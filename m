Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D807EC3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 03:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EWdB0NwRv/f7NapSfJBOyv6TGFBj6i3pI72//X6gP8=; b=4hf42fjZxeUELrUmZvwVT2xWTu
	9PYzFv7WX3Nh68qPElBPG0QJPS8gpVlIWffcTezI8i7xtQLGEwSb8zK/awvtzmeEvpnhrP0zAlPiH
	+nQ1IPQ6eElXyIgFIhAmNgNUfmyygFw9e/N1d2R6nufCDYCQS05rGUP6NpG9lKibiJCTIvTtHk4Gz
	lrokRdW/As9glj3xI8dN7Zj83cBZc6djkmZ4N5TlVl5NokAeA1PY9bx93pXdSBeNF+aHLgqdaFmRB
	DZ+QKo3gXlaPgj/YpC/CKVjJXbY/gahG4KCtU9S7SSYcaHXB77TJkvs48ymehroLO9St2o3EhFkOb
	dCsG7T4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq2kw-000000031Dp-1RyJ;
	Mon, 16 Sep 2024 03:50:30 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq2ks-000000031AZ-1CeQ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 03:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726458610;
	bh=/HSGhOJ6oxm31APw53/JajkR0x+QvXiRffyiK/sw6WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Amxl92w+dALidYyG9BrQkwXFluMNelMJ7uCpLZsE52lwpaVvTSbR+QALF4dWcrxzk
	 NUwqhJ4b3hOHUCNNjtlQAuUobdhE/NniKZW1XU9rpYt7KtxTfolBjDiRAlZTkUraAf
	 KlIhPTYYAf5HcVCcq/HG0cae+lHP4AX4AzkPM8DU=
X-QQ-mid: bizesmtpip3t1726458601tp21eho
X-QQ-Originating-IP: HtYYiAInNuBdcxwnvE2xIpXJ67YUULyhw7Le9dNePGI=
Received: from [IPV6:240e:36c:df7:ef00:7c16:95 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Sep 2024 11:49:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18235409677583047621
Message-ID: <FF9FEEE9165DCFD8+8587e98d-b14d-4281-b664-0c7a4eb361ae@uniontech.com>
Date: Mon, 16 Sep 2024 11:49:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 v2 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, sashal@kernel.org, william.qiu@starfivetech.com,
 emil.renner.berthing@canonical.com, conor.dooley@microchip.com,
 xingyu.wu@starfivetech.com, walker.chen@starfivetech.com, robh@kernel.org,
 hal.feng@starfivetech.com, kernel@esmil.dk, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, richardcochran@gmail.com,
 netdev@vger.kernel.org
References: <3A31C289BC240955+20240912025539.1928223-1-wangyuli@uniontech.com>
 <2024091350-lapdog-tarot-0130@gregkh>
From: WangYuli <wangyuli@uniontech.com>
Content-Language: en-US
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <2024091350-lapdog-tarot-0130@gregkh>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_205026_701800_B1842D4D 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2787340905325048438=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2787340905325048438==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SCJ1yK44mHojHxKX9ci50aO4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SCJ1yK44mHojHxKX9ci50aO4
Content-Type: multipart/mixed; boundary="------------0adrtLrd8lldal6V3zvoqDfe";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, sashal@kernel.org, william.qiu@starfivetech.com,
 emil.renner.berthing@canonical.com, conor.dooley@microchip.com,
 xingyu.wu@starfivetech.com, walker.chen@starfivetech.com, robh@kernel.org,
 hal.feng@starfivetech.com, kernel@esmil.dk, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, richardcochran@gmail.com,
 netdev@vger.kernel.org
Message-ID: <8587e98d-b14d-4281-b664-0c7a4eb361ae@uniontech.com>
Subject: Re: [PATCH 6.6 v2 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
References: <3A31C289BC240955+20240912025539.1928223-1-wangyuli@uniontech.com>
 <2024091350-lapdog-tarot-0130@gregkh>
In-Reply-To: <2024091350-lapdog-tarot-0130@gregkh>

--------------0adrtLrd8lldal6V3zvoqDfe
Content-Type: multipart/mixed; boundary="------------UfvJUvQUrkWwX60bhbwUuCaX"

--------------UfvJUvQUrkWwX60bhbwUuCaX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMDI0LzkvMTMgMjA6NDIsIEdyZWcgS0ggd3JvdGU6DQo+IFBsZWFzZSByZXdvcmsg
dGhpcyBzZXJpZXMgYW5kIHNlbmQgb25seSB3aGF0IGlzIG5lZWRlZCBoZXJlLg0KDQpPSywg
anVzdCBvbmUuDQoNCkxpbms6aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzI0NzM0NTU3
OTY1OUQ4RjcrMjAyNDA5MTYwMzQ2MDMuNTkxMjAtMS13YW5neXVsaUB1bmlvbnRlY2guY29t
LyANCg0KDQpUaGFua3MsDQoNCi0tIA0KV2FuZ1l1bGkNCg==
--------------UfvJUvQUrkWwX60bhbwUuCaX
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------UfvJUvQUrkWwX60bhbwUuCaX--

--------------0adrtLrd8lldal6V3zvoqDfe--

--------------SCJ1yK44mHojHxKX9ci50aO4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZueq5QUDAAAAAAAKCRDF2h8wRvQL7i69
AP4is2ibyrxhOUw7bDLNlaq45MONDMAKOkLJH9cGs9/sYgEA7AxRSHTXD02+jWCeihfeWB3EF0HG
2Z+NMlOXySpndgY=
=AJm7
-----END PGP SIGNATURE-----

--------------SCJ1yK44mHojHxKX9ci50aO4--


--===============2787340905325048438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2787340905325048438==--

