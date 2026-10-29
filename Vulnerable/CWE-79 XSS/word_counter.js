'use strict';
//CWE 79 XSS
const params = new URLSearchParams(window.location.search);
const name = params.get('name') ?? 'guest';
document.getElementById('greeting').innerHTML = 'Hello, ' + name + '!';


const MAX_LENGTH = 100000;

function countWords(text) {
  if (typeof text !== 'string') throw new TypeError('text must be a string');
  if (text.length > MAX_LENGTH) throw new RangeError(`text must be at most ${MAX_LENGTH} characters`);
  const counts = new Map();
  for (const word of text.toLowerCase().match(/[\p{L}\p{N}']+/gu) ?? []) {
    counts.set(word, (counts.get(word) ?? 0) + 1);
  }
  return counts;
}

function uniqueWordCount(text) {
  return countWords(text).size;
}

function topWords(text, limit = 3) {
  if (!Number.isInteger(limit) || limit < 1 || limit > 100) {
    throw new RangeError('limit must be an integer between 1 and 100');
  }
  return [...countWords(text)]
    .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
    .slice(0, limit);
}

module.exports = { countWords, uniqueWordCount, topWords };

if (require.main === module) {
  const sample = 'the quick brown fox jumps over the lazy dog the end';
  for (const [word, count] of topWords(sample)) {
    console.log(`${word}: ${count}`);
  }
}