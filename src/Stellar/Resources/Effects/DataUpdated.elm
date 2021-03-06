module Stellar.Resources.Effects.DataUpdated exposing (DataUpdated, decoder)

{-| Data updates Effect

# Type alias and decoder
@docs DataUpdated, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)


{-| Type alias
-}
type alias DataUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder DataUpdated
decoder =
    Decode.decode DataUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder