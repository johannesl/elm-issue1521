-- Test code written by Johannes Ridderstedt <johannes@46elks.com>
-- Email me if you need further help validating / testing this

import Html exposing (button, text)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (decodeString, list, string)

type Msg
  = ListReady (Result Http.Error String)
  | BlowUp

main =
  Html.program { init = init, update = update, view = view, subscriptions = subs }

init =
  -- Change to "smaller.json" and it will not break
  ( [], Http.send ListReady <| Http.getString "bigger.json" )

decodeList s =
  let
    r = decodeString (list string) s
  in
    case r of
      Ok l ->
        l
      Err _ ->
        []

update msg model =
  case msg of
    ListReady (Ok s) ->
      ( decodeList s, Cmd.none )

    ListReady (Err _) ->
      ( model, Cmd.none )
    
    BlowUp ->
      ( model, Cmd.none )

subs msg =
  Sub.none

view model =
  button [ onClick BlowUp ] [ text "Blow up the stack!" ]