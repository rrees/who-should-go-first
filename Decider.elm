import Array

import Html
import Html.App
import Html.Events
import Html.Attributes

import Random

import Random.Array

import Ports

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
    = Array.fromList [
        "Height",
        "Shoe size",
        "Last birthday",
        "Postcode",
        "Age",
        "Hair length",
        "Most recently ill",
        "Closest upcoming birthday"]

defaultMessage
    = "Click here to see who goes first!"

methodGenerator
    = Random.map ((Maybe.withDefault) defaultMessage) (Random.Array.sample methods)


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
    Html.div [(Html.Attributes.class "decider"), (Html.Events.onClick NewMethod)] [Html.p [Html.Attributes.class "decider--messaage"] [ Html.text model.message]]