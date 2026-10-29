import { createServer } from "node:http";

//CWE 79 XSS
createServer((req, res) => {
  const url = new URL(req.url ?? "/", "http://localhost");
  const name = url.searchParams.get("name") ?? "guest";
  res.setHeader("Content-Type", "text/html; charset=utf-8");
  res.end(`<h1>Hello, ${name}!</h1>`);
}).listen(3003, "127.0.0.1");