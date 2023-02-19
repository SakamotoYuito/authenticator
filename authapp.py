#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'Yuito Sakamoto'
__version__ = '1.0.1'
__date__ = '2023/2/18'

import rumps
import sys
import os
import configparser
import oathtool
import pyperclip

class Authenticator(rumps.App):
  def __init__(self, name):
    super(Authenticator, self).__init__(name, icon="icon.png", quit_button='多要素認証を終了')
    self.config_ini = configparser.ConfigParser()
    self.config_ini_file = 'auth.ini'
  
  def write_config(self):
    with open(self.config_ini_file, "w") as f:
        self.config_ini.write(f)

  @rumps.clicked("コードを取得")
  def copy_code(self, _):
    if not os.path.exists(self.config_ini_file):
      rumps.notification("エラー", "事前共有鍵を設定していません", "")
      sys.exit(0)

    try:
      self.config_ini.read(self.config_ini_file, encoding='utf-8')
      code = self.config_ini.get('PASSWORD', 'pass')
    except:
      self.config_ini["PASSWORD"] = {"pass": ""}
      self.write_config()
      rumps.alert("事前共有鍵を設定していません")
      sys.exit(0)

    if type(code) != str or len(code) != 16:
      rumps.alert("事前共有鍵を設定していません")
      sys.exit(0)

    key = oathtool.generate_otp(code)
    pyperclip.copy(key)
    rumps.notification("コード", str(key), "")

  @rumps.clicked("事前共有鍵設定")
  def set_password(self, _):
    response = rumps.Window('16桁の事前共有鍵', dimensions=(200, 20)).run()
    if response.clicked:
      try:
        self.config_ini.read(self.config_ini_file, encoding='utf-8')
        self.config_ini.get('PASSWORD', 'pass')
      except:
        self.config_ini["PASSWORD"] = {"pass": ""}
        self.write_config()

      self.config_ini["PASSWORD"].update({"pass": response.text})
      self.write_config()
      


if __name__ == "__main__":
  Authenticator("多要素認証").run()