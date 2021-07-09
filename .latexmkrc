$makeindex = 'internal run_makeindex %S %D %O';

sub run_makeindex {
  my $return = 999;
  my $source = shift;
  my $dest = shift;
  my @opts = @_;
  my ( $source_base, $source_path ) = fileparse( $source );
  my ( $dest_base, $dest_path ) = fileparse( $dest );
  # Paths for source and dest should have been made the same.
  # That's the way latexmk works.

  pushd( $source_path );
  if (!$silent) {
      print "$My_name: Changing directory to '$path'\n",
            "    before running makeindex.\n";
  }
  my @cmd_line = ('makeindex', @options, '-o', $dest_base, $source_base );
  print "$My_name: Running external command '@cmd_line'\n";
  $return = system( @cmd_line );
  popd();
  if (!$silent) {
    print "$My_name: changed directory back to '", cwd(), "'\n";
  }

  return $return;
}
