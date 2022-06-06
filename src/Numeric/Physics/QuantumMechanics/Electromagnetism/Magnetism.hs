{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE UndecidableInstances #-}
-- {-# LANGUAGE ScopedTypeVariables #-}
-- {-# LANGUAGE RankNTypes #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Numeric.Physics.QuantumMechanics.Electromagnetism.Magnetism
-- Copyright   :  (c) A. V. H. McPhail 2022
-- License     :  CC BY-ND-SA
--
-- Maintainer  :  haskell.vivian.mcphail <at> gmail <dot> com
-- Stability   :  provisional
-- Portability :  portable
--
-- Zeeman effect
--
-----------------------------------------------------------------------------

module Numeric.Physics.QuantumMechanics.Electromagnetism.Magnetism (
  zeeman -- lazily evaluate the Zeeman effect
  ) where

class Neutron a
class Proton a
class Electron a

data Atom a b c = (Neutron a, Proton b, Electron c) => Atom [a] [b] [c]

class Vector a
class Tensor a
class Complex a
class Field a

data ComplexField a = (Complex a, Field a) => ComplexField a

-- | lazily evaluate the Zeeman effect
--
zeeman :: (Neutron a, Proton b, Electron c, Complex d, Vector d, Field d, Complex e, Tensor e, Field e) => Atom a b c               -- ^ First Atom
  -> Atom a b c -- ^ Second Atom
  -> d          -- ^ Electromagnetic field
  -> e          -- ^ Interaction approximations
zeeman = undefined


