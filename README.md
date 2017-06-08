# chef-aps-inspec-core Inspec Profile

Inspec profile for [chef-aps-core](https://github.com/Alfresco/chef-aps-core) cookbook

To use it in your Kitchen suite add:

```
verifier:
  inspec_tests:
    - name: chef-aps-inspec-core
      git: https://github.com/Alfresco/chef-aps-inspec-core
```

This Profile depends on [chef-alfresco-inspec-utils](https://github.com/Alfresco/chef-alfresco-inspec-utils) to import libraries and matchers
