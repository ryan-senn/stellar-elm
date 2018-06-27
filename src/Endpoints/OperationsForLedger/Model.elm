module Endpoints.OperationsForLedger.Model exposing (Model, initialModel, Settings)

import Http

import Stellar.Sorting as Sorting exposing (Sorting)

import Stellar.Endpoints.OperationsForLedger as OperationsForLedger

import Form.Input as Input
import Form.IntInput as IntInput


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error OperationsForLedger.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { ledgerId : IntInput.Model
    , cursor : Input.Model
    , limit : IntInput.Model
    , sorting : Maybe Sorting
    }


initialSettings : Settings
initialSettings =
    { ledgerId = IntInput.init
    , cursor = Input.init
    , limit = IntInput.init
    , sorting = Nothing
    }