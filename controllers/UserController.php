<?php

namespace app\controllers;
use app\models\User;
use app\models\Comments;
use Yii;

class UserController extends \yii\web\Controller
{
    public function actionIndex()
    {
        if (!isset($_GET['id'])){
            throw new \yii\web\NotFoundHttpException();
        }
        $current_user = User::findOne($_GET['id']);
        $comments = Comments::find()->where(['target_id' => $_GET['id']])->asArray()->all();
        $new_comment = new Comments();

        if ($new_comment->load(Yii::$app->request->post()) && $new_comment->save()) {
            return $this->refresh();
        }



        if(empty($current_user)){
            throw new \yii\web\NotFoundHttpException();
        }
        else{
            $model = User::findOne($_GET['id']);
            $image = $model->getImage();
            $user = [
                'id' => $model->getId(),
                'username' => $model['username'],
                'email' => $model['email'],
                'photo' => $image->getPathToOrigin(),
                'facts' => $model->facts,
                'born' => $model->born,
            ];

            if(!Yii::$app->user->isGuest){
                $current_user = Yii::$app->user->getId();
            }
            else{
                $current_user = 0;
            }



            return $this->render('index', compact('user', 'model', 'current_user', 'comments','new_comment'));
        }
    }

}
