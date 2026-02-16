Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B75E81A36
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 15:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or6T2PdxYcq6y0GWrohR8HvXPhkL15MDSlcPaqKbR9s=; b=zoNxpfHojUb4MG
	zanSVweXD3orjZU7oJGzM1CfwwRzc3bLDmxTItQxv6SDEfdHg4xZUM28U0RfTezQcYRsaQJquPXII
	F6o8yLk9FWasb8Y1QLU80rYfqTrX4uOR7AXA4mRFcsUlEGg6Jg4twdJxq90DBWJGZIxLLT3q+NJwp
	Xl8m9gDVNBbZtQexz1ca9aHQZ6RLk1MFhcMFPP0gNFafwP2eRaOaZJYb7QtVpZLVuqcbsiFVTwhRx
	YXnh0znUJCw7A9UGvF5Lhth64/B0XN50PRgHXUc6CM/ZHAiFq2YaNoAljr2HKGkfXAKp1waWWceFs
	3p56+QDJLSefd6UIDLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0QU-00000006sfW-3NLh;
	Mon, 16 Feb 2026 15:22:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0QR-00000006sex-3rVk;
	Mon, 16 Feb 2026 15:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19E4043815;
	Mon, 16 Feb 2026 15:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B5FC116C6;
	Mon, 16 Feb 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771255335;
	bh=+AXEKgqENXU9fJ8gY4Qy3D4BbMROQCeB1cT+WULKFsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVke98TKQHCmPp7aYCSq+FzJJwd1N7cDuLhGNulVsi3kDISO5a7AJFBm3a7kNw1Zs
	 5Iw5iKyil96Yjb2kaa996XtcP99USdiZnGFwboQyf93SxLti2oOp6RGusQa6tt0bF4
	 0vFtMznN3MpwWhSDzdS8LxrL4xOzXYaj2wJ8GWUrAJQmsxB/Oz7vODRYewD2J5wMOt
	 n/r6PbRevelbv2CgDMGB0hBJqf0/kttTTaqCaKmPDvRwbv46S7eNobKjhJZnoznYuD
	 xBCbX73IzTj1XGCShRVaUjJ2yNu4RTgdTUiUhws1iLJYbGP9PhfuNu3gDI2EgmCiUz
	 8W3J0k0Pz4V9A==
Date: Mon, 16 Feb 2026 20:51:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] PCI: API changes for multi-port controller support
Message-ID: <qoz2odrfe5w47ibjskg2fa3bkgtqd3ctkqqeua446sfjrc2e2m@tg4vynyonu3r>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_072215_995208_D4D71168 
X-CRM114-Status: GOOD (  19.00  )
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

T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDU6NTc6NTRQTSArMDUzMCwgU3VtaXQgS3VtYXIgd3Jv
dGU6Cj4gRm9yIG11bHRpLXBvcnQgY29udHJvbGxlcnMsIGVxdWFsaXphdGlvbiBwcmVzZXQgcHJv
cGVydGllcyBzaG91bGQgYmUKPiBzcGVjaWZpZWQgaW4gaW5kaXZpZHVhbCByb290IHBvcnQgbm9k
ZXMgcmF0aGVyIHRoYW4gdGhlIGNvbnRyb2xsZXIgbm9kZSwKCnMvcm9vdCBwb3J0L1Jvb3QgUG9y
dAoKLSBNYW5pCgo+IGFsbG93aW5nIGVhY2ggcG9ydCB0byBoYXZlIGl0cyBvd24gY29uZmlndXJh
dGlvbi4KPiAKPiBDaGFuZ2Ugb2ZfcGNpX2dldF9lcXVhbGl6YXRpb25fcHJlc2V0cygpIHRvIGFj
Y2VwdCBhIGRldmljZV9ub2RlIHBvaW50ZXIuCj4gVGhpcyBhbGxvd3MgcGFyc2luZyBlcXVhbGl6
YXRpb24gcHJlc2V0cyBmcm9tIGFueSBkZXZpY2UgdHJlZSBub2RlLAo+IHdoaWNoIGlzIG5lZWRl
ZCBmb3IgbXVsdGktcG9ydCBQQ0llIGNvbnRyb2xsZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN1
bWl0IEt1bWFyIDxzdW1pdC5rdW1hckBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBkcml2ZXJz
L3BjaS9vZi5jICB8IDYgKysrKy0tCj4gIGRyaXZlcnMvcGNpL3BjaS5oIHwgMiArKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wY2kvb2YuYyBiL2RyaXZlcnMvcGNpL29mLmMKPiBpbmRleCAzNTc5MjY1
ZjExOTg0NTYzN2UxNjNkOTA1MTQzN2M4OTY2Mjc2MmY4Li5kMDllZmY0MGI1MjNjOTIwYzljYTNl
YWE2NGY3ODQ3NjViM2M1YmY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL29mLmMKPiArKysg
Yi9kcml2ZXJzL3BjaS9vZi5jCj4gQEAgLTk3MSw2ICs5NzEsNyBAQCBFWFBPUlRfU1lNQk9MX0dQ
TChvZl9wY2lfZ2V0X3Nsb3RfcG93ZXJfbGltaXQpOwo+ICAgKiBvZl9wY2lfZ2V0X2VxdWFsaXph
dGlvbl9wcmVzZXRzIC0gUGFyc2VzIHRoZSAiZXEtcHJlc2V0cy1OZ3RzIiBwcm9wZXJ0eS4KPiAg
ICoKPiAgICogQGRldjogRGV2aWNlIGNvbnRhaW5pbmcgdGhlIHByb3BlcnRpZXMuCj4gKyAqIEBu
b2RlOiBEZXZpY2UgdHJlZSBub2RlIGNvbnRhaW5pbmcgdGhlIHByb3BlcnRpZXMuCj4gICAqIEBw
cmVzZXRzOiBQb2ludGVyIHRvIHN0b3JlIHRoZSBwYXJzZWQgZGF0YS4KPiAgICogQG51bV9sYW5l
czogTWF4aW11bSBudW1iZXIgb2YgbGFuZXMgc3VwcG9ydGVkLgo+ICAgKgo+IEBAIC05ODEsNiAr
OTgyLDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwob2ZfcGNpX2dldF9zbG90X3Bvd2VyX2xpbWl0KTsK
PiAgICogZXJybm8gb3RoZXJ3aXNlLgo+ICAgKi8KPiAgaW50IG9mX3BjaV9nZXRfZXF1YWxpemF0
aW9uX3ByZXNldHMoc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCQkJICAgIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqbm9kZSwKPiAgCQkJCSAgICBzdHJ1Y3QgcGNpX2VxX3ByZXNldHMgKnByZXNldHMsCj4g
IAkJCQkgICAgaW50IG51bV9sYW5lcykKPiAgewo+IEBAIC05ODgsNyArOTkwLDcgQEAgaW50IG9m
X3BjaV9nZXRfZXF1YWxpemF0aW9uX3ByZXNldHMoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJaW50
IHJldDsKPiAgCj4gIAlwcmVzZXRzLT5lcV9wcmVzZXRzXzhndHNbMF0gPSBQQ0lfRVFfUkVTVjsK
PiAtCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTE2X2FycmF5KGRldi0+b2Zfbm9kZSwgImVxLXBy
ZXNldHMtOGd0cyIsCj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UxNl9hcnJheShub2RlLCAi
ZXEtcHJlc2V0cy04Z3RzIiwKPiAgCQkJCQkgcHJlc2V0cy0+ZXFfcHJlc2V0c184Z3RzLCBudW1f
bGFuZXMpOwo+ICAJaWYgKHJldCAmJiByZXQgIT0gLUVJTlZBTCkgewo+ICAJCWRldl9lcnIoZGV2
LCAiRXJyb3IgcmVhZGluZyBlcS1wcmVzZXRzLThndHM6ICVkXG4iLCByZXQpOwo+IEBAIC05OTgs
NyArMTAwMCw3IEBAIGludCBvZl9wY2lfZ2V0X2VxdWFsaXphdGlvbl9wcmVzZXRzKHN0cnVjdCBk
ZXZpY2UgKmRldiwKPiAgCWZvciAoaW50IGkgPSAwOyBpIDwgRVFfUFJFU0VUX1RZUEVfTUFYIC0g
MTsgaSsrKSB7Cj4gIAkJcHJlc2V0cy0+ZXFfcHJlc2V0c19OZ3RzW2ldWzBdID0gUENJX0VRX1JF
U1Y7Cj4gIAkJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiZXEtcHJlc2V0cy0lZGd0cyIs
IDggPDwgKGkgKyAxKSk7Cj4gLQkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91OF9hcnJheShkZXYt
Pm9mX25vZGUsIG5hbWUsCj4gKwkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91OF9hcnJheShub2Rl
LCBuYW1lLAo+ICAJCQkJCQlwcmVzZXRzLT5lcV9wcmVzZXRzX05ndHNbaV0sCj4gIAkJCQkJCW51
bV9sYW5lcyk7Cj4gIAkJaWYgKHJldCAmJiByZXQgIT0gLUVJTlZBTCkgewo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BjaS9wY2kuaCBiL2RyaXZlcnMvcGNpL3BjaS5oCj4gaW5kZXggMzRmNjVkNjk2
NjJlOWY2MWYwYzQ4OWVjNThkZTJjZTE3ZDIxYzBjNi4uNzJmYTZkYjk1YjhhNzVmNmU2OWI4MDE5
ZDFlYjIyNjJiNmE0NmMxMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9wY2kuaAo+ICsrKyBi
L2RyaXZlcnMvcGNpL3BjaS5oCj4gQEAgLTk2NSw2ICs5NjUsNyBAQCB2b2lkIHBjaV9yZWxlYXNl
X2J1c19vZl9ub2RlKHN0cnVjdCBwY2lfYnVzICpidXMpOwo+ICBpbnQgZGV2bV9vZl9wY2lfYnJp
ZGdlX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlk
Z2UpOwo+ICBib29sIG9mX3BjaV9zdXBwbHlfcHJlc2VudChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
KTsKPiAgaW50IG9mX3BjaV9nZXRfZXF1YWxpemF0aW9uX3ByZXNldHMoc3RydWN0IGRldmljZSAq
ZGV2LAo+ICsJCQkJICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgCQkJCSAgICBzdHJ1
Y3QgcGNpX2VxX3ByZXNldHMgKnByZXNldHMsCj4gIAkJCQkgICAgaW50IG51bV9sYW5lcyk7Cj4g
ICNlbHNlCj4gQEAgLTEwMTMsNiArMTAxNCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBvZl9wY2lf
c3VwcGx5X3ByZXNlbnQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiAgfQo+ICAKPiAgc3RhdGlj
IGlubGluZSBpbnQgb2ZfcGNpX2dldF9lcXVhbGl6YXRpb25fcHJlc2V0cyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gKwkJCQkJCSAgc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ICAJCQkJCQkgIHN0
cnVjdCBwY2lfZXFfcHJlc2V0cyAqcHJlc2V0cywKPiAgCQkJCQkJICBpbnQgbnVtX2xhbmVzKQo+
ICB7Cj4gCj4gLS0gCj4gMi4zNC4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+N
IOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
