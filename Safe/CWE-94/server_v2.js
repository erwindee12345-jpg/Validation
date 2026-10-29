const express = require('express');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());


const safeFunctions = {
  add: (a, b) => a + b,
  subtract: (a, b) => a - b,
  multiply: (a, b) => a * b,
  divide: (a, b) => a / b,
};

app.post('/execute-code', (req, res) => {
  const { operation, args } = req.body;
  //FIX: Define set of allowed operations
  if (typeof operation !== 'string' || !Object.prototype.hasOwnProperty.call(safeFunctions, operation)) {
    return res.status(400).send('Invalid operation');
  }

  if (!Array.isArray(args) || args.length !== 2 || !args.every(Number.isFinite)) {
    return res.status(400).send('Invalid arguments');
  }

  try {
    const result = safeFunctions[operation](...args);
    res.json({ result });
  } catch (error) {
    res.status(500).send('Error executing code');
  }
});

app.listen(3000, () => console.log('Server running on port 3000'));