package com.nyist.ssm.domain;

/**
 * 通话记录统计结果
 */
public class CallLogStat {
    private String yearMonth ;
    private int count ;

    public String getYearMonth() {
        return yearMonth;
    }

    public void setYearMonth(String yearMonth) {
        this.yearMonth = yearMonth;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
