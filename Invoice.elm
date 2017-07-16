module Invoice exposing (Model, update, initialModel)

{- A separated module, handling the payment -}


type alias Model =
    { price : Float }


type alias SuperModel a =
    { a | invoice : Model }


initialModel : Model
initialModel =
    { price = 0.0 }


update : Int -> SuperModel a -> SuperModel a
update quantity superModel =
    let
        model =
            superModel.invoice

        newModel =
            { model | price = (toFloat quantity) * 1.5 }
    in
        { superModel | invoice = newModel }
