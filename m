Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAB9CDC19A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnzCXL6JOSOtStWSmbMIQZ5tQ5qViPf+IFdCiPOIkcA=; b=fTyrnCdZcpIAUg
	0OQq3tpJNPqVIXa6IoHql8xolYDO0dY+T6VMmO62RMp/4TXlWKl4yLavM03y6d4cJJgakhA5RHakn
	petgpvwGJYKIdAKMH8ifZmV+qnpUNiqeDzn250KO3XZjIf9Ll2RmBR1s1CBd42oXusa55Mdlm5qh4
	/woA2d+GrWsfKflgX+7RaXcBg1CBqn5AelsZbkek22N5NC+WExbIUt03oNrijaeD5RtPSk6jznpPY
	/+UAZo7XuZyltcazuWFNw3L88xBk/3odLiRuMRPSmmToZayZrsSpK4kGwFK27/1EeJXTNme8z0/6d
	37ev9IILesuFzL68goKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6qQ-0000000D4As-2QUJ;
	Tue, 06 Jan 2026 13:11:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6qN-0000000D498-0xU6;
	Tue, 06 Jan 2026 13:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E7C144019;
	Tue,  6 Jan 2026 13:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B83DC116C6;
	Tue,  6 Jan 2026 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767705084;
	bh=up2iff1BZxa94kRdGC8JpHKlWbcnvKvXoZYjbXT7JJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9VSxyA6dLZYidFmR3YKrnuiZmFCzcB/BXSKq32qKyENyNq4aYaGeJAl6It6ZWDae
	 fNHETbHe0yBHeHjen+HujqOr71J0UL8kKlDhPZPwBXLp5KOJzvtamRwgbC1dTWtzoU
	 dU8zDzs8a3uCTCqPdqAaHawnWUWhg0/LDiK9aM5Vnv5eyd/YlNschdxUR68oCwFSuq
	 lsb+Yem3dGUbajGYyEcIG1jGg3tb4MFgBauIq1kXi/bjkYNnEjRcZYahTuLaT6sg8S
	 43n3wc587dSole11rjV87w4Lq2gF90tg+wVYlie+AZg/u/3/SL0a3CFyoH3K0toWyp
	 KnseknnkVQXOg==
Date: Tue, 6 Jan 2026 18:41:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
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
Subject: Re: [PATCH 2/2] PCI: dwc: Add multi-port controller support
Message-ID: <5gne3bureusi45sy4zqr2zrfvt4ba4uxgnsfdnjeh2eno5zspe@ldvhq2nilsan>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
 <aVvkmkd5mWPmxeiS@ryzen>
 <m5ukeugo2lazipljqpubyvm7j3xk2j5o7i2xgdbkkhii57xmyk@lh32qdzjhe4n>
 <aVzqMqTUWIuKhgmC@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVzqMqTUWIuKhgmC@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_051127_341934_DAABC5DF 
X-CRM114-Status: GOOD (  43.63  )
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

T24gVHVlLCBKYW4gMDYsIDIwMjYgYXQgMTE6NTU6NDZBTSArMDEwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToKPiBPbiBUdWUsIEphbiAwNiwgMjAyNiBhdCAxMDo0OToxOUFNICswNTMwLCBNYW5pdmFu
bmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAwNSwgMjAyNiBhdCAwNToxOToz
OFBNICswMTAwLCBOaWtsYXMgQ2Fzc2VsIHdyb3RlOgo+ID4gPiBPbiBNb24sIEphbiAwNSwgMjAy
NiBhdCAwNTo1Nzo1NVBNICswNTMwLCBTdW1pdCBLdW1hciB3cm90ZToKPiA+ID4gPiBUaGUgY3Vy
cmVudCBEZXNpZ25XYXJlIFBDSWUgUkMgaW1wbGVtZW50YXRpb24gc3VwcG9ydHMgb25seSB0aGUg
Y29udHJvbGxlcgo+ID4gPiA+IChIb3N0IEJyaWRnZSkgbm9kZSBmb3Igc3BlY2lmeWluZyB0aGUg
Um9vdCBQb3J0IHByb3BlcnRpZXMgaW4gYW4gYXNzdW1wdGlvbgo+ID4gPiA+IHRoYXQgdGhlIHVu
ZGVybHlpbmcgcGxhdGZvcm0gb25seSBzdXBwb3J0cyBhIHNpbmdsZSByb290IFBvcnQgcGVyCj4g
PiA+ID4gY29udHJvbGxlciBpbnN0YW5jZS4gVGhpcyBsaW1pdHMgc3VwcG9ydCBmb3IgbXVsdGkt
cG9ydCBjb250cm9sbGVycyB3aGVyZQo+ID4gPiA+IGRpZmZlcmVudCBwb3J0cyBtYXkgaGF2ZSBk
aWZmZXJlbnQgbGFuZSBjb25maWd1cmF0aW9ucyBhbmQgc3BlZWQgbGltaXRzLgo+ID4gPiA+IAo+
ID4gPiA+IEludHJvZHVjZSBhIHNlcGFyYXRlIGR3X3BjaWVfcG9ydCBzdHJ1Y3R1cmUgdG8gZW5h
YmxlIG11bHRpLXBvcnQgc3VwcG9ydC4KPiA+ID4gPiBFYWNoIFJvb3QgUG9ydCBjYW4gaGF2ZSBp
bmRlcGVuZGVudCBsYW5lIGNvdW50LCBzcGVlZCBsaW1pdCB0aHJvdWdoIHBjaWVATgo+ID4gPiA+
IGNoaWxkIG5vZGVzIGluIGRldmljZSB0cmVlLiBBZGQgZHdfcGNpZV9wYXJzZV9yb290X3BvcnRz
KCkKPiA+ID4gPiBBUEkgdG8gcGFyc2UgdGhlc2UgY2hpbGQgbm9kZXMuCj4gPiA+ID4gCj4gPiA+
ID4gRXF1YWxpemF0aW9uIHByZXNldHMgYW5kIGxpbmsgd2lkdGggZGV0ZWN0aW9uIGN1cnJlbnRs
eSB1c2UgY29tbW9uIERCSQo+ID4gPiA+IHNwYWNlIGZvciBhbGwgdGhlIHJvb3QgcG9ydHMuIFBl
ci1wb3J0IERCSSBzcGFjZSBhc3NpZ25tZW50IGZvciB0aGVzZQo+ID4gPiA+IGZlYXR1cmVzIHdp
bGwgYmUgYWRkZWQgaW4gZnV0dXJlLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFN1
bWl0IEt1bWFyIDxzdW1pdC5rdW1hckBvc3MucXVhbGNvbW0uY29tPgo+ID4gPiAKPiA+ID4gSGVs
bG8gU3VtaXQsCj4gPiA+IAo+ID4gPiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgeW91IHJlcHJlc2Vu
dCB0aGlzIGFzIGEgbGlzdCBvZiBwb3J0cyByYXRoZXIgdGhhbiBhCj4gPiA+IHNpbXBsZSBhcnJh
eT8KPiA+ID4gCj4gPiA+IFRoZSBudW1iZXIgb2YgcG9ydHMgaXMga25vd24gYnkgcGFyc2luZyB0
aGUgZGV2aWNlIHRyZWUsIHNvIGl0IHNob3VsZCBiZQo+ID4gPiBzdGF0aWMsIG5vPwo+ID4gPiAK
PiA+ID4gQXQgbGVhc3QgdG8gbWUsIHRoaXMgc2VlbSBzaW1pbGFyIHRvIGUuZy4gaG93IGEgZ3Bp
b19kZXZpY2UgaGFzIG11bHRpcGxlCj4gPiA+IGdwaW9fZGVzY3JpcHRvcnMgInN0cnVjdCBncGlv
X2Rlc2MgKmRlc2NzIjoKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Js
b2IvbWFzdGVyL2RyaXZlcnMvZ3Bpby9ncGlvbGliLmgjTDY4QzEtTDY4QzI2Cj4gPiA+IAo+ID4g
PiBBIGxpc3QgaXMgdXN1YWxseSB1c2VkIGZvciBzb21ldGhpbmcgdGhhdCBpcyBkeW5hbWljLgo+
ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQgdGhlIG51bWJlciBvZiBwb3J0cyB0byBhIFBDSWUgY29u
dHJvbGxlciB3aWxsIGJlIGR5bmFtaWMuCj4gPiA+IAo+ID4gPiBJIGNhbiBzZWUgdGhhdCBzdHJ1
Y3QgcWNvbV9wY2llIGluIHBjaWUtcWNvbS5jIGhhcyBzdHJ1Y3QgbGlzdF9oZWFkIHBvcnRzLAo+
ID4gPiBidXQgdGhhdCBkb2VzIG5vdCBuZWNlc3NhcmlseSBtZWFuIHRoYXQgd2UgbmVlZCB0byBo
YXZlIGEgbGlzdCBvZiBwb3J0cyBpbgo+ID4gPiBwY2llLWRlc2lnbndhcmUtaG9zdC5jLiAocGNp
ZS1xY29tIGNvdWxkIGFsc28gYmUgbW9kaWZpZWQgdG8gaGF2ZSBhbiBhcnJheQo+ID4gPiBvZiBw
b3J0cyBpZiB0aGVyZSBpcyBhIGRlc2lyZSBmb3Igc2ltaWxhciBkZXNpZ24gcGF0dGVybi4pCj4g
PiA+IAo+ID4gCj4gPiBPbmx5IHJlYXNvbiB3aHkgSSB3ZW50IHdpdGggbGlzdHMgaW4gcGNpZS1x
Y29tIGlzIGZsZXhpYmlsaXR5LiBUaGVyZSBhcmUgdXNlZnVsCj4gPiBoZWxwZXJzIGF2YWlsYWJs
ZSBmb3IgdHJhdmVyc2luZyB0aGUgbGlzdHMgYW5kIHRoZXkgc2VlbSBtdWNoIG1vcmUgZWxlZ2Fu
dCB0bwo+ID4gdXNlIHJhdGhlciB0aGFuIG1hbnVhbGx5IHRyYXZlcnNpbmcgdGhlIGFycmF5IGlu
IEMuCj4gPiAKPiA+IEJ1dCB0byBiZSBmcmFuaywgSSBkb24ndCByZWFsbHkgY2FyZSB3aGljaCBv
bmUgaXMgdXNlZCBhcyB0aGVyZSBpcyBnb2luZyB0byBiZQo+ID4gb25seSBhIGhhbmRmdWwgb2Yg
cG9ydHMgYXQgbWF4IGFueXdheSBhbmQgdGhlcmUgaXMgbm90IG11Y2ggb3ZlcmhlYWQuCj4gCj4g
UGVyc29uYWxseSwgd2hlbiBJIHNlZSBsaXN0cywgSSBhdXRvbWF0aWNhbGx5IHRoaW5rIG9mIHNv
bWV0aGluZyB0aGF0IGlzCj4gZHluYW1pYywgc28gdXNpbmcgbGlzdHMgZm9yIHNvbWV0aGluZyBz
dGF0aWMganVzdCBsb29rcyBhIGxpdHRsZSBiaXQgb3V0IG9mCj4gcGxhY2UgSU1ITy4KPiAKPiBU
ZWNobmljYWxseSwgdGhlIGRpZmZlcmVuY2UgaXMgc3BlZWQuIElmIHdlIHdhbnQgYSBzcGVjaWZp
YyBlbGVtZW50LCB3ZQo+IHdpbGwgbmVlZCB0byB0cmF2ZXJzZSB0aGUgbGlzdC4gV2l0aCBhbiBh
cnJheSwgd2UgY2FuIGFjY2VzcyB0aGUgZWxlbWVudAo+IGRpcmVjdGx5LiBIb3dldmVyLCBsb29r
aW5nIGF0IHRoZSBjdXJyZW50IHBhdGNoLCBpdCBzZWVtcyBsaWtlIGl0IG5ldmVyCj4gbG9va3Mg
Zm9yIGEgc3BlY2lmaWMgcG9ydCwgaXQgYWx3YXlzIGRvZXMgYW4gb3BlcmF0aW9uIGZvciBhbGwg
cG9ydHMuCj4gU28gZnJvbSBhIHNwZWVkIHBlcnNwZWN0aXZlLCBpdCBkb2Vzbid0IG1hdHRlciwg
YXQgbGVhc3Qgbm90IGZvciBub3cuCj4gCgpZZXMuIEkgZG9uJ3QgZW52aXNpb24gdGhlIGRyaXZl
ciBkb2luZyBlbGVtZW50IGJhc2VkIGxvb2t1cCBldmVuIGluIHRoZSBmdXR1cmUuCgo+IAo+IE9u
ZSBhZHZhbnRhZ2UgSSBjYW4gc2VlLCBpbnN0ZWFkIG9mIGRvaW5nOgo+IAo+ICsJc3RydWN0IGR3
X3BjaWVfcG9ydCAqcG9ydCA9IGxpc3RfZmlyc3RfZW50cnkoJnBjaS0+cHAucG9ydHMsCj4gKwkJ
CQkJCXN0cnVjdCBkd19wY2llX3BvcnQsIGxpc3QpOwo+ICsJcmV0dXJuIGR3X3BjaWVfd2FpdF9m
b3JfbGluayhwY2ksIHBvcnQpOwo+IAo+IGZvciBkcml2ZXJzIHdpdGggb25seSBvbmUgcG9ydCAo
bW9zdCBkcml2ZXJzKSwgd2UgY291bGQganVzdCBpbnN0ZWFkIGRvOgo+IAo+ICsJcmV0dXJuIGR3
X3BjaWVfd2FpdF9mb3JfbGluayhwY2ksIHBjaS0+cHAucG9ydCk7Cj4gCj4gVG8gc2ltcGx5IGdl
dCB0aGUgZmlyc3QgZWxlbWVudCBpbiB0aGUgYXJyYXkuIE5vIG5lZWQgdG8gc3ByaW5rbGUKPiBs
aXN0X2ZpcnN0X2VudHJ5KCkgZXZlcnl3aGVyZSBpbiBhbGwgdGhlIGRyaXZlcnMgaWYgdGhleSBq
dXN0IGhhdmUgb25lIHBvcnQuCj4gCj4gCj4gRm9yIGl0ZXJhdGluZywgdG8gYXZvaWQgbWFudWFs
bHkgdHJhdmVyc2luZyB0aGUgYXJyYXksIHdlIGNvdWxkIGRvIGxpa2UKPiBsaWJhdGEgYW5kIGNy
ZWF0ZSBhIHNpbXBsZSBtYWNybywgZS5nLiBhdGFfcWNfZm9yX2VhY2goKToKPiBodHRwczovL2dp
dGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92Ni4xOS1yYzQvZHJpdmVycy9hdGEvbGliYXRh
LWVoLmMjTDg1MS1MODU0Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2Iv
djYuMTktcmM0L2luY2x1ZGUvbGludXgvbGliYXRhLmgjTDE2NTctTDE2NTkKPiAKCkkgc3BlY2lm
aWNhbGx5IGRvIG5vdCB3YW50IHRvIGludHJvZHVjZSBjdXN0b20gaGVscGVycy4gVGhhdCdzIG9u
ZSBvZiBteSBwcmltYXJ5Cm1vdGl2YXRpb24gZm9yIHVzaW5nIGxpc3RzIDopCgo+IEFuZCBhdCBs
ZWFzdCBwZXJzb25hbGx5LCBJIHRoaW5rIG15IGJyYWluIHdpbGwgcGFyc2UgZHdfcGNpZV9wb3J0
X2Zvcl9lYWNoKCkgeyB9Cj4gZmFzdGVyIHRoYW4gaXQgcGFyc2VzIGxpc3RfZm9yX2VhY2hfZW50
cnkocG9ydCwgJnBjaWUtPnBvcnRzLCBsaXN0KSB7IH0sCj4gc2luY2UgaXQgaXMgbW9yZSB1bmlx
dWUsIGJ1dCBwZXJoYXBzIEkgYW0gdGhlIHdlaXJkIG9uZSBoZXJlIDopCj4gCgpBcnJheXMgZm9y
IHN1cmUgd2lsbCBhbGxvdyB1cyB0byBkbyBPKDEpIGxvb2t1cHMsIGJ1dCBjb25zaWRlcmluZyB0
aGF0IHdlIHdpbGwKb25seSBiZSB0cmF2ZXJzaW5nIHRoZSBwb3J0cyBmcm9tIHRoZSBzdGFydCwg
SSBzdGlsbCBwcmVmZXIgdXNpbmcgbGlzdHMuCgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPg
r43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
