# Bug

A reproduction case for bigint casting issue

To run:

    mix test
    
Failing output:

    jdesktop% mix test
    ...
    raw query: {"SELECT b0.\"id\", b0.\"num_players\" FROM \"bug_example\" AS b0 WHERE (b0.\"num_players\" @> $1::bigint)",
     [1]}
    
    
      1) test Contains query (BugTest)
         test/bug_test.exs:4
         ** (Postgrex.Error) ERROR 42883 (undefined_function): operator does not exist: int4range @> bigint
         code: Bug.test
         stacktrace:
           (ecto) lib/ecto/adapters/sql.ex:431: Ecto.Adapters.SQL.execute_and_cache/7
           (ecto) lib/ecto/repo/queryable.ex:133: Ecto.Repo.Queryable.execute/5
           (ecto) lib/ecto/repo/queryable.ex:37: Ecto.Repo.Queryable.all/4
           test/bug_test.exs:5: (test)
    
    
    
    Finished in 0.08 seconds
    4 tests, 1 failure
