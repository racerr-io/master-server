"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const mustacheExpress = require("mustache-express");
const path = require("path");
const app = express();
app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', path.join(__dirname, '../views'));
app.use('/static', express.static(path.join(__dirname, '../static')));
app.get('/', function (req, res) {
    res.render('index', { root: path.join(__dirname, '../lib') });
});
app.listen(3000, function () {
    console.log('Racerr.io Master Server started.');
});
//# sourceMappingURL=server.js.map