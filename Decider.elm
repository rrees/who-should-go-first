import Html
import Html.App
import Html.Events

main =
    Html.App.beginnerProgram
        {
            model = model,
            view = view,
            update = update
        }

type alias Model = String

type Message
    = NewMethod

methods: List String
methods
    = ["Height", "Shoe size", "Last birthday"]

model: Model
model =
    "Click me to see how to determine who goes first!"

update: Message -> Model -> Model
update msg model
    = Maybe.withDefault model (List.head methods)

view : Model -> Html.Html Message
view model =
    Html.p [Html.Events.onClick NewMethod] [ Html.text model]