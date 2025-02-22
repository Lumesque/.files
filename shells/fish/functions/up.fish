function up
    set -l this $argv[1]
    set -l result (string match --regex '\D*' $this)
    if not test -z $result;
        echo "Argument provided must be a number" >&2
        return 2
    else if test $this -lt 0;
        echo "Argument provided cannot be less than 0" >&2
        return 1
    end
    cd (string repeat -n $this ../)
end
