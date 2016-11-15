port module Ports exposing (seed)


port seed : (Int -> msg) -> Sub msg
