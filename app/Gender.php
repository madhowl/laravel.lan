<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Gender
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender query()
 * @mixin \Eloquent
 * @property int $id
 * @property string $gender
 * @property string|null $desc
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender whereDesc($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender whereGender($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Gender whereUpdatedAt($value)
 */
class Gender extends Model
{
    //
}
