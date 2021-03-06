expect_api <- function(method, Y, cost) {
  res <- smallvis(iris10, Y_init = iris10_Y, 
                  method = method, eta = 0.1,
                  perplexity = 5, epoch_callback = NULL, verbose = FALSE, 
                  ret_extra = TRUE)
  expect_equal(res$Y, c2y(Y), tolerance = 1e-3, info = paste0(method[[1]], " Y"))
  expect_equal(final_cost(res), cost, tolerance = 1e-4, info = paste0(method[[1]], " cost"))
}
