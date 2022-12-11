#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
多要素認証の6桁の番号を取得するためのプログラムです。
"""

__author__ = 'Yuito Sakamoto'
__version__ = '1.0.4'
__date__ = '2021/3/4'

import os
import errno
import configparser
import oathtool
import pyperclip

def read_config():
    """
    パスワードが書かれたiniファイルを読み込みます。
    """

    config_ini = configparser.ConfigParser()
    config_ini_file = 'auth.ini'

    if not os.path.exists(config_ini_file):
        raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), config_ini_file)

    config_ini.read(config_ini_file, encoding='utf-8')
    code = config_ini.get('PASSWORD', 'pass')
    return code

def get_key(password):
    """
    oathtoolを使って番号を取得します。
    クリップボードにコピーされ、ターミナルにも出力します。
    """

    key = oathtool.generate_otp(password)
    print(key)
    pyperclip.copy(key)

def main():
    """
    多要素認証の6桁の番号を取得するプログラムのメインプログラムです。
    常に0を返します。
    """

    code = read_config()
    get_key(code)
    return 0

if __name__ == '__main__':
    # 上記のifによって、このスクリプトファイルが直接実行されたときだけ、以下の部分を実行する。

    import sys

    # このモジュールのmain()を呼び出して結果を得て、Pythonシステムに終わりを告げる。
    sys.exit(main())
