package com.nyist.ssm.domain;

/**
 * CallLog
 */
import com.nyist.ssm.util.CallLogUtil;


/**
 * CallLog
 */
public class CallLog {
    private String caller ;
    private String callee ;
    private String callTime ;
    private String callDuration ;
    //是否是主叫
    private boolean flag ;

    public String getCallerName() {
        return callerName;
    }


    public String getCalleeName() {
        return calleeName;
    }

    private String callerName;
    private String calleeName;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getCaller() {
        return caller;
    }

    public void setCaller(String caller) {
        this.caller = caller;
    }

    public String getCallee() {
        return callee;
    }

    public void setCallee(String callee) {
        this.callee = callee;
    }

    public String getCallTime() {
        if(callTime != null){
            return CallLogUtil.formatDate(callTime);
        }
        return null ;
    }

    public void setCallTime(String callTime) {
        this.callTime = callTime;
    }

    public String getCallDuration() {
        return callDuration;
    }

    public void setCallDuration(String callDuration) {
        this.callDuration = callDuration;
    }

    public void setCallerName(String callerName) {
        this.callerName = callerName;
    }

    public void setCalleeName(String calleeName) {
        this.calleeName = calleeName;
    }
}
