Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50607E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Dec 2024 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0s5xGH5TPm++c2M7Ljj5XtGunIxm7rwppaZXdhNJ9U=; b=zW0snqQZ0LxCcPouAYh5+P2smP
	pVt9YZcSr5k3jNFmAM5B4DnojGO2PGNWq40YejsRQfwtgwO/6uwqcAfP7kG+ZlXPaR3D6uxTwYLAd
	4xT9fBh4glTDUtwJ0lrCFPTNdK1l+qLYls3OtR88YHXnJsQlmfsRTXgysyQHJKA+Q5S7f/OZMI19B
	nEj6hPgSYHVMdKm4dr9TTkPtQsnMjS8bOx8+fAP7kk+ck6scJiJzrqBLZGaMxRdGMOxsQcOKk69TJ
	h1CD3P/NJo9KMUMBj0+/ZafaBliultwA6g7YnaK/5i48crYeCBL/kfAscidGVmp5OcmobjePn+wKi
	j36sNXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSiEv-00000007gLj-409y;
	Tue, 31 Dec 2024 19:49:17 +0000
Received: from mx.kolabnow.com ([212.103.80.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSiEs-00000007gKw-2cMm
	for linux-riscv@lists.infradead.org;
	Tue, 31 Dec 2024 19:49:16 +0000
Received: from localhost (unknown [127.0.0.1])
	by mx.kolabnow.com (Postfix) with ESMTP id 42A102092016;
	Tue, 31 Dec 2024 20:43:10 +0100 (CET)
Authentication-Results: ext-mx-out011.mykolab.com (amavis);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	content-type:content-type:mime-version:references:in-reply-to
	:organization:message-id:date:date:subject:subject:from:from
	:received:received:received; s=dkim20240523; t=1735674189; x=
	1737488590; bh=ZkIIdEBPSYk8EUJiZFMkQ8Ifr1xdo+A6U8PKCH+zhZg=; b=j
	9lmbz87xcFiHtGlbXBpPiQ6XfSdwRSz2GfbWzp20tqldFIa/4fdIU9c0vHd9pis0
	qGtwC6iDDh0u7Dhpqnsde+raBax5TsndlljRABoL0ubpdj/aAzxubyw7YkkxyDea
	xejlarIQJo70JMc44wDAKYNC/m9QbxeoXdv79Dgi9wyJrCdthy+diMYNSFuodz7F
	GjHpJnC7x9yuIwjsnI/smIjdUjhKoWttKbvBu79jiaQRwz4Xp+n0/FCIMt8el1PZ
	oK/5+xbt0hPh0yXdowKkZy+VE5UmGDlDGsBxfTJGT3kAODrkwS4sxaRSL5Y8ui+x
	7qZRMw6Ix5Rp/gjbQGf1A==
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 8eyg0nFtZA2K; Tue, 31 Dec 2024 20:43:09 +0100 (CET)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
	by mx.kolabnow.com (Postfix) with ESMTPS id 7A721209228B;
	Tue, 31 Dec 2024 20:43:05 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
	by int-mx009.mykolab.com (Postfix) with ESMTPS id 2E7552050983;
	Tue, 31 Dec 2024 20:43:05 +0100 (CET)
From: Jure Repinc <jlp@holodeck1.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troymitchell988@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Troy Mitchell <TroyMitchell988@gmail.com>,
 Troy Mitchell <troymitchell988@gmail.com>
Subject: Re: [PATCH 2/2] mfd: add new driver for P1 PMIC from SpacemiT
Date: Tue, 31 Dec 2024 20:42:56 +0100
Message-ID: <3082943.DJkKcVGEfx@excalibur>
Organization: Holodeck 1
In-Reply-To: <20241230-k1-p1-v1-2-aa4e02b9f993@gmail.com>
References: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
 <20241230-k1-p1-v1-2-aa4e02b9f993@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_114914_831988_5AE14945 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0043304830275836244=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0043304830275836244==
Content-Type: multipart/signed; boundary="nextPart19961146.fSG56mABFh";
 micalg="sha256"; protocol="application/pkcs7-signature"

--nextPart19961146.fSG56mABFh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On 30/12/2024 11:02, Troy Mitchell wrote:

> +static int spacemit_pmic_shutdown(struct sys_off_data *data)
> +{
> +	int ret;
> +	struct spacemit_pmic *pmic = data->cb_data;
> +
> +	ret = regmap_update_bits(pmic->regmap,
> +				 pmic->match_data->shutdown.reg,
> +				 pmic->match_data->shutdown.bit,
> +				 pmic->match_data->shutdown.bit);
> +	if (ret)
> +		dev_err(data->dev, "failed to reboot device!");

reboot -> shutdown

> +	if (match_data->shutdown.reg) {
> +		ret = devm_register_sys_off_handler(&client->dev,
> +						    
SYS_OFF_MODE_POWER_OFF_PREPARE,
> +						    SYS_OFF_PRIO_HIGH,
> +						    
&spacemit_pmic_shutdown,
> +						    pmic);
> +		if (ret)
> +			return dev_err_probe(&client->dev,
> +					     ret,
> +					     "failed to register restart 
handler");

restart -> shutdown



Have a great time,
Jure Repinc

-- 
         Jabber/XMPP: JLP@jabber.org
              Matrix: @jlp:matrix.org
Mastodon/ActivityPub: @JRepin@mstdn.io

--nextPart19961146.fSG56mABFh
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIP3gYJKoZIhvcNAQcCoIIPzzCCD8sCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg1qMIIGdTCCBN2gAwIBAgIMKMOYHQAAAABXHdDnMA0GCSqGSIb3DQEBCwUAMFwxCzAJBgNVBAYT
AlNJMRwwGgYDVQQKExNSZXB1Ymxpa2EgU2xvdmVuaWphMRcwFQYDVQRhEw5WQVRTSS0xNzY1OTk1
NzEWMBQGA1UEAxMNU0ktVFJVU1QgUm9vdDAeFw0xNjA1MjQxMTQ5NDFaFw0zNjA0MjMyMjAwMDBa
MFoxCzAJBgNVBAYTAlNJMRwwGgYDVQQKExNSZXB1Ymxpa2EgU2xvdmVuaWphMRcwFQYDVQRhEw5W
QVRTSS0xNzY1OTk1NzEUMBIGA1UEAxMLU0lHRU4tQ0EgRzIwggGiMA0GCSqGSIb3DQEBAQUAA4IB
jwAwggGKAoIBgQDRJl0dqc7nAg7Bi5WGSvyYlSuJq1N/3IqHKoA4JK2iB46GMBSc/akw2EMOigD1
9Uce9jNnKi3cZpDMQglTi3MlAX3pv8wajmMBMfQ2P5ID2F3VkcZVKWlPUAnWjzr+3SW3neGqMN+/
3jixXPuyB45BGhW1kjqZ5i8DIwppQuF3dUYAkyESdGCwtqYAWn1d1vATzdRs7fn5uKNCGqbMcYaL
7hhC5Z0j+hnfKuZKRtzSH9xM07+xXKIoF8gvYEfWB/lkcIdVEUBANSa8TefuhVoClTapLH/zjZBV
tHt4xBMbc+6go8KD/p7J+V9+uH3QCgzM3RdIIgl13TJUtMWAByzmkq74UFM0CsOTlVvpfUzqEUUY
Zi0PYtg6/fDzg1k2dtqOEeQonQVBtPot0bP643D0zDS/kk0+V4zeQjhhVawBAvwTsOXOx9MRzyt8
5mnlMMN4Vdqk2vJd2C+uADBknlFXv5CM2CmtAbOXH4OeS0qICTqqWw8uh6T+DVl4eommyY8CAwEA
AaOCAjcwggIzMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/BAQDAgEGMDoGA1UdIAQzMDEw
LwYEVR0gADAnMCUGCCsGAQUFBwIBFhlodHRwOi8vd3d3LmNhLmdvdi5zaS9jcHMvMGkGCCsGAQUF
BwEBBF0wWzA2BggrBgEFBQcwAoYqaHR0cDovL3d3dy5jYS5nb3Yuc2kvY3J0L3NpLXRydXN0LXJv
b3QuY3J0MCEGCCsGAQUFBzABhhVodHRwOi8vb2NzcC5jYS5nb3Yuc2kwEQYDVR0OBAoECEwlJ4yo
LXKeMIIBPAYDVR0fBIIBMzCCAS8wgbeggbSggbGGKmh0dHA6Ly93d3cuY2EuZ292LnNpL2NybC9z
aS10cnVzdC1yb290LmNybIaBgmxkYXA6Ly94NTAwLmdvdi5zaS9jbj1TSS1UUlVTVCUyMFJvb3Qs
b3JnYW5pemF0aW9uSWRlbnRpZmllcj1WQVRTSS0xNzY1OTk1NyxvPVJlcHVibGlrYSUyMFNsb3Zl
bmlqYSxjPVNJP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Qwc6BxoG+kbTBrMQswCQYDVQQGEwJT
STEcMBoGA1UEChMTUmVwdWJsaWthIFNsb3ZlbmlqYTEXMBUGA1UEYRMOVkFUU0ktMTc2NTk5NTcx
FjAUBgNVBAMTDVNJLVRSVVNUIFJvb3QxDTALBgNVBAMTBENSTDEwEwYDVR0jBAwwCoAITKPDaF4I
AmMwDQYJKoZIhvcNAQELBQADggGBADVgVyRt64166Ry1oNxqii/zIzrKEr24IPkI7vJmczGJ/lRm
6vIaZBdxeuebD1KICR8YQznI0xRiQZ/cz2oINJdVqCqXlOddRZvufWIcZXpmDPlig86+gueYtJIR
Lq+gk4Fjz8tdPo6GhYN7b9wQ15FYDIjgPzEDnq/YQJ+ZJs9aPotskKHvKyaDg8NibS7qdiLXaToo
WFCaSV4h+JPtStbw+R7MaLnHvyp8sqhl4vgnPNv3TLwPmWr1jU+EP1gx5axEkKpJamc1zMgTWw/F
S4VzrxSKsDZM/7E6cCZHCWziPWs8C3uLqye2tBBBCgjmyNY5XC8rj85Rbpl5K1SIlg9jetEfUNoa
WXP0S/GgAtgB5EQ9IXwSjf9D/DxqvOme5bhK7o2l3r/1/OvPmoYttgQhBmpIYQfzacB94yTHDCJZ
rWqFc+DW4BOg/dyLLsykcNEnYWClibUWiU/ITlW/AcKkuovMQVMAHYu4u5LveEWEymkbaTxRmHx3
/swn3eZi2jCCBu0wggVVoAMCAQICDBSL7r4AAAAAVyU92jANBgkqhkiG9w0BAQsFADBaMQswCQYD
VQQGEwJTSTEcMBoGA1UEChMTUmVwdWJsaWthIFNsb3ZlbmlqYTEXMBUGA1UEYRMOVkFUU0ktMTc2
NTk5NTcxFDASBgNVBAMTC1NJR0VOLUNBIEcyMB4XDTIwMTAwNjE2MzMwMFoXDTI1MTAwNjE3MDMw
MFowfzELMAkGA1UEBhMCU0kxEjAQBgNVBAgTCVNsb3ZlbmlqYTEUMBIGA1UECxMLaW5kaXZpZHVh
bHMxRjALBgNVBCoTBEp1cmUwDQYDVQQEEwZSZXBpbmMwEgYDVQQDEwtKdXJlIFJlcGluYzAUBgNV
BAUTDTI0NjY0NzgzMTIwMzkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCu1oYnY4M9
ZB4zQrL+Ynjuc1zIYxmHZNwqgv38oz5QzIdJIyg0XRgaOrFcevE30AZMrSwYsVD689pEnQgqrkbA
JqExEBi3TtmsH4N5czwtIDiP2MYp9lkrNV/+/ND8hUUVz1i4LkFt8k8PHujuPrLgY/zmsS6Sz07I
G05lf/gxlkPMKn8oOKwiCAny4qUYEEZeQG6B2gjkayXn11Uz4DVEIpUd76BaQAYgmC1kicmJXWYm
CqKjQDMlXekvNhpFgmse3jnAlunPfoBtWM3OjSra7EJGSrWIkL1aHcXc8wMhwT2n9IsEuTitZOKw
S17bOKEqWzQ/fXGgTyt8BSSMB6H3AgMBAAGjggMMMIIDCDAOBgNVHQ8BAf8EBAMCBeAwTAYDVR0g
BEUwQzA2BgsrBgEEAa9ZAgIDBTAnMCUGCCsGAQUFBwIBFhlodHRwOi8vd3d3LmNhLmdvdi5zaS9j
cHMvMAkGBwQAi+xAAQAwgaUGCCsGAQUFBwEDBIGYMIGVMAgGBgQAjkYBATB0BgYEAI5GAQUwajAz
Fi1odHRwczovL3d3dy5jYS5nb3Yuc2kvY3BzL3NpZ2VuY2EyX3Bkc19lbi5wZGYTAmVuMDMWLWh0
dHBzOi8vd3d3LmNhLmdvdi5zaS9jcHMvc2lnZW5jYTJfcGRzX3NsLnBkZhMCc2wwEwYGBACORgEG
MAkGBwQAjkYBBgEwcQYIKwYBBQUHAQEEZTBjMDwGCCsGAQUFBzAChjBodHRwOi8vd3d3LnNpZ2Vu
LWNhLnNpL2NydC9zaWdlbi1jYS1nMi1jZXJ0cy5wN2MwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3Nw
LnNpZ2VuLWNhLnNpMBwGA1UdEQQVMBOBEWpscEBob2xvZGVjazEuY29tMIIBOgYDVR0fBIIBMTCC
AS0wgbWggbKgga+GKmh0dHA6Ly93d3cuc2lnZW4tY2Euc2kvY3JsL3NpZ2VuLWNhLWcyLmNybIaB
gGxkYXA6Ly94NTAwLmdvdi5zaS9jbj1TSUdFTi1DQSUyMEcyLG9yZ2FuaXphdGlvbklkZW50aWZp
ZXI9VkFUU0ktMTc2NTk5NTcsbz1SZXB1Ymxpa2ElMjBTbG92ZW5pamEsYz1TST9jZXJ0aWZpY2F0
ZVJldm9jYXRpb25MaXN0MHOgcaBvpG0wazELMAkGA1UEBhMCU0kxHDAaBgNVBAoTE1JlcHVibGlr
YSBTbG92ZW5pamExFzAVBgNVBGETDlZBVFNJLTE3NjU5OTU3MRQwEgYDVQQDEwtTSUdFTi1DQSBH
MjEPMA0GA1UEAxMGQ1JMMzM1MBMGA1UdIwQMMAqACEwlJ4yoLXKeMBEGA1UdDgQKBAhBsPrpktbp
jTAJBgNVHRMEAjAAMA0GCSqGSIb3DQEBCwUAA4IBgQB7FJBhacs9mzlIcERXuoNW+MjDa9dEflGl
cfDWQsZSmuuu8k11KGfoQtqB6a/CT7mYf54abpcWMjQ3H9y0gwft/ZX5sHQsZV/qGyh+2KjE+gwA
XXZ2R5lIAYDkZQBBU88dE6XzR3ibgpQ6O7wmGBN6dmIwLK1LMpOtEwHQqw/WWB6gRS+mpPnZhk9Z
6i4WVRHf5Gs/Xl3vUtV2V5VziGTc4evMh49+VG4oNG9EyF110JSAdAIbZ/F+Jz49UlzGrau6dh3H
pS/tBk0m+nTdHurklnCobrPsE9viAdUVjIQ5vfN5SXTxBSDH5Ag/8OSEfPoJBykgGYkNST52HvXT
M6WZqx9JSwA/tQrJpFrpDORgwyVRRgxgR7z7Dx38TViV7HeuqLVEJTtRIk8c6/Z2CYOlmSsUNNLw
q72j2Wv2zXSzWS2aD7cMR5v8jPzatYf4TYVOdxygrGOEBHYoElWk7ixXHyheYEqix5CFBYA7PuQm
CdDquv2oAC7tTM5m/uoS1N4xggI4MIICNAIBATBqMFoxCzAJBgNVBAYTAlNJMRwwGgYDVQQKExNS
ZXB1Ymxpa2EgU2xvdmVuaWphMRcwFQYDVQRhEw5WQVRTSS0xNzY1OTk1NzEUMBIGA1UEAxMLU0lH
RU4tQ0EgRzICDBSL7r4AAAAAVyU92jANBglghkgBZQMEAgEFAKCBoDAYBgkqhkiG9w0BCQMxCwYJ
KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNDEyMzExOTQyNTdaMC8GCSqGSIb3DQEJBDEiBCCs
EP+AjVg53weKY9wqalS/J1/9+jC7B+yG5Yk6DLj3LjA1BgkqhkiG9w0BCQ8xKDAmMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDQYJKoZIhvcNAQEBBQAEggEAPtwKbsCW/4gW
5wPdUizwo11O5dC3XesxfrUl3xHYO4tzz6NFfCSUUvF21QB1Ko8zEG4w85aGu3NQyOlXDDpJccLZ
ot5C4yFnV15x5BwPeOp6KtNnH7O1T+BpX+Dcwr5nU2CyjFPLQFZlv2hDpzmTcIEUpN5dWFB5Itcp
48N8yb+0shS0lVAiTXQ5th5St7nQqhAQFTlz6o40zF0fRtzJskBHFyI/EiTuyDq4t8L4mxCdDKJB
C8btGxCwCDTak9b2NJCTu+vHmuLDZwBHNyQC4roJoiFYFx+qUm6jbIBJUoc4ofsU4CgTUTMA4CVg
Vcfqglr06ijnsG3WWXYFb5GKAg==


--nextPart19961146.fSG56mABFh--





--===============0043304830275836244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0043304830275836244==--




