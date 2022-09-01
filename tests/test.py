from unittest.mock import MagicMock
from modules.account.service import AccountService
from modules.auth.service import AuthService
from modules.user.service import UserService


def test_login_output():
    auth_service = AuthService()

    user_info = auth_service.login('admin@root.com', 'pass')

    assert user_info[7] == 'admin@root.com'


def test_get_user():
    user_service = UserService()
    aadhar = 696969696969
    expected_name = 'nice'
    user_info = user_service.get_user(aadhar)

    assert len(user_info) == 11

    assert user_info[1] == expected_name



def mocked_get_account_type_id_by_name(account_type_name):
    if account_type_name == 'savings':
        return 1
    return 2


def test_get_account_name_from_id():

    account_service = AccountService()

    account_type_id = mocked_get_account_type_id_by_name('savings')
    expected_name = 'savings'
    account_name = account_service.get_account_name_by_id(account_type_id)

    assert account_name == expected_name
