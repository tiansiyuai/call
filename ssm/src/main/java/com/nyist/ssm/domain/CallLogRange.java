package com.nyist.ssm.domain;

/**
 * Created with IntelliJ IDEA.
 * User: 子玉
 * Date: 2017-11-18
 * Time: 13:39
 * Description:
 */
public class CallLogRange {

    private String startPoint ;
    private String endPoint ;

    public String getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(String startPoint) {
        this.startPoint = startPoint;
    }

    public String getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(String endPoint) {
        this.endPoint = endPoint;
    }

    @Override
    public String toString() {
        return startPoint + " - " + endPoint ;
    }


}
