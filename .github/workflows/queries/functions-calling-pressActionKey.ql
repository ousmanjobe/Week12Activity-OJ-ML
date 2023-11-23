/**
 * @description Find tests that call pressActionKey
 * @kind problem
 * @id javascript/functions-calling-pressActionKey
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
* Holds if `func` contains a call to `pressActionKey`.
*/
predicate calls(Function caller) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee().getName() = "pressActionKey"
  )
}

from Function test
where isTest(test) and
      calls(test)
select test, "calls pressActionKey"