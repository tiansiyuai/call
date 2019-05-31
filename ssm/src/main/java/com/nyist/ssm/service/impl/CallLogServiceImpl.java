package com.nyist.ssm.service.impl;

import com.nyist.ssm.domain.CallLog;
import com.nyist.ssm.domain.CallLogRange;
import com.nyist.ssm.service.CallLogService;
import com.nyist.ssm.service.PersonService;
import com.nyist.ssm.util.CallLogUtil;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 呼叫日志
 */
@Service("callLogService")
public class CallLogServiceImpl implements CallLogService{


    @Resource(name="personServiceCache")
    private PersonService ps ;

    private Table table ;
    public CallLogServiceImpl(){
        try {
            Configuration conf = HBaseConfiguration.create();
            Connection conn = ConnectionFactory.createConnection(conf);
            TableName name = TableName.valueOf("calllog");
            table = conn.getTable(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     *查询所有log
     */
    @Override
    public List<CallLog> findAll() {
        List<CallLog> list = new ArrayList<CallLog>();
        try {
            Scan scan = new Scan();
            ResultScanner rs = table.getScanner(scan);
            Iterator<Result> it = rs.iterator();
            byte[] f = Bytes.toBytes("f1");

            byte[] caller = Bytes.toBytes("caller");
            byte[] callee = Bytes.toBytes("callee");
            byte[] callTime = Bytes.toBytes("callTime");
            byte[] callDuration = Bytes.toBytes("callDuration");
            CallLog log = null ;
            while(it.hasNext()){
                log = new CallLog();
                Result r = it.next();
                //TODO 设置用户名
                String callerStr = Bytes.toString(r.getValue(f, caller)) ;
                log.setCaller(callerStr);
                log.setCallerName(ps.selectNameByPhone(callerStr));

                //TODO 设置用户名
                String calleeStr = Bytes.toString(r.getValue(f, callee)) ;
                log.setCallee(calleeStr);
                log.setCalleeName(ps.selectNameByPhone(calleeStr));

                log.setCallTime(Bytes.toString(r.getValue(f, callTime)));
                log.setCallDuration(Bytes.toString(r.getValue(f, callDuration)));
                list.add(log);
            }

            return list ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 按照范围查询通话记录
     */
    @Override
    public List<CallLog> findCallogs(String call , List<CallLogRange> ranges){
        List<CallLog> logs = new ArrayList<CallLog>();
        try {
            for(CallLogRange range : ranges){
                Scan scan = new Scan();
                //设置扫描起始行
                scan.setStartRow(Bytes.toBytes(CallLogUtil.getStartRowkey(call, range.getStartPoint(),100)));
                //设置扫描结束行
                scan.setStopRow(Bytes.toBytes(CallLogUtil.getStopRowkey(call, range.getStartPoint(), range.getEndPoint(),100)));

                ResultScanner rs = table.getScanner(scan);
                Iterator<Result> it = rs.iterator();
                byte[] f = Bytes.toBytes("f1");

                byte[] caller = Bytes.toBytes("caller");
                byte[] callee = Bytes.toBytes("callee");
                byte[] callTime = Bytes.toBytes("callTime");
                byte[] callDuration = Bytes.toBytes("callDuration");
                CallLog log = null;
                while (it.hasNext()) {
                    log = new CallLog();
                    Result r = it.next();
                    //rowkey
                    String rowkey = Bytes.toString(r.getRow());
                    String flag = rowkey.split(",")[3] ;
                    log.setFlag(flag.equals("0")?true:false);
                    //caller
                    log.setCaller(Bytes.toString(r.getValue(f, caller)));
                    //callee
                    log.setCallee(Bytes.toString(r.getValue(f, callee)));
                    //callTime
                    log.setCallTime(Bytes.toString(r.getValue(f, callTime)));
                    //callDuration
                    log.setCallDuration(Bytes.toString(r.getValue(f, callDuration)));
                    logs.add(log);
                }
            }
            return logs;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
