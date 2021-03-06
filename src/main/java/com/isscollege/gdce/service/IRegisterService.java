package com.isscollege.gdce.service;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;
import java.util.List;

public interface IRegisterService
{
	boolean addUser(User user);

	boolean addCompany(Company company);

	boolean registerCompanyTx(Company company, User user);

	boolean ajaxValidateLoginname(String name);

	boolean ajaxValidateCompanyId(String companyId);

	boolean addManager(User user);

	List<User> queryManager();

	int queryLevelById(String id);

	boolean deleteManager(String id);

	boolean updateCompanyByCompany(Company company, String companyId);

	boolean ajaxValidateUsername(String username);

	boolean ajaxValidatePhoneNumber(String phoneNumber);

	boolean ajaxValidateEmail(String email);

	boolean updateUserloginstateByName(User user);

	boolean addAccountant(Company company);

	boolean saveEnterpriseQualification(Company company, String companyId);

	boolean updateAccountant(Company company, String accountantName);

	Company queryCompanyByCompanyID(String number);

	boolean findcompanyId(String companyId);
	public List<User> getMUserList(int offset, int limit, String sort, String order);
	public int getMUserListTotal(String sort, String orde);
}
