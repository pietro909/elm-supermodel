import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)
import Details


main =
    beginnerProgram
    { model = { name = "model", details = Details.initialModel}
    , view = view
    , update = update
    }


view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]


type Msg = Increment | Decrement

type alias Model =
    { name : String
    , details : Details.Model
    }


update msg model =
  case msg of
    Increment ->
      let
        newDetails = Details.updateDetails 1 model.details
      in
        { model | details = newDetails }

    Decrement ->
      let
        newDetails = Details.updateDetails (-1) model.details
      in
        { model | details = newDetails }

