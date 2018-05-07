// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".


// import socket from "./socket"
import "../css/app.sass"
// import  "../static/robots.txt"
// import  "../static/favicon.ico"



// import 'jquery'
// import 'ramda'
import 'popper.js'
import 'bootstrap'
require('./theme.js')
require('./react/app.jsx')

window.$ = window.JQuery = require("jquery");
window.R = require("ramda");

