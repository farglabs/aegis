#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                  <aegis.z2h.dev>
#     .\_/.
#

cd ./install/k8s/spire/spire || exit
sed -i "s/aegis.z2h.dev/example.com/" ./spire-agent.yaml
sed -i "s/aegis.z2h.dev/example.com/" ./spire-server.yaml
sed -i "s/aegis.z2h.dev/example.com/" ./spire-controller-manager-config.yaml
cd ../..

cd ./demo-workload/using-sdk || exit
sed -i "s/aegis.z2h.dev/example.com/" ./Identity.yaml
sed -i "s/aegis.z2h.dev/example.com/" ./Deployment.yaml
cd .. || exit

cd ./using-sidecar || exit
sed -i "s/aegis.z2h.dev/example.com/" ./Identity.yaml
sed -i "s/aegis.z2h.dev/example.com/" ./Deployment.yaml
cd ../..

cd ./safe || exit
sed -i "s/aegis.z2h.dev/example.com/" ./Identity.yaml
sed -i "s/aegis.z2h.dev/example.com/" ./Deployment.yaml
cd .. || exit

cd ./sentinel || exit
sed -i "s/aegis.z2h.dev/example.com/" ./Identity.yaml
sed -i "s/aegis.z2h.dev/example.com/" ./Deployment.yaml
cd .. || exit

echo "Everything is awesome!"
