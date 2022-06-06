{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Physics (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/amcp011/.cabal/bin"
libdir     = "/home/amcp011/.cabal/lib/x86_64-linux-ghc-8.6.5/Physics-0.1.0.0-Fh27UmgUu4cH3huRebXlmt"
dynlibdir  = "/home/amcp011/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/amcp011/.cabal/share/x86_64-linux-ghc-8.6.5/Physics-0.1.0.0"
libexecdir = "/home/amcp011/.cabal/libexec/x86_64-linux-ghc-8.6.5/Physics-0.1.0.0"
sysconfdir = "/home/amcp011/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Physics_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Physics_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Physics_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Physics_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Physics_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Physics_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
