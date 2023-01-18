import 'reflect-metadata';
import {
  Resolver,
  Query,
  Mutation,
  Args,
  ResolveField,
  Root,
  Context,
  Int,
  InputType,
  Field,
  registerEnumType,
  ID,
  ObjectType,
} from '@nestjs/graphql';
import { Inject, Logger, LoggerService } from '@nestjs/common';
import { PrismaService } from '../../typings/prisma.service';
import { domains, domainsCreateInput } from 'prisma/generated/domains';


@Resolver('Custom')
export class CustomResolver {
  private readonly logger = new Logger(CustomResolver.name);

  constructor(@Inject(PrismaService) private prismaService: PrismaService) {}
  @Query((returns) => String, { nullable: true })
  helloCustom() {
    this.logger.error("this is a log")
    this.logger.debug("this is a debug")
    this.logger.warn("this is a warn")
    this.logger.verbose("this is a warn")
    return 'Hello world';
  }
}
