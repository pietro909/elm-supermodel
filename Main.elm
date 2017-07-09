import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)
import Details
import Invoice


main =
    beginnerProgram
    { model = initialModel
    , view = view
    , update = update
    }


type Msg = Increment | Decrement

type alias Model =
    { name : String
    , details : Details.Model
    , invoice : Invoice.Model
    }


initialModel : Model
initialModel =
    { name = "model"
    , details = Details.initialModel
    , invoice = Invoice.initialModel
    }


view model =
    div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            Details.update 1 model
            |> Details.mapQuantity Invoice.update

        Decrement ->
            Details.update -1 model
            |> Details.mapQuantity Invoice.update

