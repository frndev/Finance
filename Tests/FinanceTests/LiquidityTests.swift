@testable import Finance
import XCTest

class FinancialRatioTests: XCTestCase {

    func testGeneralLiquidityRatio() throws {
        XCTAssertNoThrow(try generalLiquidityRatio(currentAssets: 1000, currentLiabilities: 500))
        XCTAssertEqual(try generalLiquidityRatio(currentAssets: 1000, currentLiabilities: 500), 2)
        XCTAssertThrowsError(try generalLiquidityRatio(currentAssets: 1000, currentLiabilities: .zero)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.divisionByZero)
        }
        XCTAssertThrowsError(try generalLiquidityRatio(currentAssets: 1000, currentLiabilities: -500)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.negativeValue)
        }
        XCTAssertThrowsError(try generalLiquidityRatio(currentAssets: -1000, currentLiabilities: 500)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.negativeValue)
        }
    }

    func testAcidTestRatio() throws {
        XCTAssertNoThrow(try acidTestRatio(currentAssets: 100, inventory: 5, currentLiabilities: 5))
        XCTAssertEqual(try acidTestRatio(currentAssets: 100, inventory: 5, currentLiabilities: 5), 19.0)
        XCTAssertThrowsError(try acidTestRatio(currentAssets: 100, inventory: 5, currentLiabilities: .zero)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.divisionByZero)
        }
        XCTAssertThrowsError(try acidTestRatio(currentAssets: 100, inventory: 5, currentLiabilities: -5)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.negativeValue)
        }
    }

    func testCashRatio() throws {
        XCTAssertNoThrow(try cashRatio(cashAndEquivalents: 1000, currentLiabilities: 500))
        XCTAssertEqual(try cashRatio(cashAndEquivalents: 1000, currentLiabilities: 500), 2)
        XCTAssertThrowsError(try cashRatio(cashAndEquivalents: 1000, currentLiabilities: .zero)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.divisionByZero)
        }
        XCTAssertThrowsError(try cashRatio(cashAndEquivalents: 1000, currentLiabilities: -500)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.negativeValue)
        }
        XCTAssertThrowsError(try cashRatio(cashAndEquivalents: -1000, currentLiabilities: 500)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.negativeValue)
        }
    }

    func testOperatingCashFlowRatio() throws {
        XCTAssertNoThrow(try operatingCashFlowRatio(operatingCashFlow: 1000, currentLiabilities: 500))
        XCTAssertEqual(try operatingCashFlowRatio(operatingCashFlow: 1000, currentLiabilities: 500), 2)
        XCTAssertThrowsError(try operatingCashFlowRatio(operatingCashFlow: 1000, currentLiabilities: .zero)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.divisionByZero)
        }
        XCTAssertThrowsError(try operatingCashFlowRatio(operatingCashFlow: 1000, currentLiabilities: -500)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.negativeValue)
        }
        XCTAssertThrowsError(try operatingCashFlowRatio(operatingCashFlow: -1000, currentLiabilities: 500)) { error in
            XCTAssertEqual(error as? FinancialError, FinancialError.negativeValue)
        }
    }
}
