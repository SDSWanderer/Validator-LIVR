package Validator::LIVR::Rules::String;

sub one_of {
    my $allowed_values = shift;

    return sub {
        my $value = shift;
        return if !defined($value) || $value eq '';

        return 'NOT_ALLOWED_VALUE' unless grep { $value eq $_ } @$allowed_values;
        return;
    }
}


sub max_length {
    my $max_length = shift;

    return sub {
        my $value = shift;
        return if !defined($value) || $value eq '';

        return 'TOO_LONG' if length($value) > $max_length;
        return;
    };
}


sub min_length {
    my $min_length = shift;

    return sub {
        my $value = shift;
        return if !defined($value) || $value eq '';

        return 'TOO_SHORT' if length($value) < $min_length;
        return;
    };
}


sub length_equal {
    my $length = shift;

    return sub {
        my $value = shift;
        return if !defined($value) || $value eq '';

        return 'TOO_SHORT' if length($value) < $length;
        return 'TOO_LONG' if length($value) > $length;
        return;
    };
}


sub length_between {
    my ($min_length, $max_length) = @_;

    return sub {
        my $value = shift;
        return if !defined($value) || $value eq '';

        return 'TOO_SHORT' if length($value) < $min_length;
        return 'TOO_LONG' if length($value) > $max_length;
        return;
    };
}

1;