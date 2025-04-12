import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LandingPage
  {
    'gkuk8wgt': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SignIn
  {
    'durrbkmo': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    'prs6xc0p': {
      'en': 'Welcome back, please log in to continue \nyour journey',
      'ar': 'أهلاً بك مجدداً، يرجى تسجيل الدخول لمواصلة رحلتك',
    },
    'n9vfycbq': {
      'en': 'Email address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '5wli7ku1': {
      'en': 'Email address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '8xcshr2c': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '7tn7e0c3': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'f6ngt3l9': {
      'en': 'Forgot password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    'eo7rslz6': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    '9dpggc4e': {
      'en': 'Please enter email address',
      'ar': 'الرجاء إدخال عنوان البريد الإلكتروني',
    },
    'hj969z58': {
      'en': 'Please enter email address',
      'ar': 'الرجاء إدخال عنوان البريد الإلكتروني',
    },
    '9f43i85v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    '1n9hrtun': {
      'en': 'Please enter password',
      'ar': 'الرجاء إدخال كلمة المرور',
    },
    'q76m33sn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    '1ymrqool': {
      'en': 'Don’t have an account? ',
      'ar': '',
    },
    'k8dpde54': {
      'en': ' Sign up',
      'ar': '',
    },
    'fipr82z3': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SignUp
  {
    'bnttitxx': {
      'en': 'Sign up',
      'ar': 'اشتراك',
    },
    '51mkhzzn': {
      'en': 'Sign up and begin your journey to the\n next level',
      'ar': 'سجل وابدأ رحلتك إلى المستوى التالي',
    },
    '6p8m77dr': {
      'en': 'First name',
      'ar': 'الاسم الأول',
    },
    '8soj5d8c': {
      'en': 'First name',
      'ar': 'الاسم الأول',
    },
    '9krott77': {
      'en': 'Email address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '7f2d89k4': {
      'en': 'Email address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '3bbr9ibv': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'h7nwuq6q': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '811p5nhl': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    '3lgeslm0': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'n80r0nkd': {
      'en': 'Sign up',
      'ar': 'اشتراك',
    },
    'ii05u2cq': {
      'en': 'Please enter first name',
      'ar': 'الرجاء إدخال الاسم الأول',
    },
    'mt0833fn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    '0iv6dpxi': {
      'en': 'Please enter email address',
      'ar': '',
    },
    '33lmklj7': {
      'en': 'Please enter email address',
      'ar': '',
    },
    'vsr3oz5m': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jd1lgw6z': {
      'en': 'Please enter password',
      'ar': '',
    },
    '2e06ru0n': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '675y4yl2': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب بالفعل؟',
    },
    'zyp2vxna': {
      'en': ' Sign in',
      'ar': 'تسجيل الدخول',
    },
    '7n631pnw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Home
  {
    '0r7qthsz': {
      'en': 'Leaderboard',
      'ar': 'لوحة المتصدرين',
    },
    'ckcudqnx': {
      'en': 'Rank',
      'ar': 'رتبة',
    },
    '60dqmwxv': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'pwf2qce4': {
      'en': 'Score',
      'ar': 'نتيجة',
    },
    'gz8kql1e': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // Profile
  {
    'ft2blr1t': {
      'en': 'Kids',
      'ar': 'أطفال',
    },
    's53dm9ek': {
      'en': 'Presence',
      'ar': 'حضور',
    },
    'qpyft5ui': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'kwgnxv9u': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    'i1f5ofya': {
      'en': 'This  Applcation was Developed With Love By',
      'ar': 'تم تطوير هذا التطبيق بكل حب من قبل',
    },
    '1reid8v0': {
      'en': 'Nihed BenAbdennour',
      'ar': 'نهاد بن عبد النور',
    },
    'eiz0h5ql': {
      'en': 'Profile',
      'ar': 'حساب ',
    },
    '6r47vpz7': {
      'en': 'Profile',
      'ar': 'حساب ',
    },
  },
  // ForgetPassword
  {
    'sje902hh': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'z8cfo74l': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    'a5pwaa7h': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar':
          'سنرسل لك رسالة بريد إلكتروني تحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال البريد الإلكتروني المرتبط بحسابك أدناه.',
    },
    'bxv3t92h': {
      'en': 'Your email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
    },
    'nta1idy8': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'c905k17b': {
      'en': 'Send Link',
      'ar': 'إرسال الرابط',
    },
    '4ng0c85v': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // Presence
  {
    'qtsv9shd': {
      'en': 'Today Presence',
      'ar': 'الحضور اليوم',
    },
    'fmboj8z0': {
      'en': 'Presence',
      'ar': 'حضور',
    },
  },
  // AddKid
  {
    '2qqm33p9': {
      'en': 'Add new kid',
      'ar': 'إضافة طفل جديد',
    },
    'w3enyeop': {
      'en': 'Complete Name ',
      'ar': 'الاسم الكامل',
    },
    '48extjel': {
      'en': 'Complete Name ',
      'ar': 'الاسم الكامل',
    },
    'a1xt7eux': {
      'en': 'Parent Phone Number',
      'ar': 'رقم هاتف الوالدين',
    },
    '6e97w37q': {
      'en': 'Parent Phone Number',
      'ar': 'رقم هاتف الوالدين',
    },
    '0kzj76u4': {
      'en': 'Select Gender ..',
      'ar': 'حدد الجنس ..',
    },
    '1wwt5cw2': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن العنصر...',
    },
    'yepe4sx4': {
      'en': 'BOY',
      'ar': 'BOY',
    },
    'd5suwdao': {
      'en': 'GIRL',
      'ar': 'GIRL',
    },
    'uj2i4w5z': {
      'en': 'Select Birth Date',
      'ar': 'حدد تاريخ الميلاد',
    },
    'xchsb781': {
      'en': 'Upload Picture',
      'ar': 'تحميل الصورة',
    },
    'lymy0dc7': {
      'en': 'Upload Medical Folder',
      'ar': 'تحميل المجلد الطبي',
    },
    '85hbgwcz': {
      'en': 'Add now',
      'ar': 'أضف الآن',
    },
    '1l871y38': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // KidsByClass
  {
    'a9zn69vb': {
      'en': 'الأطفال',
      'ar': 'الأطفال',
    },
  },
  // KidDetails
  {
    'ea9023rz': {
      'en': 'Parents Phone Number',
      'ar': 'رقم هاتف الوالدين',
    },
    'ja9balmz': {
      'en': 'Medical  Folder',
      'ar': 'المجلد الطبي',
    },
    'kass826q': {
      'en': 'Home',
      'ar': 'الرئيسية  ',
    },
  },
  // Classes
  {
    'pqoyyrut': {
      'en': 'Classes',
      'ar': 'الفصول الدراسية',
    },
    'vh43mxnk': {
      'en': 'Classes',
      'ar': 'الفصول الدراسية',
    },
  },
  // AddClass
  {
    'b2257pks': {
      'en': 'Add new Class',
      'ar': 'إضافة فصل جديد',
    },
    'gb323pp2': {
      'en': 'Class Name',
      'ar': 'اسم الفصل',
    },
    'p0s5h534': {
      'en': 'Class Name',
      'ar': 'اسم الفصل',
    },
    'ivp95cj2': {
      'en': 'Add now',
      'ar': 'أضف الآن',
    },
    'uix1ksdd': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // SelectGame
  {
    'u2sqias2': {
      'en': 'Kid Make Presence by playing a Game',
      'ar': 'الطفل يصنع حضوره من خلال لعب لعبة',
    },
    'xwnf5l03': {
      'en': 'Games',
      'ar': 'ألعاب',
    },
    'ynih5bzv': {
      'en': 'Draw',
      'ar': 'يرسم',
    },
    'resm7adn': {
      'en': '10 Points',
      'ar': '10 نقاط',
    },
    'xfu3oygj': {
      'en': 'Bee',
      'ar': 'نحلة',
    },
    'dkvcc55c': {
      'en': '10 Points',
      'ar': '10 نقاط',
    },
    '9ykfnroi': {
      'en': 'Quiz',
      'ar': 'لغز',
    },
    'uc9ly48j': {
      'en': '10 Points',
      'ar': '10 نقاط',
    },
    'g5yla0in': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // HomePresnce
  {
    'p362v4s0': {
      'en': 'Presence',
      'ar': 'حضور',
    },
    'fc1pvdu3': {
      'en': 'Check Presence Today',
      'ar': 'تحقق من الحضور اليوم',
    },
    'vbsos03u': {
      'en': 'Presence History',
      'ar': 'تاريخ الحضور',
    },
    'x0f0c9bk': {
      'en': 'Presence',
      'ar': 'حضور',
    },
  },
  // BeeGame
  {
    'yir3s8v6': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // BoyWinner
  {
    'enwa6czb': {
      'en': 'Good Morning',
      'ar': 'صباح الخير',
    },
    'fa7tmjuj': {
      'en': 'Done',
      'ar': 'منتهي',
    },
    'feye5r63': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // GirlWinner
  {
    'h2cxzpfx': {
      'en': 'Good Morning',
      'ar': 'صباح الخير',
    },
    'yx876qef': {
      'en': 'Done',
      'ar': 'منتهي',
    },
    'gevjbity': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // DrawingPage
  {
    'urroh54p': {
      'en': 'Draw Something',
      'ar': 'ارسم شيئا',
    },
    'gry64qfe': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'gx4cim3p': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // QuizGame
  {
    '8320t3gl': {
      'en': 'What\'s This ?',
      'ar': 'ما هذا ؟',
    },
    '1eqotl9k': {
      'en': 'Apple',
      'ar': 'تفاحة',
    },
    'bbe70t2e': {
      'en': 'strawberry',
      'ar': 'لفراولة',
    },
    'apmi01tk': {
      'en': 'Orange',
      'ar': 'برتقال',
    },
    'pwld5fjk': {
      'en': 'Banana',
      'ar': 'موز',
    },
    'jj2241ej': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // ReactionAngry
  {
    '5ct7d3jl': {
      'en': 'OoOH !',
      'ar': 'أوووه!',
    },
    'c87rd90x': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'ot1xpqz2': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // BravoReaction
  {
    '0rlmityy': {
      'en': 'Bravoooooo !',
      'ar': 'برافوووو!',
    },
    'gcz0zpdb': {
      'en': 'التالي',
      'ar': 'التالي',
    },
    'kcqtcqr8': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // ChooseKid
  {
    '3p0agmn0': {
      'en': 'Select Kid',
      'ar': 'اختر طفلاً',
    },
    'xrvpcnhj': {
      'en': 'الأطفال',
      'ar': 'الأطفال',
    },
  },
  // PresenceDetails
  {
    'nzn4ku8n': {
      'en': 'Presence List',
      'ar': 'قائمة الحضور',
    },
    '8oo12hyo': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // PresenceByClasses
  {
    '0vds9bqz': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // Settings
  {
    'me1d1mrs': {
      'en': 'Change password',
      'ar': 'تغيير كلمة المرور',
    },
    'cysruyzr': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
    },
    '92ap0wp9': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'k4xpwqbv': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // Bee
  {
    '6od2hn0r': {
      'en': 'Next',
      'ar': 'التالي',
    },
  },
  // RankPointsTable
  {
    'ij32fjmz': {
      'en': 'Points',
      'ar': 'نقاط',
    },
    'u3dio8jh': {
      'en': '+10 ',
      'ar': '+10',
    },
  },
  // SelectLanguage
  {
    'w62x0buc': {
      'en': 'عربية',
      'ar': 'عربية',
    },
    'pqnujf1w': {
      'en': 'English',
      'ar': 'English',
    },
  },
  // Miscellaneous
  {
    '381g0rgr': {
      'en': '',
      'ar': '',
    },
    'qwzwizfa': {
      'en': '',
      'ar': '',
    },
    'vb3emsuv': {
      'en': '',
      'ar': '',
    },
    'bj7y5zuw': {
      'en': '',
      'ar': '',
    },
    'exyqgnh0': {
      'en': '',
      'ar': '',
    },
    'bwcw4y3b': {
      'en': '',
      'ar': '',
    },
    'gier6417': {
      'en': '',
      'ar': '',
    },
    'y827odx5': {
      'en': '',
      'ar': '',
    },
    'qpemh1t9': {
      'en': '',
      'ar': '',
    },
    'oy0ir44b': {
      'en': '',
      'ar': '',
    },
    '05qh02oo': {
      'en': '',
      'ar': '',
    },
    'zmxyqs3m': {
      'en': '',
      'ar': '',
    },
    'bhb3dvpk': {
      'en': '',
      'ar': '',
    },
    'ip0ltzxm': {
      'en': '',
      'ar': '',
    },
    'e9qbkr6b': {
      'en': '',
      'ar': '',
    },
    '8tx2vmfi': {
      'en': '',
      'ar': '',
    },
    '3hhztl3w': {
      'en': '',
      'ar': '',
    },
    'yxcibv2f': {
      'en': '',
      'ar': '',
    },
    'oh238yqo': {
      'en': '',
      'ar': '',
    },
    'mnaxzupj': {
      'en': '',
      'ar': '',
    },
    'ymlnp3ve': {
      'en': '',
      'ar': '',
    },
    'n8s42la9': {
      'en': '',
      'ar': '',
    },
    'lu70nsjh': {
      'en': '',
      'ar': '',
    },
    'yxj32ozf': {
      'en': '',
      'ar': '',
    },
    '06hb9kyw': {
      'en': '',
      'ar': '',
    },
    'k6j8oe32': {
      'en': '',
      'ar': '',
    },
    'p1lt1xi3': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
