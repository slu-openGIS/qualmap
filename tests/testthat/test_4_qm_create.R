context("test cluster create")

# test data ------------------------------------------------

test_cluster <- qm_define(118600, 119101, 119300)

test_sf <- stLouis

test_tbl <- as_tibble(data.frame(
  x = c(1,2,3),
  y = c("a", "b", "a")
))

# test inputs ------------------------------------------------

# test missing ref parameter
expect_error(qm_create(key = "TRACTCE", value = test_cluster, rid = 1, cid = 1, category = "test"),
             "A reference, consisting of a simple features object, must be specified.")

# test ambiguous ref parameter
expect_error(qm_create("TRACTCE", test_cluster, 1, 1, "test"),
             "The reference object must be a simple features object.")

# test no sf ref parameter
expect_error(qm_create(ref = test_tbl, key = "TRACTCE", value = test_cluster, rid = 1, cid = 1, category = "test"),
             "The reference object must be a simple features object.")

# test missing key parameter
expect_error(qm_create(ref = test_sf, value = test_cluster, rid = 1, cid = 1, category = "test"),
             "A key identification variable must be specified.")

# test incorrect key parameter
expect_error(qm_create(ref = test_sf, key = "test", value = test_cluster, rid = 1, cid = 1, category = "test"),
             "`by` can't contain join column `test` which is missing from LHS") # this error message is not helpful

# test missing value parameter
expect_error(qm_create(ref = test_sf, key = "TRACTCE", rid = 1, cid = 1, category = "test"),
             "A vector containing feature ids must be specified.")

# this error message is misleading
# expect_error(qm_create(test_sf, "TRACTCE", 1, 1, "test"),
#             "The cluster identification number (cid) must a numeric value.")

# test missing rid parameter
# fails despite expected/actual messages being identical??
# expect_error(qm_create(ref = test_sf, key = "TRACTCE", value = test_cluster, cid = 1, category = "test"),
#             "A respondent identification number (rid) must be specified.")

# test missing cid parameter
# fails despite expected/actual messages being identical??
# expect_error(qm_create(ref = test_sf, key = "TRACTCE", value = test_cluster, rid = 1, category = "test"),
#             "A cluster identification number (cid) must be specified.")

# test results ------------------------------------------------