<?php
/**
 * App Layout: layouts/app.php
 *
 * This is the template that is used for displaying all posts by default.
 *
 * @link    https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WPEmergeTheme
 */
?>

<div class="page-listing">
	<div class="mm-container">
		<div class="breadcrumb-top">
			<?php theBreadcrumb() ?>			
		</div>
		<h1 class="title-block"><?php thePageTitle(); ?></h1>

		<div class="pagination"></div>
		<div class="list-project">
			<h2 class="title-select-box">Filter project by technology</h2>
			<div class="select-box">
				<select class="js-example-basic-multiple" name="states[]" multiple="multiple">
					<option value="rjs">ReactJS</option>
					<option value="wp">WordPress</option>
					<option value="njs">NodeJS</option>
					<option value="scss">SCSS</option>
					<option value="php">PHP</option>
					<option value="jv">Java</option>
					<option value="js">Javascript</option>
				</select>
				<div class="arrow-down"></div>

			</div>

			<section class="project-item" data-value="wp">
				<div class="project-item__content">
					<div class="project-item__tags">
						<a href="#" class="project-item__tag">Lorem Tag</a>
						<a href="#" class="project-item__tag">Ipsum Label</a>
					</div>

					<h2 class="project-item__title">
						<a href="#" class="project-item__link">Lorem Ipsum Dolor System</a>
					</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">
							Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
						</li>
						<li class="project-item__list-item">
							Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
						</li>
					</ul>
				</div>

				<div class="project-item__image" style="--bg-color: rgba(0, 180, 255, 0.2);">
					<a href="#" class="project-item__image-link">
						<img
							src="<?php echo get_template_directory_uri(); ?>/project-test-1.png"
							alt="Project Test 1"
							loading="lazy"
						>
					</a>
				</div>
			</section>

			<section class="project-item" data-value="wp">
				<div class="project-item__content">
					<div class="project-item__tags">
						<a href="#" class="project-item__tag">Lorem Tag</a>
						<a href="#" class="project-item__tag">Ipsum Label</a>
					</div>

					<h2 class="project-item__title">
						<a href="#" class="project-item__link">Lorem Ipsum Dolor System</a>
					</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">
							Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
						</li>
						<li class="project-item__list-item">
							Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
						</li>
					</ul>
				</div>

				<div class="project-item__image" style="--bg-color: rgba(255, 200, 0, 0.2);">
					<a href="#" class="project-item__image-link">
						<img
							src="<?php echo get_template_directory_uri(); ?>/project-test-2.png"
							alt="Project Test 2"
							loading="lazy"
						>
					</a>
				</div>
			</section>

			<section class="project-item" data-value="wp">
				<div class="project-item__content">
					<div class="project-item__tags">
						<a href="#" class="project-item__tag">Lorem Tag</a>
						<a href="#" class="project-item__tag">Ipsum Label</a>
					</div>

					<h2 class="project-item__title">
						<a href="#" class="project-item__link">Lorem Ipsum Dolor System</a>
					</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">
							Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
						</li>
						<li class="project-item__list-item">
							Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
						</li>
					</ul>
				</div>

				<div class="project-item__image">
					<a href="#" class="project-item__image-link">
						<img
							src="<?php echo get_template_directory_uri(); ?>/project-test-1.png"
							alt="Project Test 1"
							loading="lazy"
						>
					</a>
				</div>
			</section>

			<section class="project-item" data-value="wp">
				<div class="project-item__content">
					<div class="project-item__tags">
						<a href="#" class="project-item__tag">Lorem Tag</a>
						<a href="#" class="project-item__tag">Ipsum Label</a>
					</div>

					<h2 class="project-item__title">
						<a href="#" class="project-item__link">Lorem Ipsum Dolor System</a>
					</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">
							Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
						</li>
						<li class="project-item__list-item">
							Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
						</li>
					</ul>
				</div>

				<div class="project-item__image">
					<a href="#" class="project-item__image-link">
						<img
							src="<?php echo get_template_directory_uri(); ?>/project-test-2.png"
							alt="Project Test 2"
							loading="lazy"
						>
					</a>
				</div>
			</section>
		</div>

	</div>
</div>

