import 'reflect-metadata';
import { Resolver, Mutation, Args } from '@nestjs/graphql';
import { Inject, Logger, LoggerService } from '@nestjs/common';
import { PrismaService } from '../../../typings/prisma.service';
import { domains, domainsCreateInput } from 'prisma/generated/domains';
import { LoginService } from '../../services/';

@Resolver('login')
export class LoginResolver {
  private readonly logger = new Logger(LoginResolver.name);

  constructor( private _loginService: LoginService) {}
  @Mutation((returns) => String)
  login(
    @Args('username') username: string,
    @Args('password') password: string,
  ) {
    this._loginService.login({username,password});
    return 'Hello world';
  }
}
