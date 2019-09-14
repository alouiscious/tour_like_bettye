lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "TourLikeBettye/version"


Gem::Specification.new do |spec|
  spec.name          = "TourLikeBettye"
  spec.version       = TourLikeBettye::VERSION
  spec.authors       = ["Alouiscious Media"]
  spec.email         = ["info@reneesoul.com"]

  spec.summary       = %q{This app shall help performing artists in several genres to tour.\n
    It specifically targets the smallest touring bands/venues/revenues\n that are easy enough for a good samller act to target.}
  spec.description   = %q{Also, this displays from the largest concerts \n and the logic to connecting efficient touring routes \n 
    and ideal regions and timelines to play them. Connect with venues straight away.\n
        using bettye's and jam base web site. Know whose booking these venues.\n Discover important A/V logistics right down to stage door, green room, and parking.
}
  spec.homepage      = "https://alloiusciousmedia.com"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alouiscious/tour_like_bettye"
  spec.metadata["changelog_uri"] = "https://github.com/alouiscious/tour_like_bettye/mission_rd/CHANGELOG.md."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pry"
  # spec.add_dependency 'open-uri'
  spec.add_dependency "nokogiri"
end
