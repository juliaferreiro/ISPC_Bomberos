import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresarSiniestroComponent } from './ingresar-siniestro.component';

describe('IngresarSiniestroComponent', () => {
  let component: IngresarSiniestroComponent;
  let fixture: ComponentFixture<IngresarSiniestroComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [IngresarSiniestroComponent]
    });
    fixture = TestBed.createComponent(IngresarSiniestroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
