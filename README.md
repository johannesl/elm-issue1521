# Test to reproduce elm-lang issue &#35;1521

Trying to decode a JSON list with ~7000 items crashes the Elm runtime on some browsers with "Maximum call stack stack size exceeded".

Crashes on Google Chrome (55.0.2883.95, 64-bit, macOS). Firefox and Safari seems to survive.

Start with **elm-reactor** and launch your browser to test.