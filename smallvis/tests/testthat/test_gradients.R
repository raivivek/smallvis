library(smallvis)
context("Gradients")

perp <- 5

test_that("SNE", {
  test_grad("tsne", perplexity = perp)
  test_grad("ssne", perplexity = perp)
  test_grad("asne", perplexity = perp)
  test_grad("wtsne", perplexity = perp)
  test_grad("wssne", perplexity = perp)
  test_grad("basne", perplexity = perp)
  test_grad("basne", perplexity = perp, beta = 0.5)
  test_grad("bssne", perplexity = perp)
  test_grad("btsne", perplexity = perp)
  test_grad("btasne", perplexity = perp)
  test_grad("tsneu", perplexity = perp)
  test_grad("skdtsne", perplexity = perp)
  test_grad("usne", perplexity = perp, gr_eps = 1e-10)
  test_grad("cetsne", perplexity = perp)
})

test_that("Norm SNE", {
  test_grad("tasne", perplexity = perp)
  test_grad("tmsne", perplexity = perp)
  test_grad("trmsne", perplexity = perp)
  test_grad("trsrsne", perplexity = perp)
  test_grad("arsrsne", perplexity = perp)
})

test_that("HSSNE", {
  # fd starts losing accuracy for alpha = 0
  test_grad("hssne", perplexity = perp, alpha = 1e-6)
  test_grad("hssne", perplexity = perp, alpha = 0.5)
  test_grad("hssne", perplexity = perp, alpha = 1)
  
  test_grad("bhssne", perplexity = perp, alpha = 1e-6, beta = 1)
  test_grad("bhssne", perplexity = perp, alpha = 0.5, beta = 1)
  test_grad("bhssne", perplexity = perp, alpha = 1, beta = 1)
  
  test_grad("bhssne", perplexity = perp, alpha = 1e-6, beta = 0.1)
  test_grad("bhssne", perplexity = perp, alpha = 0.5, beta = 0.1)
  test_grad("bhssne", perplexity = perp, alpha = 1, beta = 0.1)
  
  test_grad("bhssne", perplexity = perp, alpha = 1e-6, beta = 10)
  test_grad("bhssne", perplexity = perp, alpha = 0.5, beta = 10)
  test_grad("bhssne", perplexity = perp, alpha = 1, beta = 10)
})

test_that("JSE", {
  test_grad("jse", kappa = 0.5, perplexity = perp)
  # very low and high values of kappa lose accuracy
  test_grad("jse", kappa = 0, perplexity = perp)
  test_grad("jse", kappa = 1e-4, perplexity = perp)
  test_grad("jse", kappa = 0.999, perplexity = perp)
  test_grad("jse", kappa = 1, perplexity = perp, tol = 1e-5)
  
  test_grad("sjse", kappa = 0.5, perplexity = perp)
  test_grad("sjse", kappa = 0, perplexity = perp)
  test_grad("sjse", kappa = 1e-4, perplexity = perp)
  test_grad("sjse", kappa = 0.999, perplexity = perp)
  test_grad("sjse", kappa = 1, perplexity = perp, tol = 1e-5)
  
  test_grad("rsrjse", kappa = 0.5, perplexity = perp)
  test_grad("rsrjse", kappa = 1e-5, perplexity = perp)
  test_grad("rsrjse", kappa = 1, perplexity = perp, tol = 1e-5)
})

test_that("NeRV", {
  test_grad("nerv", lambda = 0.5, perplexity = perp)
  test_grad("nerv", lambda = 0, perplexity = perp)
  test_grad("nerv", lambda = 1, perplexity = perp)

  test_grad("rsrnerv", lambda = 0.5, perplexity = perp)
  test_grad("rsrnerv", lambda = 1e-5, perplexity = perp)
  test_grad("rsrnerv", lambda = 1, perplexity = perp)

  test_grad("bnerv", lambda = 0.5, perplexity = perp)
  test_grad("bnerv", lambda = 1e-5, perplexity = perp)
  test_grad("bnerv", lambda = 1, perplexity = perp)
  
  test_grad("snerv", lambda = 0.5, perplexity = perp)
  test_grad("snerv", lambda = 0, perplexity = perp)
  test_grad("snerv", lambda = 1e-4, perplexity = perp)
  test_grad("snerv", lambda = 0.999, perplexity = perp)
  test_grad("snerv", lambda = 1, perplexity = perp)
})

test_that("MDS", {
  test_grad("mmds")
  test_grad("smmds")
  test_grad("sammon")
  test_grad("gmmds", k = perp)
  test_grad("ballmmds")
  test_grad("knnmmds", k = perp)
})

test_that("EE", {
  test_grad("ee", lambda = 1, perplexity = perp)
  test_grad("ee", lambda = 100, perplexity = perp)
  test_grad("ee", lambda = 1000, perplexity = perp)

  test_grad("ee", lambda = 1, neg_weights = FALSE, perplexity = perp)
  test_grad("ee", lambda = 100, neg_weights = FALSE, perplexity = perp)
  test_grad("ee", lambda = 1000, neg_weights = FALSE, perplexity = perp)

  test_grad("tee", lambda = 1, perplexity = perp)
  test_grad("tee", lambda = 0.1, perplexity = perp)
  test_grad("tee", lambda = 0.01, perplexity = perp)
})

test_that("LargeVis", {
  # LV gradients can be extremely large compared to other methods
  test_grad("largevis", tolerance = 1e-3, gamma = 7, perplexity = perp, gr_eps = 0)
  test_grad("largevis", gamma = 1e-3, perplexity = perp, gr_eps = 0)
  test_grad("largevis", tolerance = 1e-2, gamma = 1000, perplexity = perp, gr_eps = 0)
})

test_that("UMAP", {
  test_grad("umap", perplexity = perp, gr_eps = 0)
  test_grad("umap", spread = 10, min_dist = 0.01, perplexity = perp, gr_eps = 0)
  test_grad("umap", spread = 0.5, min_dist = 1e-4, perplexity = perp, gr_eps = 0)
  test_grad("tumap", perplexity = perp, gr_eps = 0)
  test_grad("ntumap", perplexity = perp, gr_eps = 0)
})


test_that("AB-SNE", {
  test_grad("absne", perplexity = perp, alpha = 0.75, lambda = 0.5)
  test_grad("absne", perplexity = perp, alpha = 0.25, lambda = 0.75)
  test_grad("absne", perplexity = perp, alpha = 1.0, lambda = 1.0)
  test_grad("absne", perplexity = perp, alpha = 1.0, lambda = 0.95)
  test_grad("absne", perplexity = perp, alpha = 1.0, lambda = 1.05)
  test_grad("absne", perplexity = perp, alpha = 0.6, lambda = 1.0)
  test_grad("absne", perplexity = perp, alpha = 1.4, lambda = 1.0)
  
  test_grad("absneamb", perplexity = perp, alpha = 1)
  test_grad("absneamb", perplexity = perp, alpha = 2)
  test_grad("absneamb", perplexity = perp, alpha = -0.5)
  
  test_grad("absne", perplexity = perp, alpha = 1, lambda = 0)
  test_grad("absne", perplexity = perp, alpha = 2, lambda = 0)
  test_grad("absne", perplexity = perp, alpha = -0.5, lambda = 0)
  
  test_grad("absneb0", perplexity = perp, alpha = 1)
  test_grad("absneb0", perplexity = perp, alpha = 2)
  test_grad("absneb0", perplexity = perp, alpha = -0.5)
  
  test_grad("absne", perplexity = perp, alpha = 1, lambda = 1)
  test_grad("absne", perplexity = perp, alpha = 2, lambda = 2)
  test_grad("absne", perplexity = perp, alpha = -0.5, lambda = -0.5)
  
  test_grad("absnea0", perplexity = perp, beta = 1)
  test_grad("absnea0", perplexity = perp, beta = 2)
  test_grad("absnea0", perplexity = perp, beta = 0.5)
  
  test_grad("absne", perplexity = perp, alpha = 0, lambda = 1)
  test_grad("absne", perplexity = perp, alpha = 0, lambda = 2)
  test_grad("absne", perplexity = perp, alpha = 0, lambda = -0.5)

  test_grad("absne00", perplexity = perp)
  test_grad("absne", perplexity = perp, alpha = 0, lambda = 0)
  
  test_grad("abssne", perplexity = perp, alpha = 0.75, lambda = 0.5)
  test_grad("abssne", perplexity = perp, alpha = 0.25, lambda = 0.75)
  test_grad("abssne", perplexity = perp, alpha = 1.0, lambda = 1.0)
  test_grad("abssne", perplexity = perp, alpha = 1.0, lambda = 0.95)
  test_grad("abssne", perplexity = perp, alpha = 1.0, lambda = 1.05)
  test_grad("abssne", perplexity = perp, alpha = 0.6, lambda = 1.0)
  test_grad("abssne", perplexity = perp, alpha = 1.4, lambda = 1.0)
})

test_that("f-divergences", {
  test_grad("chsne", perplexity = perp)
  test_grad("hlsne", perplexity = perp)
  test_grad("rklsne", perplexity = perp)
  test_grad("jssne", perplexity = perp)
})

test_that("g-SNE", {
  test_grad("gsne", perplexity = perp, lambda = 1e-3)
  test_grad("gsne", perplexity = perp, lambda = 1e-2)
  test_grad("gsne", perplexity = perp, lambda = 1e-1)
  test_grad("gsne", perplexity = perp, lambda = 0)
  test_grad("gsne", perplexity = perp, lambda = 1)
  test_grad("gsne", perplexity = perp, lambda = 10)
  test_grad("gsne", perplexity = perp, lambda = 1000)
})
