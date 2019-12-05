sub execute($opcode, $a, $b) {
    given $opcode {
        when 1 { $a + $b }
        when 2 { $a * $b }
    }
}


sub read-file($filename) {
    my $contents = slurp $filename;
    split(',', $contents);
}


sub read-and-print-file($filename) {
    my @program-state = read-file($filename).map: *.Int;
    @program-state;
}


sub run-program (@program-state) {
    my $num-instructions = @program-state.elems;
    
    my @instruction-indices = 0,4 ... $num-instructions - $num-instructions % 4;

    for @instruction-indices -> $instruction-idx {

        last if @program-state[$instruction-idx] == 99;
        
        my $a-idx = @program-state[$instruction-idx + 1];
        my $b-idx = @program-state[$instruction-idx + 2];
        my $result-idx = @program-state[$instruction-idx + 3];
        
        @program-state[$result-idx] = execute(@program-state[$instruction-idx],
                                              @program-state[$a-idx],
                                              @program-state[$b-idx]);
    }

    @program-state;
}


#say run-program(read-and-print-file("../2/1.input"));
