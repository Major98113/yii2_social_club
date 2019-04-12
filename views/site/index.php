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
            <div class="col-lg-4 text-center profile-block">
                <div class="profile-window">
                    <div>
                        <a href="/user/<?=$user['id'] ?>">
                            <?php  if ($user['photo']=='/img/avatar_miss.png'):  ?>
                                <img src="<?=$user['photo']?>" class="img-responsive"/>
                            <?php else:?>
                                <img src="/<?=$user['photo']?>" class="img-responsive"/>
                            <?php endif; ?>
                        </a>
                    </div>
                    <h2><?=$user['email'];?></h2>
                    <div class="text-body">
                        <?=$user['facts'] ?>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>

    </div>
</div>
