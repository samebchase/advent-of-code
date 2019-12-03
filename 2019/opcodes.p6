sub execute($opcode, $a-idx, $b-idx) {
    case $opcode of {
        1 => $a-idx + $b-idx
        2 => $a-idx * $b-idx
        99 => "halt"
    }
}


sub read-and-print-file($filename) {
    my $contents = slurp $filename;

    my @program-state = split(',', $contents);

    my @instructions = @program-state.batch(4);

    for @instructions -> $opcode, $a-idx = Nil, $b-idx = Nil, $result-idx = Nil {
        
        my $result = execute($opcode, $a-idx, $b-idx);
        @program-state[$result-idx] = $result;        
    
    }

    say @program-state;
}


read-and-print-file("1.input");
