enum SpeciesType {
  NAME_1,
  NAME_2,
  ID_NO,
  PASSPORT_NO,
  PHONE_NO_1,
  PHONE_NO_2,
  PHONE_NO_3,
  TEL_NO_1,
  TEL_NO_2,
  LANGUAGE_1,
  LANGUAGE_2,
  LANGUAGE_3,
  NATION_STATE,
  NATION_CODE_AL2,
  NATION_CODE_AL3,
  NATION_CODE_NO,
  ADDRESS_1,
  ADDRESS_2,
  ADDRESS_3,
  ADDRESS_CITY,
  ADDRESS_TOWN,
  ADDRESS_WARD,
  EMAIL,
  FAX,
  WEBSITE,
  USERNAME,
  PASSWORD_1,
  PASSWORD_2,
  PASSWORD_3,
  PASSWORD_4,
  YEAR,
  YEAR_MONTH,
  YEAR_MONTH_DAY_1,
  YEAR_MONTH_DAY_2,
  DATE_TIME_1,
  DATE_TIME_2,
  TIME_1,
  TIME_2,
  TIME_3,
  TIME_4,
  TIME_5,
  TIME_6,
  TIME_7,
  TIME_8,
  TIME_9,
  TIME_10,
  UTC_TIME_1,
  UTC_TIME_2,
  UTC_TIME_3,
  DURATION_1,
  TIME_INTERVAL_1,
  TIME_INTERVAL_2,
  TIME_INTERVAL_3,
  AMOUNT_1,
  AMOUNT_2,
  AMOUNT_3,
  AMOUNT_4,
  AMOUNT_5,
  CURRENCY,
  BANK_ACC_NO,
  DEBIT_CARD_NO,
  CREDIT_CARD_NO,
  PREPAID_CARD_NO,
  IMAGE_UPLOAD,
  FILE_UPLOAD_1,
  FILE_UPLOAD_2,
  FILE_UPLOAD_3,
  //71-7,
  TAX_CODE,
  BUSSINESS_CODE,
  TAX_1,
  TAX_2,
  TAX_3,
  TAX_4,
  TAX_5,
  TAX_6,
  FEE,
  DISCOUNT,
  //84-8,
}

final _pattern = <SpeciesType, Pattern>{
  SpeciesType.NAME_1:
      r'^([a-zA-Z0-9ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]{1,255})$',
  SpeciesType.NAME_2: r'^(?![\\s.]+$)[a-zA-Z\\s]{1,255}$',
  SpeciesType.ID_NO: r'^[0-9]{9,12}$',
  SpeciesType.PASSPORT_NO: r'^[A-Z0-9]{1,10}$',
  SpeciesType.PHONE_NO_1: r'^[\\+]?(\\d{3,5}\\s\\d{3}\\s\\d{3}\\s\\d{3})$',
  SpeciesType.PHONE_NO_2: r'^(\\d{4}\\s\\d{3}\\s\\d{3})$',
  // SpeciesType.PHONE_NO_3: r'^(\\d){9,15}$',
  SpeciesType.PHONE_NO_3: r'^[0-9\-\+]{9,15}$',
  SpeciesType.TEL_NO_1: r'^[\\+]?(\\d{3,5}\\s\\d{2}\\s\\d{3}\\s\\d{3})$',
  SpeciesType.TEL_NO_2: r'^(\\d{4}\\s)(\\d){1,11}$',
  SpeciesType.LANGUAGE_1: '',
  SpeciesType.LANGUAGE_2: '',
  SpeciesType.LANGUAGE_3:
      r'^(aa|ab|ae|af|ak|am|an|ar|as|av|ay|az|az|ba|be|bg|bh|bi|bm|bn|bo|br|bs|ca|ce|ch|co|cr|cs|cu|cv|cy|da|de|dv|dz|ee|el|en|eo|es|et|eu|fa|ff|fi|fj|fo|fr|fy|ga|gd|gl|gn|gu|gv|ha|he|hi|ho|hr|ht|hu|hy|hz|ia|id|ie|ig|ii|ik|io|is|it|iu|ja|jv|ka|kg|ki|kj|kk|kl|km|kn|ko|kr|ks|ku|kv|kw|ky|la|lb|lg|li|ln|lo|lt|lu|lv|mg|mh|mi|mk|ml|mn|mr|ms|mt|my|na|nb|nd|ne|ng|nl|nn|no|nr|nv|ny|oc|oj|om|os|pa|pi|pl|ps|pt|qu|rm|rn|ro|ru|rw|sa|sc|sd|se|sg|si|sk|sl|sm|sn|so|sq|sr|ss|st|su|sv|sw|ta|te|tg|th|ti|tk|tl|tn|to|tr|ts|tt|tw|ty|ug|uk|ur|uz|ve|vi|vo|wa|wo|xh|yi|yo|za|zh|zu)$',
  SpeciesType.NATION_STATE: '',
  SpeciesType.NATION_CODE_AL2: '',
  SpeciesType.NATION_CODE_AL3: '',
  SpeciesType.NATION_CODE_NO: '',
  SpeciesType.ADDRESS_1: r'^((\\d,)?\\d,\\d,\\d,)$',
  SpeciesType.ADDRESS_2: r'(\\w+,)?\\w+,\\w+,\\w+',
  SpeciesType.ADDRESS_3: '',
  SpeciesType.ADDRESS_CITY: '',
  SpeciesType.ADDRESS_TOWN: '',
  SpeciesType.ADDRESS_WARD: '',
  SpeciesType.EMAIL:
      r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  SpeciesType.FAX: r'[^+? *[1-9]+]?[0-9 ]+',
  SpeciesType.WEBSITE:
      r'^(http(s)?://.)?(www.)?[-a-zA-Z0-9@:%._+~#=]{2,256}.[a-z]{2,6}$',
  SpeciesType.USERNAME: r'^([a-zA-Z0-9\.\-]{2,50})$',
  SpeciesType.PASSWORD_1: r'^[a-zA-Z0-9!@#\\$%\\^\\&*\\)\\(+=._-]{8,20}$',
  SpeciesType.PASSWORD_2: r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  SpeciesType.PASSWORD_3: r'^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$',
  SpeciesType.PASSWORD_4:
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
  SpeciesType.YEAR: r'^\\d{4}$',
  SpeciesType.YEAR_MONTH: r'^\\d{4}-\\d{2}$',
  SpeciesType.YEAR_MONTH_DAY_1: r'^\\d{4}-\\d{2}-\\d{2}$',
  SpeciesType.YEAR_MONTH_DAY_2: r'^\\d{4}\\d{2}\\d{2}$',
  SpeciesType.DATE_TIME_1:
      r'^(([0-9]{4}\-[0-9]{2}\-[0-9]{2}T[0-9]{2}\:[0-9]{2}\:[0-9]{2}Z))|(([0-9]{4}\-[0-9]{2}\-[0-9]{2}T[0-9]{2}\:[0-9]{2}\:[0-9]{2}\+[0-9]{2}\:[0-9]{2}))$',
  SpeciesType.DATE_TIME_2:
      r'^([0-9]{2}\/[0-9]{2}\/[0-9]{4}\ [0-9]{2}\:[0-9]{2}\:[0-9]{2})$',
  SpeciesType.TIME_1: r'^T(\\d{2}:\\d{2}:[0-9.{1}]{0,10})$',
  SpeciesType.TIME_2: r'^T([0-9{2}:(\\s)?\\d{2}:(\\s)?[0-9.{1}]{0,10})$',
  SpeciesType.TIME_3: r'^T([0-9]{2}):(\\s)?([0-9]{2})$',
  SpeciesType.TIME_4: r'^T(\\d{2})$',
  SpeciesType.TIME_5: r'^([0-9]{2}):([0-9]{2}):([0-9]{2}).[0-9]{3}$',
  SpeciesType.TIME_6: r'^([0-9]{2}):([0-9]{2}):([0-9]{2})$',
  SpeciesType.TIME_7: r'^([0-9]{2}):([0-9]{2})$',
  SpeciesType.TIME_8: r'^T(\\d{2}\\d{2}[0-9.{1}]{0,10})$',
  SpeciesType.TIME_9: r'^T(\\d{2}\\d{2}[0-9]{2})$',
  SpeciesType.TIME_10: r'^T(\\d{2}\\d{2})$',
  SpeciesType.UTC_TIME_1: r'(?:Z|[+-](?:2[0-3]|[01][0-9]):[0-5][0-9])$',
  SpeciesType.UTC_TIME_2: r'^(?:Z|[+-](?:2[0-3]|[01][0-9])[0-5][0-9])$',
  SpeciesType.UTC_TIME_3: r'^(?:Z|[+-](?:2[0-3]|[01][0-9]))$',
  SpeciesType.DURATION_1:
      r'^P(?=\\d+[YMWD])(\\d+Y)?(\\d+M)?(\\d+W)?(\\d+D)?(T(?=\\d+[HMS])(\\d+H)?(\\d+M)?(\\d+S)?)?$',
  SpeciesType.TIME_INTERVAL_1:
      r'^(((([0-9]{4})\-(0[0-9]|1[0-2])\-(([0-2][0-9])|(3[0-1])))|)(\T|)((([0-1][0-9]|2[0-3])\:\ ([0-5][0-9]|60)\ \:\ ([0-5][0-9]|60))|)((\+([0-1][0-9]|2[0-3])\:00)|Z|)\\((([0-9]{4})\-(0[0-9]|1[0-2])\-(([0-2][0-9])|(3[0-1])))|)(\T|)((([0-1][0-9]|2[0-3])\:\ ([0-5][0-9]|60)\ \:\ ([0-5][0-9]|60))|)((\+([0-1][0-9]|2[0-3])\:00)|Z|))$',
  SpeciesType.TIME_INTERVAL_2: r'',
  SpeciesType.TIME_INTERVAL_3: r'',
  SpeciesType.AMOUNT_1: r'^(?:\\d{1,3}(?:,\\d{3})*|\\d+)(?:.\\d+)?$',
  SpeciesType.AMOUNT_2: r'^(?:\\d{1,3}(?:,\\d{3})*|\\d+)(?:.\\d+)?$',
  SpeciesType.AMOUNT_3: r'^(-?)(?:\\d{1,3}(?:,\\d{3})*|\\d+)?$',
  SpeciesType.AMOUNT_4: r'^(?:\\d{1,3}(?:.\\d{3})*|\\d+)(?:,\\d+)?$',
  SpeciesType.AMOUNT_5:
      r'^((\(|)((?:[0-9]{1,3})\.)+([0-9]{1,3})(\,[0-9]+|))(\)|)$',
  SpeciesType.CURRENCY: r'',
  SpeciesType.BANK_ACC_NO: r'^[0-9A-Za-z?]{9,14}$',
  SpeciesType.DEBIT_CARD_NO: r'',
  SpeciesType.CREDIT_CARD_NO: r'',
  SpeciesType.PREPAID_CARD_NO: r'',
  SpeciesType.IMAGE_UPLOAD: r'',
  SpeciesType.FILE_UPLOAD_1: r'',
  SpeciesType.FILE_UPLOAD_2: r'',
  SpeciesType.FILE_UPLOAD_3: r'',
  //71-73 not name
  SpeciesType.TAX_CODE: r'^([0-9]{10}(\-[0-9]{3}|))$',
  SpeciesType.BUSSINESS_CODE: r'',
  SpeciesType.TAX_1: r'',
  SpeciesType.TAX_2: r'',
  SpeciesType.TAX_3: r'',
  SpeciesType.TAX_4: r'',
  SpeciesType.TAX_5: r'',
  SpeciesType.TAX_6: r'',
  SpeciesType.FEE: r'',
  SpeciesType.DISCOUNT: r'',
};

class NMValidator {
  static String? error(String? value, SpeciesType type, String? illegal) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(_pattern[type] as String);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return illegal;
  }
}
