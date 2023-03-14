Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65A9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDotchTS5iEMuMNP8swpNgMOMDKtMIxpVUWD4T65j9Y=; b=1I0PX0W4hZUz6+
	Yv2K0z1ND1gBitfo3MOcKIKqgzGn36WNb82AYNMX5j/EeRbGWJidY8hMvUzg9eU1z9Lqeya/GXyn9
	ul1uNv99VSfPUjFVYqzM5ywtG6da7daMIYwLy9o3x52Jiu91zp5IVKJm/4/HDBnUdj0fld8TjiJmf
	b5C/Z6u5zGwlQUwD2bZktWwQq0FGVh8Qt5mwtHjMvHoXA6ftsBJRTsB2Im3YHZbJdC2FBZlNNX8+n
	j6X4Hdxqrp1Jef47e0x21VSvoqYfmVmqHnkb8sbQtTJ/xoMs6uZxQyHBn9fPckETBqzD9DwoC2FJC
	6chlgeYNDkAn2++L/zvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5jU-00ATXR-2u;
	Tue, 14 Mar 2023 14:34:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5jR-00ATWY-0v
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 14:34:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pc5jQ-0002Cq-1j; Tue, 14 Mar 2023 15:34:28 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pc5jP-0046Eq-BQ; Tue, 14 Mar 2023 15:34:27 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1pc5jO-0008kD-GN; Tue, 14 Mar 2023 15:34:26 +0100
Message-ID: <3df9aa881dce1cfb1360c4d4fe6f609f5a73f97b.camel@pengutronix.de>
Subject: Re: [PATCH v5 06/21] reset: Create subdirectory for StarFive drivers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
 <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org
Date: Tue, 14 Mar 2023 15:34:26 +0100
In-Reply-To: <20230311090733.56918-7-hal.feng@starfivetech.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
	 <20230311090733.56918-7-hal.feng@starfivetech.com>
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_073429_319246_4B8A8021 
X-CRM114-Status: GOOD (  16.22  )
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

T24gU2EsIDIwMjMtMDMtMTEgYXQgMTc6MDcgKzA4MDAsIEhhbCBGZW5nIHdyb3RlOgo+IEZyb206
IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4gCj4gVGhpcyBtb3ZlcyB0
aGUgU3RhckZpdmUgSkg3MTAwIHJlc2V0IGRyaXZlciB0byBhIG5ldyBzdWJkaXJlY3RvcnkgaW4K
PiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIG1vcmUgU3RhckZpdmUgcmVzZXQgZHJpdmVycy4KPiAK
PiBUZXN0ZWQtYnk6IFRvbW1hc28gTWVyY2lhaSA8dG9tbS5tZXJjaWFpQGdtYWlsLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+IFNp
Z25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPgo+IC0tLQo+
IMKgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDIgKy0KPiDCoGRyaXZlcnMvcmVzZXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA4ICstLS0tLS0tCj4gwqBkcml2ZXJzL3Jlc2V0L01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQo+IMKgZHJpdmVycy9yZXNldC9zdGFyZml2ZS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICB8IDggKysrKysrKysKPiDCoGRyaXZlcnMvcmVzZXQv
c3RhcmZpdmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCj4gwqBkcml2ZXJz
L3Jlc2V0L3sgPT4gc3RhcmZpdmV9L3Jlc2V0LXN0YXJmaXZlLWpoNzEwMC5jIHwgMAo+IMKgNiBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IMKgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvcmVzZXQvc3RhcmZpdmUvS2NvbmZpZwo+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvcmVzZXQvc3RhcmZpdmUvTWFrZWZpbGUKPiDCoHJlbmFtZSBkcml2
ZXJzL3Jlc2V0L3sgPT4gc3RhcmZpdmV9L3Jlc2V0LXN0YXJmaXZlLWpoNzEwMC5jICgxMDAlKQo+
IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggY2FiYTNi
NjFhZDVjLi44N2YyMTBlMzU3Y2EgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9N
QUlOVEFJTkVSUwo+IEBAIC0xOTk0MCw3ICsxOTk0MCw3IEBAIFNUQVJGSVZFIEpINzEwMCBSRVNF
VCBDT05UUk9MTEVSIERSSVZFUgo+IMKgTToJRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBl
c21pbC5kaz4KPiDCoFM6CU1haW50YWluZWQKPiDCoEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZXNldC9zdGFyZml2ZSxqaDcxMDAtcmVzZXQueWFtbAo+IC1GOglkcml2ZXJz
L3Jlc2V0L3Jlc2V0LXN0YXJmaXZlLWpoNzEwMC5jCj4gK0Y6CWRyaXZlcnMvcmVzZXQvc3RhcmZp
dmUvcmVzZXQtc3RhcmZpdmUtamg3MTAwLmMKPiDCoEY6CWluY2x1ZGUvZHQtYmluZGluZ3MvcmVz
ZXQvc3RhcmZpdmUtamg3MTAwLmgKPiDCoAo+IAo+IAo+IAo+IMKgU1RBUkZJVkUgSkg3MVhYIFBN
VSBDT05UUk9MTEVSIERSSVZFUgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L0tjb25maWcg
Yi9kcml2ZXJzL3Jlc2V0L0tjb25maWcKPiBpbmRleCA2YWU1YWE0NmE2YjIuLjZhYThmMjQzYjMw
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Jlc2V0L0tjb25maWcKPiArKysgYi9kcml2ZXJzL3Jl
c2V0L0tjb25maWcKPiBAQCAtMjMyLDEzICsyMzIsNiBAQCBjb25maWcgUkVTRVRfU09DRlBHQQo+
IMKgCSAgVGhpcyBlbmFibGVzIHRoZSByZXNldCBkcml2ZXIgZm9yIHRoZSBTb0NGUEdBIEFSTXY3
IHBsYXRmb3Jtcy4gVGhpcwo+IMKgCSAgZHJpdmVyIGdldHMgaW5pdGlhbGl6ZWQgZWFybHkgZHVy
aW5nIHBsYXRmb3JtIGluaXQgY2FsbHMuCj4gwqAKPiAKPiAKPiAKPiAtY29uZmlnIFJFU0VUX1NU
QVJGSVZFX0pINzEwMAo+IC0JYm9vbCAiU3RhckZpdmUgSkg3MTAwIFJlc2V0IERyaXZlciIKPiAt
CWRlcGVuZHMgb24gQVJDSF9TVEFSRklWRSB8fCBDT01QSUxFX1RFU1QKPiAtCWRlZmF1bHQgQVJD
SF9TVEFSRklWRQo+IC0JaGVscAo+IC0JICBUaGlzIGVuYWJsZXMgdGhlIHJlc2V0IGNvbnRyb2xs
ZXIgZHJpdmVyIGZvciB0aGUgU3RhckZpdmUgSkg3MTAwIFNvQy4KPiAtCj4gwqBjb25maWcgUkVT
RVRfU1VOUExVUwo+IMKgCWJvb2wgIlN1bnBsdXMgU29DcyBSZXNldCBEcml2ZXIiIGlmIENPTVBJ
TEVfVEVTVAo+IMKgCWRlZmF1bHQgQVJDSF9TVU5QTFVTCj4gQEAgLTMyMCw2ICszMTMsNyBAQCBj
b25maWcgUkVTRVRfWllOUQo+IMKgCWhlbHAKPiDCoAkgIFRoaXMgZW5hYmxlcyB0aGUgcmVzZXQg
Y29udHJvbGxlciBkcml2ZXIgZm9yIFhpbGlueCBaeW5xIFNvQ3MuCj4gwqAKPiAKPiAKPiAKPiAr
c291cmNlICJkcml2ZXJzL3Jlc2V0L3N0YXJmaXZlL0tjb25maWciCj4gwqBzb3VyY2UgImRyaXZl
cnMvcmVzZXQvc3RpL0tjb25maWciCj4gwqBzb3VyY2UgImRyaXZlcnMvcmVzZXQvaGlzaWxpY29u
L0tjb25maWciCj4gwqBzb3VyY2UgImRyaXZlcnMvcmVzZXQvdGVncmEvS2NvbmZpZyIKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9yZXNldC9NYWtlZmlsZSBiL2RyaXZlcnMvcmVzZXQvTWFrZWZpbGUK
PiBpbmRleCAzZTdlNWZkNjMzYTguLjcxOWI4ZjZmODRiYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3Jlc2V0L01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9yZXNldC9NYWtlZmlsZQo+IEBAIC0xLDYg
KzEsNyBAQAo+IMKgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+IMKgb2JqLXkg
Kz0gY29yZS5vCj4gwqBvYmoteSArPSBoaXNpbGljb24vCj4gK29iai0kKENPTkZJR19BUkNIX1NU
QVJGSVZFKSArPSBzdGFyZml2ZS8KClRoaXMgc2hvdWxkIHJlYWxseSBiZSBvYmoteSwgb3RoZXJ3
aXNlIHRoaXMgd29uJ3QgY29tcGlsZSB3aXRoCkNPTVBJTEVfVEVTVD15IGJ1dCBBUkNIX1NUQVJG
SVZFPW4uCgpXaXRoIHRoYXQgZml4ZWQsClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
