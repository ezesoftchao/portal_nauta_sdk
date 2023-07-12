library portal_nauta;

import 'dart:io';

import 'package:portal_nauta/src/captcha/load_bytes_captcha.dart';
import 'package:portal_nauta/src/captcha/save_captcha_local.dart';
import 'package:portal_nauta/src/core/di.dart';
import 'package:portal_nauta/src/csrf/load_csrf.dart';
import 'package:portal_nauta/src/csrf/load_csrf_document.dart';
import 'package:portal_nauta/src/csrf/read_csrf_local.dart';
import 'package:portal_nauta/src/csrf/save_csrf_local.dart';
import 'package:portal_nauta/src/login/load_login_html.dart';
import 'package:portal_nauta/src/login/login_login.dart';
import 'package:portal_nauta/src/recharge/load_recharge.dart';
import 'package:portal_nauta/src/recharge/recharge.dart';
import 'package:portal_nauta/src/transfer/parse_transfer.dart';
import 'package:portal_nauta/src/transfer/transfer.dart';
import 'package:portal_nauta/src/user_info/load_user_info_document.dart';
import 'package:portal_nauta/src/user_info/parse_user_info.dart';
import 'package:portal_nauta/src/user_info/user_info.dart';
import 'package:portal_nauta/src/change_password/change_password.dart';
import 'package:portal_nauta/src/change_password/load_change_password_document.dart';

export 'src/login/exceptions/captcha_wrong_exception.dart';
export 'src/login/exceptions/user_or_password_wrong_exception.dart';

export 'src/change_password/exceptions/new_password_error_validation.dart';
export 'src/change_password/exceptions/old_password_wrong.dart';

export 'src/recharge/exceptions/code_wrong.dart';

class PortalNauta extends Di {
  Future<bool> login(String username, String password, String captcha) async {
    final csrf = await ReadCsrfLocal(localManager).execute(await pathLocal());
    final loginDocument = await LoadLoginHtml(await clientHttp())
        .execute(csrf, username, password, captcha);

    return LoadLogin(loginDocument).execute();
  }

  Future<File> preLogin() async {
    final documentCsrf = await LoadCsrfDocument(await clientHttp()).execute();
    final csrf = LoadCsrf(documentCsrf).execute();

    await SaveCsrfLocal(localManager).execute(await pathLocal(), csrf);

    final bytesCaptchaFile =
        await LoadBytesCaptcha(await clientHttp()).execute();

    final captchaFile = await SaveCaptchaLocal(localManager)
        .execute(await pathLocal(), bytesCaptchaFile);

    return captchaFile;
  }

  Future<UserInfo> userInfo() async {
    final userInfoDocument =
        await LoadUserInfoDocument(await clientHttp()).execute();

    return ParseUserInfo(userInfoDocument).execute();
  }

  Future<bool> changePassword( String oldPassword, String newPassword, String repeatPassword ) async {
    final csrf = await ReadCsrfLocal(localManager).execute(await pathLocal());

    final loadChangePasswordDocument =
    await LoadChangePasswordDocument(await clientHttp()).execute( csrf, oldPassword, newPassword, repeatPassword );

    return LoadChangePassword(loadChangePasswordDocument).execute();
  }

  Future<bool> recharge( String code ) async {
    final csrf = await ReadCsrfLocal(localManager).execute(await pathLocal());

    final loadRechargeDocument =
    await LoadRechargeDocument(await clientHttp()).execute( csrf, code );

    return LoadRecharge(loadRechargeDocument).execute();
  }

  Future<bool> transfer( String balance, String userPassword, String accountDestinatary ) async {
    final csrf = await ReadCsrfLocal(localManager).execute(await pathLocal());

    final parseTransferDocument =
    await ParseTransferDocument(await clientHttp()).execute( csrf, balance, userPassword, accountDestinatary );

    return ParseTransfer(parseTransferDocument).execute();
  }
}
