module Details exposing (..)

{- A separated module, handling the details -}

type alias Model =
    { quantity : Int, price : Float }


initialModel : Model
initialModel =
    { quantity = 0, price = 0.0 }


updateDetails : Int -> Model -> Model
updateDetails number model =
    if model.quantity == 0 && number < 0 then
      model
    else
      let
          quantity = model.quantity + number
      in
          { model
          | quantity = quantity
          , price = (toFloat quantity) * 1.5
          }

