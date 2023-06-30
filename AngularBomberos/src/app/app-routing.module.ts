import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './pages/login/login.component';
import { TutorialComponent } from './pages/tutorial/tutorial.component';
import { HomeComponent } from './pages/home/home.component';
import { IngresarSiniestroComponent } from './pages/ingresar-siniestro/ingresar-siniestro.component';
import { InventarioComponent } from './pages/inventario/inventario.component';
import { PersonalComponent } from './pages/personal/personal.component';
import { HistorialSiniestroComponent } from './pages/historial-siniestro/historial-siniestro.component';
import { RegistroComponent } from './pages/registro/registro.component';

const routes: Routes = [
  {path: 'tutorial', component: TutorialComponent},
  {path: 'login', component: LoginComponent},
  {path: 'home', component: HomeComponent},
  {path: 'ingresar-siniestro', component: IngresarSiniestroComponent},
  {path: 'inventario', component: InventarioComponent},
  {path: 'personal', component: PersonalComponent},
  {path: 'historial-siniestro', component: HistorialSiniestroComponent},
  {path: 'registro', component: RegistroComponent},
  {path:  '', redirectTo: 'home' , pathMatch: 'full'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
