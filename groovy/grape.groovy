#!groovy
@Grab(group='org.jsoup', module='jsoup', version='1.11.3')

import org.jsoup.Jsoup
import org.jsoup.nodes.Document


final def url = args[0]

def doc = Jsoup.connect(url).get()
def links = doc.select("a").size()
println "link: ${links}"

