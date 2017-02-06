# Test to reproduce ~~elm-lang issue &#35;1521__~~

Running elm-reactor with a list in the model of ~7000 items crashes the Elm runtime on some browsers with "Maximum call stack stack size exceeded".

Crashes on Google Chrome (55.0.2883.95, 64-bit, macOS). Firefox and Safari seems to survive.

Start with **elm-reactor** and launch your browser to test.

![Maximum call stack size exceeded]
(https://raw.githubusercontent.com/johannesl/elm-issue1521/master/maximum-call-stack-size-exceeded.png)
