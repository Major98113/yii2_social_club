<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;

$this->title = 'Account';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php $form = ActiveForm::begin([
    'options' => [
        'enctype' => 'multipart/form-data'
    ]
]); ?>


<div class="site-account">
    <h1><?= Html::encode($this->title) ?></h1>
    <div class="row">
        <div class="col-lg-12">
            <div class="profile-window">
                <div>
                    <img src="/<?=$user['photo']?>" class="img-responsive"/>
                </div>
                <?= $form->field($model, 'image')->fileInput() ?>
                <?= $form->field($model, 'username')->textInput(['maxlength' => '25']) ?>
                <?= $form->field($model, 'born')->textInput() ?>
                <?= $form->field($model, 'facts')->textarea() ?>


                <div class="form-group">
                    <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
                </div>

            </div>
        </div>
    </div>
</div>

<?php ActiveForm::end(); ?>
