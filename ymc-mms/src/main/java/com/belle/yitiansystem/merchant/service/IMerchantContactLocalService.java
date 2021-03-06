package com.belle.yitiansystem.merchant.service;

import java.util.Map;

import com.belle.infrastructure.orm.basedao.PageFinder;
import com.belle.infrastructure.orm.basedao.Query;
import com.belle.yitiansystem.merchant.model.vo.ContactsVoLocal;

/**
 * TODO: 增加描述
 * 
 * @author luo.hl
 * @date 2014-7-14 下午4:44:00
 * @version 0.1.0 
 * @copyright yougou.com 
 */
public interface IMerchantContactLocalService {
	public PageFinder<Map<String, Object>> getContactList(
			ContactsVoLocal vo, Query query);
}
