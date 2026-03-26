Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C6410A88D4
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9cZ92/G1S28vZpRr3fwtpeAjasC8D0J5uVy1OM2oVs=; b=2oFvaDxRPI+I3j
	Whzi7P6pVGkoYmYBvLzcwg557pvCtB0mxGU6aOUMdd3t2NO1a5j27/1K7l643Nk5CZgoLQcwB+76P
	awI6DgPGdOf70g21NXMoK90sY2wOEVFvYXBYLE0Mc68reJ6Z8NNZqO4tYc+OrxoMrfuK2DnuRjoDm
	tcA5NtANHGjiezIT9IKrrGSq79sFFYLo26kAZR3C202OUjzKqdggH/zLZV55bHUP/jGBnyAi6MV7J
	2fHqt4AiaxqoY7LsgKAff0SZK2gnrD+eYMLAMeP61nNVUrx6ZumarKGDZq8TwRTGltLcdLrNuO8GJ
	DkdG8Ze5gQmaID65fWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o13-00000005trr-36va;
	Thu, 26 Mar 2026 16:57:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o12-00000005trD-0ZXD;
	Thu, 26 Mar 2026 16:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 043036011F;
	Thu, 26 Mar 2026 16:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC2C116C6;
	Thu, 26 Mar 2026 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774544222;
	bh=tr+9fNAQNqGsuZCPn0EwTdspBeuzqbTTR89MFy19qdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stOtUva7Sd7FQSWNmcGkhGLZugI5j7Fu2CtWbWqq0feqBH45KJVj1SwSgjEtshfuA
	 u3XZes7NQeWH3mSRD0/1aqabnAxICLFxr028HePUwdbgtDlohLqz83XgB24EIwd+qj
	 iddlTgjMFbQfNG3wepAs+pEMfZbkgg0qKGvcrzkPcUtVZwC4QD9tWWFqzoHk1si/Bz
	 +GdPkwh4nzND9/SezB+7Zf5LDO9RAnXAqPmaPLhzUTamcxe/+8pIVwc288cmxAMrAu
	 W/yFu9VJhOcGYgL+3t2hCwnspKUbtsy6CetHnzGSHNpFoF4i4woC/hpijnDmE97JpU
	 DPDCLIctgg4IQ==
Date: Thu, 26 Mar 2026 22:26:42 +0530
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
Subject: Re: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Message-ID: <nokpoxfotjlirqs735sse3f5copimqwmd7fblegrcozkmpkgae@6bw6u3qazbme>
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
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

T24gVGh1LCBNYXIgMDUsIDIwMjYgYXQgMTE6NTA6MzVBTSArMDUzMCwgU3VtaXQgS3VtYXIgd3Jv
dGU6Cj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBtdWx0aS1wb3J0IFBDSWUgY29udHJv
bGxlcnMgaW4gdGhlIERlc2lnbldhcmUKPiBkcml2ZXIuIEN1cnJlbnRseSwgdGhlIGRyaXZlciBv
bmx5IHN1cHBvcnRzIGEgc2luZ2xlIFJvb3QgUG9ydCB3aXRoCj4gY29udHJvbGxlci1sZXZlbCBw
cm9wZXJ0aWVzLCB3aGljaCBkb2Vzbid0IHdvcmsgZm9yIG11bHRpLXBvcnQgY29udHJvbGxlcnMK
PiB3aGVyZSBlYWNoIHBvcnQgbWF5IGhhdmUgZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zLgo+IAo+
IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgYSBwZXItcG9ydCBzdHJ1Y3R1cmUgYW5kIHBhcnNpbmcg
QVBJIHRoYXQgYWxsb3dzIAo+IGVhY2ggUm9vdCBQb3J0IHRvIGJlIGNvbmZpZ3VyZWQgaW5kZXBl
bmRlbnRseSB2aWEgcGNpZUBOIGNoaWxkIG5vZGVzIGluCj4gZGV2aWNlIHRyZWUsIHdoaWxlIG1h
aW50YWluaW5nIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyAKPiBzaW5nbGUt
cG9ydCBiaW5kaW5ncy4KPiAKClRoaXMgcGF0Y2ggdG91Y2hlcyBtdWx0aXBsZSBob3N0IGNvbnRy
b2xsZXIgZHJpdmVycy4gSSdkIGFwcHJlY2lhdGUgaWYgdGhlCnBsYXRmb3JtIG1haW50YWluZXJz
IGNvdWxkIHRlc3QgdGhpcyBzZXJpZXMgYW5kIGdpdmUgdGhlaXIgdGVzdGVkLWJ5IHRhZyB0byBt
YWtlCnN1cmUgd2UgZG9uJ3QgcmVncmVzcy4KCi0gTWFuaQoKPiBTaWduZWQtb2ZmLWJ5OiBTdW1p
dCBLdW1hciA8c3VtaXQua3VtYXJAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gRml4IGVycm9yIGNvZGUgcHJlc2VydmF0aW9uIGluIGR3X3BjaWVfcmVzdW1lX25v
aXJxKCkgdG8gcmV0dXJuIGFjdHVhbAo+ICAgZXJyb3IgZnJvbSBkd19wY2llX3dhaXRfZm9yX2xp
bmsoKSBpbnN0ZWFkIG9mIGhhcmRjb2RlZCAtRVRJTUVET1VUIChNYW5pKS4KPiAtIEluaXRpYWxp
emUgcmV0IHZhcmlhYmxlIHRvIC1FTk9FTlQgaW4gZHdfcGNpZV9wYXJzZV9yb290X3BvcnRzKCkg
KE1hbmkpLgo+IC0gZHdfcGNpZV9ob3N0X2luaXQoKTogUmVtb3ZlIC1FTk9FTlQgZXJyb3Igc2tp
cHBpbmcgdG8gbWFrZSBwYXJzaW5nCj4gICBmYWlsdXJlcyBmYXRhbCBmb3Igbm93LCBhZGQgVE9E
TyBjb21tZW50IGFib3V0IG1ha2luZyBwcm9wZXJ0aWVzCj4gICBvcHRpb25hbCBsYXRlciAoTWFu
aSkuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMTA1LWR0
LXBhcnNlci12MS0wLWIxMWM2M2NiNWUyY0Bvc3MucXVhbGNvbW0uY29tCj4gCj4gLS0tCj4gU3Vt
aXQgS3VtYXIgKDIpOgo+ICAgICAgIFBDSTogQVBJIGNoYW5nZXMgZm9yIG11bHRpLXBvcnQgY29u
dHJvbGxlciBzdXBwb3J0Cj4gICAgICAgUENJOiBkd2M6IEFkZCBtdWx0aS1wb3J0IGNvbnRyb2xs
ZXIgc3VwcG9ydAo+IAo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktZXh5bm9zLmMg
ICAgICAgICAgIHwgICA0ICstCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2
LmMgICAgICAgICAgICAgfCAgMTUgKy0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
LW1lc29uLmMgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtZGVzaWdud2FyZS1ob3N0LmMgfCAxNzUgKysrKysrKysrKysrKysrKysrLS0tLQo+ICBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuYyAgICAgIHwgIDMyICsr
LS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmggICAgICB8
ICAxNyArKy0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jICAgICAg
ICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWludGVsLWd3
LmMgICAgICAgIHwgIDEzICstCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNv
bS1jb21tb24uYyAgICAgfCAgIDUgKy0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1xY29tLWVwLmMgICAgICAgICB8ICAgNCArLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLXFjb20uYyAgICAgICAgICAgIHwgICA0ICstCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaWUtcmNhci1nZW40LmMgICAgICAgfCAgMTMgKy0KPiAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1zcGVhcjEzeHguYyAgICAgICB8ICAgNSArLQo+ICBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMgICAgICAgIHwgICA0ICstCj4gIGRyaXZl
cnMvcGNpL29mLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAg
ZHJpdmVycy9wY2kvcGNpLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
Cj4gIDE2IGZpbGVzIGNoYW5nZWQsIDIzMiBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkK
PiAtLS0KPiBiYXNlLWNvbW1pdDogMDk3YTZjMzM2ZDAwODA3MjVjNjI2ZmRhMTE4ZWNmZWM0NDhh
Y2QwZgo+IGNoYW5nZS1pZDogMjAyNTEwMTAtZHQtcGFyc2VyLTk4YjUwY2UxOGZjMQo+IAo+IEJl
c3QgcmVnYXJkcywKPiAtLSAKPiBTdW1pdCBLdW1hciA8c3VtaXQua3VtYXJAb3NzLnF1YWxjb21t
LmNvbT4KPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/
4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
