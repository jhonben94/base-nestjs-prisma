import { DomainResolver } from "./resolvers.domain";
import {CustomResolver } from "./resolver.custom";
import { LoginResolver } from "./login";

export default [    
    CustomResolver,
    DomainResolver,
    LoginResolver
]
