<?php

/* @var $this yii\web\View */

$this->title = 'Главная';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Все пользователи</h1>
    </div>

    <div class="body-content">

        <div class="row">
            <?php foreach ($users as $user): ?>
            <div class="col-lg-4 text-center">
                <div class="profile-window">
                    <div>
                        <img src="/img/avatar_miss.png" class="img-responsive"/>
                    </div>
                    <h2><?=$user['email'];?></h2>
                </div>
            </div>
            <?php endforeach; ?>
        </div>

    </div>
</div>
