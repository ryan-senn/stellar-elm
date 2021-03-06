module Stellar.Endpoints.DataForAccount exposing
    ( requestBuilder
    , send, Response (..)
    , DataKey (..), dataKeyList
    )

{-| Data for Account Endpoint

# Build the Request with required fields
@docs requestBuilder

# Send the Request & catch Response
@docs send, Response

# Available Data
@docs DataKey, dataKeyList

-}

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import String.Extra as String

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Data as Data exposing (Data)

import Stellar.Error as Error exposing (Error)


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> PublicKey -> DataKey -> RequestBuilder Response
requestBuilder endpoint publicKey dataKey =

    HttpBuilder.get (url endpoint publicKey dataKey)
        |> withExpect (Http.expectJson decoder)


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> PublicKey -> DataKey -> String
url endpoint publicKey key =
    endpoint
    ++ "/accounts/"
    ++ publicKey
    ++ "/data/"
    ++ dataKeyToString key


{-| Union type of available Data to request
-}
type DataKey
    = UserId

{-| List of available Data to request
-}
dataKeyList : List DataKey
dataKeyList =
    [ UserId
    ]


dataKeyToString : DataKey -> String
dataKeyToString =
    toString >> String.decapitalize >> String.dasherize


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success Data


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Data.decoder
        ]