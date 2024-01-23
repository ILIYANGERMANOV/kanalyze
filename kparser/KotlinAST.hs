module KotlinAST where

data KType
  = KUnit
  | KNothing
  | KType
      { _ktypeName :: String,
        _nullable :: Bool
      }
  deriving (Show, Eq)

data KVisibility = KPublic | KPrivate | KInternal | KProtected
  deriving (Show, Eq)

data KParamDef = KParamDef
  { _paramDefName :: String,
    _paramDefType :: KType,
    _paramDefaultValue :: Maybe KExpresssion
  }
  deriving (Show, Eq)

data KParam = KParam
  { _paramName :: String,
    _paramValue :: KExpresssion
  }
  deriving (Show, Eq)

data KAnnotation = KAnnotation
  { _annotationName :: String,
    _annotationParams :: [KParam]
  }
  deriving (Show, Eq)

data KLiteral
  = KString
      { _kStringValue :: String
      }
  | KInt
      { _kIntValue :: Int
      }
  deriving (Show, Eq)

data KExpresssion
  = KVarDeclaration
  | KFunCall
  | KBranching
  | KLoop
  | KUnknown
      { _unknownRawValue :: String
      }
  deriving (Show, Eq)

data KFun = KFun
  { _funAnnotations :: [KAnnotation],
    _funVisibility :: KVisibility,
    _funName :: String,
    _funReceivers :: [KType],
    _funParams :: [KParamDef],
    _funOutput :: KType,
    _funBody :: [KExpresssion]
  }
  deriving (Show, Eq)