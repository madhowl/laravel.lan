<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Student
 *
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student query()
 * @mixin \Eloquent
 * @property int $id
 * @property string $familia
 * @property string $name
 * @property string $otchestvo
 * @property int $gender_id
 * @property string $birthday
 * @property int $group_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereBirthday($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereFamilia($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereGenderId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereGroupId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereOtchestvo($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Student whereUpdatedAt($value)
 */
class Student extends Model
{
    //
}
