import { createServer } from "node:http";

//CWE 79 FIX
function escapeHtml(text: string): string {
  return text
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");
}

createServer((req, res) => {
  const url = new URL(req.url ?? "/", "http://localhost");
  const name = url.searchParams.get("name") ?? "guest";
  res.setHeader("Content-Type", "text/html; charset=utf-8");
  res.end(`<h1>Hello, ${escapeHtml(name)}!</h1>`);
}).listen(3003, "127.0.0.1");