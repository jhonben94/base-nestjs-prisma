import { Logger,Module } from '@nestjs/common'
import { GraphQLModule } from '@nestjs/graphql'
import { PrismaService } from './prisma.service'
import { join } from 'path'
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo'
import { ApolloServerPluginLandingPageLocalDefault } from 'apollo-server-core';
import resolvers from 'src/resolvers'
import {  services } from '../src/services'
import { AuthModule } from '../src/auth/auth.module'


@Module({
  imports: [
    AuthModule,
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), 'src/schema.gql'),
      buildSchemaOptions: { dateScalarMode: 'timestamp' },
      playground: false,
      plugins: [ApolloServerPluginLandingPageLocalDefault()],
    })
  ],
  controllers: [],
  providers: [PrismaService,Logger,...resolvers,...services],
})
export class AppModule {}
