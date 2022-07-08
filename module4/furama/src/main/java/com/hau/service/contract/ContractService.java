package com.hau.service.contract;

import com.hau.model.contract.AttachFacility;
import com.hau.model.contract.Contract;
import com.hau.repository.contract.IContractRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContractService implements IContractService{

    @Autowired
    private IContractRepository iContractRepository;

    @Override
    public Page<Contract> findAll(Pageable pageable, String searchValue) {
        return this.iContractRepository.findByIdContract(pageable, "%" + searchValue + "%");
    }

    @Override
    public Optional<Contract> findById(Integer id) {
        return this.iContractRepository.findById(id);
    }

    @Override
    public Contract save(Contract contract) {
        return this.iContractRepository.save(contract);
    }

    @Override
    public void remove(Integer id) {
        this.iContractRepository.deleteById(id);
    }

    @Override
    public Iterable<Contract> findAll() {
        return this.iContractRepository.findAll();
    }


}
