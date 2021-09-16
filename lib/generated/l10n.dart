// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter`
  String get appName {
    return Intl.message(
      'Flutter',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `BACK TO HOME`
  String get appBackHome {
    return Intl.message(
      'BACK TO HOME',
      name: 'appBackHome',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Protocol`
  String get protocolPrivacy {
    return Intl.message(
      'Privacy Protocol',
      name: 'protocolPrivacy',
      desc: '',
      args: [],
    );
  }

  /// ` Privacy Protocol `
  String get protocolPrivacyText {
    return Intl.message(
      ' Privacy Protocol ',
      name: 'protocolPrivacyText',
      desc: '',
      args: [],
    );
  }

  /// `Membership Protocol`
  String get protocolMembership {
    return Intl.message(
      'Membership Protocol',
      name: 'protocolMembership',
      desc: '',
      args: [],
    );
  }

  /// ` Membership Protocol `
  String get protocolMembershipText {
    return Intl.message(
      ' Membership Protocol ',
      name: 'protocolMembershipText',
      desc: '',
      args: [],
    );
  }

  /// `Please read carefully before using this product`
  String get protocolNotice {
    return Intl.message(
      'Please read carefully before using this product',
      name: 'protocolNotice',
      desc: '',
      args: [],
    );
  }

  /// `We have always respected and will strictly protect the legitimate rights and interests of users (including user privacy, user data, etc.) when using this product from any infringement. This agreement (including the privacy policy in the last part of this article) is between users (including natural persons, legal persons or other organizations that have obtained this product through various legal channels, hereinafter referred to as users or you) and us against this product A final, complete and exclusive agreement on related matters, and replaces and replaces the discussion and agreement between the parties on the above matters before the merger. This agreement will be legally binding on the user's use of this product, and you have promised and guaranteed that you have the right and ability to enter into this agreement. Users who start to use this product will be deemed to have accepted this agreement. Please read and understand the various terms in this agreement, including exemption and restriction of our exemption clauses and restrictions on the rights of users (minors should be accompanied by legal guardians when reviewing ), if you cannot accept all the terms in this agreement, please do not start using this product.`
  String get protocolNoticeContent {
    return Intl.message(
      'We have always respected and will strictly protect the legitimate rights and interests of users (including user privacy, user data, etc.) when using this product from any infringement. This agreement (including the privacy policy in the last part of this article) is between users (including natural persons, legal persons or other organizations that have obtained this product through various legal channels, hereinafter referred to as users or you) and us against this product A final, complete and exclusive agreement on related matters, and replaces and replaces the discussion and agreement between the parties on the above matters before the merger. This agreement will be legally binding on the user\'s use of this product, and you have promised and guaranteed that you have the right and ability to enter into this agreement. Users who start to use this product will be deemed to have accepted this agreement. Please read and understand the various terms in this agreement, including exemption and restriction of our exemption clauses and restrictions on the rights of users (minors should be accompanied by legal guardians when reviewing ), if you cannot accept all the terms in this agreement, please do not start using this product.',
      name: 'protocolNoticeContent',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get protocolAnd {
    return Intl.message(
      'and',
      name: 'protocolAnd',
      desc: '',
      args: [],
    );
  }

  /// `404`
  String get error404 {
    return Intl.message(
      '404',
      name: 'error404',
      desc: '',
      args: [],
    );
  }

  /// `oops!`
  String get error404Title {
    return Intl.message(
      'oops!',
      name: 'error404Title',
      desc: '',
      args: [],
    );
  }

  /// `We can’t find the page that you’re looking for.`
  String get error404Notice {
    return Intl.message(
      'We can’t find the page that you’re looking for.',
      name: 'error404Notice',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get dialogPrompt {
    return Intl.message(
      'Reminder',
      name: 'dialogPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get dialogAgree {
    return Intl.message(
      'Agree',
      name: 'dialogAgree',
      desc: '',
      args: [],
    );
  }

  /// `Disagree`
  String get dialogDisagree {
    return Intl.message(
      'Disagree',
      name: 'dialogDisagree',
      desc: '',
      args: [],
    );
  }

  /// `START`
  String get guideEnter {
    return Intl.message(
      'START',
      name: 'guideEnter',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navHome {
    return Intl.message(
      'Home',
      name: 'navHome',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get navAccount {
    return Intl.message(
      'Account',
      name: 'navAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login {
    return Intl.message(
      'Sign in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get loginAccount {
    return Intl.message(
      'Account',
      name: 'loginAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPassword {
    return Intl.message(
      'Password',
      name: 'loginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get loginMobileError {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'loginMobileError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter more than 8 character password`
  String get loginPasswordError {
    return Intl.message(
      'Please enter more than 8 character password',
      name: 'loginPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Account or password error`
  String get loginError {
    return Intl.message(
      'Account or password error',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Forget password？`
  String get loginForget {
    return Intl.message(
      'Forget password？',
      name: 'loginForget',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get register {
    return Intl.message(
      'Sign up',
      name: 'register',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
