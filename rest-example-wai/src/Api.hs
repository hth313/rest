-- | The API path hierarchy
module Api where

import Rest.Api (Api, Router, Some1 (..), mkVersion, root, route, (-/))

import ApiTypes (BlogApi)
import qualified Api.Post as Post
import qualified Api.User as User

-- | Defines a versioned api
api :: Api BlogApi
api = [(mkVersion 1 0 0, Some1 blog)]

-- _ The entire routing table for v1.0.0 of the blog
blog :: Router BlogApi BlogApi
blog =
  root -/ user
       -/ post
  where
    user = route User.resource
    post = route Post.resource
