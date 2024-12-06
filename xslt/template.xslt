<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>

	<!--Creamos una variable que reciba un parametro desde el procesador
	la propiedad "name" establece el nombre de la variable
	la propiedad select establece el origen del dato de la variable-->
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>
	<xsl:param name="TipoBebidas" select="TipoBebidas"></xsl:param>

	<!--Mi template Principal
	La idea es recrear el comportamiento de una "pagina maestra" donde la pagina principal carga los elementos
	que son "constantes" en el resto del sitio-->

	<xsl:template match="Menu">

		<html lang="en">

			<head>
				<meta charset="utf-8"></meta>
				<meta content="width=device-width, initial-scale=1.0" name="viewport"></meta>

				<title>Restaurantly Bootstrap Template - Index</title>
				<meta content="" name="description"></meta>
				<meta content="" name="keywords"></meta>

				<!-- Favicons -->
				<link href="assets/img/favicon.png" rel="icon"></link>
				<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"></link>

				<!-- Google Fonts -->
				<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"></link>

				<!-- Vendor CSS Files -->
				<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/aos/aos.css" rel="stylesheet"></link>
				<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"></link>
				<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"></link>

				<!-- Template Main CSS File -->
				<link href="assets/css/style.css" rel="stylesheet"></link>
				<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

			</head>

			<body>

				<!-- ======= Top Bar ======= -->
				<div id="topbar" class="d-flex align-items-center fixed-top">
					<div class="container d-flex justify-content-center justify-content-md-between">

						<div class="contact-info d-flex align-items-center">
							<i class="bi bi-phone d-flex align-items-center">
								<span>+1 5589 55488 55</span>
							</i>
							<i class="bi bi-clock d-flex align-items-center ms-4">
								<span> Mon-Sat: 11AM - 23PM</span>
							</i>
						</div>

						<div class="languages d-none d-md-flex align-items-center">
							<ul>
								<li>En</li>
								<li>
									<a href="#">De</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- ======= Header ======= -->
				<header id="header" class="fixed-top d-flex align-items-cente">
					<div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

						<h1 class="logo me-auto me-lg-0">
							<a href="index.html">Restaurantly</a>
						</h1>
						<!-- Uncomment below if you prefer to use an image logo -->
						<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

						<nav id="navbar" class="navbar order-last order-lg-0">
							<ul>
								<!--Creo una lista dinamica a partir de las opciones del xml-->
								<xsl:for-each select="Opciones/Opcion">
									<!--xsl:choose funcina como un Switch, permitiendome crear casos que empaten en funcion de una condicion y declarar una condicion default-->
									<li>
										<xsl:choose>
											<xsl:when test="$TipoMenu = @Id">
												<a class="nav-link scrollto active" href="{@Url}">
													<xsl:value-of select="@Texto"/>
												</a>
											</xsl:when>
											<xsl:otherwise>
												<a class="nav-link scrollto" href="{@Url}">
													<xsl:value-of select="@Texto"/>
												</a>
											</xsl:otherwise>
										</xsl:choose>

									</li>
								</xsl:for-each>
							</ul>
							<i class="bi bi-list mobile-nav-toggle"></i>
						</nav>
						<!-- .navbar -->
						<a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">Book a table</a>

					</div>
				</header>
				<!-- End Header -->

				<!-- ======= Hero Section ======= -->
				<section id="hero" class="d-flex align-items-center">
					<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
						<div class="row">
							<div class="col-lg-8">
								<h1>
									Bienvenido a <span>
										<xsl:value-of select="DAtos/NombreRestaurante"/>
									</span>
								</h1>
								<h2>
									<xsl:value-of select="Datos/Descripcion"/>
								</h2>

								<div class="btns">
									<a href="#menu" class="btn-menu animated fadeInUp scrollto">Nuestro Menú</a>
								</div>
							</div>
							<div class="col-lg-4 d-flex align-items-center justify-content-center position-relative" data-aos="zoom-in" data-aos-delay="200">
								<a href="https://www.youtube.com/watch?v=GlrxcuEDyF8" class="glightbox play-btn"></a>
							</div>

						</div>
					</div>
				</section>
				<!-- End Hero -->

				<!-- ======= Choose Section ======= -->
				<xsl:choose>
					<xsl:when test="$TipoMenu = 0">
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 1">
						<xsl:call-template name="Carta"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 2">
						<xsl:call-template name="Contacto"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 3">
						<xsl:call-template name="PlayRomm"></xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<!-- End Choose -->

				<!-- ======= Footer ======= -->
				<footer id="footer">
					<div class="footer-top">
						<div class="container">
							<div class="row">

								<div class="col-lg-3 col-md-6">
									<div class="footer-info">
										<h3>Restaurantly</h3>
										<p>
											A108 Adam Street <br></br>
											NY 535022, USA<br></br>
											<br></br>
											<strong>Phone:</strong> +1 5589 55488 55<br></br>
											<strong>Email:</strong> info@example.com<br></br>
										</p>
										<div class="social-links mt-3">
											<a href="#" class="twitter">
												<i class="bx bxl-twitter"></i>
											</a>
											<a href="#" class="facebook">
												<i class="bx bxl-facebook"></i>
											</a>
											<a href="#" class="instagram">
												<i class="bx bxl-instagram"></i>
											</a>
											<a href="#" class="google-plus">
												<i class="bx bxl-skype"></i>
											</a>
											<a href="#" class="linkedin">
												<i class="bx bxl-linkedin"></i>
											</a>
										</div>
									</div>
								</div>

								<div class="col-lg-2 col-md-6 footer-links">
									<h4>Useful Links</h4>
									<ul>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Home</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">About us</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Services</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Terms of service</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Privacy policy</a>
										</li>
									</ul>
								</div>

								<div class="col-lg-3 col-md-6 footer-links">
									<h4>Our Services</h4>
									<ul>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Web Design</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Web Development</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Product Management</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Marketing</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Graphic Design</a>
										</li>
									</ul>
								</div>

								<div class="col-lg-4 col-md-6 footer-newsletter">
									<h4>Our Newsletter</h4>
									<p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
									<form action="" method="post">
										<input type="email" name="email"></input>
										<input type="submit" value="Subscribe"></input>

									</form>

								</div>

							</div>
						</div>
					</div>

					<div class="container">

						<div class="credits">
							<!-- All the links in the footer should remain intact. -->
							<!-- You can delete the links only if you purchased the pro version. -->
							<!-- Licensing information: https://bootstrapmade.com/license/ -->
							<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/restaurantly-restaurant-template/ -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</footer>
				<!-- End Footer -->

				<div id="preloader"></div>
				<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
					<i class="bi bi-arrow-up-short"></i>
				</a>

				<!-- Vendor JS Files -->
				<script src="assets/vendor/aos/aos.js"></script>
				<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
				<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
				<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
				<script src="assets/vendor/php-email-form/validate.js"></script>
				<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

				<!-- Template Main JS File -->
				<script src="assets/js/main.js"></script>

			</body>

		</html>

		<!--	<xsl:value-of select="Opciones/Opcion/@Texto"/>
		<xsl:for-each select="Opciones/Opcion">
			<br></br>
			<xsl:value-of select="@Texto"/>
			<br></br>
		</xsl:for-each>
		<xsl:for-each select="Platillos/Tipo">
			<xsl:choose>
				<xsl:when test="@Nombre = 'Desayunos'">
					<h1 style="color:red;">
						<xsl:value-of select="@Nombre"/>
					</h1>
						<xsl:for-each select="Platillo">
							<ul>
								<li>
									<xsl:value-of select="@Nombre"/>
								</li>
								<li>
									<xsl:value-of select="Descripcion"/>
								</li>
								<li>
									<xsl:value-of select="Precio"/>
								</li>
							</ul>
						</xsl:for-each>
				</xsl:when>
				<xsl:when test="@Nombre = 'Comidas'">
					<h1 style="color:yellow;">
						<xsl:value-of select="@Nombre"/>
					</h1>
				</xsl:when>
				<xsl:otherwise>
					<h2 style="color:green;">
						<xsl:value-of select="@Nombre"/>
					</h2>					
				</xsl:otherwise>
			</xsl:choose>			
		</xsl:for-each>-->
	</xsl:template>

	<!--Templeate adicionales-->
	<!--Son "microtempleates que contienen estructura y contenido en funcion de la pagina/segmento que se desea mostrar-->
	<xsl:template name="Home">

		<!-- ======= Why Us Section ======= -->
		<section id="why-us" class="why-us">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Platillos</h2>
					<p>Nuestros Platillos Favoritos</p>
				</div>

				<div class="row">
					<!--PRODUCTOS POPULARES DESDE EL ML-->
					<!--Creo una recorrido para seleccinar el primero platillo de cada tipo de platillo excepto de bebidas-->
					<xsl:for-each select="Platillos/Tipo[@Nombre != 'Bebidas']/Platillo[@Orden = 1]">
						<div class="col-lg-4">
							<div class="box" data-aos="zoom-in" data-aos-delay="100">
								<div class="section-title">
									<h2>
										<!--El nombre del tipo de platillo-->
										<xsl:value-of select="../@Nombre"/>
									</h2>
								</div>
								<br></br>
								<!--Inferimos el dato proveniente del nodo en la propiedad de la etiqueta (imagen)-->
								<img src="{Imagen}" alt="{Imagen}" style="width:100%; height:auto;"></img>
								<br></br>
								<h4>
									<!--Aqui muestro el nombre del platillo-->
									<!--aqui toma la primera letra en h4 y del resto lo hace en h5-->
									<span style="display:contents;">
										<!--substring(cadena, lugar inicial, numero de la cadena-->
										<xsl:value-of select="substring(@Nombre, 1, 1)"/>
									</span>
									<!--string-length(cadena) => el total de datos de la cadena-->
									<xsl:value-of select="substring(@Nombre,2, string-length(@Nombre))"/>
								</h4>
								<h5>
									<xsl:value-of select="Precio"/>
								</h5>
								<p>
									<xsl:value-of select="Descripcion"/>
								</p>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</section>
		<!-- End Why Us Section -->

		<!-- ======= Events Section ======= -->
		<section id="events" class="events">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Especialidades</h2>
					<p>Conoce nuestros platillos especiales</p>
				</div>

				<div class="events-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
					<div class="swiper-wrapper">
						<!--Recorro todos los platillos para seleccionar solo aquellos que son especialidad-->
						<xsl:for-each select="Platillos/Tipo/Platillo[@Especialidad = 'SI']">
							<div class="swiper-slide">
								<div class="row event-item">
									<div class="col-lg-6">
										<!--Voy a inferir la imagen en su posicion 1-->
										<img src="{Imagen[position()=1]}" class="img-fluid" alt="{Imagen[position()=1]}"></img>
									</div>
									<div class="col-lg-6 pt-4 pt-lg-0 content">
										<h3>
											<!--Recuperamos el nombre del platillo-->
											<xsl:value-of select="@Nombre"/>
										</h3>
										<div class="price">
											<p>
												<span>
													<!--Recuperamos el precio del platillo-->
													<xsl:value-of select="Precio"/>
												</span>
											</p>
										</div>
										<p class="fst-italic">
											<!--Recuperamos el texto especial-->
											<xsl:value-of select="TextoEspecial"/>
										</p>
										<!--Ingredientes-->
										<div calss="col-lg-12">
											<!--Imagen-->
											<div class="col-lg-12">
												<div class="col-lg-6 pt-4 pt-lg-0 content">
													<h3>
														<!--Recuperamos el nombre de los ingredientes-->
														<xsl:value-of select="Ingredientes/Ingrediente[position() = 1]/@Nombre"/>
													</h3>
													<p>
														<!--Recuperamos el nombre de los ingredientes-->
														<xsl:value-of select="Ingredientes/Ingrediente[position() = 1]"/>
													</p>
												</div>
												<!--Inferimos la imagen en su posicion 1-->
												<img src="{Imagen[position()=2]}" class="img-fluid" alt="{Imagen[position()=2]}"></img>
											</div>
											<!--Textos-->
											<div class="col-lg-12">
												<div class="row event-item">
													<!--Recorrer el resto de ingredientes-->
													<xsl:for-each select="Ingredientes/Ingrediente[position()>1]">
														<div class="col-lg-6 pt-4 pt-lg-0 content">
															<h3>
																<!--Recuepramos el nombre de los ingredientes-->
																<xsl:value-of select="@Nombre"/>
															</h3>
															<p class="fst-italic">
																<!--Recuperamos el valor de los ingredientes-->
																<xsl:value-of select="Ingredientes/Ingrediente[position()=1]"/>
															</p>
															<p>
																<!--Inferimos la imagen en su posicion 1-->
																<img src="{@Imagen}" class="img-fluid" alt=""/>
															</p>
														</div>
													</xsl:for-each>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</xsl:for-each>
						<!-- End testimonial item -->

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Events Section -->

		<!-- ======= Specials Section ======= -->
		<section id="specials" class="specials">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Specials</h2>
					<p>Check Our Specials</p>
				</div>

				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-3">
						<ul class="nav nav-tabs flex-column">
							<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
								<li class="nav-item">
									<xsl:choose>
										<xsl:when test="@Orden = 1">
											<!--El data-bs-toggle es el que te da la base del llamado, en este caso "tab"-->
											<!--el {} es para ingresar un dato duro dentro de otra propiedad-->
											<a class="nav-link active show" data-bs-toggle="tab" href="#tab-{@Orden}">
												<xsl:value-of select="@Nombre"/>
											</a>
										</xsl:when>
										<xsl:otherwise>
											<a class="nav-link" data-bs-toggle="tab" href="#tab-{@Orden}">
												<xsl:value-of select="@Nombre"/>
											</a>
										</xsl:otherwise>
									</xsl:choose>

								</li>
							</xsl:for-each>
						</ul>
					</div>

					<div class="col-lg-9 mt-4 mt-lg-0">
						<div class="tab-content">
							<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
								<xsl:choose>
									<xsl:when test="@Orden = 1">
										<div class="tab-pane active show" id="tab-{@Orden}">
											<div class="row">
												<div class="col-lg-8 details order-2 order-lg-1">
													<h3>
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="fst-italic">
														<xsl:value-of select="Precio"/>
													</p>
													<p>
														<xsl:value-of select="Descripcion"/>

													</p>
												</div>
												<div class="col-lg-4 text-center order-1 order-lg-2">
													<img src="{Imagen}" alt="" class="img-fluid"></img>
												</div>
											</div>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="tab-pane" id="tab-{@Orden}">
											<div class="row">
												<div class="col-lg-8 details order-2 order-lg-1">
													<h3>
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="fst-italic">
														<xsl:value-of select="Precio"/>
													</p>
													<p>
														<xsl:value-of select="Descripcion"/>

													</p>
												</div>
												<div class="col-lg-4 text-center order-1 order-lg-2">
													<img src="{Imagen}" alt="" class="img-fluid"></img>
												</div>
											</div>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Specials Section -->

	</xsl:template>
	<xsl:template name="Carta">
		<!-- ======= Menu Section ======= -->
		<section id="menu" class="menu section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Menu</h2>
					<p>Check Our Tasty Menu</p>
				</div>

				<!--Selectores-->
				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="menu-flters">
							<li data-filter="*" class="filter-active">All</li>
							<!--Recorro todos los tipos de platillos para seleccionar su Nombre-->
							<xsl:for-each select="Platillos/Tipo">
								<!--Infiero el dato corresppondiente para que los filtros cambien en funcion del mismo-->
								<li data-filter=".filter-{@Nombre}">
									<xsl:value-of select="@Nombre"/>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
				<!--Contenido-->
				<div class="row menu-container" data-aos="fade-up" data-aos-delay="200">
					<!--Recuperar los elementos que coincidan con las clases de mi XML-->
					<xsl:for-each select="Platillos/Tipo/Platillo">
						<div class="col-lg-6 menu-item filter-{../@Nombre}">
							<img src="{Imagen}" class="menu-img" alt="{Imagen}"></img>
							<div class="menu-content">
								<a href="#">
									<xsl:value-of select="@Nombre"/>
								</a>

							</div>

						</div>
					</xsl:for-each>



					<div class="col-lg-6 menu-item filter-starters">
						<img src="assets/img/menu/lobster-bisque.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Lobster Bisque</a>
							<span>$5.95</span>
						</div>
						<div class="menu-ingredients">
							Lorem, deren, trataro, filede, nerada
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-specialty">
						<img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Bread Barrel</a>
							<span>$6.95</span>
						</div>
						<div class="menu-ingredients">
							Lorem, deren, trataro, filede, nerada
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-starters">
						<img src="assets/img/menu/cake.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Crab Cake</a>
							<span>$7.95</span>
						</div>
						<div class="menu-ingredients">
							A delicate crab cake served on a toasted roll with lettuce and tartar sauce
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-salads">
						<img src="assets/img/menu/caesar.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Caesar Selections</a>
							<span>$8.95</span>
						</div>
						<div class="menu-ingredients">
							Lorem, deren, trataro, filede, nerada
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-specialty">
						<img src="assets/img/menu/tuscan-grilled.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Tuscan Grilled</a>
							<span>$9.95</span>
						</div>
						<div class="menu-ingredients">
							Grilled chicken with provolone, artichoke hearts, and roasted red pesto
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-starters">
						<img src="assets/img/menu/mozzarella.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Mozzarella Stick</a>
							<span>$4.95</span>
						</div>
						<div class="menu-ingredients">
							Lorem, deren, trataro, filede, nerada
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-salads">
						<img src="assets/img/menu/greek-salad.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Greek Salad</a>
							<span>$9.95</span>
						</div>
						<div class="menu-ingredients">
							Fresh spinach, crisp romaine, tomatoes, and Greek olives
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-salads">
						<img src="assets/img/menu/spinach-salad.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Spinach Salad</a>
							<span>$9.95</span>
						</div>
						<div class="menu-ingredients">
							Fresh spinach with mushrooms, hard boiled egg, and warm bacon vinaigrette
						</div>
					</div>

					<div class="col-lg-6 menu-item filter-specialty">
						<img src="assets/img/menu/lobster-roll.jpg" class="menu-img" alt=""/>
						<div class="menu-content">
							<a href="#">Lobster Roll</a>
							<span>$12.95</span>
						</div>
						<div class="menu-ingredients">
							Plump lobster meat, mayo and crisp lettuce on a toasted bulky roll
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Menu Section -->
	</xsl:template>
	<xsl:template name="Contacto">
			<!--API de Google-->

			<script>
				// Definir la función initMap globalmente
				function initMap() {
				// Asegúrate de que aquí inicializas el mapa correctamente
				const mapOptions = {
				center: { lat: -34.397, lng: 150.644 },  // Cambia estas coordenadas por las deseadas
				zoom: 8
				};
				const map = new google.maps.Map(document.getElementById('map'), mapOptions);
				}
			</script>

			<script>
				<![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
			</script>
		
		<!--Referencia a mi archivo JS-->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;callback=initMap"
				async="" defer=""></script>


		<script src="assets/js/MiScript.js" type="text/javascript" ></script>
		<script src="assets/js/google.js" type="module" ></script>


		<section id="contact" class="contact">
			<div class="container" data-aos="fade-up">
				<div class="section-title">
					<h2>Contacto</h2>
					<p>Queremos Escucharte</p>
				</div>
			</div>

			<!--Mapa-->
			<div data-aos="fade-up">
				<style>
					#map {
					border:0;
					width: 100%;
					height: 350px;
					}
				</style>
				<div id="google-map">
					<div id="map"></div>
				</div>
				<text id="direccion"> esta es una etiqueta de texto </text>
				<div class="col-lg-12 margin-bottom-30" id="street" style="height: 400px; width: 100%;"></div>
			</div>
			<!--Datos del Formulario-->
			<div class="container" data-aos="fade-up">
				<div class="row mt-5">
					<!--Datos de Contacto-->
					<div class="col-lg-4">
						<div class="info">
							<div class="address">
								<i class="bi bi-geo-alt"></i>
								<h4>Dirección: </h4>
								<p>
									<xsl:value-of select="Datos/Direccion"/>
								</p>
							</div>
							<div class="open-hours">
								<i class="bi bi-clock"></i>
								<h4>Horarios: </h4>
								<xsl:for-each select="Datos/Horarios/Horario">
									<p>
										<xsl:value-of select="."/>
									</p>
								</xsl:for-each>
							</div>
							<div class="email">
								<i class="bi bi-envelope"></i>
								<h4>Email:</h4>
								<p>
									<a href="mailto:{Datos/correo}">
										<xsl:value-of select="Datos/correo"/>
									</a>
								</p>
							</div>
							<div class="phone">
								<i class="bi bi-phone"></i>
								<h4>Telefono:</h4>
								<p>
									<xsl:value-of select="Datos/Telefono"/>
								</p>
							</div>
						</div>
					</div>
					<!--Formulario-->
					<div class="col-lg-8 mt-5 mt-lg-0">
						<form action="#" method="post" role="form" class="php-email-form">
							<div class="row">

								<div class="col-md-6 form-group">
									<input type="text" name="contac_name" class="form-control" id="contac_name" placeholder="Ingresa tu nombre" required=""/>
								</div>
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<input type="email" class="form-control" name="contact_email" id="contact_email" placeholder="Ingrese su email" required=""/>
								</div>

								<div class="row">
									<div class="col-md-6 form-group">
										<input type="number" name="contac_people" class="form-control" id="contac_people" required="true" max="8" min="1" placeholder="# de Personas"/>
									</div>
									<div class="col-md-6 form-group mt-3 mt-md-0">
										<input type="number" class="form-control" name="contact_add" id="contact_add" required="true" max="4" min="0" placeholder="# de Personas adicionales"/>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 form-group mt-3 mt-md-0">
										<input type="date" id="contact_fecha" name="contact_fecha" class="form-control" required="true"></input>
									</div>

									<div class="col-md-6 form-group mt-3 mt-md-0">
										<input type="time" id="contact_hora" name="contact_hora" class="form-control" required ="true" max="19:00:00" min="08:00:00"></input>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 form-group mt-3 mt-md-0">
										<output id="total" class="form-control" disable="true"></output>
									</div>
								</div>

								<div class="text-center">
									<a class="book-a-table-btn" id="miBoton" onclick="enviar_formulario()">Presionar</a>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

		<script>
			<![CDATA[
		console.log("Hola desde el temlate de Contacto");
// $ => Uso de Jquery
// (document) => hace referencia al objeto que deseo obtener y/o manipular
//.ready() => evento que se dispara una vez que el DOM ha sido cargado
//function (){} => Es un funcion anonima
$(document).ready(function () {
  console.log("Hola desde JQuery");

  //recuperar la fecha actual del servidor (deonde se aloja el Sistema)
  var now = new Date(Date.now());
  //recuperar el control "contact_hora"
  var timeControl = document.getElementById("contact_hora");
  //recupero la hora y los minutos actuales del servidor
  var horas = now.getHours();
  var minutos = now.getMinutes();

  //imprimo en la consola los resultados
  console.log("Now: ");
  console.log(now);
  console.log("La hora actual es: " + horas + ":" + minutos);
  console.log("horas: " + horas);
  console.log("minutos: " + minutos);
  console.log("timeControl: ");
  console.log(timeControl);

  //validar el formato de la fecha
  //   if (horas < 10) {
  //     horas = "0" + horas;
  //   }
  //   if (minutos < 10) {
  //     minutos = "0" + minutos;
  //   }
  horas = horas < 10 ? "0" + horas : horas;
  minutos = minutos < 10 ? "0" + minutos : minutos;

  //concateno el resultado
  var formatted = horas + ":" + minutos;

  //puedo asignar los valores resultantes usando JS, Jquery(2)
  //JS
  //timeControl.value = formatted;
  //Jquery
  //$('#contact_hora').val(formatted);
  //Jquery apelando a un atributo
  $("#contact_hora").attr("value", formatted);
  dia = now.getDate();
  mes = now.getMonth() + 1;
  anio = now.getFullYear();




  mes = mes < 10 ? "0" + mes : mes;
  dia = dia < 10 ? "0" + dia : dia;

  var fechaFormatted = anio + "-" + mes + "-" + dia;
   console.log("fechaFormatted: " + fechaFormatted);
   //Asigno los valores
   $('#contact_fecha').attr('value', fechaFormatted);
});
  
		]]>
		</script>

	</xsl:template>
	<xsl:template name="PlayRomm">
		<!--Referenia a CSS-->
		<link href="assets/css/DragandDrop.css" rel="stylesheet"></link>
		<!--Referencia JS-->
		<script src="assets/js/DragandDrop.js" type="text/javascript"></script>

		<div class="container">
			<!--Audio-->
			<section class="tm-section-row p-5">
				<br></br>
				<br></br>
				<h2>Audio</h2>
				<div id="Audio" style="width:100%">
					<img src="assets/img/gallery/gallery-1.jpg" width="100%"></img>
					<audio controls="true" style="width:100%" autoplay="autoplay" >
						<source src="assets/audio.mp3"></source>
					</audio>
				</div>
			</section>
			<!--Video-->
			<section class="tm-section-row p-5">
				<h2>Video</h2>
				<div id="Video" style="width:100%">
					<video controls="true" style="width:100%">
						<source src="assets/GoProHW.mp4"></source>
					</video>
				</div>
				<br></br>
				<br></br>	
			</section>

			<!--Drag and Drop-->
			<section class="tm-section-row p-5">
				<h2 class="col-lg-12 mb-30"><![CDATA[Drag & Drop]]></h2>
				    <!--Cuadro1-->
				<div id="cuadro1" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)">
					<!--cuadradito1-->
					<div class="cuadradito" id="arrastrable1" draggable="true" ondragstart="start(event)" ondragend="end(event)" ></div>
					
					<!--cuadradito2-->
					<div class="cuadradito" id="arrastrable2" draggable="true" ondragstart="start(event)" ondragend="end(event)" ></div>
					
					<!--cuadradito3-->
					<div class="cuadradito" id="arrastrable3" draggable="true" ondragstart="start(event)" ondragend="end(event)" ></div>
			
				</div>
				<!--Cuadro2-->

				<div id="cuadro2" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)"></div>
					<!--Cuadro3-->
					<div id="cuadro3" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return clone(event)"></div>
				<!--Cuadro4(Papelera)-->
						<div id="papelera" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return remove(event)">
				</div>
			</section>
		</div>
	</xsl:template>
</xsl:stylesheet>
