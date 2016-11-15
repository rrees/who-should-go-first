module Main exposing (..)

import Array
import Html
import Html.Events
import Html.Attributes
import Random
import Random.Array
import Ports


main =
    Html.program
        {
            init = init
            , view = view
            , update = update
            , subscriptions = subscriptions
        }


type alias Model =
    { message : String
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

update : Message -> Model -> (Model, Cmd Message)
update msg model =
    let
        ( message, seed ) =
            Random.step methodGenerator model.seed
    in
        ((Model message seed), Cmd.none)


view : Model -> Html.Html Message
view model =
    Html.div [ (Html.Attributes.class "decider"), (Html.Events.onClick NewMethod) ] [ Html.p [ Html.Attributes.class "decider--messaage" ] [ Html.text model.message ] ]

init: (Model, Cmd Message)
init =
    (Model defaultMessage (Random.initialSeed 15000), Cmd.none)

subscriptions: Model -> Sub Message
subscriptions model =
    Sub.none
