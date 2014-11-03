import xml.etree.ElementTree as ET
import pprint

dataSource = "data/exampleResearchArticle.xml"

tree = ET.parse(dataSource)
root = tree.getroot()

print "\nChildren of root:"
for child in root:
    print child.tag

