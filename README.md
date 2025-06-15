# RandomSearch

## Pseudocode for Random Search

```elixir
Input: NumIterations, ProblemSize, SearchSpace
Output: Best
Best ← ∅;
foreach iteri ∈ NumIterations do
  candidatei ← RandomSolution(ProblemSize, SearchSpace);
  if Cost(candidatei ) < Cost(Best) then
    Best ← candidatei ;
  end
end
return Best
```

## Usage

```elixir
iex(1)> problem_size = 2
2
iex(2)> 
nil
iex(3)> search_space = Enum.map(1..problem_size, fn _i -> [-5, 5] end)
[[-5, 5], [-5, 5]]
iex(4)> 
nil
iex(5)> max_iter = 100
100
iex(6)> 
nil
iex(7)> RandomSearch.search(search_space, max_iter)
 > iteration=1, best=27.211555936224904
 > iteration=2, best=11.695082466263408
 > iteration=3, best=11.695082466263408
 > iteration=4, best=11.695082466263408
 > iteration=5, best=7.436281064286609
 > iteration=6, best=7.436281064286609
 > iteration=7, best=5.398333646980341
 > iteration=8, best=5.398333646980341
 > iteration=9, best=5.398333646980341
 > iteration=10, best=5.398333646980341
 > iteration=11, best=5.398333646980341
 > iteration=12, best=5.398333646980341
 > iteration=13, best=5.398333646980341
 > iteration=14, best=5.398333646980341
 > iteration=15, best=5.398333646980341
 > iteration=16, best=5.398333646980341
 > iteration=17, best=5.398333646980341
 > iteration=18, best=5.398333646980341
 > iteration=19, best=5.137844582377334
 > iteration=20, best=5.137844582377334
 > iteration=21, best=5.137844582377334
 > iteration=22, best=5.137844582377334
 > iteration=23, best=5.137844582377334
 > iteration=24, best=5.137844582377334
 > iteration=25, best=1.843194550462348
 > iteration=26, best=1.843194550462348
 > iteration=27, best=1.843194550462348
 > iteration=28, best=1.843194550462348
 > iteration=29, best=1.843194550462348
 > iteration=30, best=1.843194550462348
 > iteration=31, best=1.843194550462348
 > iteration=32, best=1.843194550462348
 > iteration=33, best=1.843194550462348
 > iteration=34, best=1.843194550462348
 > iteration=35, best=1.843194550462348
 > iteration=36, best=1.843194550462348
 > iteration=37, best=1.843194550462348
 > iteration=38, best=0.15059162709981933
 > iteration=39, best=0.15059162709981933
 > iteration=40, best=0.15059162709981933
 > iteration=41, best=0.15059162709981933
 > iteration=42, best=0.15059162709981933
 > iteration=43, best=0.15059162709981933
 > iteration=44, best=0.15059162709981933
 > iteration=45, best=0.15059162709981933
 > iteration=46, best=0.15059162709981933
 > iteration=47, best=0.15059162709981933
 > iteration=48, best=0.15059162709981933
 > iteration=49, best=0.15059162709981933
 > iteration=50, best=0.15059162709981933
 > iteration=51, best=0.15059162709981933
 > iteration=52, best=0.15059162709981933
 > iteration=53, best=0.15059162709981933
 > iteration=54, best=0.15059162709981933
 > iteration=55, best=0.15059162709981933
 > iteration=56, best=0.15059162709981933
 > iteration=57, best=0.15059162709981933
 > iteration=58, best=0.15059162709981933
 > iteration=59, best=0.15059162709981933
 > iteration=60, best=0.15059162709981933
 > iteration=61, best=0.15059162709981933
 > iteration=62, best=0.15059162709981933
 > iteration=63, best=0.15059162709981933
 > iteration=64, best=0.15059162709981933
 > iteration=65, best=0.15059162709981933
 > iteration=66, best=0.15059162709981933
 > iteration=67, best=0.15059162709981933
 > iteration=68, best=0.15059162709981933
 > iteration=69, best=0.15059162709981933
 > iteration=70, best=0.15059162709981933
 > iteration=71, best=0.15059162709981933
 > iteration=72, best=0.15059162709981933
 > iteration=73, best=0.15059162709981933
 > iteration=74, best=0.15059162709981933
 > iteration=75, best=0.15059162709981933
 > iteration=76, best=0.15059162709981933
 > iteration=77, best=0.15059162709981933
 > iteration=78, best=0.15059162709981933
 > iteration=79, best=0.15059162709981933
 > iteration=80, best=0.15059162709981933
 > iteration=81, best=0.15059162709981933
 > iteration=82, best=0.15059162709981933
 > iteration=83, best=0.15059162709981933
 > iteration=84, best=0.15059162709981933
 > iteration=85, best=0.15059162709981933
 > iteration=86, best=0.15059162709981933
 > iteration=87, best=0.15059162709981933
 > iteration=88, best=0.15059162709981933
 > iteration=89, best=0.15059162709981933
 > iteration=90, best=0.15059162709981933
 > iteration=91, best=0.15059162709981933
 > iteration=92, best=0.15059162709981933
 > iteration=93, best=0.15059162709981933
 > iteration=94, best=0.15059162709981933
 > iteration=95, best=0.15059162709981933
 > iteration=96, best=0.15059162709981933
 > iteration=97, best=0.15059162709981933
 > iteration=98, best=0.15059162709981933
 > iteration=99, best=0.15059162709981933
 > iteration=100, best=0.15059162709981933
%{vector: [0.04869593956801754, -0.3849939383541088], cost: 0.15059162709981933}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `random_search` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:random_search, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/random_search>.

