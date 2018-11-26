<!-- Logo -->
<a href="{{ site_url('dashboard') }}" class="logo">
	<!-- mini logo for sidebar mini 50x50 pixels -->
	<span class="logo-mini"><b>TMD</b></span>
	<!-- logo for regular state and mobile devices -->
	<span class="logo-lg"><img src="{{ base_url }}dist/img/tmd_logo_white.png"></span>
</a>

<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top">
	<!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
		<span class="sr-only">Toggle navigation</span>
	</a>
	<!-- Navbar Right Menu -->
	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			
			<li class="dropdown user user-menu">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<img src="{{ base_url }}dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
					<span class="hidden-xs">{{ user_fullname }}</span>
				</a>
				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header">
						<img src="{{ base_url }}dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

						<p>
							{{ user_fullname }}
						</p>
					</li>
					<!-- Menu Body -->
					<li class="user-body">
						<div class="row">
							<div class="col-xs-4 text-center">
								<a href="#">Followers</a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#">Sales</a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#">Friends</a>
							</div>
						</div>
						<!-- /.row -->
					</li>
					<!-- Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
							<a href="#" class="btn btn-default btn-flat">Profile</a>
						</div>
						<div class="pull-right">
							<a href="{{ site_url('authentication/user/logout') }}" class="btn btn-default btn-flat">Sign out</a>
						</div>
					</li>
				</ul>
			</li>
			
		</ul>
	</div>

</nav>