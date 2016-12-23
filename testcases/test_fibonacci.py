import http


class FibonacciTestCase(http.BaseTestCase):
    def test_fibonacci(self):
        """
        Test fibonacci
        """
        self.assert_request('get', '/fibonacci/0', expected_body='')
        self.assert_request('get', '/fibonacci/1', expected_body='0')
        self.assert_request('get', '/fibonacci/5', expected_body="0 1 1 2 3")
