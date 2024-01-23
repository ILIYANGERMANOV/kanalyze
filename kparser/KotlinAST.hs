{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module KotlinAST where

data KExpresssion
  = TBD
  | KUnknown
      { _kuRawValue :: String
      }

data KType
  = KUnit
  | KNothing
  | KType
      { _ktypeName :: String,
        _nullable :: Bool
      }

data KFunInput
  = KFunParam
      { _paramName :: String,
        _paramType :: KType,
        _defaultValue :: Maybe KExpresssion
      }
  | KFunReceiver
      { _receiverType :: KType
      }

data KFun = KFun
  { _funName :: String,
    _funInput :: [KFunInput],
    _funOutput :: KType,
    _body :: [KExpresssion]
  }