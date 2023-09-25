# Kill process killmenow

exec { 'pkill' :
  path    => '/bin/',
  command => 'pkill killmenow',
  }
