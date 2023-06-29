import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HistorialSiniestroComponent } from './historial-siniestro/historial-siniestro.component';
import { IngresarSiniestroComponent } from './ingresar-siniestro/ingresar-siniestro.component';
import { InventarioComponent } from './inventario/inventario.component';
import { LoginComponent } from './login/login.component';
import { PersonalComponent } from './personal/personal.component';
import { RegistroComponent } from './registro/registro.component';
import { TutorialComponent } from './tutorial/tutorial.component';



@NgModule({
  declarations: [
    HistorialSiniestroComponent,
    IngresarSiniestroComponent,
    InventarioComponent,
    LoginComponent,
    PersonalComponent,
    RegistroComponent,
    TutorialComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PagesModule { }
