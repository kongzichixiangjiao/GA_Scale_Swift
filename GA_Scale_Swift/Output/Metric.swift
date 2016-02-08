//
//  Metric.swift
//  Scale
//
//  Created by Khoa Pham
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public enum MyMetricUnit: Double {
    case 亿分之一_nano = 0.000_000_001
    case 十万分之一_micro = 0.000_001
    case 千分之一_milli = 0.001
    case 百分之一_centi = 0.01
    case 十分之一_deci = 0.1
    case 一_base = 1
    case 十倍_deka = 10
    case 百倍_hecto = 100
    case 千倍_kilo = 1_000
    case 百万倍_mega = 1_000_000
    case 十亿倍_giga = 1_000_000_000
    case 兆倍_tera = 1_000_000_000_000
    case 千兆倍_peta = 1_000_000_000_000_000
    
    static var defaultScale: Double {
        return MetricUnit.base.rawValue
    }
}

public enum MetricUnit: Double {
    case nano = 0.000_000_001
    case micro = 0.000_001
    case milli = 0.001
    case centi = 0.01
    case deci = 0.1
    case base = 1
    case deka = 10
    case hecto = 100
    case kilo = 1_000
    case mega = 1_000_000
    case giga = 1_000_000_000
    case tera = 1_000_000_000_000
    case peta = 1_000_000_000_000_000
    
    static var defaultScale: Double {
        return MetricUnit.base.rawValue
    }
}

public struct Metric {
    public let value: Double
    public let unit: MetricUnit

    public init(value: Double, unit: MetricUnit) {
        self.value = value
        self.unit = unit
    }

    public func to(unit unit: MetricUnit) -> Metric {
        return Metric(value: self.value * self.unit.rawValue * MetricUnit.base.rawValue / unit.rawValue, unit: unit)
    }
}

public extension Double {
    public var nano: Metric {
        return Metric(value: self, unit: .nano)
    }

    public var micro: Metric {
        return Metric(value: self, unit: .micro)
    }

    public var milli: Metric {
        return Metric(value: self, unit: .milli)
    }

    public var centi: Metric {
        return Metric(value: self, unit: .centi)
    }

    public var deci: Metric {
        return Metric(value: self, unit: .deci)
    }

    public var base: Metric {
        return Metric(value: self, unit: .base)
    }

    public var deka: Metric {
        return Metric(value: self, unit: .deka)
    }

    public var hecto: Metric {
        return Metric(value: self, unit: .hecto)
    }

    public var kilo: Metric {
        return Metric(value: self, unit: .kilo)
    }

    public var mega: Metric {
        return Metric(value: self, unit: .mega)
    }

    public var giga: Metric {
        return Metric(value: self, unit: .giga)
    }

    public var tera: Metric {
        return Metric(value: self, unit: .tera)
    }

    public var peta: Metric {
        return Metric(value: self, unit: .peta)
    }
}

public func compute(left: Metric, right: Metric, operation: (Double, Double) -> Double) -> Metric {
    let (min, max) = left.unit.rawValue < right.unit.rawValue ? (left, right) : (right, left)
    let result = operation(min.value, max.to(unit: min.unit).value)

    return Metric(value: result, unit: min.unit)
}

public func +(left: Metric, right: Metric) -> Metric {
    return compute(left, right: right, operation: +)
}

public func -(left: Metric, right: Metric) -> Metric {
    return compute(left, right: right, operation: -)
}

public func *(left: Metric, right: Metric) -> Metric {
    return compute(left, right: right, operation: *)
}

public func /(left: Metric, right: Metric) throws -> Metric {
    guard right.value != 0 else {
        throw Error.DividedByZero
    }

    return compute(left, right: right, operation: /)
}
