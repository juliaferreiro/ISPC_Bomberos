import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Usuario } from '../models/usuario';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private http:HttpClient) { }

  url:string = "https://localhost:44390/api/Usuario";

  getUsuario(){
    return this.http.get(this.url);
  }

  addUsuario(usuario:Usuario):Observable<Usuario>{
    return this.http.post<Usuario>(this.url, usuario);
  }

  updateUsuario(dni:number, usuario:Usuario):Observable<Usuario>{
    return this.http.put<Usuario>(this.url + `/${dni}`, usuario);
  }

  deleteUsuario(dni:number){
    return this.http.delete(this.url + `/${dni}`);
  }
}
