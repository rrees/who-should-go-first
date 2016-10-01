import Array

import Html
import Html.App
import Html.Events

import Random

import Random.Array

main =
    Html.App.beginnerProgram
        {
            model = model,
            view = view,
            update = update
        }

type alias Model =
    {
        message: String,
        seed: Random.Seed
    }

type Message
    = NewMethod

methods: Array.Array String
methods
    = Array.fromList ["Height", "Shoe size", "Last birthday"]

defaultMessage
    = "Click me to see how to determine who goes first!"

methodGenerator
    = Random.map (\maybeMessage -> Maybe.withDefault defaultMessage maybeMessage) (Random.Array.sample methods)


model: Model
model = Model defaultMessage (Random.initialSeed 15000)

update: Message -> Model -> Model
update msg model
    = let (message, seed)
        = Random.step methodGenerator model.seed
    in
        Model message seed

view : Model -> Html.Html Message
view model =
    Html.div [Html.Events.onClick NewMethod] [Html.p [] [ Html.text model.message]]