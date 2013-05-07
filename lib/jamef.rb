require 'active_model'
require 'action_view'
require 'nokogiri'
require 'rest_client'

Dir[File.dirname(__FILE__) + '/jamef/*.rb', File.dirname(__FILE__) + '/jamef/errors/*.rb'].each{|f| require(f)}

module Jamef
  AJU = 174
  BAR = 122
  BAU = 111
  BHZ = 1
  BNU = 13
  BSB = 163
  CCM = 160
  CPQ = 12
  CXJ = 5
  CWB = 10
  FES = 192
  FLN = 11
  FOR = 177
  GYN = 148
  ITJ = 193
  JAS = 4
  JOI = 9
  LDB = 8
  MAO = 149
  MCZ = 183
  POA = 14
  PSA = 159
  RAO = 121
  REC = 171
  RIO = 3
  SAO = 2
  SJK = 125
  SJP = 124
  SSA = 168
  UDI = 109
  VIX = 7
end
