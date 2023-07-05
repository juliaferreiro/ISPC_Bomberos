import { Component } from '@angular/core';
import { Usuario } from '../../models/usuario';
import { UsuarioService } from '../../services/usuario.service';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent {
  usuario:Usuario = new Usuario();
  datatable:any = [];

  constructor(private usuarioService:UsuarioService){

  }

  ngOnInit(): void {
    this.onDataTable();
  }

  onDataTable(){
    this.usuarioService.getUsuario().subscribe(res => {
      this.datatable = res;
      console.log(res);
    });
  }

  onAddUsuario(usuario:Usuario):void{
    this.usuarioService.addUsuario(usuario).subscribe(res => {
      if(res){
        alert(`El/la usuario/a ${usuario.nombre} se ha registrado con exito!`);
        this.clear();
        //this.onDataTable();
      } else {
        alert('Error! :(')
      }
    });
  }

    onSetData(select:any){
    this.usuario.dni= select.dni;
    this.usuario.apellido = select.apellido;
    this.usuario.nombre = select.nombre;
    this.usuario.id_Jerarquia = select.id_Jerarquia;
    this.usuario.estado = select.estado;
  }

  clear(){
    this.usuario.dni =0;
    this.usuario.apellido = "";
    this.usuario.nombre = "";
    this.usuario.id_Jerarquia = 0;
    this.usuario.estado = true;
  }
}