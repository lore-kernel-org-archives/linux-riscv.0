Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11060A2615
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcNGsP6m;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=by8wIive
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LM1U6fmZ7jnnXxdoRnp7s7OkQ62g5Ku9BbHW1PaSHG0=; b=jcNGsP6m5/5dLedE79hxSc/AdG
	48S3p8prakeHGYP/K7zUU+wKZoZGkY5Um5p7Btwl58pAdvV4Qp5e1ch5zr60eeEx8NiHJdEQZnNOZ
	fRDbHYdXs4PBI1fT9+pcRSYcE1ZKTOAcAL1IcSoi/tG986qOoVJqZNBWYh7FdIihFDXlS/mhUts+d
	hOakqgSv98SyIBJtcZDWXc2Dfst4NzKh79WRkj8pxbFAyMJF4ES1Zdg6hLtZmHSI96XVmZ4onN5K9
	7IJDCSKR9R1TqlGb269aUC+NS3IqhVl+ExCbV9+jf+d3DzYF6jp9nQyBm8kda0qiG/myj1t0h2NwG
	dJwicBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJF5-00000002QH1-0WcA;
	Mon, 26 Oct 2026 11:51:55 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJF1-00000002QFv-1rcy;
	Mon, 26 Oct 2026 11:51:53 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026115147euoutp02fbdb3f86653841ec23ac907b4075263c~iEhrNO3qA1071610716euoutp02j;
	Mon, 26 Oct 2026 11:51:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026115147euoutp02fbdb3f86653841ec23ac907b4075263c~iEhrNO3qA1071610716euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793015508;
	bh=YinZmgUxjrnzRHvPSk376pdEtqCxovYcrJWpuvmDrIU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=by8wIivew9pTDGPoTkSG52zplLXz983sSizV/qELERWT5oVuqIgfot3/OW9BIxyJY
	 zjI5cpv21ITFG69/U1uaImy/AyfYRmMZu4B7Mvz8fVXbcYDMm3KpeMYKk771I84KLW
	 x3cAa4RB6ZuCbhrkCDU0HDDD8oZEU5jT9jLs0Ptk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026115147eucas1p1d8e71671cd33ce5a03eea64ec83a33b8~iEhq8pjZd2047620476eucas1p1N;
	Mon, 26 Oct 2026 11:51:47 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026115145eusmtip2e7bb4ae4c9084dd2b3cc1944364155c7~iEho0S8Av1075710757eusmtip2l;
	Mon, 26 Oct 2026 11:51:45 +0000 (GMT)
Message-ID: <1e4f872d-6b3c-4091-b570-0a9b0b501773@samsung.com>
Date: Mon, 26 Oct 2026 12:51:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/21] drm/bridge: inno-hdmi: Add .mode_valid
 platform operation
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Vinod Koul
	<vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <6458508.5fSG56mABF@diego>
X-CMS-MailID: 20261026115147eucas1p1d8e71671cd33ce5a03eea64ec83a33b8
X-Msg-Generator: CA
X-RootMTR: 20260929103229eucas1p2e440f2ec00fdf7986eed7597674bf6a9
X-EPHeader: CA
X-CMS-RootMailID: 20260929103229eucas1p2e440f2ec00fdf7986eed7597674bf6a9
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103229eucas1p2e440f2ec00fdf7986eed7597674bf6a9@eucas1p2.samsung.com>
	<20260929-jh7110-clean-send-v5-11-82b4d8e3c6c7@samsung.com>
	<6458508.5fSG56mABF@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_045151_744090_74C41134 
X-CRM114-Status: GOOD (  17.55  )
X-Spam-Score: -3.1 (---)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiA5LzMwLzI2IDEyOjE5LCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiBBbSBEaWVuc3RhZywg
MjkuIFNlcHRlbWJlciAyMDI2LCAxMjozMTowOCBNaXR0ZWxldXJvcMOkaXNjaGUgU29tbWVyemVp
dCBzY2hyaWViIE1pY2hhbCBXaWxjenluc2tpOgo+PiBpbm5vX2hkbWlfYnJpZGdlX21vZGVfdmFs
aWQoKSB2YWxpZGF0ZXMgdGhlIHBpeGVsIGNsb2NrIGFnYWluc3QKPj4gaGRtaS0+cmVmY2xrLCBi
dXQgdGhhdCBjbG9jayBpcyBvcHRpb25hbCBhbmQgaXMgb25seSBwcmVzZW50IG9uCj4+IHBsYXRm
b3JtcyB0aGF0IGRlc2NyaWJlIGEgInJlZiIgY2xvY2suIFBsYXRmb3JtcyB3aGVyZSB0aGUgcGl4
ZWwgY2xvY2sKPj4gaXMgcHJvZHVjZWQgYnkgYSBzZXBhcmF0ZSBkZXZpY2UgLSBzdWNoIGFzIHRo
ZSBTdGFyRml2ZSBKSDcxMTAsIHdob3NlCj4+IFBIWSBpcyBib3RoIHRoZSBjbG9jayBhbmQgdGhl
IFBIWSBwcm92aWRlciAtIGhhdmUgbm8gInJlZiIgY2xvY2ssIHNvCj4+IHRoZSBjaGVjayBpcyBz
a2lwcGVkIGVudGlyZWx5IGFuZCBldmVyeSBtb2RlIGlzIHJlcG9ydGVkIGFzIHZhbGlkLgo+Pgo+
PiBBIG1vZGUgdGhlIHBsYXRmb3JtIGNhbm5vdCBnZW5lcmF0ZSBpcyB0aGVuIGFkdmVydGlzZWQg
dG8gdXNlcnNwYWNlLgo+PiBUaGUgc3Vic2VxdWVudCBtb2Rlc2V0IGFwcGVhcnMgdG8gc3VjY2Vl
ZCwgc2luY2UgdGhlIGF0b21pYyBlbmFibGUgcGF0aAo+PiBjYW5ub3QgZmFpbCwgYW5kIHRoZSBk
aXNwbGF5IHNpbGVudGx5IHN0YXlzIGJsYW5rLgo+Pgo+PiBBZGQgYSAubW9kZV92YWxpZCBwbGF0
Zm9ybSBvcGVyYXRpb24gc28gcGxhdGZvcm1zIGNhbiByZWplY3QgbW9kZXMgdGhleQo+PiBhcmUg
dW5hYmxlIHRvIGRyaXZlLiBQbGF0Zm9ybXMgdGhhdCBkbyBub3QgaW1wbGVtZW50IGl0IGFyZSB1
bmFmZmVjdGVkLgo+Pgo+PiBSZXZpZXdlZC1ieTogSm9zaHVhIFBlaXNhY2ggPGpwZWlzYWNoQHVi
dW50dS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+Cj4gCj4gSW4gcGF0Y2ggMTkgeW91IGFkZCB0aGUgamg3MTEwLWlubm8t
aGRtaS1waHkgdmFyaWFudCBvZiB0aGUgcGh5IHdoaWNoCj4gcmVnaXN0ZXJzIGEgY2xvY2sgcHJv
dmlkZXIgZm9yIHRoZSBwaXhlbCBjbG9jay4gSXNuJ3QgdGhhdCB0aGUgcmVmY2xrIHlvdSdyZQo+
IG1pc3Npbmc/CgpJdCdzIHRoZSBzYW1lIGNsb2NrIHRoZSBjb250cm9sbGVyIGFscmVhZHkgY29u
c3VtZXMsIGV4Y2VwdCBpdCBpcyBub3QKdGhlIHJlZiBjbG9jayBpdCBpcyB0aGUgcGl4ZWwgY2xv
Y2sgYW5kIG9uIHRoZSBKSDcxMTAgdGhvc2UgYXJlIHR3bwpzZXBhcmF0ZSBjbG9ja3MuCgpGcm9t
IFRSTSBbMV0gdGFibGUgNS0zIHBhZ2UgNTMwIGZvciB0aGUgSERNSSBibG9jazoKCnUwX2hkbWlf
dHguY2xrX21jbGsgICA8LSBjbGtfaGRtaXR4MF9tY2xrICAgICA1MS4yIE1Iegp1MF9oZG1pX3R4
LmNsa19iY2xrICAgPC0gY2xrX2hkbWl0eDBfc2NrICAgICAgMTIuOCBNSHoKdTBfaGRtaV90eC5j
bGtfc3lzICAgIDwtIGNsa19kaXNwX2FwYiAgICAgICAgIDUxLjIgTUh6CnUwX2hkbWlfdHguY2xr
X3JlZiAgICA8LSBjbGtfaGRtaV9waHlfcmVmICAgICAyNCBNSHosIGZpeGVkCgphbmQgaW4gdGhl
IFNvdXJjZSBzZWN0aW9uIG9mIHRoZSBzYW1lIHRhYmxlOgoKY2xrX2hkbWl0eDBfcGl4ZWxjbGsg
IDwtIHUwX2hkbWlfdHguY2xrX3BpeCAgIG1heCAyOTcgTUh6CgpTbyBjbGtfcmVmIGlzIGEgZml4
ZWQgMjQgTUh6IGlucHV0LCB3aGlsZSB0aGUgcGl4ZWwgY2xvY2sgaXMgYW4gb3V0cHV0CmZyb20g
dGhlIHNhbWUgYmxvY2ssIHdoaWNoIHZvdXRjcmcgdGhlbiByb3V0ZXMgdG8gdGhlIERDODIwMCBw
aXgwL3BpeDEKTVVYZXMgYW5kIHRoZSBEU0kgVFggY2xrX2RwaS4gQ2FsbGluZyBpdCAicmVmIiB3
b3VsZCBiZSB3cm9uZy4KClRoZXJlIGlzIG90aGVyIHJlYXNvbiBhcyB3ZWxsLiBoZG1pLT5yZWZj
bGsgaXMgZmV0Y2hlZCB3aXRoCmRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKCkgc28gaXQg
c3RheXMgZW5hYmxlZCBmb3IgdGhlIGxpZmV0aW1lCm9mIHRoZSBjb250cm9sbGVyLCBhbmQgaW5p
dF9odygpIHBhc3NlcyBjbGtfZ2V0X3JhdGUocmVmY2xrKSB0bwppbm5vX2hkbWlfaTJjX2luaXQo
KSBmb3IgdGhlIEREQyBkaXZpZGVyLgpBcHBsaWVkIHRvIGEgY2xvY2sgdGhhdCBtb3ZlcyBiZXR3
ZWVuIDI1IGFuZCAyOTcgTUh6IHBlcgptb2RlIGFuZCByZWFkcyBiYWNrIDAgYmVmb3JlIHRoZSBm
aXJzdCBtb2Rlc2V0IHRoZXkgd291bGQgZW5hYmxlIHRoZQpwcmUgUExMIGF0IHByb2JlIGFuZCBj
b21wdXRlIHRoZSBEREMgZGl2aWRlciBmcm9tIGEgbWVhbmluZ2xlc3MgcmF0ZS4KClsxXSAtIGh0
dHBzOi8vZG9jLWVuLnJ2c3BhY2Uub3JnL0pINzExMC9QREYvSkg3MTEwX1RSTV9TdGFyRml2ZV9Q
cmVsaW1pbmFyeV9WMi5wZGYKCgo+IAo+IFRoYW5rcwo+IEhlaWtvCj4gCj4gCj4gCgpCZXN0IHJl
Z2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
