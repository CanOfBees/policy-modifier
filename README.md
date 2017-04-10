## Policy Modifier(s) ##

A temporary repository to hold XSL stylesheets for modifying XACML policies.

### xsl ###
**policy-updater.xsl**: this stylesheet will apply an identity transform that updates the first _<Rule>_ node.

### tests ###
This directory includes the following:
```
├── output
├── policy-updater-test.php
└── resources
    ├── xacml-policy-with-embargo.xml
    └── xacml-policy-without-embargo.xml
```

**policy-updater-test.php**: this is a simple PHP script that calls the apppropriate pieces to generate a sample document in `tests/output`.

**output**: a temporary holding place for test output. Files written here haven't been tracked by git.

**resources**: a holding place for sample XACML documents. One of the samples includes an embargo while the other doesn't.

#### usage ####
1. cd to `policy-modifier/tests`
2. run `$ php policy-updater-test.php`
3. review the results under `output/`
4. make changes
5. repeat {1..4}

