# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

omnitest <- function(correctExpr=NULL, correctVal=NULL, strict=FALSE, eval_for_class=as.logical(NA)){
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correctExpr) && is.null(correctVal))return(TRUE)
  # If eval_for_class is not specified, default to customTests$EVAL_FOR_CLASS.
  # If the latter is not set, default to TRUE.
  if(is.na(eval_for_class)){
    if(exists("EVAL_FOR_CLASS", customTests)){
      eval_for_class <- isTRUE(customTests$EVAL_FOR_CLASS)
    } else {
      eval_for_class <- TRUE
    }
  }
  # If eval_for_class is TRUE, create a parent environment for that in
  # in which evaluations for class are to be made.
  eval_env <- if(eval_for_class){
    cleanEnv(e$snapshot)
  } else {
    NULL
  }
  # Testing for correct expression only
  if(!is.null(correctExpr) && is.null(correctVal)){
    err <- try({
      good_expr <- parse(text=correctExpr)[[1]]
      ans <- is_robust_match(good_expr, e$expr, eval_for_class, eval_env)
    }, silent=TRUE)
    if (is(err, "try-error")) {
      return(expr_identical_to(correctExpr))
    } else {
      return(ans)
    }
  }
  # Testing for both correct expression and correct value
  # Value must be character or single number
  valGood <- as.logical(NA)
  if(!is.null(correctVal)){
    if(is.character(e$val)){
      valResults <- expectThat(e$val,
                               is_equivalent_to_legacy(correctVal, label=correctVal),
                               label=(e$val))
      if(is(e, "dev") && !valResults$passed)swirl_out(valResults$message)
      valGood <- valResults$passed
      # valGood <- val_matches(correctVal)
    } else if(length(e$val) == 1 && !is.na(e$val) && is.numeric(e$val)){
      cval <- try(as.numeric(correctVal), silent=TRUE)
      valResults <- expectThat(e$val, 
                               equals_legacy(cval, label=correctVal),
                               label=toString(e$val))
      if(is(e, "dev") && !valResults$passed)swirl_out(valResults$message)
      valGood <- valResults$passed
    }
  }
  # If a correct expression is given attempt a robust match with user's expression.
  exprGood <- TRUE
  if(!is.null(correctExpr)){
    err <- try({
      good_expr <- parse(text=correctExpr)[[1]]
      ans <- is_robust_match(good_expr, e$expr, eval_for_class, eval_env)
    }, silent=TRUE)
    exprGood <- ifelse(is(err, "try-error"), expr_identical_to(correctExpr), ans)
  }
  if((isTRUE(valGood) || is.na(valGood)) && exprGood){
    return(TRUE)
  } else if (isTRUE(valGood) && !exprGood && !strict){
    swirl_out(s()%N%"That's not the expression I expected but it works.")
    swirl_out(s()%N%"I've executed the correct expression in case the result is needed in an upcoming question.")
    eval(parse(text=correctExpr),globalenv())
    return(TRUE)
  } else {
    return(FALSE)
  }
}
