/**
 * @description Find functions that are longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function has a body.
 */
predicate hasBody(Function func) {
  exists(Block b | func.getABody(b))
}

/**
* Holds if `function` contains more than 10 lines.
*/
predicate moreThanTenLines(Function func) {
  exists(Block b | func.getABody(b) and b.getNumLines() > 10)
}

from Function func
where hasBody(func) and
      moreThanTenLines(func)
select func, "is longer than 10 lines"