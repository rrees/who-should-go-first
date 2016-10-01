import Html
import Html.App

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

model: Model
model =
    "Click me to see how to determine who goes first!"

update: Message -> Model -> Model
update msg model =
    model

view : Model -> Html.Html Message
view model =
    Html.p [] [ Html.text model]