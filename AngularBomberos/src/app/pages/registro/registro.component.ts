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
        alert(`El/la usuario/a ${usuario.Nombre} se ha registrado con exito!`);
        this.clear();
        //this.onDataTable();
      } else {
        alert('Error! :(')
      }
    });
  }

    onSetData(select:any){
    this.usuario.DNI= select.dni;
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