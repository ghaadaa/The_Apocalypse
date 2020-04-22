<?php  
    include "../../Entities/categorie_r.php";
    include "../../Core/Categorie_rCore.php";
?>
<!DOCTYPE html>
<html lang="en">

    <head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Blank</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php include 'sidebar.php'; ?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <?php include 'navbar.php'; ?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                </div>
                <!-- /.container-fluid -->
                <div class="row">
                    <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h3 mb-4 text-gray-800">Modifier une catégorie</h1>
                            </div>
                            <?php			
                                if (isset($_GET['objet'])){
                                    $Categorie_rCore=new Categorie_rCore();
                                    $result=$Categorie_rCore->rechercherCategorie_r($_GET['objet']);
                                    foreach($result as $row){
                                        $objet=$row['objet'];
                                        $modetraitement=$row['modetraitement'];
                            ?>
                                    <form method="POST" class="user" >
                                        <div class="form-group">
                                            <label>Objet</label>
                                            <input type="text" class="form-control form-control-user" name="objet" value="<?PHP echo $objet ?>">
                                        
                                            <label >Mode de traitement</label>
                                            <input type="text" class="form-control form-control-user" name="modetraitement" value="<?PHP echo $modetraitement ?>">
                                        </div>

                                        <input type="submit" class="btn btn-primary btn-user btn-block" name="modifier" value="Modifier">                                            
                                        <input type="hidden" name="objet_ini" value="<?PHP echo $_GET['objet'];?>">
                                    </form>   
                            <?PHP
                                    } //end for
                                } // end if isset
                                if (isset($_POST['modifier'])){
                                    $categorie_r=new categorie_r($_POST["objet"],$_POST["modetraitement"]);
                                    $Categorie_rCore->modifierCategorie_r($categorie_r, $_POST["objet_ini"]);
                                    
                                }
                            ?>

                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <?php  include 'footer.php'; ?>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    </body>
</html>