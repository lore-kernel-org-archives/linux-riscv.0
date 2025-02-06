Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8146AC02192
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 03:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmujWbHhjFuSw3FMcHlG2FUn6rvYuvCQWglJnNar2xM=; b=XESAmNQBvn6kmr
	1BQ4ID1ck99wvSp2V5Ib/5XBmiuHuSiZ6Z+2XRNqZpfJ8cw2WdRnT7TqPrLgolCqmiDIqzgqkKGKu
	Ayz3PgriHGdxqXLEy2gaQlREdrD66FBFfhPFSHXVAtlYnOCCDt4Lw+yZnIxrK+n+0cdAjoGqGnQY/
	KfhkNzKJwiPcU+Fls0Evy4kEk8+ASm6K6hh4xyYdA58PxU+4qvhMj5eRO1ZhZJG4rOaPdGOTDeyKV
	Fxday5g2I7dIE1DjpmZEnEdnN2YZ3M5gcWvGd+Jxp3AYLNMf7d7z+/qy2UaK84SNDMrG/nl5ILR2C
	iigTnJrDbK5JAt/u2IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfs8c-000000055va-47Qn;
	Thu, 06 Feb 2025 03:01:10 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfs8Y-000000055uf-2TMh
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 03:01:09 +0000
X-QQ-mid: bizesmtpsz11t1738810770txlrd4
X-QQ-Originating-IP: YWIJS65zdp2o+m9dZjLObOYuHeSSwMrYNUq5iTbCLsg=
Received: from [192.168.125.117] ( [183.27.97.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Feb 2025 10:59:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 246281262797526275
Message-ID: <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
Date: Thu, 6 Feb 2025 10:59:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, E Shattow <e@freeshell.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: OKhYnE1LzMsBJeEYIvJ5jK4/7u4FYb9vyDcookNJUEWBuWx9YcTYuNRt
	y5sldLp2dF10rCKReK34jarBAEbqIMROzxMxwXl9nQOS7ZDXb9M6wZIDSWczOUPdqocVV4N
	SZjKFTYLUPpESPwzxBeaxsbfN475KnhuxGER9SgCTWUt8bVzbgeyxf2BLwPaW94YucQ/6kA
	P64uttAbcFtlPkytwbXem60WCKaFicIkgiUW0f3OcS8VZXKThwszxKIvxFbjSprwOXd2yCu
	phHh5ey3Wi54Au/jQqkMFgasCfPDj7Q5KraMur1psgfc9zq3PzF8arVp44vIGYzcMmCT8VS
	04vyTKG5suhK5iDk0zTUl925+VdIsFPki01bLY+7etQMvo95IecemQGBmgbafdfYHEu642Z
	vIN/bgPOedDEAzQ3QJjJCeuR3MSSzrf6XCIQcBZnThmlxO9BsQQTQdTkEBZU7v7mhSUgdzZ
	YRHlPFaLw2FmoW1BTuNLtxA94itvMHkwvMqMvTU2A+SLEFneEF0iRlIKtMQPNjQWhC1YXE2
	bpNrOTyVBEKsJOr4/BXWxupBgxYPIlL46QE1/nodGndpk4h6wJQ56F1B3PTXnR+cW3jR7X9
	WvFTVTzOliTb7tiNauI1OCPXb8p/K17F+KAOn+JZ3fCdi0HNK10nlrA8B6y59XA7osDDCYs
	6seSZ8f1+QIFK5cR1I5au0XHkfC0djIsFp+B0mK0jWIFu+XYrOoxUwbXhoZZwfvosxArcwb
	d9sbk0iIjwvoaky/JnG+VXjiZmhAVCzp79iMZ9Ybre6ES0Uj8VhftJIOdlLvL8SbBX8QThD
	h3fnulhIPs4PofpHhsUy5v958dsYSZPwfYEGeNfEwODHQSzvsWTeFhIYZfncsyJ3hzpfVJ6
	L26sjP3sj6mdP9d9Hp2ubZZpYEFEL+cF+gX5f3UtH6SVKRIZqGRbb4xhobABuxieCDsG9ws
	NWFg5R+jzkwikkg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_190107_175255_93E7AA96 
X-CRM114-Status: UNSURE (   8.34  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi81LzIwMjUgNjowMSBQTSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiBPbiAyLzUv
MjUgMDg6NTcsIEhhbCBGZW5nIHdyb3RlOgo+PiBPbiAyLzMvMjAyNSA5OjM3IEFNLCBFIFNoYXR0
b3cgd3JvdGU6Cj4+PiBBZGQgYm9vdHBoLXByZS1yYW0gaGludGluZyB0byBqaDcxMTAtY29tbW9u
LmR0c2k6Cj4+PiDCoMKgIC0gaTJjNV9waW5zIGFuZCBpMmMtcGlucyBzdWJub2RlIGZvciBjb25u
ZWN0aW9uIHRvIGVlcHJvbQo+Pj4gwqDCoCAtIGVlcHJvbSBub2RlCj4+PiDCoMKgIC0gcXNwaSBm
bGFzaCBjb25maWd1cmF0aW9uIHN1Ym5vZGUKPj4+IMKgwqAgLSBtZW1vcnkgbm9kZQo+Pj4gwqDC
oCAtIHVhcnQwIGZvciBzZXJpYWwgY29uc29sZQo+Pj4KPj4+IMKgwqAgV2l0aCB0aGlzIHRoZSBV
LUJvb3QgU1BMIHNlY29uZGFyeSBwcm9ncmFtIGxvYWRlciBtYXkgZHJvcCBzdWNoCj4+PiDCoMKg
IG92ZXJyaWRlcyB3aGVuIHVzaW5nIGR0LXJlYmFzaW5nIHdpdGggSkg3MTEwIE9GX1VQU1RSRUFN
IGJvYXJkIHRhcmdldHMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRSBTaGF0dG93IDxlQGZyZWVz
aGVsbC5kZT4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcx
MTAtY29tbW9uLmR0c2kgfCA2ICsrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZl
L2poNzExMC1jb21tb24uZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEw
LWNvbW1vbi5kdHNpCj4+PiBpbmRleCAzMGM1ZjM0ODdjOGIuLmM5ZTdhZTU5ZWU3YyAxMDA2NDQK
Pj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNp
Cj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21tb24uZHRz
aQo+Pj4gQEAgLTI4LDYgKzI4LDcgQEAgY2hvc2VuIHsKPj4+IMKgwqDCoMKgwqAgbWVtb3J5QDQw
MDAwMDAwIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg0MDAwMDAwMCAweDEgMHgwPjsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+IMKgwqDCoMKgwqAgfTsKPj4+IMKg
IMKgwqDCoMKgwqAgZ3Bpby1yZXN0YXJ0IHsKPj4+IEBAIC0yNDcsNiArMjQ4LDcgQEAgZW1tY192
ZGQ6IGFsZG80IHsKPj4+IMKgwqDCoMKgwqAgfTsKPj4+IMKgIMKgwqDCoMKgwqAgZWVwcm9tQDUw
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBjb21wYXRpYmxlID0gImF0bWVsLDI0YzA0IjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZWcgPSA8MHg1MD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZXNpemUgPSA8MTY+Owo+Pj4g
QEAgLTMyMyw2ICszMjUsNyBAQCAmcXNwaSB7Cj4+PiDCoMKgwqDCoMKgIG5vcl9mbGFzaDogZmxh
c2hAMCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9y
IjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47Cj4+PiArwqDCoMKgwqDCoMKgwqAg
Ym9vdHBoLXByZS1yYW07Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2RucyxyZWFkLWRlbGF5ID0g
PDI+Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDEwMDAwMDAw
MD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2Rucyx0c2hzbC1ucyA9IDwxPjsKPj4+IEBAIC00
MDUsNiArNDA4LDcgQEAgR1BPRU5fU1lTX0kyQzJfREFUQSwKPj4+IMKgwqDCoMKgwqAgfTsKPj4+
IMKgIMKgwqDCoMKgwqAgaTJjNV9waW5zOiBpMmM1LTAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJv
b3RwaC1wcmUtcmFtOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGkyYy1waW5zIHsKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbm11eCA9IDxHUElPTVVYKDE5LCBHUE9VVF9MT1csCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
R1BPRU5fU1lTX0kyQzVfQ0xLLAo+Pj4gQEAgLTQxMyw2ICs0MTcsNyBAQCBHUElfU1lTX0kyQzVf
Q0xLKT4sCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgR1BPRU5fU1lTX0kyQzVfREFUQSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHUElfU1lTX0kyQzVfREFUQSk+Owo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1kaXNhYmxlOyAvKiBleHRlcm5hbCBwdWxs
LXVwICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlucHV0LWVuYWJsZTsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlucHV0LXNjaG1pdHQtZW5hYmxlOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4+PiBAQCAtNjQxLDYgKzY0Niw3IEBAIEdQT0VOX0RJU0FCTEUsCj4+PiDCoCB9Owo+Pj4g
wqAgwqAgJnVhcnQwIHsKPj4+ICvCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+PiDCoMKgwqDCoMKg
IGNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47Cj4+PiDCoMKgwqDCoMKgIHBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7Cj4+PiDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9IDwmdWFydDBfcGlucz47
Cj4+Cj4+IFdoYXQgYWJvdXQgJm1tYzAsICZtbWMxLCAmcXNwaSwgJnN5c2dwaW8sICZtbWMwX3Bp
bnMsICZtbWMxX3BpbnMsICZpMmM1Pwo+PiBXaHkgbm90IGFkZCAiYm9vdHBoLXByZS1yYW07IiBm
b3IgdGhlbT8KPiAKPiBXb3VsZCB0aGV5IGJlIG5lZWRlZCBiZWZvcmUgcmVsb2NhdGlvbiBvZiBV
LUJvb3QgdG8gRFJBTT8KClllYWgsIHRoZXkgYXJlIG5lZWRlZCBieSBTUEwgYW5kIHRoZXkgYXJl
IHNldCBpbgpVLUJvb3QgYXJjaC9yaXNjdi9kdHMvamg3MTEwLWNvbW1vbi11LWJvb3QuZHRzaS4K
CkJlc3QgcmVnYXJkcywKSGFsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
