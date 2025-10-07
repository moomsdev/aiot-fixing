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

		<!-- <div class="search-box">
			<div class="input-wrapper" id="inputWrapper">
				<input type="text" id="searchInput" placeholder="Tìm kiếm...">
				<button class="search-btn" aria-label="Tìm kiếm"></button>
			</div>
			
			<div class="suggestions" id="suggestions">
				<span class="suggestion">ReactJS</span>
				<span class="suggestion">WordPress</span>
				<span class="suggestion">Docker</span>
				<span class="suggestion">SCSS</span>
				<span class="suggestion">NodeJS</span>
			</div>
		</div> -->

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
						<span class="project-item__tag">Lorem Tag</span>
						<span class="project-item__tag">Ipsum Label</span>
					</div>

					<h2 class="project-item__title">Lorem Ipsum Dolor System</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
						<li class="project-item__list-item">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</li>
					</ul>
				</div>

				<div class="project-item__image">
					<img src="<?php echo get_template_directory_uri(); ?>/project-test-1.png" alt="Project Test 1" loading="lazy">
				</div>
			</section>

			<section class="project-item" data-value="wp jv">
				<div class="project-item__content">
					<div class="project-item__tags">
						<span class="project-item__tag">Lorem Tag</span>
						<span class="project-item__tag">Ipsum Label</span>
					</div>

					<h2 class="project-item__title">Lorem Ipsum Dolor System</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
						<li class="project-item__list-item">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</li>
					</ul>
				</div>

				<div class="project-item__image">
					<img src="<?php echo get_template_directory_uri(); ?>/project-test-2.png" alt="Project Test 1" loading="lazy">
				</div>
			</section>

			<section class="project-item" data-value="jv">
				<div class="project-item__content">
					<div class="project-item__tags">
						<span class="project-item__tag">Lorem Tag</span>
						<span class="project-item__tag">Ipsum Label</span>
					</div>

					<h2 class="project-item__title">Lorem Ipsum Dolor System</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
						<li class="project-item__list-item">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</li>
					</ul>
				</div>

				<div class="project-item__image">
					<img src="<?php echo get_template_directory_uri(); ?>/project-test-1.png" alt="Project Test 1" loading="lazy">
				</div>
			</section>

			<section class="project-item" data-value="js">
				<div class="project-item__content">
					<div class="project-item__tags">
						<span class="project-item__tag">Lorem Tag</span>
						<span class="project-item__tag">Ipsum Label</span>
					</div>

					<h2 class="project-item__title">Lorem Ipsum Dolor System</h2>

					<p class="project-item__description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.
						Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at
						nibh elementum imperdiet. Duis sagittis ipsum.
					</p>

					<ul class="project-item__list">
						<li class="project-item__list-item">Lorem ipsum dolor sit.</li>
						<li class="project-item__list-item">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
						<li class="project-item__list-item">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</li>
					</ul>
				</div>

				<div class="project-item__image">
					<img src="<?php echo get_template_directory_uri(); ?>/project-test-2.png" alt="Project Test 1" loading="lazy">
				</div>
			</section>

		</div>

	</div>
</div>

<!-- Phần Jvs test cho search box -->
<!-- <script>
  const searchInput = document.getElementById("searchInput");
  const inputWrapper = document.getElementById("inputWrapper");
  const suggestions = document.getElementById("suggestions");

  // click gợi ý -> chuyển thành chip trong input
  suggestions.addEventListener("click", function (e) {
    if (e.target.classList.contains("suggestion")) {
      const keyword = e.target.textContent;

      // tạo chip
      const chip = document.createElement("span");
      chip.classList.add("chip");
      chip.innerHTML = `${keyword} <button class="remove">&times;</button>`;

      // thêm chip trước ô input
      inputWrapper.insertBefore(chip, searchInput);

      // xoá gợi ý đã click
      e.target.remove();
    }
  });

  // click nút x -> xoá chip và trả lại vào gợi ý
  inputWrapper.addEventListener("click", function (e) {
    if (e.target.classList.contains("remove")) {
      const chip = e.target.parentElement;
      const keyword = chip.textContent.replace("×", "").trim();

      // trả keyword lại vào suggestions
      const suggestion = document.createElement("span");
      suggestion.classList.add("suggestion");
      suggestion.textContent = keyword;
      suggestions.appendChild(suggestion);

      // xoá chip
      chip.remove();
    }
  });
</script> -->
