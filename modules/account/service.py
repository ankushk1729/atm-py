from utils.util import Util
class AccountService:
    
    def __init__(self, user_info):
        self.user_info = user_info
        self.util = Util()
        self.root = self.util.get_query_root()

    def create_account(self, user_id, account_type):
        print(user_id, account_type)
        create_acc_query = self.root[12].text.format(account_type, user_id)
        print(create_acc_query)
        cursor = self.util.execute_query_with_commit(create_acc_query)

        cursor.close()

    def get_account_type_id_by_name(self, account_name):

        get_account_id_query = self.root[13].text.format(account_name)

        cursor = self.util.execute_query(get_account_id_query)

        query_list = list(cursor)
        # print(query_list)
        cursor.close()
        if len(query_list) < 1 : 
            return None

        return query_list[0][0]


    def approve_requests(self):

        pending_requests_query = self.root[14].text

        self.util.execute_query(pending_requests_query)

