#!/usr/bin/env bash

#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                  <aegis.z2h.dev>
#     .\_/.
#

http PUT http://aegis-safe.aegis-system.svc.cluster.local:8017/v1/workload \
  token=NotaryGeneratedSecureWorkloadToken \
  workloadId=aegis-workload-demo \
  workloadSecret=NotaryGeneratedRandomWorkloadSecret