package com.nyist.ssm.web.controller;

import com.alibaba.fastjson.JSON;
import com.nyist.ssm.domain.*;
import com.nyist.ssm.service.CallLogService;
import com.nyist.ssm.hive.HiveCallLogService;
import com.nyist.ssm.util.CallLogUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.nyist.ssm.domain.CallLog;
import com.nyist.ssm.domain.CallLogRange;
import com.nyist.ssm.hive.HiveCallLogService;
import com.nyist.ssm.service.CallLogService;
import com.nyist.ssm.service.PersonService;
import com.nyist.ssm.util.CallLogUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/4/11.
 */
@Controller
public class CallLogController {

    @Resource(name="personService")
    private PersonService ps ;

    //注入hiveservice
    @Resource(name="hiveCallLogService")
    private HiveCallLogService hcs ;

    @Resource(name="callLogService")
    private CallLogService cs ;

    @RequestMapping("/callLog/findAll")
    public String findAll(Model m){
        List<CallLog> list = cs.findAll();

        m.addAttribute("callLogs",list);
        return "callLog/callLogList" ;

    }

    @RequestMapping("/callLog/json/findAll")
    public String findAllJson(HttpServletResponse response) {
        List<CallLog> list = cs.findAll();
        String json = JSON.toJSONString(list);
        //***通知浏览器接受到数据类型字符集****
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        try {
            OutputStream out = response.getOutputStream();

            /**** json文件采用编码的字符集 ****/
            out.write(json.getBytes("utf-8"));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  null;
    }

    /**
     * 进入查询通话记录的页面,form
     */
    @RequestMapping("/callLog/toFindCallLogPage")
    public String toFindCallLogPage(){
        return "callLog/findCallLog" ;
    }

    @RequestMapping(value = "/callLog/findCallLog",method = RequestMethod.POST)
    public String findCallLog(Model m , @RequestParam("caller") String caller, @RequestParam("startTime") String startTime, @RequestParam("endTime") String endTime){
        List<CallLogRange> list = CallLogUtil.getCallLogRanges(startTime, endTime);
        List<CallLog> logs = cs.findCallogs(caller,list);
        m.addAttribute("callLogs", logs);
        return "callLog/callLogList" ;
    }

    /**
     * 查询最近通话记录
     */
    @RequestMapping(value = "/callLog/findLatestCallLog",method = RequestMethod.POST)
    public String findLatestCallLog(Model m , @RequestParam("caller") String caller){
        CallLog log = hcs.findLatestCallLog(caller);
        if(log != null){
            m.addAttribute("log", log);
        }
        return "callLog/latestCallLog" ;
    }

    /**
     * 查询最近通话记录
     */
    @RequestMapping(value = "/callLog/toFindLatestCallLog")
    public String toFindLatestCallLog(){
        return "callLog/findLatestCallLog" ;
    }

    /**
     * 统计指定人员，指定月份的通话次数
     */
    @RequestMapping("/callLog/toStatCallLog")
    public String toStatCallLog(){
        return "callLog/statCallLog" ;
    }

    /**
     * 统计指定人员，指定月份的通话次数
     */
    @RequestMapping("/callLog/statCallLog")
    public String statCallLog(Model m ,@RequestParam("caller") String caller ,@RequestParam("year") String year){
        List<CallLogStat> list = hcs.statCallLogsCount(caller, year);

        if(list != null && !list.isEmpty()){
            List<String> months = new ArrayList<String>();
            List<Integer> counts = new ArrayList<Integer>();
            for(CallLogStat cls : list){
                months.add(cls.getYearMonth());
                counts.add(cls.getCount());
            }

            m.addAttribute("title", caller + "在" + year + "年各月份通话次数统计");
            m.addAttribute("list", list);
        }

        return "callLog/statCallLog" ;
    }

    /**
     */
    public String statCallLog222(String caller, String year) {
        List<CallLogStat> list = new ArrayList<CallLogStat>();
        CallLogStat st = new CallLogStat();
        st.setYearMonth("1");
        st.setCount(100);
        list.add(st);
        st = new CallLogStat();
        st.setYearMonth("2");
        st.setCount(300);
        list.add(st);
        st = new CallLogStat();
        st.setYearMonth("3");
        st.setCount(280);
        list.add(st);

        if (list != null && !list.isEmpty()) {
            List<String> months = new ArrayList<String>();
            List<Integer> counts = new ArrayList<Integer>();
            for (CallLogStat cls : list) {
                months.add(cls.getYearMonth());
                counts.add(cls.getCount());
            }

            JSON.toJSONString(months);
            JSON.toJSONString(counts);
        }

        return "callLog/statCallLog";
    }
}
