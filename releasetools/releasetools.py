# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011, The Linux Foundation. All rights reserved.
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import hashlib
import common
import re

def FullOTA_Assertions(info):
  AddDisplaySeriesAssertion(info)
  AddModemAssertion(info)
  return

def IncrementalOTA_Assertions(info):
  AddDisplaySeriesAssertion(info)
  AddModemAssertion(info)
  return

def AddModemAssertion(info):
  android_info = info.input_zip.read("OTA/android-info.txt")
  m = re.search(r'require\s+version-modem\s*=\s*(.+)', android_info)
  if m:
    version = m.group(1).rstrip()
    if len(version) and '*' not in version:
      cmd = 'assert(op3.verify_modem("' + version + '") == "1" || abort("E3004-1: The installed version of firmware is not compatible with this rom."););'
      info.script.AppendExtra(cmd)
  return

def AddDisplaySeriesAssertion(info):
  android_info = info.input_zip.read("OTA/android-info.txt")
  m = re.search(r'require\s+display-series\s*=\s*(.+)', android_info)
  if m:
    series = m.group(1).rstrip()
    if len(series) and '*' not in series:
      cmd = ('ui_print("Checking if this device is a \\"' + series + '\\"...");\n' +
             'assert(getprop("ro.display.series") == "' + series + '" || ' +
             'abort("E3004-2: This rom runs only on \\"' + series + '\\", ' +
             'but this device is \\"\" + getprop(\"ro.display.series\") + \"\\"."););\n' +
             'ui_print(" Confirmed: this device is a \\"\" + getprop(\"ro.display.series\") + \"\\"!!!");')
      info.script.AppendExtra(cmd)
  return
