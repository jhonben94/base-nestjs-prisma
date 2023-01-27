import { Injectable } from '@nestjs/common';
import { LoginService } from '../services'

@Injectable()
export class AuthService {
  constructor(private _service: LoginService) {}

  async validateUser(username: string, password: string): Promise<any> {
    const data = await this._service.login({username,password});
    
    return null;
  }
}