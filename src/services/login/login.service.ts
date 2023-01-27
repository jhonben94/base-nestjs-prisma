import { Injectable } from '@nestjs/common';
import { Inject, Logger } from '@nestjs/common';

@Injectable()
export class LoginService {
    private readonly logger = new Logger(LoginService.name);

    constructor(){}
    login({username,password}){
        this.logger.log("Logging is working")
    }
}