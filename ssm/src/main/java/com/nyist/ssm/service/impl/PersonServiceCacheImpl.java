package com.nyist.ssm.service.impl;

import com.nyist.ssm.dao.BaseDao;
import com.nyist.ssm.dao.impl.PersonDaoImpl;
import com.nyist.ssm.domain.Person;
import com.nyist.ssm.service.PersonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 *
 */
@Service("personServiceCache")
public class PersonServiceCacheImpl extends BaseServiceImpl<Person> implements PersonService{
    public static Map<String, String> callers = new HashMap<String, String>();

    static {
        callers.put("15810092493", "史玉龙");
        callers.put("18000696806", "赵贺彪");
        callers.put("15151889601", "张倩 ");
        callers.put("13269361119", "王世昌");
        callers.put("15032293356", "张涛");
        callers.put("17731088562", "张阳");
        callers.put("15338595369", "李进全");
        callers.put("15733218050", "杜泽文");
        callers.put("15614201525", "王子玉");
        callers.put("15778423030", "梁鹏");
        callers.put("18641241020", "郭美彤");
        callers.put("15732648446", "刘飞飞");
        callers.put("13341109505", "段光星");
        callers.put("13560190665", "唐会华");
        callers.put("18301589432", "杨力谋");
        callers.put("13520404983", "温海英");
        callers.put("18332562075", "朱尚宽");
        callers.put("18620192711", "刘能宗");
    }
    @Override
    @Resource(name="personDao")
    public void setDao(BaseDao<Person> dao) {
        super.setDao(dao);
    }
    @Override
    public String selectNameByPhone(String phone){
        return callers.get(phone);
    }
}