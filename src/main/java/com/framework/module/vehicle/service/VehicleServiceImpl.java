package com.framework.module.vehicle.service;

import com.framework.module.vehicle.domain.Vehicle;
import com.framework.module.vehicle.domain.VehicleRepository;
import com.kratos.common.AbstractCrudService;
import com.kratos.common.PageRepository;
import com.kratos.exceptions.BusinessException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Transactional
public class VehicleServiceImpl extends AbstractCrudService<Vehicle> implements VehicleService {
    private VehicleRepository vehicleRepository;
    @Override
    protected PageRepository<Vehicle> getRepository() {
        return vehicleRepository;
    }

    @Override
    public Vehicle save(Vehicle vehicle) throws Exception {
        if(StringUtils.isBlank(vehicle.getMemberId())) {
            throw new BusinessException("会员不能为空");
        }
        // 如果当前车是默认，则将其他的车改为非默认
        if(vehicle.getIsDefault()) {
            Map<String, String[]> param = new HashMap<>();
            param.put("member.id", new String[]{vehicle.getMemberId()});
            List<Vehicle> vehicles = this.findAll(param);
            vehicles.forEach(vehicle1 -> vehicle1.setIsDefault(false));
            vehicleRepository.save(vehicles);
        }
        return super.save(vehicle);
    }

    @Autowired
    public VehicleServiceImpl(VehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }
}
