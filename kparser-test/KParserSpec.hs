module KParserSpec where

import Test.Hspec (Spec, describe, hspec, it, shouldBe)

spec :: Spec
spec = describe "hspec works" $ do
  it "2 + 2 should be 4" $ do
    2 + 2 `shouldBe` 4