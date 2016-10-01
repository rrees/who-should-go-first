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

methodGenerator
    = Random.map (\maybeMessage -> Maybe.withDefault model.message maybeMessage) (Random.Array.sample methods)


model: Model
model = Model "Click me to see how to determine who goes first!" (Random.initialSeed 15000)

update: Message -> Model -> Model
update msg model
    = Model model.message model.seed

view : Model -> Html.Html Message
view model =
    Html.p [Html.Events.onClick NewMethod] [ Html.text model.message]