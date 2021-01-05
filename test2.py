import numpy as np
import unittest
from unittest import mock
from graph import plot_square

#class test(unittest.TestCase):
def test_plot_square1():
    x, y = [0, 1, 2], [0, 1, 2]
    line, = plot_square(x, y)
    x_plot, y_plot = line.get_xydata().T
    np.testing.assert_array_equal(y_plot, np.square(y))


if __name__ == "__main__":
    unittest.main()
