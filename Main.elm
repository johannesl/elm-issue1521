-- Test code written by Johannes Ridderstedt <johannes@46elks.com>
-- Email me if you need further help validating / testing this

import Html exposing (text)

main =
  Html.program { init = init, update = update, view = view, subscriptions = subs }

init =
  -- 7000 hit's the call stack size limit in Chrome, 5000 don't
  ( longListOfEmptyStrings 16000, Cmd.none )

longListOfEmptyStrings n =
  if n == 0 then
    [""]
  else
    [""] ++ longListOfEmptyStrings (n-1)

update msg model =
  ( model, Cmd.none )

subs msg =
  Sub.none

view model =
  text "Running this in the debugger will not make it here.."
