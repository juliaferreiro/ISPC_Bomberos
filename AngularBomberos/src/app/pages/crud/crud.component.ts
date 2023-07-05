import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../models/usuario';
import { UsuarioService } from '../../services/usuario.service';

@Component({
  selector: 'app-crud',
  templateUrl: './crud.component.html',
  styleUrls: ['./crud.component.css']
})
export class CrudComponent implements OnInit {

  usuario:Usuario = new Usuario();
  datatable:any = [];

  constructor(private usuarioService:UsuarioService){

  }

  ngOnInit() {
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
        alert(`El usuario ${usuario.Nombre} se ha registrado con exito!`);
        this.clear();
        this.onDataTable();
      } else {
        alert('Error! :(')
      }
    });
  }

  onUpdateUsuario(usuario:Usuario):void{
    this.usuarioService.updateUsuario(usuario.DNI, usuario).subscribe(res => {
      if(res){
        alert(`El usuario de DNI ${usuario.DNI} se ha modificado con exito!`);
        this.clear();
        this.onDataTable();
      } else {
        alert('Error! :(')
      }
    });
  }

  onDeleteUsuario(id:number):void{
    this.usuarioService.deleteUsuario(id).subscribe(res => {
      if(res){
        alert(`El usuario de DNI ${id} se ha eliminado con exito!`);
        this.clear();
        this.onDataTable();
      } else {
        alert('Error! :(')
      }
    });
  }

  onSetData(select:any){
    this.usuario.DNI = select.DNI;
    this.usuario.Apellido = select.Apellido;
    this.usuario.Nombre = select.Nombre;
    this.usuario.ID_Jerarquia = select.ID_Jerarquia;
    this.usuario.Estado = select.Estado;
  }

  clear(){
    this.usuario.DNI =0;
    this.usuario.Apellido = "";
    this.usuario.Nombre = "";
    this.usuario.ID_Jerarquia = 0;
    this.usuario.Estado = true;
  }
}
