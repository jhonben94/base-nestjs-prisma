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
} from '@nestjs/graphql';
import { Inject, Logger, LoggerService } from '@nestjs/common';
import { PrismaService } from '../../typings/prisma.service';
import { domains, domainsCreateInput } from 'prisma/generated/domains';


@Resolver(domains)
export class DomainResolver {
  private readonly logger = new Logger(DomainResolver.name);

  constructor(@Inject(PrismaService) private prismaService: PrismaService) {}


  @Query((returns) => String, { nullable: true })
  hello() {
    this.logger.error("this is a log")
    this.logger.debug("this is a debug")
    this.logger.warn("this is a warn")
    this.logger.verbose("this is a warn")
    return 'Hello world';
  }

  @Query((returns) => [domains], { nullable: true })
  async alldomains(@Context() ctx) {
    try {
      return this.prismaService.domains.findMany();
    } catch (error) {
      throw error;
    }
  }
  @Query((returns) => domains, { nullable: true })
  postById(@Args('id') id: number) {
    return this.prismaService.domains.findUnique({
      where: { id },
    })
  }

  @Mutation((returns) => domains, { nullable: true })
  async delete(
    @Args('id') id: number,
    @Context() ctx,
  ): Promise<domains | null> {
    return this.prismaService.domains.delete({
      where: {
        id: id,
      },
    })
  }

  @Query((returns) => [domains])
  paginate(
    @Args('searchString', { nullable: true }) searchString: string,
    @Args('skip', { nullable: true }) skip: number,
    @Args('take', { nullable: true }) take: number,
    @Args('orderBy', { nullable: true }) orderBy: string,
    @Args('orderDir', { nullable: true }) orderDir: string,
    @Context() ctx,
  ) {

    let orderData={}
    orderData[orderBy]=orderDir;
    const or = searchString
      ? {
          OR: [
            { domain_code: { contains: searchString } },
            { domain_description: { contains: searchString } },
            { domain_value: { contains: searchString } },
            { module: { contains: searchString } },
            { domain_value_type: { contains: searchString } },
          ],
        }
      : {}

    return this.prismaService.domains.findMany({
      where: {
        ...or,
      },
      take: take || undefined,
      skip: skip || undefined,
      orderBy: [orderData] || undefined,
    })
  }
  
  @Mutation((returns) => domains)
  createDraft(
    @Args('data') data: domainsCreateInput,
    @Context() ctx,
  ): Promise<domains> {
    return this.prismaService.domains.create({
      data
    })
  }
}
