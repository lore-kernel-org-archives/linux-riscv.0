Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F82C46CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3jJ6xR6Izn826QTLkqiCGIOYf/xwjHDWHX1terAF2k=; b=AtHg3vAfQv343w
	NluFnU0BMgfIwIj5x3XQTtE4ifnRIxualHV8J34bEVM0xxl4BMVjE6Pe6ozOIZU0amNWpamppl+9A
	wvIQdZRdu9jLRMGOJZ2Hzvq/+wqI1BDtdDlC8mtCdIqtJl43wIMvXexm1FW4cyR394G7Z3Jo4uHs8
	9NTjzagj5l6Q4EmxoGuvTx+AVuTEDIPMvqEKgcyA4/Tfu+umeXaMmzMM3UVFsPaewlydqAwEquU4n
	LDbQYuxDNWyTBnbx/m8u+PWzn7BwoELkfpZlz5YxLHE9+FPRpmn8+viMZTkELhO1/nLcGIUsSx0i2
	DbumeAn/Z30HLrVq7TdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGjs-002W0v-25;
	Thu, 21 Dec 2023 10:57:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGjo-002Vv4-1c
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 10:57:15 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6ECBA7FC9;
	Thu, 21 Dec 2023 18:56:24 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 18:56:24 +0800
Received: from [192.168.125.85] (113.72.145.47) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 18:56:23 +0800
Message-ID: <8c417157-8884-4e91-8912-0344e71f82c2@starfivetech.com>
Date: Thu, 21 Dec 2023 18:56:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 15/21] PCI: microchip: Add event irqchip field to host
 port and add PLDA irqchip
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
	<kw@linux.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <20231214072839.2367-16-minda.chen@starfivetech.com>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20231214072839.2367-16-minda.chen@starfivetech.com>
X-Originating-IP: [113.72.145.47]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_025712_882197_67446E6D 
X-CRM114-Status: GOOD (  23.81  )
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

CgpPbiAyMDIzLzEyLzE0IDE1OjI4LCBNaW5kYSBDaGVuIHdyb3RlOgo+IFBvbGFyRmlyZSBQQ0lF
IGV2ZW50IElSUXMgaW5jbHVkZXMgUExEQSBsb2NhbCBpbnRlcnJ1cHRzIGFuZCBQb2xhckZpcmUK
PiB0aGVpciBvd24gSVJRcy4gUG9sYXJGaXJlIFBDSWUgZXZlbnQgaXJxX2NoaXAgb3BzIHVzaW5n
IGFuIGV2ZW50X2Rlc2MgdG8KPiB1bmlmeSBkaWZmZXJlbnQgSVJRIHJlZ2lzdGVyIGFkZHJlc3Nl
cy4gT24gUExEQSBzaWRlcywgUExEQSBpcnFjaGlwIGNvZGVzCj4gb25seSByZXF1aXJlIHRvIHNl
dCBQTERBIGxvY2FsIGludGVycnVwdCByZWdpc3Rlci4gU28gdGhlIFBMREEgaXJxY2hpcCBvcHMK
PiBjb2RlcyBjYW4gbm90IGJlIGV4dHJhY3RlZCBmcm9tIFBvbGFyRmlyZSBjb2Rlcy4KPiAKPiBU
byBzdXBwb3J0IFBMREEgaXRzIG93biBldmVudCBJUlEgcHJvY2VzcywgaW1wbGVtZW50cyBQTERB
IGlycWNoaXAgb3BzIGFuZAo+IGFkZCBldmVudCBpcnFjaGlwIGZpZWxkIHRvIHN0cnVjdCBwY2ll
X3BsZGFfcnAuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWluZGEgQ2hlbiA8bWluZGEuY2hlbkBzdGFy
Zml2ZXRlY2guY29tPgo+IC0tLQo+ICAuLi4vcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLW1pY3Jv
Y2hpcC1ob3N0LmMgfCA2NSArKysrKysrKysrKysrKysrKystCj4gIGRyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGxkYS9wY2llLXBsZGEuaCAgICAgICB8ICAzICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2
NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCkhpIENvbm9yCiAgIENvdWxkIHlvdSB0
YWtlIHRpbWUgdG8gcmV2aWV3IHRoaXMgcGF0Y2g/ICBGb3IgSSB1c2luZyBldmVudCBpcnEgY2hp
cCBpbnN0ZWFkIG9mIGV2ZW50IG9wcyBhbmQgdGhlIHdob2xlIHBhdGNoIGhhdmUgYmVlbiBjaGFu
Z2VkLiAgSSB0aGluayBpdCdzIGJldHRlciAKICAgQW5kIEkgYWRkZWQgdGhlIGltcGxlbWVudGF0
aW9uIG9mIFBMREEgZXZlbnQgaXJxY2hpcCAgYW5kIG1ha2UgaXQgZWFzaWVyIHRvIGNsYWltIHRo
ZSBuZWNlc3NpdHkgb2YgdGhlIG1vZGlmaWNhdGlvbi4KICAgSWYgeW91IGFwcHJvdmUgdGhpcywg
SSB3aWxsIGFkZCBiYWNrIHRoZSByZXZpZXcgdGFnLiBUaGFua3MKCkhpIExvcmVuem8KICAgSGF2
ZSB5b3UgcmV2aWV3ZWQgdGhpcyBwYXRjaO+8nyBEb2VzIHRoZSBjb21taXQgbWVzc2FnZSBhbmQg
dGhlIGNvZGVzIGFyZSBjYW4gYmUgYXBwcm92ZWQg77yfVGhhbmtzCgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1taWNyb2NoaXAtaG9zdC5jIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtbWljcm9jaGlwLWhvc3QuYwo+IGluZGV4IGZkMGQ5
MmMzZDAzZi4uZmY0MGMxNjIyMTczIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGxkYS9wY2llLW1pY3JvY2hpcC1ob3N0LmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BsZGEvcGNpZS1taWNyb2NoaXAtaG9zdC5jCj4gQEAgLTc3MSw2ICs3NzEsNjMgQEAgc3Rh
dGljIHN0cnVjdCBpcnFfY2hpcCBtY19ldmVudF9pcnFfY2hpcCA9IHsKPiAgCS5pcnFfdW5tYXNr
ID0gbWNfdW5tYXNrX2V2ZW50X2lycSwKPiAgfTsKPiA+ICtzdGF0aWMgdTMyIHBsZGFfaHdpcnFf
dG9fbWFzayhpbnQgaHdpcnEpCj4gK3sKPiArCXUzMiBtYXNrOwo+ICsKPiArCWlmIChod2lycSA8
IEVWRU5UX1BNX01TSV9JTlRfSU5UWCkKPiArCQltYXNrID0gQklUKGh3aXJxICsgQV9BVFJfRVZU
X1BPU1RfRVJSX1NISUZUKTsKPiArCWVsc2UgaWYgKGh3aXJxID09IEVWRU5UX1BNX01TSV9JTlRf
SU5UWCkKPiArCQltYXNrID0gUE1fTVNJX0lOVF9JTlRYX01BU0s7Cj4gKwllbHNlCj4gKwkJbWFz
ayA9IEJJVChod2lycSArIFBNX01TSV9UT19NQVNLX09GRlNFVCk7Cj4gKwo+ICsJcmV0dXJuIG1h
c2s7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHBsZGFfYWNrX2V2ZW50X2lycShzdHJ1Y3QgaXJx
X2RhdGEgKmRhdGEpCj4gK3sKPiArCXN0cnVjdCBwbGRhX3BjaWVfcnAgKnBvcnQgPSBpcnFfZGF0
YV9nZXRfaXJxX2NoaXBfZGF0YShkYXRhKTsKPiArCj4gKwl3cml0ZWxfcmVsYXhlZChwbGRhX2h3
aXJxX3RvX21hc2soZGF0YS0+aHdpcnEpLAo+ICsJCSAgICAgICBwb3J0LT5icmlkZ2VfYWRkciAr
IElTVEFUVVNfTE9DQUwpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBwbGRhX21hc2tfZXZlbnRf
aXJxKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkKPiArewo+ICsJc3RydWN0IHBsZGFfcGNpZV9ycCAq
cG9ydCA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGRhdGEpOwo+ICsJdTMyIG1hc2ssIHZh
bDsKPiArCj4gKwltYXNrID0gcGxkYV9od2lycV90b19tYXNrKGRhdGEtPmh3aXJxKTsKPiArCj4g
KwlyYXdfc3Bpbl9sb2NrKCZwb3J0LT5sb2NrKTsKPiArCXZhbCA9IHJlYWRsX3JlbGF4ZWQocG9y
dC0+YnJpZGdlX2FkZHIgKyBJTUFTS19MT0NBTCk7Cj4gKwl2YWwgJj0gfm1hc2s7Cj4gKwl3cml0
ZWxfcmVsYXhlZCh2YWwsIHBvcnQtPmJyaWRnZV9hZGRyICsgSU1BU0tfTE9DQUwpOwo+ICsJcmF3
X3NwaW5fdW5sb2NrKCZwb3J0LT5sb2NrKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgcGxkYV91
bm1hc2tfZXZlbnRfaXJxKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkKPiArewo+ICsJc3RydWN0IHBs
ZGFfcGNpZV9ycCAqcG9ydCA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGRhdGEpOwo+ICsJ
dTMyIG1hc2ssIHZhbDsKPiArCj4gKwltYXNrID0gcGxkYV9od2lycV90b19tYXNrKGRhdGEtPmh3
aXJxKTsKPiArCj4gKwlyYXdfc3Bpbl9sb2NrKCZwb3J0LT5sb2NrKTsKPiArCXZhbCA9IHJlYWRs
X3JlbGF4ZWQocG9ydC0+YnJpZGdlX2FkZHIgKyBJTUFTS19MT0NBTCk7Cj4gKwl2YWwgfD0gbWFz
azsKPiArCXdyaXRlbF9yZWxheGVkKHZhbCwgcG9ydC0+YnJpZGdlX2FkZHIgKyBJTUFTS19MT0NB
TCk7Cj4gKwlyYXdfc3Bpbl91bmxvY2soJnBvcnQtPmxvY2spOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
c3RydWN0IGlycV9jaGlwIHBsZGFfZXZlbnRfaXJxX2NoaXAgPSB7Cj4gKwkubmFtZSA9ICJQTERB
IFBDSWUgRVZFTlQiLAo+ICsJLmlycV9hY2sgPSBwbGRhX2Fja19ldmVudF9pcnEsCj4gKwkuaXJx
X21hc2sgPSBwbGRhX21hc2tfZXZlbnRfaXJxLAo+ICsJLmlycV91bm1hc2sgPSBwbGRhX3VubWFz
a19ldmVudF9pcnEsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBsZGFfZXZlbnRf
b3BzIHBsZGFfZXZlbnRfb3BzID0gewo+ICAJLmdldF9ldmVudHMgPSBwbGRhX2dldF9ldmVudHMs
Cj4gIH07Cj4gQEAgLTc3OCw3ICs4MzUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBsZGFfZXZl
bnRfb3BzIHBsZGFfZXZlbnRfb3BzID0gewo+ICBzdGF0aWMgaW50IHBsZGFfcGNpZV9ldmVudF9t
YXAoc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwgdW5zaWduZWQgaW50IGlycSwKPiAgCQkJICAg
ICAgIGlycV9od19udW1iZXJfdCBod2lycSkKPiAgewo+IC0JaXJxX3NldF9jaGlwX2FuZF9oYW5k
bGVyKGlycSwgJm1jX2V2ZW50X2lycV9jaGlwLCBoYW5kbGVfbGV2ZWxfaXJxKTsKPiArCXN0cnVj
dCBwbGRhX3BjaWVfcnAgKnBvcnQgPSAodm9pZCAqKWRvbWFpbi0+aG9zdF9kYXRhOwo+ICsKPiAr
CWlycV9zZXRfY2hpcF9hbmRfaGFuZGxlcihpcnEsIHBvcnQtPmV2ZW50X2lycV9jaGlwLCBoYW5k
bGVfbGV2ZWxfaXJxKTsKPiAgCWlycV9zZXRfY2hpcF9kYXRhKGlycSwgZG9tYWluLT5ob3N0X2Rh
dGEpOwo+ICAKPiAgCXJldHVybiAwOwo+IEBAIC05NjMsNiArMTAyMiw5IEBAIHN0YXRpYyBpbnQg
cGxkYV9pbml0X2ludGVycnVwdHMoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgCWlm
ICghcG9ydC0+ZXZlbnRfb3BzKQo+ICAJCXBvcnQtPmV2ZW50X29wcyA9ICZwbGRhX2V2ZW50X29w
czsKPiAgCj4gKwlpZiAoIXBvcnQtPmV2ZW50X2lycV9jaGlwKQo+ICsJCXBvcnQtPmV2ZW50X2ly
cV9jaGlwID0gJnBsZGFfZXZlbnRfaXJxX2NoaXA7Cj4gKwo+ICAJcmV0ID0gcGxkYV9wY2llX2lu
aXRfaXJxX2RvbWFpbnMocG9ydCk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJZGV2X2VycihkZXYsICJm
YWlsZWQgY3JlYXRpbmcgSVJRIGRvbWFpbnNcbiIpOwo+IEBAIC0xMDQwLDYgKzExMDIsNyBAQCBz
dGF0aWMgaW50IG1jX3BsYXRmb3JtX2luaXQoc3RydWN0IHBjaV9jb25maWdfd2luZG93ICpjZmcp
Cj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gIAlwb3J0LT5wbGRhLmV2ZW50X29wcyA9ICZtY19ldmVu
dF9vcHM7Cj4gKwlwb3J0LT5wbGRhLmV2ZW50X2lycV9jaGlwID0gJm1jX2V2ZW50X2lycV9jaGlw
Owo+ICAKPiAgCS8qIEFkZHJlc3MgdHJhbnNsYXRpb24gaXMgdXA7IHNhZmUgdG8gZW5hYmxlIGlu
dGVycnVwdHMgKi8KPiAgCXJldCA9IHBsZGFfaW5pdF9pbnRlcnJ1cHRzKHBkZXYsICZwb3J0LT5w
bGRhLCAmbWNfZXZlbnQpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bs
ZGEvcGNpZS1wbGRhLmggYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1wbGRhLmgK
PiBpbmRleCBkZDhiYzI3NTBiZmMuLjI0YWM1MGM0NThkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1wbGRhLmgKPiArKysgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BsZGEvcGNpZS1wbGRhLmgKPiBAQCAtMTI4LDYgKzEyOCw4IEBACj4gICAqIERNQSBl
bmQgOiByZXNlcnZlZCBmb3IgdmVuZG9yIGltcGxlbWVudAo+ICAgKi8KPiAgCj4gKyNkZWZpbmUg
UE1fTVNJX1RPX01BU0tfT0ZGU0VUCQkJMTkKPiArCj4gIHN0cnVjdCBwbGRhX3BjaWVfcnA7Cj4g
IAo+ICBzdHJ1Y3QgcGxkYV9ldmVudF9vcHMgewo+IEBAIC0xNTAsNiArMTUyLDcgQEAgc3RydWN0
IHBsZGFfcGNpZV9ycCB7Cj4gIAlyYXdfc3BpbmxvY2tfdCBsb2NrOwo+ICAJc3RydWN0IHBsZGFf
bXNpIG1zaTsKPiAgCWNvbnN0IHN0cnVjdCBwbGRhX2V2ZW50X29wcyAqZXZlbnRfb3BzOwo+ICsJ
Y29uc3Qgc3RydWN0IGlycV9jaGlwICpldmVudF9pcnFfY2hpcDsKPiAgCXZvaWQgX19pb21lbSAq
YnJpZGdlX2FkZHI7Cj4gIAlpbnQgbnVtX2V2ZW50czsKPiAgfTsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
