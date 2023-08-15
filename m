Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E32EC001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 10:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZBzNKgxwIijos/Fnbq3zKyHS0YSNRSdjFSvSv16eqk=; b=LyOlzIDLK6RMG9
	4TNI70cKDl1h/mZ9qh7TeGw3rrqoNJUH5FVkMksYgficC2Om3CvpN0h3UZtGxmnXmX3lRiIdIa0oq
	R+MCTvxEVx2L5cybjw+2EG02PjlvR1APCdEDPHX2V/Cv+mTs0N0mdfZKInVm94dFi1CM8P2ezJH7d
	iQLGcCnU/Lgs0A7XXj5uR6soWrJvOTIxwcIB1L0l6fxJzDZXX/qZ0124XzFqQFxMYZmp6ZVUAQ/OI
	BTZRLi4Ik9yu+oMw5Kfu3q3UXhFcIeJ3KIkDCeKopuaA8r7CnL3WUhW73CLpLfPmy5sVdldgRywHR
	hCnAZJqStjU3On3hXVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrWv-001Ja0-0r;
	Tue, 15 Aug 2023 10:44:05 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrWr-001JWD-0S
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 10:44:03 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 379AD7FD3;
	Tue, 15 Aug 2023 18:43:37 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 15 Aug
 2023 18:43:37 +0800
Received: from [192.168.125.127] (183.27.98.20) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 15 Aug
 2023 18:43:35 +0800
Message-ID: <5424ddb2-8f6b-ca15-c2f1-83e3cb9db7b6@starfivetech.com>
Date: Tue, 15 Aug 2023 18:43:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 07/11] PCI: microchip: Rename IRQ init function
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-8-minda.chen@starfivetech.com>
 <20230814-vividness-disgrace-115283ea6f9a@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230814-vividness-disgrace-115283ea6f9a@wendy>
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_034401_534138_A287AA0B 
X-CRM114-Status: GOOD (  17.22  )
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

CgpPbiAyMDIzLzgvMTQgMjE6NTUsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBNb24sIEF1ZyAx
NCwgMjAyMyBhdCAwNDoyMDoxMlBNICswODAwLCBNaW5kYSBDaGVuIHdyb3RlOgo+PiBSZW5hbWUg
SVJRIGluaXQgZnVuY3Rpb24gYW5kIHByZXBhcmUgZm9yIHJlLXVzZQo+PiBJUlEgaW5pdCBmdW5j
dGlvbi4KPj4gCj4+IHJlbmFtZSBsaXN0Ogo+PiBtY19pbml0X2ludGVycnVwdHMgLT4gcGxkYV9p
bml0X2ludGVycnVwdHMKPj4gbWNfcGNpZV9pbml0X2lycV9kb21haW4tPiBwbGRhX3BjaWVfaW5p
dF9pcnFfZG9tYWlucwo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWluZGEgQ2hlbiA8bWluZGEuY2hl
bkBzdGFyZml2ZXRlY2guY29tPgo+PiAtLS0KPj4gIC4uLi9wY2kvY29udHJvbGxlci9wbGRhL3Bj
aWUtbWljcm9jaGlwLWhvc3QuYyB8IDM3ICsrKysrKysrKysrKystLS0tLS0KPj4gIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXBsZGEuaCAgICAgICB8ICA3ICsrKysKPj4gIDIgZmls
ZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtbWljcm9jaGlwLWhvc3Qu
YyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLW1pY3JvY2hpcC1ob3N0LmMKPj4g
aW5kZXggYjQyZjFhYWMzZWMzLi4xNDBlN2NhMWE1Y2IgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLW1pY3JvY2hpcC1ob3N0LmMKPj4gKysrIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtbWljcm9jaGlwLWhvc3QuYwo+PiBAQCAtNTU5LDcg
KzU1OSw3IEBAIHN0YXRpYyBpbnQgbWNfcGNpZV9pbml0X2Nsa3Moc3RydWN0IGRldmljZSAqZGV2
KQo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+IC1zdGF0aWMgaW50IG1jX3BjaWVfaW5pdF9p
cnFfZG9tYWlucyhzdHJ1Y3QgcGxkYV9wY2llX3JwICpwb3J0KQo+PiArc3RhdGljIGludCBwbGRh
X3BjaWVfaW5pdF9pcnFfZG9tYWlucyhzdHJ1Y3QgcGxkYV9wY2llX3JwICpwb3J0LCBzdHJ1Y3Qg
cGxkYV9ldnQgKmV2dCkKPj4gIHsKPj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwb3J0LT5kZXY7
Cj4+ICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlOwo+PiBAQCAtNTcy
LDggKzU3Miw4IEBAIHN0YXRpYyBpbnQgbWNfcGNpZV9pbml0X2lycV9kb21haW5zKHN0cnVjdCBw
bGRhX3BjaWVfcnAgKnBvcnQpCj4+ICAJCXJldHVybiAtRUlOVkFMOwo+PiAgCX0KPj4gIAo+PiAt
CXBvcnQtPmV2ZW50X2RvbWFpbiA9IGlycV9kb21haW5fYWRkX2xpbmVhcihwY2llX2ludGNfbm9k
ZSwgTlVNX0VWRU5UUywKPj4gLQkJCQkJCSAgICZldmVudF9kb21haW5fb3BzLCBwb3J0KTsKPj4g
Kwlwb3J0LT5ldmVudF9kb21haW4gPSBpcnFfZG9tYWluX2FkZF9saW5lYXIocGNpZV9pbnRjX25v
ZGUsIHBvcnQtPm51bV9ldmVudHMsCj4+ICsJCQkJCQkgICBldnQtPmRvbWFpbl9vcHMsIHBvcnQp
Owo+PiAgCWlmICghcG9ydC0+ZXZlbnRfZG9tYWluKSB7Cj4+ICAJCWRldl9lcnIoZGV2LCAiZmFp
bGVkIHRvIGdldCBldmVudCBkb21haW5cbiIpOwo+PiAgCQlvZl9ub2RlX3B1dChwY2llX2ludGNf
bm9kZSk7Cj4+IEBAIC02NTgsMTQgKzY1OCwxNSBAQCBzdGF0aWMgdm9pZCBtY19kaXNhYmxlX2lu
dGVycnVwdHMoc3RydWN0IG1jX3BjaWUgKnBvcnQpCj4+ICAJd3JpdGVsX3JlbGF4ZWQoR0VOTUFT
SygzMSwgMCksIGJyaWRnZV9iYXNlX2FkZHIgKyBJU1RBVFVTX0hPU1QpOwo+PiAgfQo+PiAgCj4+
IC1zdGF0aWMgaW50IG1jX2luaXRfaW50ZXJydXB0cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LCBzdHJ1Y3QgcGxkYV9wY2llX3JwICpwb3J0KQo+PiArc3RhdGljIGludCBwbGRhX2luaXRf
aW50ZXJydXB0cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+PiArCQkJCXN0cnVjdCBw
bGRhX3BjaWVfcnAgKnBvcnQsIHN0cnVjdCBwbGRhX2V2dCAqZXZ0KQo+PiAgewo+PiAgCXN0cnVj
dCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+ICAJaW50IGlycTsKPj4gIAlpbnQgaSwgaW50
eF9pcnEsIG1zaV9pcnEsIGV2ZW50X2lycTsKPj4gIAlpbnQgcmV0Owo+PiAgCj4+IC0JcmV0ID0g
bWNfcGNpZV9pbml0X2lycV9kb21haW5zKHBvcnQpOwo+PiArCXJldCA9IHBsZGFfcGNpZV9pbml0
X2lycV9kb21haW5zKHBvcnQsIGV2dCk7Cj4+ICAJaWYgKHJldCkgewo+PiAgCQlkZXZfZXJyKGRl
diwgImZhaWxlZCBjcmVhdGluZyBJUlEgZG9tYWluc1xuIik7Cj4+ICAJCXJldHVybiByZXQ7Cj4+
IEBAIC02NzUsMTUgKzY3NiwxOCBAQCBzdGF0aWMgaW50IG1jX2luaXRfaW50ZXJydXB0cyhzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgcGxkYV9wY2llX3JwCj4+ICAJaWYgKGly
cSA8IDApCj4+ICAJCXJldHVybiAtRU5PREVWOwo+PiAgCj4+IC0JZm9yIChpID0gMDsgaSA8IE5V
TV9FVkVOVFM7IGkrKykgewo+PiArCWZvciAoaSA9IDA7IGkgPCBwb3J0LT5udW1fZXZlbnRzOyBp
KyspIHsKPj4gIAkJZXZlbnRfaXJxID0gaXJxX2NyZWF0ZV9tYXBwaW5nKHBvcnQtPmV2ZW50X2Rv
bWFpbiwgaSk7Cj4+ICAJCWlmICghZXZlbnRfaXJxKSB7Cj4+ICAJCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBtYXAgaHdpcnEgJWRcbiIsIGkpOwo+PiAgCQkJcmV0dXJuIC1FTlhJTzsKPj4gIAkJ
fQo+PiAgCj4+IC0JCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LCBldmVudF9pcnEsIG1jX2V2
ZW50X2hhbmRsZXIsCj4+IC0JCQkJICAgICAgIDAsIGV2ZW50X2NhdXNlW2ldLnN5bSwgcG9ydCk7
Cj4+ICsJCWlmIChldnQtPnJlcXVlc3RfZXZ0X2lycSkKPj4gKwkJCXJldCA9IGV2dC0+cmVxdWVz
dF9ldnRfaXJxKHBvcnQsIGV2ZW50X2lycSwgaSk7Cj4+ICsJCWVsc2UKPj4gKwkJCXJldCA9IGRl
dm1fcmVxdWVzdF9pcnEoZGV2LCBldmVudF9pcnEsIHBsZGFfZXZlbnRfaGFuZGxlciwKPj4gKwkJ
CQkJICAgICAgIDAsIE5VTEwsIHBvcnQpOwo+IAo+IElzIHRoZXJlIGEgcGFydGljdWxhciByZWFz
b24gdGhpcyBpZi9lbHNlIGFkZGl0aW9uIGVuZGVkIHVwIGluIHRoaXMKPiBwYXRjaCwgYnV0IHRo
ZSBpZi9lbHNlIGFkZGl0aW9uIGluIHBsZGFfaGFuZGxlX2V2ZW50KCkgZW5kZWQgdXAgaW4gdGhl
Cj4gbmV4dCBvbmU/Cj4gCj4gT3RoZXJ3aXNlLCB0aGlzIGxvb2tzIGZpbmUgdG8gbWUuCkkgZm9y
Z2V0IHRvIG1vZGlmeSBtY19oYW5kbGVfZXZlbnQoKe+8jCBTbyBsZWF2ZSBpdCB0byBuZXh0IHBh
dGNoLiAgCkJ1dCBJIHdpbGwgZW5kZWQgdXAgdGhlbSBpbiB0aGlzIHBhdGNoZXMuIFRoaXMgcGF0
Y2ggaXMgdG8gbW9kaWZ5LCBuZXh0IHBhdGNoIGlzIHRvIG1vdmUuIAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
