module Main exposing (..)

import Array
import Browser
import Html
import Html.Events
import Html.Attributes
import Random
import Random.Array
import Ports


main =
    Browser.sandbox
        {
            init = init
            , update = update
            , view = view
        }


type alias Model =
    { methodDescription : String
    , seed : Random.Seed
    }


type Message
    = NewMethod


methods : Array.Array String
methods =
    Array.fromList
        [ "Height"
        , "Shoe size"
        , "Last birthday"
        , "Postcode"
        , "Age"
        , "Hair length"
        , "Most recently ill"
        , "Closest upcoming birthday"
        ]


defaultMessage =
    "Click here to see who goes first!"


methodGenerator =
    Random.map ((Maybe.withDefault) defaultMessage) (Random.Array.sample methods)

update : Message -> (Model, Cmd Message) -> (Model, Cmd Message)
update msg (model, message) =
    let
        ( methodDescription, seed ) =
            Random.step methodGenerator model.seed
    in
        ((Model methodDescription seed), Cmd.none)


view : (Model, Cmd Message) -> Html.Html Message
view (model, msg) =
    Html.div [ (Html.Attributes.class "decider"), (Html.Events.onClick NewMethod) ] [ Html.p [ Html.Attributes.class "decider--messaage" ] [ Html.text model.methodDescription ] ]

init: (Model, Cmd Message)
init =
    (Model defaultMessage (Random.initialSeed 15000), Cmd.none)

subscriptions: Model -> Sub Message
subscriptions model =
    Sub.none
