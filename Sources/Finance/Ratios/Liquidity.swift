import Foundation

/// Calculate the general liquidity ratio, which measures a company's ability to pay its short-term debts.
///
/// - Parameters:
///   - currentAssets: The total value of the company's current assets.
///   - currentLiabilities: The total value of the company's current liabilities.
/// - Returns: The general liquidity ratio calculated as currentAssets / currentLiabilities.
/// - Throws: `FinancialError.divisionByZero` if `currentLiabilities` is zero, `FinancialError.negativeValue` if values are negative.
public func generalLiquidityRatio(currentAssets: Double, currentLiabilities: Double) throws -> Double {
    guard currentLiabilities != 0 else { throw FinancialError.divisionByZero }
    guard currentAssets >= 0, currentLiabilities >= 0 else { throw FinancialError.negativeValue }
    return currentAssets / currentLiabilities
}

/// Calculate the acid-test ratio, which measures a company's ability to pay its short-term debts excluding inventory.
///
/// - Parameters:
///   - currentAssets: The total value of the company's current assets.
///   - inventory: The value of the company's inventory.
///   - currentLiabilities: The total value of the company's current liabilities.
/// - Returns: The acid-test ratio calculated as (currentAssets - inventory) / currentLiabilities.
/// - Throws: `FinancialError.divisionByZero` if `currentLiabilities` is zero, `FinancialError.negativeValue` if values are negative.
public func acidTestRatio(currentAssets: Double, inventory: Double, currentLiabilities: Double) throws -> Double {
    guard currentLiabilities != 0 else { throw FinancialError.divisionByZero }
    guard currentAssets >= 0, inventory >= 0, currentLiabilities >= 0 else { throw FinancialError.negativeValue }
    return (currentAssets - inventory) / currentLiabilities
}

/// Calculate the cash ratio, which measures a company's ability to pay its short-term debts using cash and cash equivalents.
///
/// - Parameters:
///   - cashAndEquivalents: The total value of the company's cash and cash equivalents.
///   - currentLiabilities: The total value of the company's current liabilities.
/// - Returns: The cash ratio calculated as cashAndEquivalents / currentLiabilities.
/// - Throws: `FinancialError.divisionByZero` if `currentLiabilities` is zero, `FinancialError.negativeValue` if values are negative.
public func cashRatio(cashAndEquivalents: Double, currentLiabilities: Double) throws -> Double {
    guard currentLiabilities != 0 else { throw FinancialError.divisionByZero }
    guard cashAndEquivalents >= 0, currentLiabilities >= 0 else { throw FinancialError.negativeValue }
    return cashAndEquivalents / currentLiabilities
}

/// Calculate the operating cash flow ratio, which measures a company's ability to pay its short-term debts using operating cash flow.
///
/// - Parameters:
///   - operatingCashFlow: The operating cash flow of the company.
///   - currentLiabilities: The total value of the company's current liabilities.
/// - Returns: The operating cash flow ratio calculated as operatingCashFlow / currentLiabilities.
/// - Throws: `FinancialError.divisionByZero` if `currentLiabilities` is zero, `FinancialError.negativeValue` if values are negative.
public func operatingCashFlowRatio(operatingCashFlow: Double, currentLiabilities: Double) throws -> Double {
    guard currentLiabilities != 0 else { throw FinancialError.divisionByZero }
    guard operatingCashFlow >= 0, currentLiabilities >= 0 else { throw FinancialError.negativeValue }
    return operatingCashFlow / currentLiabilities
}
