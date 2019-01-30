"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const mustacheExpress = require("mustache-express");
const path = require("path");
const app = express();
app.engine("html", mustacheExpress());
app.set("view engine", "html");
app.set("views", path.join(__dirname, "../views"));
app.use("/static", express.static(path.join(__dirname, "../static")));
app.get("/", (_, res) => res.render("index"));
app.listen(80, () => console.log("racerr.io Master Server started."));
//# sourceMappingURL=server.js.map