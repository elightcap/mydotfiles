#!/bin/sh

api="https://api.kraken.com/0/public/Ticker"

case $1 in
    "--BTC")
        url="$api"?pair=BTCUSD
        fullquote=$(curl -sf $url | jq -r ".result.XXBTZUSD.c[0]")
        quote=$"$fullquote"
        echo ": $quote"
        ;;
    "--ETH")
        url="$api"?pair=ETHUSD
        fullquote=$(curl -sf $url | jq -r ".result.XETHZUSD.c[0]")
        quote=$"$fullquote"
        echo "ETH: $quote"
        ;;
    "--TRX")
        url="$api"?pair=TRXUSD
        fullquote=$(curl -sf $url | jq -r ".result.TRXUSD.c[0]")
        quote=$"$fullquote"
        echo "TRX: $quote"
esac
