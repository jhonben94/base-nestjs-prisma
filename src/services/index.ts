import { LoginService} from '../services/login/login.service'
// Export para instanciar en los diferentes recursos
export {
    LoginService
}
// export general de servicios en forma de array para agregarlos al app.module de manera mas rapida.
export const services =[LoginService]