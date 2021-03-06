require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail,password,password_confirmation,last_name,first_name,last_name_ka,first_name_ka,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数字混合の6文字以上なら登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在するとき登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下なら登録できない' do
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみなら登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが半角数字のみなら登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'パスワード登録'
        @user.password_confirmation = 'パスワード登録'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passordが存在していてもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank",
                                                      'Last name is invalid. Input full-width characters')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank",
                                                      'First name is invalid. Input full-width characters')
      end
      it 'last_name_kaが空では登録できない' do
        @user.last_name_ka = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ka can't be blank",
                                                      'Last name ka is invalid. Input full-width katakana characters')
      end
      it 'first_name_kaが空では登録できない' do
        @user.first_name_ka = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ka can't be blank",
                                                      'First name ka is invalid. Input full-width katakana characters')
      end
      it 'last_nameは全角でなければ登録できない' do
        @user.last_name = 'inoue'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'first_nameは全角でなければ登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'last_name_kaは全角カタカナでなければ登録できない' do
        @user.last_name_ka = '井上'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ka is invalid. Input full-width katakana characters')
      end
      it 'first_name_kaは全角カタカナでなければ登録できない' do
        @user.first_name_ka = '井上'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ka is invalid. Input full-width katakana characters')
      end
      it 'last_name_kaは半角文字では登録できない' do
        @user.last_name_ka = 'inoue'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ka is invalid. Input full-width katakana characters')
      end
      it 'first_name_kaは半角文字では登録できない' do
        @user.first_name_ka = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ka is invalid. Input full-width katakana characters')
      end
    end
  end
end
