Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6678FEEB595
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx6Rmv94IigvD/jC0aeOFcK6GLwDNM+t4p3cIzAi0CI=; b=0l5PELmD1wmunLDjcFvkON+p0P
	cIg/1hOu4TC8601gm7zDSmECnHhBYOARXY/bW0Q4D93TRwdROob3DBGPZuppyyAIU8LJxbMb++DUy
	3ZcOi59YDcxg8rc3lk9+qbP/h3YnCveUSdhCPx3MjdJWRRHZMudNQL+8ZS8xBnMgLGr5fqKjhclqZ
	FN5fpC3yuI1YwlTeGMann/49miIu+cwyhx1cHhkaO0gDQW8NLEPUrkQk6c8o51FJ020vs9F7Ku0Pa
	hA2We/SJZ6irNKkCPhhXFFj0Ozw04u/y6ryLFjPQH95N/DJBA1ho+2eZIp31Ezx03+1Wllzws9Zf1
	mXnkQlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sohrW-0000000CpVU-0XSI;
	Thu, 12 Sep 2024 11:19:46 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sohrO-0000000CpNi-0Rdw
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 11:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726139956;
	bh=gwqnDSwyrM+DKHM6o4MF4S9SNqM7p4CU54lRbptdR5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=phqh0Xex62KVO/6c+nAx1Fo3lgWINs5nnTiL2ys70r6yXdJi0jbZsRFkjje0ljvU3
	 lszUTJ5WRD8k6i028O8H1S/KwikduJZNCdBsXr6HkZV1dPBZkwFNPegFCZOjLw5NzF
	 w5AZkSXe2RhVCdvmsMaNcQRISYXH2hamntuKf3KY=
X-QQ-mid: bizesmtpsz3t1726139948th8758c
X-QQ-Originating-IP: BPb4tK2MNgm+iF4mzm/8gWP71C5W04ufrAnra1Vcbcw=
Received: from [10.20.53.22] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Sep 2024 19:19:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11510979904803689971
Message-ID: <57B002D3A0A289D5+d784ecd6-ed84-4aa1-ae58-0c67d2de1989@uniontech.com>
Date: Thu, 12 Sep 2024 19:19:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 v2 3/4] riscv: dts: starfive: Add the nodes and pins
 of I2Srx/I2Stx0/I2Stx1
To: Conor Dooley <conor.dooley@microchip.com>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "sashal@kernel.org" <sashal@kernel.org>,
 William Qiu <william.qiu@starfivetech.com>,
 "emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Walker Chen <walker.chen@starfivetech.com>, "robh@kernel.org"
 <robh@kernel.org>, "kernel@esmil.dk" <kernel@esmil.dk>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20240912025539.1928223-1-wangyuli@uniontech.com>
 <D2DCF9E2F70EDC93+20240912025539.1928223-3-wangyuli@uniontech.com>
 <ZQ2PR01MB13070BA638E892A5516DEA8CE6642@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20240912-lividly-remover-6d71b985a803@wendy>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <20240912-lividly-remover-6d71b985a803@wendy>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_041938_994825_D0D674A7 
X-CRM114-Status: GOOD (  15.90  )
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
Content-Type: multipart/mixed; boundary="===============8069709326311009406=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8069709326311009406==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------daPFu3hERqXZ2EKE4E3HHmX1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------daPFu3hERqXZ2EKE4E3HHmX1
Content-Type: multipart/mixed; boundary="------------LswK17Aqy0IZfBExW0A8pZyM";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Conor Dooley <conor.dooley@microchip.com>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "sashal@kernel.org" <sashal@kernel.org>,
 William Qiu <william.qiu@starfivetech.com>,
 "emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Walker Chen <walker.chen@starfivetech.com>, "robh@kernel.org"
 <robh@kernel.org>, "kernel@esmil.dk" <kernel@esmil.dk>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Message-ID: <d784ecd6-ed84-4aa1-ae58-0c67d2de1989@uniontech.com>
Subject: Re: [PATCH 6.6 v2 3/4] riscv: dts: starfive: Add the nodes and pins
 of I2Srx/I2Stx0/I2Stx1
References: <20240912025539.1928223-1-wangyuli@uniontech.com>
 <D2DCF9E2F70EDC93+20240912025539.1928223-3-wangyuli@uniontech.com>
 <ZQ2PR01MB13070BA638E892A5516DEA8CE6642@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20240912-lividly-remover-6d71b985a803@wendy>
In-Reply-To: <20240912-lividly-remover-6d71b985a803@wendy>

--------------LswK17Aqy0IZfBExW0A8pZyM
Content-Type: multipart/mixed; boundary="------------Gajo2sRrm0dpMDj0o6sCnfgL"

--------------Gajo2sRrm0dpMDj0o6sCnfgL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAyNC85LzEyIDE4OjQwLCBDb25vciBEb29sZXkgd3JvdGU6DQoNCj4gT24gVGh1LCBT
ZXAgMTIsIDIwMjQgYXQgMTA6MjM6MDlBTSArMDAwMCwgSGFsIEZlbmcgd3JvdGU6DQo+Pj4g
T24gMTIuMDkuMjQgMTA6NTUsIFdhbmdZdWxpIHdyb3RlOg0KPj4+ICsJaTJzcnhfcGluczog
aTJzcngtMCB7DQo+Pj4gKwkJY2xrLXNkLXBpbnMgew0KPj4+ICsJCQlwaW5tdXggPSA8R1BJ
T01VWCgzOCwgR1BPVVRfTE9XLA0KPj4+ICsJCQkJCSAgICAgIEdQT0VOX0RJU0FCTEUsDQo+
Pj4gKwkJCQkJICAgICAgR1BJX1NZU19JMlNSWF9CQ0xLKT4sDQo+Pj4gKwkJCQkgPEdQSU9N
VVgoNjMsIEdQT1VUX0xPVywNCj4+PiArCQkJCQkgICAgICBHUE9FTl9ESVNBQkxFLA0KPj4+
ICsJCQkJCSAgICAgIEdQSV9TWVNfSTJTUlhfTFJDSyk+LA0KPj4+ICsJCQkJIDxHUElPTVVY
KDM4LCBHUE9VVF9MT1csDQo+Pj4gKwkJCQkJICAgICAgR1BPRU5fRElTQUJMRSwNCj4+PiAr
CQkJCQkgICAgICBHUElfU1lTX0kyU1RYMV9CQ0xLKT4sDQo+Pj4gKwkJCQkgPEdQSU9NVVgo
NjMsIEdQT1VUX0xPVywNCj4+PiArCQkJCQkgICAgICBHUE9FTl9ESVNBQkxFLA0KPj4+ICsJ
CQkJCSAgICAgIEdQSV9TWVNfSTJTVFgxX0xSQ0spPiwNCj4+PiArCQkJCSA8R1BJT01VWCg2
MSwgR1BPVVRfTE9XLA0KPj4+ICsJCQkJCSAgICAgIEdQT0VOX0RJU0FCTEUsDQo+Pj4gKwkJ
CQkJICAgICAgR1BJX1NZU19JMlNSWF9TRElOMCk+Ow0KPj4+ICsJCQlpbnB1dC1lbmFibGU7
DQo+Pj4gKwkJfTsNCj4+PiArCX07DQo+Pj4gKw0KPj4+ICsJaTJzdHgxX3BpbnM6IGkyc3R4
MS0wIHsNCj4+PiArCQlzZC1waW5zIHsNCj4+PiArCQkJcGlubXV4ID0gPEdQSU9NVVgoNDQs
IEdQT1VUX1NZU19JMlNUWDFfU0RPMCwNCj4+PiArCQkJCQkgICAgICBHUE9FTl9FTkFCTEUs
DQo+Pj4gKwkJCQkJICAgICAgR1BJX05PTkUpPjsNCj4+PiArCQkJYmlhcy1kaXNhYmxlOw0K
Pj4+ICsJCQlpbnB1dC1kaXNhYmxlOw0KPj4+ICsJCX07DQo+Pj4gKwl9Ow0KPj4+ICsNCj4+
PiArCW1jbGtfZXh0X3BpbnM6IG1jbGstZXh0LTAgew0KPj4+ICsJCW1jbGstZXh0LXBpbnMg
ew0KPj4+ICsJCQlwaW5tdXggPSA8R1BJT01VWCg0LCBHUE9VVF9MT1csDQo+Pj4gKwkJCQkJ
ICAgICBHUE9FTl9ESVNBQkxFLA0KPj4+ICsJCQkJCSAgICAgR1BJX1NZU19NQ0xLX0VYVCk+
Ow0KPj4+ICsJCQlpbnB1dC1lbmFibGU7DQo+Pj4gKwkJfTsNCj4+PiArCX07DQo+Pj4gKw0K
Pj4+ICAgCW1tYzBfcGluczogbW1jMC0wIHsNCj4+PiAgIAkJIHJzdC1waW5zIHsNCj4+PiAg
IAkJCXBpbm11eCA9IDxHUElPTVVYKDYyLCBHUE9VVF9TWVNfU0RJTzBfUlNULA0KPj4gVGhl
IGFib3ZlIGNoYW5nZXMgaGFkIGJlZW4gcmV2ZXJ0ZWQgaW4gY29tbWl0IGUwNTAzZDQ3ZTkz
ZCBpbiB0aGUgbWFpbmxpbmUuDQo+PiBJcyBpdCBhcHByb3ByaWF0ZSB0byBtZXJnZSB0aGlz
IHBhdGNoIGludG8gdGhlIHN0YWJsZSBicmFuY2g/DQo+Pg0KPj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjQwNDE1MTI1MDMzLjg2OTA5LTEtaGFubmFoLnBldWNrbWFubkBj
YW5vbmljYWwuY29tLw0KPiBIYWgsIEkgaGFkIGdvbmUgbG9va2luZyB0aGlzIG1vcm5pbmcg
YmVjYXVzZSBJIGhhZCBhIGh1bmNoIHRoYXQgdGhlcmUNCj4gd2FzIHNvbWUgbWlzc2luZyBm
aXggdGhpcyBzZXJpZXMgZGlkbid0LCBidXQgY291bGRuJ3QgcmVtZW1iZXIgd2hhdCBpdA0K
PiB3YXMuIEkgY29tcGxldGVseSBmb3Jnb3QgdGhhdCBzb21lIG9mIHRoaXMgd2FzIG5vbi1w
cmVzZW50IG92ZXJsYXkNCj4gcmVsYXRlZCBzdHVmZiB0aGF0IGhhZCBoYWQgdG8gYmUgcmV2
ZXJ0ZWQuDQo+DQo+IFNvIHllcywgaWYgaXQgaGFkIHRvIGJlIHJldmVydGVkIGluIG1haW5s
aW5lLCBpdCBzaG91bGRuJ3QgZ2V0DQo+IGJhY2twb3J0ZWQuIFRoYW5rcyBmb3Igc3BvdHRp
bmcgdGhhdCBIYWwuDQo+DQo+IENoZWVycywNCj4gQ29ub3IuDQpHb3QgaXQuIFRoYW5rcyBm
b3IgcG9pbnRpbmcgdGhhdCBvdXQsIGFuZCBzb3JyeSBmb3IgYm90aGVyaW5nIHlvdSBhbGwu
Li4NCg0KQW5kIHRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZS4uLg0KDQpUaGFua3MsDQot
LSANCldhbmdZdWxpDQo=
--------------Gajo2sRrm0dpMDj0o6sCnfgL
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

--------------Gajo2sRrm0dpMDj0o6sCnfgL--

--------------LswK17Aqy0IZfBExW0A8pZyM--

--------------daPFu3hERqXZ2EKE4E3HHmX1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZuLOKQUDAAAAAAAKCRDF2h8wRvQL7i+W
AQD8Sh07zwb01SPyNIAxZ6LRwInAHLsIkz8+rbyiuadVGwEAl41V/nlXgYAV//boDfuIG9bHkUtM
L/wVkPL/e3BgEAg=
=26jf
-----END PGP SIGNATURE-----

--------------daPFu3hERqXZ2EKE4E3HHmX1--


--===============8069709326311009406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8069709326311009406==--

