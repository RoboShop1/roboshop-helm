if [[ -z "${VAULT_TOKEN}" ]];
then
  echo "VAULT_TOKEN is missing" && exit 1
fi

if [[ -z "${VAULT_ADDR}" ]];
then
  echo "VAULT_ADDR is missing" && exit 1
fi

if [[ -z "${secret}" ]];
then
  echo "secret is missing" && exit 1
fi


if [[ -z "${mount}" ]];
then
  echo "mount is missing" && exit 1
fi

export $VAULT_ADDR
vault login $VAULT_TOKEN > /dev/null

if [[ $? -ne '0' ]];
then
  echo "vault login is failure" && exit 1
fi

vault kv get  ${mount}/${secret}   | sed -n  '/Data/, $ p' | sed '1,3 d' | awk '{print "export " $1"="$2}' > /data/${secret}-secrets

#