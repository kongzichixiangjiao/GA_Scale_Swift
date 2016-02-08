//
//  data.swift
//  GA_Scale_Swift
//
//  Created by houjianan on 16/2/1.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import Foundation

enum UnitsType {
    case weight, time, volume, temperature, power, metric, length, energy, area, angle
}

struct data {
//    static let
    static let Units: [[String : UnitsType]] = [["重量" : .weight], ["时间" : .time], ["体积" : .volume], ["温度" : .temperature], ["功率" : .power], ["十进制" : .metric], ["长度" : .length], ["能量" : .energy], ["面积" : .area], ["角度" : .angle]]
    //重量
    static let weightUnits: [WeightUnit] = {
        return [.milligram, .centigram, .decigram, .gram, .dekagram, .hectogram, .kilogram, .ton, .carat, .newton, .ounce, .pound, .stone]
    }()
    static let weightUnitsString: [MyWeightUnit] = {
        return [.毫克_milligram, .里克_centigram, .分克_decigram, .克_gram, .十克_dekagram, .百克_hectogram, .千克_kilogram, .吨_ton, .克拉_carat, .牛顿_newton, .盎司_ounce, .英镑_pound, .石头_stone]
    }()
    //时间
    static let timeUnits: [TimeUnit] = {
        return [.nanosecond, .microsecond, .millisecond, .centisecond, .second, .minute, .hour, .day, .week, .fortnight, .month, .year, .decade, .century, .millennium]
    }()
    static let timeUnitsString: [MyTimeUnit] = {
        return [.纳秒_nanosecond, .微妙_microsecond, .毫秒_millisecond, .里秒_centisecond, .秒_second, .分_minute, .时_hour, .天_day, .周_week, .两星期_fortnight, .月_month, .年_year, .十年_decade, .百年_century, .千年_millennium]
    }()
    //体积
    static let volumeUnits: [VolumeUnit] = {
        return [.microliter, .milliliter, .centiliter, .liter, .dekaliter, .hectoliter, .kiloliter, .gill, .gallon, .pint, .quart]
    }()
    static let volumeUnitsString: [MyVolumeUnit] = {
        return [.微升_microliter, .毫升_milliliter, .里升_centiliter, .公升_liter, .十升_dekaliter, .百升_hectoliter, .千升_kiloliter, .及耳_gill, .加仑_gallon, .品脱_pint, .夸脱_quart]
    }()
    //温度
    static let temperatureUnits: [TemperatureUnit] = {
        return [.kelvin, .celsius, .fahrenheit]
    }()
    static let temperatureUnitsString: [MyTemperatureUnit] = {
        return [.开式度_kelvin, .摄氏度_celsius, .华氏度_fahrenheit]
    }()
    //功率
    static let powerUnits: [PowerUnit] = {
        return [.milliwatt, .watt, .kilowatt, .megawatt, .gigawatt, .horsepower]
    }()
    static let powerUnitsString: [MyPowerUnit] = {
        return [.毫瓦特_milliwatt, .瓦特_watt, .千瓦_kilowatt, .兆瓦特_megawatt, .千兆瓦特_gigawatt, .马力_horsepower]
    }()
    //度量
    static let metricUnits: [MetricUnit] = {
        return [.nano, .micro, .milli, .centi, .deci, .base, .deka, .hecto, .kilo, .mega, .giga, .tera, .peta]
    }()
    static let metricUnitsString: [MyMetricUnit] = {
        return [.亿分之一_nano, .十万分之一_micro, .千分之一_milli, .百分之一_centi, .十分之一_deci, .一_base, .十倍_deka, .百倍_hecto, .千倍_kilo, .百万倍_mega, .十亿倍_giga, .兆倍_tera, .千兆倍_peta]
    }()
    //长度
    static let lengthUnits: [LengthUnit] = {
        return [.millimeter, .centimeter, .decimeter, .meter, .dekameter, .hectometer, .kilometer, .yard, .parsec, .mile, .foot, .fathom, .inch, .league]
    }()
    static let lengthUnitsString: [MyLengthUnit] = {
        return [.毫米_millimeter, .厘米_centimeter, .分米_decimeter, .米_meter, .十米_dekameter, .百米_hectometer, .千米_kilometer, .码_yard, .秒差距_parsec, .英里_mile, .英尺_foot, .英寻_fathom, .英寸_inch, .里格_league]
    }()
    //能量
    static let energyUnits: [EnergyUnit] = {
        return [.joule, .kilojoule, .gramcalorie, .kilocalorie, .watthour]
    }()
    static let energyUnitsString: [MyEnergyUnit] = {
        return [.焦耳_joule, .千焦_kilojoule, .克卡_gramcalorie, .千卡_kilocalorie, .瓦时_watthour]
    }()
    //面积
    static let areaUnits: [AreaUnit] = {
        return [.squareFoot, .squareYard, .squareMeter, .squareKilometer, .squareMile, .acre, .hectare]
    }()
    static let areaUnitsString: [MyAreaUnit] = {
        return [.平方英尺_squareFoot, .平方码_squareYard, .平方米_squareMeter, .平方千米_squareKilometer, .平方英里_squareMile, .英亩_acre, .公顷_hectare]
    }()
    //角度
    static let angleUnits: [AngleUnit] = {
        return [.degree, .radian, .pi]
    }()
    static let angleUnitsString: [MyAngleUnit] = {
        return [.度_degree, .弧度_radian, .π_pi]
    }()
    
    
}