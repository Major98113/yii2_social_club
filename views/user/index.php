<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use app\models\User;

$this->title = $user['username'];
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['/']];
$this->params['breadcrumbs'][] = ['label' => $user['username']];

?>


<div class="site-account">
    <div class="row">
        <div class="col-lg-12">
            <div class="profile-window">
                <h1><?= Html::encode($this->title) ?></h1>
                <div class="text-body">
                    <div>
                        <?php if ($user['photo']=='/img/avatar_miss.png'):  ?>
                            <img src="<?=$user['photo']?>" class="img-responsive"/>
                        <?php else:?>
                            <img src="/<?=$user['photo']?>" class="img-responsive"/>
                        <?php endif; ?>
                    </div>
                    <p>Interestinf facts: <?=$user['facts']; ?></p>
                    <p>Year of birth: <?=$user['born']; ?></p>

                    <pre>
                        <?php
                        if (!empty($comments)):
                            foreach ($comments as $comment):
                                $speaker = User::find()->where(['id' => $comment['author_id']])->asArray()->one();
                                echo "<h4>".$speaker['username']."</h4>";
                                echo "<p> >> ".$comment['body']."</p>";
                                echo "(".$comment['time'].")";
                            endforeach;

                            else:
                                echo "This User has not any comments";
                        endif; ?>
                    </pre>

                    <?php if($current_user==0): ?>
                        <div class='alert-danger'>
                            If you are guest, you have not rule to put comments !!!
                        </div>
                    <?php else: ?>
                        <?php $form = ActiveForm::begin(); ?>
                        <?= $form->field($new_comment, 'author_id')->hiddenInput(['value' => $current_user])->label(false); ?>
                        <?= $form->field($new_comment, 'target_id')->hiddenInput(['value' => $user['id']])->label(false); ?>
                        <?= $form->field($new_comment, 'body')->textarea() ?>
                        <div class="form-group">
                            <?= Html::submitButton('Отправить сообщение', ['class' => 'btn btn-success']) ?>
                        </div>
                        <?php ActiveForm::end();
                    endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
