import logging

import pytest

from fixtures.area import AREA
from helpers import area_summary

logging.basicConfig(level=logging.DEBUG)


def test_merge_areas():
    logging.debug(AREA)

def test_area_summary():
    area_summary(AREA)

