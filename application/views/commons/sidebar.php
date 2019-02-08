<section class="sidebar">
	<!-- sidebar menu: : style can be found in sidebar.less -->
	<ul class="sidebar-menu" data-widget="tree">
		<li class="header">MAIN NAVIGATION</li>

		<li class="treeview">
			<a href="#">
				<i class="fa fa-dashboard"></i>
				<span>Dashboard</span>
				<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
			<ul class="treeview-menu">
				<li><a href="{{ site_url('dashboard') }}"><i class="fa fa-angle-right"></i> Home</a></li>
			</ul>
		</li>

		{% if roles_permission_entity.has_permission_module(['PTPM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-wheelchair"></i>
					<span>Patients</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_pt']) %}
					
						<li><a href="{{ site_url('patient_management/profile') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}


					{% if roles_permission_entity.has_permission_name(['add_pt']) %}
					
						<li><a href="{{ site_url('patient_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}


					{% if roles_permission_entity.has_permission_name(['search_pt']) %}
						
						<li><a href="{{ site_url('patient_management/profile/search') }}"><i class="fa fa-angle-right"></i> Search </a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['headcount_pt']) %}
                    
                    	<li><a href="{{ site_url('patient_management/headcount') }}"><i class="fa fa-angle-right"></i> Headcount </a></li>

                	{% endif %}
					
				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['PPM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-stethoscope"></i>
					<span>Providers</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

				{% if roles_permission_entity.has_permission_name(['view_provider']) %}

					<li><a href="{{ site_url('provider_management/profile/') }}"><i class="fa fa-angle-right"></i> View</a></li>

				{% endif %}

				{% if roles_permission_entity.has_permission_name(['add_provider']) %}

					<li><a href="{{ site_url('provider_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

				{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['PRSM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-car"></i>
					<span>Route Sheet</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_prs']) %}
						<li><a href="{{ site_url('provider_route_sheet_management/route_sheet') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['add_prs']) %}

						<li><a href="{{ site_url('provider_route_sheet_management/route_sheet/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}

				</ul>
			</li>

		{% endif %}


		{% if roles_permission_entity.has_permission_module(['HHCPM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-heartbeat"></i>
					<span>Facilities</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_hhc']) %}
						
						<li><a href="{{ site_url('home_health_care_management/profile') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['add_hhc']) %}

						<li><a href="{{ site_url('home_health_care_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['PRG']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-money"></i>
					<span>Payroll</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['generate_pr']) %}

						<li><a href="{{ site_url('payroll_management/payroll') }}"><i class="fa fa-angle-right"></i> Create</a></li>

					{% endif %}

				</ul>
			</li>

		{% endif %}

		{% if roles_permission_entity.has_permission_module(['SBAWRG', 'SBHVRG', 'SBFVRG', 'SBCPORG']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-list-alt"></i> <span>Superbill</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_module(['SBAWRG', 'SBHVRG', 'SBFVRG', 'SBCPORG']) %}

	                	<li><a href="{{ site_url('superbill_management/superbill/') }}"><i class="fa fa-angle-right"></i> Create</a></li>

                	{% endif %}

				</ul>
			</li>

		{% endif %}
		
		{% if roles_permission_entity.has_permission_module(['UM']) %}

			<li class="treeview">
				<a href="#">
					<i class="fa fa-users"></i>
					<span>Users</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>

				<ul class="treeview-menu">

					{% if roles_permission_entity.has_permission_name(['view_user']) %}

						<li><a href="{{ site_url('user_management/profile') }}"><i class="fa fa-angle-right"></i> View</a></li>

					{% endif %}

					{% if roles_permission_entity.has_permission_name(['add_user']) %}

						<li><a href="{{ site_url('user_management/profile/add') }}"><i class="fa fa-angle-right"></i> Add</a></li>

					{% endif %}

				</ul>
			</li>

		{% endif %}
	</ul>
</section>