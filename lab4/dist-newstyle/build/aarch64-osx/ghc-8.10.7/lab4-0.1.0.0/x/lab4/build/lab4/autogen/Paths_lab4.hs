{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_lab4 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/ivannapantyo/.cabal/bin"
libdir     = "/Users/ivannapantyo/.cabal/lib/aarch64-osx-ghc-8.10.7/lab4-0.1.0.0-inplace-lab4"
dynlibdir  = "/Users/ivannapantyo/.cabal/lib/aarch64-osx-ghc-8.10.7"
datadir    = "/Users/ivannapantyo/.cabal/share/aarch64-osx-ghc-8.10.7/lab4-0.1.0.0"
libexecdir = "/Users/ivannapantyo/.cabal/libexec/aarch64-osx-ghc-8.10.7/lab4-0.1.0.0"
sysconfdir = "/Users/ivannapantyo/.cabal/etc"

getBinDir     = catchIO (getEnv "lab4_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "lab4_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "lab4_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "lab4_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lab4_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lab4_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
