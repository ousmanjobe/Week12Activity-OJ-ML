/**
 * @description Find functions that are longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a function.
 */
predicate isFunction(Function func) {
  exists(CallExpr function |
    function.getCalleeName() = "function"
  )
}

/**
* Holds if `function` contains more than 10 lines.
*/
predicate moreThanTenLines(Function func) {
  exists(func.getNumLines() >= 10)
}

from Function func
where isFunction(func) and
      moreThanTenLines(func)
select func, "is longer than 10 lines"