module KotlinAST where

data KVisibility = KPublic | KPrivate | KInternal | KProtected
  deriving (Show, Eq)

type ClassRef = String

data KType
  = KUnit
  | KNothing
  | KInt
  | KLong
  | KDouble
  | KFloat
  | KChar
  | KString
  | KBoolean
  | KClassRef ClassRef
  | KLambda KSignature
  | KGeneric
      { genericName :: String,
        genericInherits :: ClassRef
      }
  | KNullable KType
  deriving (Show, Eq)

data KSignature = KSignature
  { _sigAnnotations :: [KAnnotationValue],
    _sigSuspending :: Bool,
    _sigReceivers :: [KType],
    _sigParams :: [KParamDef],
    _sigOutput :: KType
  }
  deriving (Show, Eq)

data KParamDef = KParamDef
  { _paramDefAnnotations :: [KAnnotationValue],
    _paramDefName :: String,
    _paramDefType :: KType,
    _paramDefaultValue :: Maybe KExpresssion
  }
  deriving (Show, Eq)

data KParamValue = KParamValue
  { _paramName :: String,
    _paramValue :: KExpresssion
  }
  deriving (Show, Eq)

data KAnnotationValue = KAnnotationValue
  { _annotationName :: String,
    _annotationParams :: [KParamValue]
  }
  deriving (Show, Eq)

data KLiteral
  = KLiteralInt Int
  | KLiteralDouble Double
  | KLiteralFloat Float
  | KLiteralChar Char
  | KLiteralString String
  | KLiteralBoolean Bool
  | KLiteralUnit
  deriving (Show, Eq)

data KExpresssion
  = KLiteralExpression KLiteral
  | KPostFixIncrement KExpresssion
  | KPostFixDecrement KExpresssion
  | KAccessor
  | KUnknown String
  deriving (Show, Eq)

data KFunDef = KFunDef
  { _funVisibility :: KVisibility,
    _funName :: String,
    _funSignature :: KSignature,
    _funBody :: [KExpresssion]
  }
  deriving (Show, Eq)