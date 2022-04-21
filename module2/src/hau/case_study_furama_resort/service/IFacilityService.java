package hau.case_study_furama_resort.service;

import hau.case_study_furama_resort.model.facility_model.Facility;

public interface IFacilityService extends IService<Facility>{

    void add();
    void addHouse();
    void addRoom();
    void addVila();
    void displayListFacilityMaintenance();
}
