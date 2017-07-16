module Details exposing (Model, initialModel, update, mapQuantity)

{- A separated module, handling the details -}


type alias Model =
    { quantity : Int }


initialModel : Model
initialModel =
    { quantity = 0 }


update : Int -> Model -> Model
update number model =
    if model.quantity == 0 && number < 0 then
        model
    else
        { model | quantity = model.quantity + number }


mapQuantity : (Int -> a -> b) -> a -> Model -> b
mapQuantity f input model =
    f model.quantity input
