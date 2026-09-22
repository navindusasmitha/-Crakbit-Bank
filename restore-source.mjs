import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = path.dirname(fileURLToPath(import.meta.url));
const chunkDir = path.join(root, '.release', 'v1.6');
const expectedHash = 'f36cadf9122588e15c7dba88ec2bcb1473746523116431010b308a0098612457';

if (!fs.existsSync(chunkDir)) throw new Error('Release payload directory is missing.');
const parts = fs.readdirSync(chunkDir).filter(f => /^\d+\.b64$/.test(f)).sort();
if (parts.length !== 5) throw new Error(`Expected 5 release chunks, found ${parts.length}.`);

const b64 = parts.map(f => fs.readFileSync(path.join(chunkDir, f), 'utf8').trim()).join('');
const zipBuffer = Buffer.from(b64, 'base64');
const actualHash = crypto.createHash('sha256').update(zipBuffer).digest('hex');
if (actualHash !== expectedHash) throw new Error(`Release integrity check failed. Expected ${expectedHash}, got ${actualHash}.`);

const workDir = path.join(root, '.release', '.restore-work');
const zipPath = path.join(workDir, 'Crakbit-Bank-v1.6.zip');
const extractDir = path.join(workDir, 'extracted');
fs.rmSync(workDir, { recursive: true, force: true });
fs.mkdirSync(workDir, { recursive: true });
fs.writeFileSync(zipPath, zipBuffer);

const escapePs = s => s.replaceAll("'", "''");
const ps = `Expand-Archive -LiteralPath '${escapePs(zipPath)}' -DestinationPath '${escapePs(extractDir)}' -Force`;
const result = spawnSync('powershell.exe', ['-NoProfile', '-Command', ps], { stdio: 'inherit' });
if (result.status !== 0) {
  fs.rmSync(workDir, { recursive: true, force: true });
  process.exit(result.status || 1);
}

const sourceRoot = path.join(extractDir, 'crakbit-bank-v1.6-core-pro');
if (!fs.existsSync(sourceRoot)) throw new Error('Release source folder was not found after extraction.');

const filesToRestore = [
  'server.mjs',
  'v16.mjs',
  path.join('public', 'app.js'),
  path.join('public', 'style.css')
];
for (const rel of filesToRestore) {
  const from = path.join(sourceRoot, rel);
  const to = path.join(root, rel);
  if (!fs.existsSync(from)) throw new Error(`Required release file is missing: ${rel}`);
  fs.mkdirSync(path.dirname(to), { recursive: true });
  fs.copyFileSync(from, to);
  console.log(`[OK] Restored ${rel}`);
}

fs.rmSync(workDir, { recursive: true, force: true });
console.log('Crakbit Bank v1.6 source restoration completed successfully.');
