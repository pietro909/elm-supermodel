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


update msg model =
    case msg of
        Increment ->
            let
                newDetails =
                    Details.update 1 model.details
                newInvoice =
                    Details.mapQuantity Invoice.update model.invoice newDetails
            in
                { model
                | details = newDetails
                , invoice = newInvoice
                }

        Decrement ->
            let
                newDetails =
                    Details.update -1 model.details
                newInvoice =
                      Details.mapQuantity Invoice.update model.invoice newDetails
            in
                { model
                | details = newDetails
                , invoice = newInvoice
                }

