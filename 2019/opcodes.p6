my %instruction-idxs = "opcode" => 0,
                       "input-a-idx" => 1,
                       "input-b-idx" => 2,
                       "result-idx" => 3;

my %opcodes = "1" => "add",
              "2" => "multiply";

sub read-and-print-file ($filename) {
    my $contents = slurp $filename;

    my @program-state = split(',', $contents);
    
    my @instructions = @program-state.batch(4);

    for @instructions -> $opcode, $a-idx = Nil, $b-idx = Nil, $result-idx = Nil {
        
        
        
    }

    say @program-state;
}


read-and-print-file("1.input");
