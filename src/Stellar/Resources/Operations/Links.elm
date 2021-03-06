module Stellar.Resources.Operations.Links exposing (Links, decoder)

{-| Links common to all Operations

# Type alias and decoder
@docs Links, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


{-| Links
-}
type alias Links =
    { self : Link
    , succeeds : Link
    , precedes : Link
    , effects : Link
    , transaction : Link
    }


{-| Decoder
-}
decoder : Decoder Links
decoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "transaction" Link.decoder