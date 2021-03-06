module Stellar.Resources.Effects.TrustlineRemoved exposing (TrustlineRemoved, decoder)

{-| Trustline removed Effect

# Type alias and decoder
@docs TrustlineRemoved, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)
import Stellar.AssetType as AssetType exposing (AssetType)


{-| Type alias
-}
type alias TrustlineRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , limit : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder TrustlineRemoved
decoder =
    Decode.decode TrustlineRemoved
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "asset" AssetType.decoder
        |> Decode.required "limit" Decode.string
        |> Decode.required "_links" Links.decoder