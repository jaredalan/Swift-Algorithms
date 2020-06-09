import Foundation
import QuartzCore

public class BenchTimer {
    // Single method called 'measureBlock', has closure argument -> returns CFTimeInterval; type used to rep elapsed time in seconds
    public static func measureBlock(closure:() -> Void) -> CFTimeInterval {
        // iteration of 10
        let runCount = 10
        // individual run times are stored in an array of double type, repeating 0.0 count refers to runCount
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        // for loop that will iterate through runCount
        for i in 0..<runCount {
            // QuartzCore allows usage of CACurrentMediaTime
            let startTime = CACurrentMediaTime()
            // 'measureBlock' is executed between 'startTime' and 'endTime'
            closure()
            let endTime = CACurrentMediaTime()
            // 'execTime' is the discrepancy between endTime and startTime
            let execTime = endTime - startTime
            // execTime is stored inside an array of executionTimes
            executionTimes[i] = execTime
        }
        // result 'executionTimes' in conjunction with reduce; combining the elements of the sequence using the given closure - (0, +) begin at index and increment / number of iterations = avg exec time
        return (executionTimes.reduce(0, +)) / Double(runCount)
    }
}
