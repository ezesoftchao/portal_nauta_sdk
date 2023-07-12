class UserInfo{
  final Account account;
  final HouseAccount houseAccount;

  UserInfo(this.account,this.houseAccount);
}

class Account{
  final String username;
  final String email;
  final String availableTime;
  final String availableBalance;
  final String blockDate;
  final String accountType;
  final String delDate;
  final String serviceType;

  Account(this.username, this.email, this.availableTime, this.availableBalance, this.blockDate, this.accountType, this.delDate, this.serviceType);
}

class HouseAccount{
  final String offer;
  final String monthlyFee;
  final String speedDown;
  final String speedUp;
  final String phone;
  final String linkIdentifier;
  final String linkStatus;
  final String activationDate;
  final String lockDate;
  final String deletionDate;
  final String quotaFund;
  final String debt;

  HouseAccount(this.offer, this.monthlyFee, this.speedDown, this.speedUp, this.phone, this.linkIdentifier, this.linkStatus, this.activationDate, this.lockDate, this.deletionDate, this.quotaFund, this.debt);
}