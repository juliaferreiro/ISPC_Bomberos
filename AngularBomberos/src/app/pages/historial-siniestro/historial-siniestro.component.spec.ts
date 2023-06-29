import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HistorialSiniestroComponent } from './historial-siniestro.component';

describe('HistorialSiniestroComponent', () => {
  let component: HistorialSiniestroComponent;
  let fixture: ComponentFixture<HistorialSiniestroComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [HistorialSiniestroComponent]
    });
    fixture = TestBed.createComponent(HistorialSiniestroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
