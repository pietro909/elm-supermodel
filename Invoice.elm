module Invoice exposing (Model, initialModel, update)

{- A separated module, handling the payment -}


type alias Model =
    { price : Float }


type alias SuperModel a =
    { a | invoice : Model }


initialModel : Model
initialModel =
    { price = 0.0 }


update : Int -> Model -> Model
update quantity model =
    { model | price = (toFloat quantity) * 1.5 }
