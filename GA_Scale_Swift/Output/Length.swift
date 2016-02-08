//
//  Length.swift
//  Scale
//
//  Created by Khoa Pham
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public enum MyLengthUnit: Double {
    case 毫米_millimeter = 0.001
    case 厘米_centimeter = 0.01
    case 分米_decimeter = 0.1
    case 米_meter = 1
    case 十米_dekameter = 10
    case 百米_hectometer = 100
    case 千米_kilometer = 1_000
    case 码_yard = 0.914_4
    case 秒差距_parsec = 30_856_775_813_060_000
    case 英里_mile = 1_609.344
    case 英尺_foot = 0.304_8
    case 英寻_fathom = 1.828_8
    case 英寸_inch = 0.025_4
    case 里格_league = 4_828.032
    
    static var defaultScale: Double {
        return LengthUnit.meter.rawValue
    }
}

public enum LengthUnit: Double {
    case millimeter = 0.001
    case centimeter = 0.01
    case decimeter = 0.1
    case meter = 1
    case dekameter = 10
    case hectometer = 100
    case kilometer = 1_000
    case yard = 0.914_4
    case parsec = 30_856_775_813_060_000
    case mile = 1_609.344
    case foot = 0.304_8
    case fathom = 1.828_8
    case inch = 0.025_4
    case league = 4_828.032
    
    static var defaultScale: Double {
        return LengthUnit.meter.rawValue
    }
}

public struct Length {
    public let value: Double
    public let unit: LengthUnit

    public init(value: Double, unit: LengthUnit) {
        self.value = value
        self.unit = unit
    }

    public func to(unit unit: LengthUnit) -> Length {
        return Length(value: self.value * self.unit.rawValue * LengthUnit.meter.rawValue / unit.rawValue, unit: unit)
    }
}

public extension Double {
    public var millimeter: Length {
        return Length(value: self, unit: .millimeter)
    }

    public var centimeter: Length {
        return Length(value: self, unit: .centimeter)
    }

    public var decimeter: Length {
        return Length(value: self, unit: .decimeter)
    }

    public var meter: Length {
        return Length(value: self, unit: .meter)
    }

    public var dekameter: Length {
        return Length(value: self, unit: .dekameter)
    }

    public var hectometer: Length {
        return Length(value: self, unit: .hectometer)
    }

    public var kilometer: Length {
        return Length(value: self, unit: .kilometer)
    }

    public var yard: Length {
        return Length(value: self, unit: .yard)
    }

    public var parsec: Length {
        return Length(value: self, unit: .parsec)
    }

    public var mile: Length {
        return Length(value: self, unit: .mile)
    }

    public var foot: Length {
        return Length(value: self, unit: .foot)
    }

    public var fathom: Length {
        return Length(value: self, unit: .fathom)
    }

    public var inch: Length {
        return Length(value: self, unit: .inch)
    }

    public var league: Length {
        return Length(value: self, unit: .league)
    }
}

public func compute(left: Length, right: Length, operation: (Double, Double) -> Double) -> Length {
    let (min, max) = left.unit.rawValue < right.unit.rawValue ? (left, right) : (right, left)
    let result = operation(min.value, max.to(unit: min.unit).value)

    return Length(value: result, unit: min.unit)
}

public func +(left: Length, right: Length) -> Length {
    return compute(left, right: right, operation: +)
}

public func -(left: Length, right: Length) -> Length {
    return compute(left, right: right, operation: -)
}

public func *(left: Length, right: Length) -> Length {
    return compute(left, right: right, operation: *)
}

public func /(left: Length, right: Length) throws -> Length {
    guard right.value != 0 else {
        throw Error.DividedByZero
    }

    return compute(left, right: right, operation: /)
}
