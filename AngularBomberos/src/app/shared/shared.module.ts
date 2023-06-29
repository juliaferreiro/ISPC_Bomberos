import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { NavbarComponent } from './navbar/navbar.component';
import { FooterComponent } from './footer/footer.component';
import { PagesModule } from '../pages/pages.module';



@NgModule({
  declarations: [
    HeaderComponent,
    NavbarComponent,
    FooterComponent
  ],
  imports: [
    CommonModule,
    PagesModule
  ],
  exports:[
    HeaderComponent,
    NavbarComponent,
    FooterComponent
  ],
})
export class SharedModule { }
