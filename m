Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3037AC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXv8cbVzNWSvWKpLIqVgaL1/SwHw/0GxS/5WVAd8wiQ=; b=FWCQBfs4ZTsvvz
	Iz+i1BGOyRF/RSWGwVK6IpyUi4s+D/uTtv4N75QcoVqIRAJRlkBGBsFqJ/pF+cKgaaPNIrnafE5gi
	fxLS1gevyO9UfZJ51zx1eJbdp1KnTrr6EcwW0fOpMYPrEPKpmtHUqt6HVgjEdItgWHp5zp8LfmHNV
	MsIJ8LMXhmpygzVntFx4h1AHreriOElDEcu4N4GJNKp87y8sqEnnIi1gGcqQRpTegdp2e1RgDbOnT
	zdkQTQo1yD3xrWi3LsFXBs8PVZYzz2EMN7bGi8ibzjYVrCdyBX7Qop83ijXj5ztmiIaOzXOL5SbK8
	HG5I8oaHYeGUMbdCHh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5HV-001ROF-1K;
	Fri, 17 Mar 2023 08:17:45 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5HR-001RGf-19
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 08:17:43 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C920024DC31;
	Fri, 17 Mar 2023 16:17:08 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 16:17:08 +0800
Received: from [192.168.125.74] (113.72.145.194) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 16:17:07 +0800
Message-ID: <555ba3ba-085b-b7e0-f06f-3ec856034801@starfivetech.com>
Date: Fri, 17 Mar 2023 16:17:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From: Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 06/21] reset: Create subdirectory for StarFive drivers
To: Philipp Zabel <p.zabel@pengutronix.de>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, "Emil Renner
 Berthing" <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-7-hal.feng@starfivetech.com>
 <3df9aa881dce1cfb1360c4d4fe6f609f5a73f97b.camel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <3df9aa881dce1cfb1360c4d4fe6f609f5a73f97b.camel@pengutronix.de>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_011741_677975_EC6E4300 
X-CRM114-Status: GOOD (  13.77  )
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

T24gVHVlLCAxNCBNYXIgMjAyMyAxNTozNDoyNiArMDEwMCwgUGhpbGlwcCBaYWJlbCB3cm90ZToK
PiBPbiBTYSwgMjAyMy0wMy0xMSBhdCAxNzowNyArMDgwMCwgSGFsIEZlbmcgd3JvdGU6Cj4+IEZy
b206IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4+IAo+PiBUaGlzIG1v
dmVzIHRoZSBTdGFyRml2ZSBKSDcxMDAgcmVzZXQgZHJpdmVyIHRvIGEgbmV3IHN1YmRpcmVjdG9y
eSBpbgo+PiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIG1vcmUgU3RhckZpdmUgcmVzZXQgZHJpdmVy
cy4KPj4gCj4+IFRlc3RlZC1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tLm1lcmNpYWlAZ21haWwu
Y29tPgo+PiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21p
bC5kaz4KPj4gU2lnbmVkLW9mZi1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5j
b20+Cj4+IC0tLQo+PiDCoE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4+IMKgZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDggKy0tLS0tLS0KPj4gwqBkcml2ZXJzL3Jlc2V0L01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+PiDCoGRyaXZlcnMvcmVz
ZXQvc3RhcmZpdmUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKysrKysrCj4+
IMKgZHJpdmVycy9yZXNldC9zdGFyZml2ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8
IDIgKysKPj4gwqBkcml2ZXJzL3Jlc2V0L3sgPT4gc3RhcmZpdmV9L3Jlc2V0LXN0YXJmaXZlLWpo
NzEwMC5jIHwgMAo+PiDCoDYgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9yZXNldC9zdGFyZml2ZS9L
Y29uZmlnCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcmVzZXQvc3RhcmZpdmUvTWFr
ZWZpbGUKPj4gwqByZW5hbWUgZHJpdmVycy9yZXNldC97ID0+IHN0YXJmaXZlfS9yZXNldC1zdGFy
Zml2ZS1qaDcxMDAuYyAoMTAwJSkKPj4gCj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTCj4+IGluZGV4IGNhYmEzYjYxYWQ1Yy4uODdmMjEwZTM1N2NhIDEwMDY0NAo+PiAt
LS0gYS9NQUlOVEFJTkVSUwo+PiArKysgYi9NQUlOVEFJTkVSUwo+PiBAQCAtMTk5NDAsNyArMTk5
NDAsNyBAQCBTVEFSRklWRSBKSDcxMDAgUkVTRVQgQ09OVFJPTExFUiBEUklWRVIKPj4gwqBNOglF
bWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+PiDCoFM6CU1haW50YWluZWQK
Pj4gwqBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvc3RhcmZpdmUs
amg3MTAwLXJlc2V0LnlhbWwKPj4gLUY6CWRyaXZlcnMvcmVzZXQvcmVzZXQtc3RhcmZpdmUtamg3
MTAwLmMKPj4gK0Y6CWRyaXZlcnMvcmVzZXQvc3RhcmZpdmUvcmVzZXQtc3RhcmZpdmUtamg3MTAw
LmMKPj4gwqBGOglpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3N0YXJmaXZlLWpoNzEwMC5oCj4+
IMKgCj4+IAo+PiAKPj4gCj4+IMKgU1RBUkZJVkUgSkg3MVhYIFBNVSBDT05UUk9MTEVSIERSSVZF
Ugo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9LY29uZmlnIGIvZHJpdmVycy9yZXNldC9L
Y29uZmlnCj4+IGluZGV4IDZhZTVhYTQ2YTZiMi4uNmFhOGYyNDNiMzBjIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3Jlc2V0L0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9yZXNldC9LY29uZmlnCj4+
IEBAIC0yMzIsMTMgKzIzMiw2IEBAIGNvbmZpZyBSRVNFVF9TT0NGUEdBCj4+IMKgCSAgVGhpcyBl
bmFibGVzIHRoZSByZXNldCBkcml2ZXIgZm9yIHRoZSBTb0NGUEdBIEFSTXY3IHBsYXRmb3Jtcy4g
VGhpcwo+PiDCoAkgIGRyaXZlciBnZXRzIGluaXRpYWxpemVkIGVhcmx5IGR1cmluZyBwbGF0Zm9y
bSBpbml0IGNhbGxzLgo+PiDCoAo+PiAKPj4gCj4+IAo+PiAtY29uZmlnIFJFU0VUX1NUQVJGSVZF
X0pINzEwMAo+PiAtCWJvb2wgIlN0YXJGaXZlIEpINzEwMCBSZXNldCBEcml2ZXIiCj4+IC0JZGVw
ZW5kcyBvbiBBUkNIX1NUQVJGSVZFIHx8IENPTVBJTEVfVEVTVAo+PiAtCWRlZmF1bHQgQVJDSF9T
VEFSRklWRQo+PiAtCWhlbHAKPj4gLQkgIFRoaXMgZW5hYmxlcyB0aGUgcmVzZXQgY29udHJvbGxl
ciBkcml2ZXIgZm9yIHRoZSBTdGFyRml2ZSBKSDcxMDAgU29DLgo+PiAtCj4+IMKgY29uZmlnIFJF
U0VUX1NVTlBMVVMKPj4gwqAJYm9vbCAiU3VucGx1cyBTb0NzIFJlc2V0IERyaXZlciIgaWYgQ09N
UElMRV9URVNUCj4+IMKgCWRlZmF1bHQgQVJDSF9TVU5QTFVTCj4+IEBAIC0zMjAsNiArMzEzLDcg
QEAgY29uZmlnIFJFU0VUX1pZTlEKPj4gwqAJaGVscAo+PiDCoAkgIFRoaXMgZW5hYmxlcyB0aGUg
cmVzZXQgY29udHJvbGxlciBkcml2ZXIgZm9yIFhpbGlueCBaeW5xIFNvQ3MuCj4+IMKgCj4+IAo+
PiAKPj4gCj4+ICtzb3VyY2UgImRyaXZlcnMvcmVzZXQvc3RhcmZpdmUvS2NvbmZpZyIKPj4gwqBz
b3VyY2UgImRyaXZlcnMvcmVzZXQvc3RpL0tjb25maWciCj4+IMKgc291cmNlICJkcml2ZXJzL3Jl
c2V0L2hpc2lsaWNvbi9LY29uZmlnIgo+PiDCoHNvdXJjZSAiZHJpdmVycy9yZXNldC90ZWdyYS9L
Y29uZmlnIgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9NYWtlZmlsZSBiL2RyaXZlcnMv
cmVzZXQvTWFrZWZpbGUKPj4gaW5kZXggM2U3ZTVmZDYzM2E4Li43MTliOGY2Zjg0YmMgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvcmVzZXQvTWFrZWZpbGUKPj4gKysrIGIvZHJpdmVycy9yZXNldC9N
YWtlZmlsZQo+PiBAQCAtMSw2ICsxLDcgQEAKPj4gwqAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wCj4+IMKgb2JqLXkgKz0gY29yZS5vCj4+IMKgb2JqLXkgKz0gaGlzaWxpY29uLwo+
PiArb2JqLSQoQ09ORklHX0FSQ0hfU1RBUkZJVkUpICs9IHN0YXJmaXZlLwo+IAo+IFRoaXMgc2hv
dWxkIHJlYWxseSBiZSBvYmoteSwgb3RoZXJ3aXNlIHRoaXMgd29uJ3QgY29tcGlsZSB3aXRoCj4g
Q09NUElMRV9URVNUPXkgYnV0IEFSQ0hfU1RBUkZJVkU9bi4KPiAKPiBXaXRoIHRoYXQgZml4ZWQs
Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpU
aGUgc2FtZSBwcm9ibGVtIGV4aXN0cyBpbiBkcml2ZXJzL2Nsay9NYWtlZmlsZS4KV2lsbCBmaXgg
dGhlbSBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LgoKQmVz
dCByZWdhcmRzLApIYWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
