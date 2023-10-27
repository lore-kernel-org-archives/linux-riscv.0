Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F1EC25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oobv7ZMAEVovj7m/8QIjr0Yx2+AvUhIAilQMzSEGaBs=; b=0cnu6zn+T4ClmF
	TUuYXyatSGymAzbh+4WPB3DAqmi8XlM9aaNQdQQUFCgbDOPK9m1IXuUkj1FZhLxmwLaYB0ASyw63x
	w0PAa0uAw4z3/24QlNv/hU4E+E5MKULaXCd0sqVMrr7g4S3Npw4wxyQwbyKmZN0RECETbtvn/lJX0
	f8uMMLf+YmcUi0WwMqjU94u183wHJgN+RjBbDYjZRtUT3f3CJuYm5pgqolc339JLu0KOibBejpmZW
	XNHgUcyLE/VFYDHVbpHe8GJ0t54zBl60DsGuTk2L7PP+hRphAJ5yZGcivbdondBhG/avBf6CgIIuT
	q3naTu+LXU3dFPFLQhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJ54-00G1Wa-23;
	Fri, 27 Oct 2023 09:24:38 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJ50-00G1Sj-1A
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 09:24:36 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4ABE824E1F0;
	Fri, 27 Oct 2023 17:23:50 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 27 Oct
 2023 17:23:50 +0800
Received: from [192.168.125.131] (183.27.99.126) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 27 Oct
 2023 17:23:49 +0800
Message-ID: <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
Date: Fri, 27 Oct 2023 17:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
X-Originating-IP: [183.27.99.126]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_022434_680449_41667F5F 
X-CRM114-Status: GOOD (  20.11  )
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

T24gMjAyMy8xMC8yNSAyMjozOSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gCj4gSGkgWGluZ3l1
LAo+IAo+IAo+IE9uIDI1LzEwLzIwMjMgMTE6MDQsIFhpbmd5dSBXdSB3cm90ZToKPj4gT24gMjAy
My8xMC8yNCAyMjo1NiwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+Pgo+Pj4gSGkgWGluZ3l1LAo+
Pj4KPj4+Cj4+PiBPbiAxOS8xMC8yMDIzIDA3OjM1LCBYaW5neXUgV3Ugd3JvdGU6Cj4+Pj4gQWRk
IHRpbWVyIGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCj4+Pgo+Pj4gQXMgaXQg
aXMgYSBuZXcgdGltZXIsIHBsZWFzZSBhZGQgYSBwcm9wZXIgbmljZSBkZXNjcmlwdGlvbiBleHBs
YWluaW5nIHRoZSB0aW1lciBoYXJkd2FyZSwgdGhhbmtzLgo+Pgo+PiBPSy4gV2lsbCBhZGQgdGhl
IGRlc2NyaXB0aW9uIGluIG5leHQgdmVyc2lvbi4KPj4KPj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
WGluZ3l1IFd1IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4KPj4+PiAtLS0KPj4+PiDCoMKg
IE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA3ICsKPj4+PiDCoMKgIGRyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZ8KgwqDCoMKg
wqDCoMKgIHzCoCAxMSArCj4+Pj4gwqDCoCBkcml2ZXJzL2Nsb2Nrc291cmNlL01ha2VmaWxlwqDC
oMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+IMKgwqAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1q
aDcxMTAuYyB8IDM4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+IMKgwqAgNCBm
aWxlcyBjaGFuZ2VkLCAzOTkgaW5zZXJ0aW9ucygrKQo+Pj4+IMKgwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItamg3MTEwLmMKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+Pj4gaW5kZXggN2E3YmQ4YmQ4MGU5Li45
MWMwOWIzOTkxMzEgMTAwNjQ0Cj4+Pj4gLS0tIGEvTUFJTlRBSU5FUlMKPj4+PiArKysgYi9NQUlO
VEFJTkVSUwo+Pj4+IEBAIC0yMDQ3Myw2ICsyMDQ3MywxMyBAQCBTOsKgwqDCoCBNYWludGFpbmVk
Cj4+Pj4gwqDCoCBGOsKgwqDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvc3RhcmZpdmUsamg3MTEwLXRkbS55YW1sCj4+Pj4gwqDCoCBGOsKgwqDCoCBzb3VuZC9zb2Mv
c3RhcmZpdmUvamg3MTEwX3RkbS5jCj4+Pj4gwqDCoCArU1RBUkZJVkUgSkg3MTEwIFRJTUVSIERS
SVZFUgo+Pj4+ICtNOsKgwqDCoCBTYW1pbiBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29t
Pgo+Pj4+ICtNOsKgwqDCoCBYaW5neXUgV3UgPHhpbmd5dS53dUBzdGFyZml2ZXRlY2guY29tPgo+
Pj4+ICtTOsKgwqDCoCBTdXBwb3J0ZWQKPj4+PiArRjrCoMKgwqAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RpbWVyL3N0YXJmaXZlLGpoNzExMC10aW1lci55YW1sCj4+Pj4gK0Y6
wqDCoMKgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItamg3MTEwLmMKPj4+PiArCj4+Pj4gwqDC
oCBTVEFSRklWRSBKSDcxWDAgQ0xPQ0sgRFJJVkVSUwo+Pj4+IMKgwqAgTTrCoMKgwqAgRW1pbCBS
ZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPj4+PiDCoMKgIE06wqDCoMKgIEhhbCBG
ZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsb2Nrc291cmNlL0tjb25maWcgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcKPj4+PiBp
bmRleCAwYmEwZGM0ZWNmMDYuLjgyMWFiY2MxZTUxNyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJz
L2Nsb2Nrc291cmNlL0tjb25maWcKPj4+PiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25m
aWcKPj4+PiBAQCAtNjQxLDYgKzY0MSwxNyBAQCBjb25maWcgUklTQ1ZfVElNRVIKPj4+PiDCoMKg
wqDCoMKgwqDCoMKgIGlzIGFjY2Vzc2VkIHZpYSBib3RoIHRoZSBTQkkgYW5kIHRoZSByZGN5Y2xl
IGluc3RydWN0aW9uLsKgIFRoaXMgaXMKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIHJlcXVpcmVkIGZv
ciBhbGwgUklTQy1WIHN5c3RlbXMuCj4+Pj4gwqDCoCArY29uZmlnIFNUQVJGSVZFX0pINzExMF9U
SU1FUgo+Pj4+ICvCoMKgwqAgYm9vbCAiVGltZXIgZm9yIHRoZSBTVEFSRklWRSBKSDcxMTAgU29D
Igo+Pj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBBUkNIX1NUQVJGSVZFIHx8IENPTVBJTEVfVEVTVAo+
Pj4KPj4+IFlvdSBtYXkgd2FudCB0byB1c2UgQVJDSF9TVEFSRklWRSBvbmx5IGlmIHRoZSBwbGF0
Zm9ybSBjYW4gbWFrZSB0aGlzIHRpbWVyIG9wdGlvbmFsLiBPdGhlcndpc2UsIHNldCB0aGUgb3B0
aW9uIGZyb20gdGhlIHBsYXRmb3JtIEtjb25maWcgYW5kIHB1dCB0aGUgYm9vbCAiYmxhIGJsYSIg
aWYgQ09NUElMRV9URVNUCj4+Cj4+IFllcywgdGhpcyB0aW1lciBvbmx5IGJlIHVzZWQgb24gdGhl
IFN0YXJGaXZlIFNvQy4gU28gSSBpbnRlbmQgdG8gbW9kaWZ5IHRvIHRoaXM6Cj4+Cj4+IGJvb2wg
IlRpbWVyIGZvciB0aGUgU1RBUkZJVkUgSkg3MTEwIFNvQyIgaWYgQ09NUElMRV9URVNUCj4+IGRl
cGVuZHMgb24gQVJDSF9TVEFSRklWRQo+IAo+IEluIHRoaXMgY2FzZSwgeW91IHNob3VsZCBjaGFu
Z2UgdGhlIHBsYXRmb3JtIGNvbmZpZyBhbmQgc2VsZWN0IHRoZSB0aW1lciBmcm9tIHRoZXJlLiBS
ZW1vdmUgdGhlIGRlcGVuZHMgb24gQVJDSF9TVEFSRklWRSBzbyBpdCBpcyBwb3NzaWJsZSBlbmFi
bGUgY3Jvc3MgdGVzdCBjb21waWxhdGlvbi4gT3RoZXJ3aXNlIENPTVBJTEVfVEVTVCB3aWxsIG5v
dCB3b3JrIG9uIG90aGVyIHBsYXRmb3Jtcy4KPiAKPiBbIC4uLiBdCj4gCgpJdCBpcyBub3QgYSBr
ZXJuZWwgdGltZXIgb3IgY2xvY2tzb3VyY2UuIEl0IHdpbGwgbm90IHdvcmsgb24gb3RoZXIgcGxh
dGZvcm1zIGFuZCBpcyBqdXN0IHVzZWQgb24gdGhlIEpINzExMCBTb0MuCkkgdGhpbmsgSSBuZWVk
bid0IHJlbW92ZSBpdC4gTWF5YmUgSSBtb2RpZnkgdG8gdGhpczoKCmJvb2wgIlRpbWVyIGZvciB0
aGUgU1RBUkZJVkUgSkg3MTEwIFNvQyIgaWYgQ09NUElMRV9URVNUCmRlcGVuZHMgb24gQVJDSF9T
VEFSRklWRSB8fCBDT01QSUxFX1RFU1QKCj4+Pj4gK3N0cnVjdCBqaDcxMTBfY2xrZXZ0IHsKPj4+
PiArwqDCoMKgIHN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UgZXZ0Owo+Pj4+ICvCoMKgwqAgc3Ry
dWN0IGNsb2Nrc291cmNlIGNzOwo+Pj4+ICvCoMKgwqAgYm9vbCBjc19pc192YWxpZDsKPj4+PiAr
wqDCoMKgIHN0cnVjdCBjbGsgKmNsazsKPj4+PiArwqDCoMKgIHN0cnVjdCByZXNldF9jb250cm9s
ICpyc3Q7Cj4+Pj4gK8KgwqDCoCB1MzIgcmF0ZTsKPj4+PiArwqDCoMKgIHUzMiByZWxvYWRfdmFs
Owo+Pj4+ICvCoMKgwqAgdm9pZCBfX2lvbWVtICpiYXNlOwo+Pj4+ICvCoMKgwqAgY2hhciBuYW1l
W3NpemVvZigiamg3MTEwLXRpbWVyLmNoWCIpXTsKPj4+PiArfTsKPj4+PiArCj4+Pj4gK3N0cnVj
dCBqaDcxMTBfdGltZXJfcHJpdiB7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgY2xrICpwY2xrOwo+Pj4+
ICvCoMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKnByc3Q7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qg
amg3MTEwX2Nsa2V2dCBjbGtldnRbSkg3MTEwX1RJTUVSX0NIX01BWF07Cj4+Pgo+Pj4gV2h5IGRv
IHlvdSBuZWVkIHNldmVyYWwgY2xvY2sgZXZlbnRzIGFuZCBjbG9jayBzb3VyY2VzID8KPj4KPj4g
VGhpcyB0aW1lciBoYXMgZm91ciBjb3VudGVycyAoY2hhbm5lbHMpIHdoaWNoIHJ1biBpbmRlcGVu
ZGVudGx5LiBTbyBlYWNoIGNvdW50ZXIgY2FuIGhhdmUgaXRzIG93biBjbG9jayBldmVudCBhbmQg
Y2xvY2sgc291cmNlIHRvIGNvbmZpZ3VyZSBkaWZmZXJlbnQgc2V0dGluZ3MuCj4gCj4gVGhlIGtl
cm5lbCBvbmx5IG5lZWRzIG9uZSBjbG9ja3NvdXJjZS4gVXN1YWxseSBtdWx0aXBsZSBjbG9ja2V2
ZW50cyBhcmUgcGVyLWNwdSBiYXNlZCBzeXN0ZW0uCj4gCj4gVGhlIGRyaXZlciBkb2VzIG5vdCBz
ZWVtIHRvIGhhdmUgYSBwZXIgY3B1IHRpbWVyIGJ1dCBqdXN0IGluaXRpYWxpemluZyBtdWx0aXBs
ZSBjbG9ja2V2ZW50cyB3aGljaCB3aWxsIGVuZCB1cCB1bnVzZWQsIHdhc3RpbmcgZW5lcmd5Lgo+
IAo+IAoKVGhlIGJvYXJkIG9mIHRoZSBTdGFyRml2ZSBKSDcxMTAgU29DIGhhcyB0d28gdHlwZXMg
b2YgdGltZXIgOiByaXNjdi10aW1lciBhbmQgamg3MTEwLXRpbWVyLiBJdCBib290cyBieSByaXNj
di10aW1lcihjbG9ja3NvdXJjZSkgYW5kIHRoZSBqaDcxMTAtdGltZXIgaXMgb3B0aW9uYWwgYW5k
IGFkZGl0aW9uYWwuCkkgdGhpbmsgSSBzaG91bGQgaW5pdGlhbGl6ZSB0aGUgZm91ciBjaGFubmVs
cyBvZiBqaDcxMTAtdGltZXIgYXMgY2xvY2tldmVudHMgbm90IGNsb2Nrc291cmNlIHByZS1jcHUu
CgpUaGFua3MsClhpbmd5dSBXdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
