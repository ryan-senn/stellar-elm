module Stellar.Signer exposing (Signer, decoder)

{-| Record to represent a Signer

# Type alias and Decoder
@docs Signer, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.PublicKey as PublicKey exposing (PublicKey)


{-| Type alias
-}
type alias Signer =
    { publicKey : PublicKey
    , weight : Int
    , key : PublicKey
    , type_ : String
    }


{-| Decoder
-}
decoder : Decoder Signer
decoder =
    Decode.decode Signer
        |> Decode.required "public_key" PublicKey.decoder
        |> Decode.required "weight" Decode.int
        |> Decode.required "key" PublicKey.decoder
        |> Decode.required "type" Decode.string