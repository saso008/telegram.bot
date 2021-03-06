
context('CommandHandler')

dispatcher <- Dispatcher(Bot(token))
command_handler <- CommandHandler('foo', foo_handler, pass_args = TRUE)
update <- Update(foo_update)

test_that("Process Command", {
  
  expect_error(dispatcher$add_handler(handler = command_handler), NA)
  expect_null(dispatcher$process_update(update))
  
  # one filter
  command_handler$filters <- MessageFilters$all
  expect_error(dispatcher$add_handler(handler = command_handler), NA)
  expect_null(dispatcher$process_update(update))
  
  # list of filters
  command_handler$filters <- list(MessageFilters$text, MessageFilters$command)
  expect_error(dispatcher$add_handler(handler = command_handler), NA)
  expect_null(dispatcher$process_update(update))
  
})
