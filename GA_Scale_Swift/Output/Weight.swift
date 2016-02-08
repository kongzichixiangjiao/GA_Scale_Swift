//
//  Weight.swift
//  Scale
//
//  Created by Khoa Pham
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public enum MyWeightUnit: Double {
    
    case 毫克_milligram = 0.001 //毫克
    case 里克_centigram  = 0.01 //里克
    case 分克_decigram  = 0.1 //分克
    case 克_gram  = 1 //克
    case 十克_dekagram  = 10 //十克
    case 百克_hectogram  = 100 //百克
    case 千克_kilogram  = 1_000 //千克
    case 吨_ton  = 1_000_000 //吨
    case 克拉_carat  = 0.2 //克拉
    case 牛顿_newton  = 101.971_621_297_8 //牛顿
    case 盎司_ounce  = 28.349_523_125 //盎司
    case 英镑_pound  = 453.592_37 //英镑
    case 石头_stone  = 6_350.293_18 //石头
    
    static var defaultScale: Double {
        return WeightUnit.gram.rawValue
    }
}

public enum WeightUnit: Double {
    
    case milligram = 0.001 //毫克
    case centigram = 0.01 //里克
    case decigram = 0.1 //分克
    case gram = 1 //克
    case dekagram = 10 //十克
    case hectogram = 100 //百克
    case kilogram = 1_000 //千克
    case ton = 1_000_000 //吨
    case carat = 0.2 //克拉
    case newton = 101.971_621_297_8 //牛顿
    case ounce = 28.349_523_125 //盎司
    case pound = 453.592_37 //英镑
    case stone = 6_350.293_18 //石头

    static var defaultScale: Double {
        return WeightUnit.gram.rawValue
    }
}

public struct Weight {
    public let value: Double
    public let unit: WeightUnit

    public init(value: Double, unit: WeightUnit) {
        self.value = value
        self.unit = unit
    }

    public func to(unit unit: WeightUnit) -> Weight {
        return Weight(value: self.value * self.unit.rawValue * WeightUnit.gram.rawValue / unit.rawValue, unit: unit)
    }
}

public extension Double {
    public var milligram: Weight {
        return Weight(value: self, unit: .milligram)
    }

    public var centigram: Weight {
        return Weight(value: self, unit: .centigram)
    }

    public var decigram: Weight {
        return Weight(value: self, unit: .decigram)
    }

    public var gram: Weight {
        return Weight(value: self, unit: .gram)
    }

    public var dekagram: Weight {
        return Weight(value: self, unit: .dekagram)
    }

    public var hectogram: Weight {
        return Weight(value: self, unit: .hectogram)
    }

    public var kilogram: Weight {
        return Weight(value: self, unit: .kilogram)
    }

    public var ton: Weight {
        return Weight(value: self, unit: .ton)
    }

    public var carat: Weight {
        return Weight(value: self, unit: .carat)
    }

    public var newton: Weight {
        return Weight(value: self, unit: .newton)
    }

    public var ounce: Weight {
        return Weight(value: self, unit: .ounce)
    }

    public var pound: Weight {
        return Weight(value: self, unit: .pound)
    }

    public var stone: Weight {
        return Weight(value: self, unit: .stone)
    }
}

public func compute(left: Weight, right: Weight, operation: (Double, Double) -> Double) -> Weight {
    let (min, max) = left.unit.rawValue < right.unit.rawValue ? (left, right) : (right, left)
    let result = operation(min.value, max.to(unit: min.unit).value)

    return Weight(value: result, unit: min.unit)
}

public func +(left: Weight, right: Weight) -> Weight {
    return compute(left, right: right, operation: +)
}

public func -(left: Weight, right: Weight) -> Weight {
    return compute(left, right: right, operation: -)
}

public func *(left: Weight, right: Weight) -> Weight {
    return compute(left, right: right, operation: *)
}

public func /(left: Weight, right: Weight) throws -> Weight {
    guard right.value != 0 else {
        throw Error.DividedByZero
    }

    return compute(left, right: right, operation: /)
}
