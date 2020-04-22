<?PHP
include_once "../../config.php";
class Categorie_rCore {

	function ajouterCategorie_r($categorie_r){
		$sql="INSERT INTO `categorie_r` (`objet`, `modetraitement`) VALUES (:objet,:modetraitement)";
		$db = config::getConnexion();
		try{
        $req=$db->prepare($sql);
		
        $objet=$categorie_r->getObjet();
        $modetraitement=$categorie_r->getModetraitement();
   
		$req->bindValue(':objet',$objet);
		$req->bindValue(':modetraitement',$modetraitement);		
		$req->execute();
        }
        catch (Exception $e){
            echo 'Erreur: '.$e->getMessage();
        }
	}

	function Afficherlistecategories_r(){
		$sql="SElECT * From categorie_r";
		$db = config::getConnexion();
		try{
		$liste=$db->query($sql);
		return $liste;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }	
	}

	function SupprimerCategorie_r($objet){
		$sql="DELETE FROM categorie_r where objet= :objet";
		$db = config::getConnexion();
        $req=$db->prepare($sql);
		$req->bindValue(':objet',$objet);
		try{
            $req->execute();
        }
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}

	function rechercherCategorie_r($objet){
		$sql="SELECT * from categorie_r where objet='$objet'";
		$db = config::getConnexion();
		try{
			$categorie_r=$db->query($sql);
		return $categorie_r;
		}
        catch (Exception $e){
            die('Erreur: '.$e->getMessage());
        }
	}
	
	function modifierCategorie_r($categorie_r, $objet){
		$sql="UPDATE categorie_r SET objet=:objetn, modetraitement=:modetraitement WHERE objet=:objet"; 
		//var_dump($sql);
		
		$db = config::getConnexion();
		try{		
			$req=$db->prepare($sql);
			$objetn=$categorie_r->getObjet();
			$modetraitement=$categorie_r->getModetraitement();

		

			$req->bindValue(':objet',$objet);
			
			$datas = array(':objetn'=>$objetn, ':objet'=>$objet, ':modetraitement'=>$modetraitement);
			$req->bindValue(':objetn',$objetn);
			
			$req->bindValue(':modetraitement',$modetraitement); 

			//var_dump($req);

		
			$req->execute();
			echo $req->rowCount() . " records UPDATED successfully";
			
		}
		catch (PDOException $e){
			echo " Erreur ! ".$e->getMessage();
			echo " Les datas : " ;
			print_r($datas);
		}
	}
     function trierCategories_r()
   {
	$sql="SELECT * FROM categorie_r ORDER BY modetraitement";
	$db = config::getConnexion();
	 try{
	$liste=$db->query($sql);
	return $liste;
	    }
	catch (Exception $e){
		die('Erreur: '.$e->getMessage());
	    }
    }
}
?>