package com.nyist.ssm.service;

import com.nyist.ssm.domain.CallLog;
import com.nyist.ssm.domain.CallLogRange;

import java.util.List;

/**
 *
 */
public interface CallLogService {
    public List<CallLog> findAll();

    List<CallLog> findCallogs(String caller, List<CallLogRange> list);


}
