module Details exposing (Model, update, initialModel, mapQuantity)

{- A separated module, handling the details -}

type alias Model =
    { quantity : Int }

type alias SuperModel a =
    { a | details : Model }


initialModel : Model
initialModel =
    { quantity = 0 }


update: Int -> SuperModel a -> SuperModel a
update number superModel =
  let
      model = superModel.details
  in
      if model.quantity == 0 && number < 0 then
        superModel
      else
          let
              newModel =
                  { model | quantity = model.quantity + number }
          in
              { superModel | details = newModel }


mapQuantity : (Int -> SuperModel a -> c) -> SuperModel a -> c
mapQuantity f superModel =
    f superModel.details.quantity superModel

