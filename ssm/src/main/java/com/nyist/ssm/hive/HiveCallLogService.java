package com.nyist.ssm.hive;


import com.nyist.ssm.domain.CallLog;
import com.nyist.ssm.domain.CallLogStat;
import org.apache.hadoop.hbase.client.Result;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@Service("hiveCallLogService")
public class HiveCallLogService {

    //hiveserver2连接串
    private static String url = "jdbc:hive2://hd01:10000/mydb" ;
    //驱动程序类
    private static String driverClass = "org.apache.hive.jdbc.HiveDriver" ;

    static{
        try {
            Class.forName(driverClass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 查询最近的通话记录,使用hive进行mr查询.
     */
    public CallLog findLatestCallLog(String phoneNum){
        try {
            Connection conn = DriverManager.getConnection(url);
            Statement st = conn.createStatement();
            //select * from mydb.ext_calllogs_in_hbase where id like '%15732648446%' order by callTime desc limit 1 ;
            // select * from mydb.ext_calllogs_in_hbase where id like '%15732648446%' order by callTime desc limit 1
            System.out.println("111"+phoneNum+"1113333");
            String sql = "select * from mydb.ext_calllogs_in_hbase where id like '%"+ phoneNum+"%' order by callTime desc limit 1" ;
            System.out.println(sql);


            ResultSet rs = st.executeQuery(sql);


            CallLog log = null ;
            while(rs.next()){
                log = new CallLog();
                System.out.println("aaaaaaaaaaaa");
                //打印Caller
                System.out.println(rs.getString("caller"));
                log.setCaller(rs.getString("caller"));
                log.setCallee(rs.getString("callee"));
                log.setCallTime(rs.getString("callTime"));
                log.setCallDuration(rs.getString("callDuration"));
            }
            rs.close();
            return log ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null ;
    }


    /**
     * 查询指定人员在各个月份的的通话次数
     * @param caller
     */
    public List<CallLogStat> statCallLogsCount(String caller, String year){
        List<CallLogStat> list = new ArrayList<CallLogStat>() ;
        try {
            Connection conn = DriverManager.getConnection(url);
            Statement st = conn.createStatement();
            String sql = "select count(*) ,substr(calltime,1,6) from mydb.ext_calllogs_in_hbase " +
                    "where caller = '" + caller+"' and substr(calltime,1,4) == '" + year
                    + "' group by substr(calltime,1,6)";
            ResultSet rs = st.executeQuery(sql);
            CallLog log = null;
            while (rs.next()) {
                CallLogStat logSt = new CallLogStat();
                logSt.setCount(rs.getInt(1));
                System.out.println(rs.getInt(1));
                logSt.setYearMonth(rs.getString(2));
                list.add(logSt);
            }
            rs.close();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
