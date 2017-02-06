-- Test code written by Johannes Ridderstedt <johannes@46elks.com>
-- Email me if you need further help validating / testing this

import Html exposing (button, text)
import Html.Events exposing (onClick)
import Json.Decode exposing (decodeString, list, string)

type Msg
  = BlowUp

main =
  Html.program { init = init, update = update, view = view, subscriptions = subs }

init =
  -- 7000 hit's the call stack size limit in Chrome, 5000 don't
  ( decodeList (longJsonList 7000), Cmd.none )

decodeList s =
  let
    r = decodeString (list string) s
  in
    case r of
      Ok l ->
        l
      Err _ ->
        []

longJsonList : Int -> String
longJsonList n =
    "[" ++ String.repeat n "\"\"," ++ "\"\"]"

update msg model =
  case msg of
    BlowUp ->
      ( model, Cmd.none )

subs msg =
  Sub.none

view model =
  button [ onClick BlowUp ] [ text "Blow up the stack!" ]
