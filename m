Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF78AC624D4
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7kne4Qr1PA1hM+j/Zz3qQDUDEZlL/KMZ7KquqZuhbM=; b=Tb7jFq1W+zie2G
	gKjt3BqqAJqDUGzJHPTKjcCETnzjv+fuWzINQumQ9syOLIprkzCZ5Dg5KMrcdB2kaSIjIKVgEQOtV
	//JCSjSIQG8J4hPCsyWqZ64jntrbaYc+4RVGGwMdH0+Z0lcGkIYJxB2r26q4rE97tEMqFxfBBwr27
	/jgAxVSP/eROVO2YgcPY0P+UOWlwiilK15ZBNOQJM5c+FrpHVBbbzNSyYsO8J/bWmKVjGxwIPQl4I
	cZ8N+Bf8huNP0Y56EohzHJlwvCxa1NBSixu80UMK8R5tf/tSmGKVAC8DhYgLkSFa+4ylZ50024AX2
	ZVk2obAyiVnuDcUzEg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PGf-0000000CJZ9-1ZFw;
	Tue, 01 Sep 2026 14:15:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PGZ-0000000CJXo-3Wol;
	Tue, 01 Sep 2026 14:15:15 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260901141504euoutp02f8cf59604fcc0bb3e97ba307ffda0a3a~ROAEy4Y3I1223512235euoutp02b;
	Tue,  1 Sep 2026 14:15:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260901141504euoutp02f8cf59604fcc0bb3e97ba307ffda0a3a~ROAEy4Y3I1223512235euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788272104;
	bh=2nW3DmaEwtQqmdcgqJ0ClmdaBE1cGoZ7pcvRuf3Yst4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FI9HGXNVyamhN2zlQXR4CDPmMvub+hQK2T7ZBv5DkCgQPnby1w+gTVZUh41hlg+KR
	 5ny8AyyOmQlmxO76627Rk1f6+fa9NHdeszWgDcCUqsh3yBThzUR5IsBAQipbYRojBC
	 INCm0GUIqJFBdpcJ/FMR+S//fjPKiXb3VraxvlOY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260901141504eucas1p156346e8510ccf68f19fc29333c31cfe7~ROAEgxzXG3199331993eucas1p12;
	Tue,  1 Sep 2026 14:15:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260901141502eusmtip277e141767fe1c923ccc834fdf6eb451f~ROACyv4-D1277812778eusmtip20;
	Tue,  1 Sep 2026 14:15:02 +0000 (GMT)
Message-ID: <b41f260d-2308-4853-8d3b-22cba534e4e2@samsung.com>
Date: Tue, 1 Sep 2026 16:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
To: Icenowy Zheng <uwu@icenowy.me>, Vinod Koul <vkoul@kernel.org>, Neil
	Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner
	<heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maudspierings@gocontroll.com>, Graham Markall <hello@big-grey.co.uk>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <e0e0c41c4c6b0b674c4cfc3b6927d60c40fbf733.camel@icenowy.me>
X-CMS-MailID: 20260901141504eucas1p156346e8510ccf68f19fc29333c31cfe7
X-Msg-Generator: CA
X-RootMTR: 20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa
X-EPHeader: CA
X-CMS-RootMailID: 20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa@eucas1p2.samsung.com>
	<20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
	<e0e0c41c4c6b0b674c4cfc3b6927d60c40fbf733.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_071512_479710_316627F0 
X-CRM114-Status: GOOD (  22.61  )
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

CgpPbiA4LzI4LzI2IDE2OjA2LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+IOWcqCAyMDI2LTA4LTI4
5LqU55qEIDE1OjQ3ICswMjAw77yMTWljaGFsIFdpbGN6eW5za2nlhpnpgZPvvJoKPj4gQWN0aXZh
dGUgdGhlIGRpc3BsYXkgc3Vic3lzdGVtIGJ5IGFkZGluZyB0aGUgZGM4MjAwLCBoZG1pIGFuZCB2
b3V0Y3JnCj4+IG5vZGVzIGFzIGRpcmVjdCBzb2MgY2hpbGRyZW4uIEVhY2ggcmVmZXJlbmNlcyB0
aGUgUERfVk9VVCBwb3dlcgo+PiBkb21haW4KPj4gdGhyb3VnaCBwb3dlci1kb21haW5zLCBzbyBn
ZW5wZCBwb3dlcnMgdGhlIGRvbWFpbiBvbiBkZW1hbmQsIGFuZCB0aGUKPj4gSERNSS1QSFkgLT4g
dm91dGNyZyAtPiBIRE1JLWNvbnRyb2xsZXIgcHJvYmUgb3JkZXIgaXMgcmVzb2x2ZWQgYnkKPj4g
ZGVmZXJyZWQgcHJvYmUuCj4+Cj4+IFRoZSBtb25vbGl0aGljIGhkbWkgbm9kZSBpcyBtb2RlbGxl
ZCBhcyBhIGNvbnRhaW5lciB3aXRoIGhkbWlfcGh5Cj4+IGFuZCBoZG1pX2NvbnRyb2xsZXIgY2hp
bGRyZW4uIFRoaXMgbGV0cyB0aGUgUEhZIChjbG9jayBwcm92aWRlciwKPj4gZGVwZW5kaW5nIG9u
bHkgb24geGluMjRtKSBhbmQgdGhlIGNvbnRyb2xsZXIgKGNsb2NrIGNvbnN1bWVyKSBwcm9iZQo+
PiBpbmRlcGVuZGVudGx5LCBicmVha2luZyB0aGUgY2lyY3VsYXIgY2xvY2sgZGVwZW5kZW5jeSB3
aXRoIHZvdXRjcmcuCj4+Cj4+IHZvdXRjcmcgY29uc3VtZXMgdGhlIHBpeGVsIGNsb2NrIGZyb20g
dGhlICZoZG1pX3BoeSBub2RlIGluc3RlYWQgb2YKPj4gdGhlCj4+IG9sZCBmaXhlZC1jbG9jaywg
YW5kIGRjODIwMCBnZXRzIGl0cyBwaXhlbCBjbG9ja3MgZnJvbSB2b3V0Y3JnJ3MKPj4gTVVYZXMK
Pj4gYW5kIGlzIG1hcmtlZCBkbWEtbm9uY29oZXJlbnQgZm9yIGZyYW1lYnVmZmVyIERNQS4gVGhl
IG9sZCwgaW5jb3JyZWN0Cj4+IGhkbWl0eDAtcGl4ZWwtY2xvY2sgZml4ZWQtY2xvY2sgbm9kZSBp
cyByZW1vdmVkLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IERvbWluaXF1ZSBCZWxoYWNoZW1pIDxk
YkBkb21pYmVsLmRlPgo+PiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlxdWUgQmVsaGFjaGVtaSA8ZGJA
ZG9taWJlbC5kZT4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5
bnNraUBzYW1zdW5nLmNvbT4KPj4gKwkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4+ICsJ
CSNjbG9jay1jZWxscyA9IDwwPjsKPj4gKwkJY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsK
Pj4gKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gInhpbjI0bSI7Cj4+ICsJfTsKPj4gKwo+PiAgCXNv
YyB7Cj4+ICAJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4+ICAJCWludGVycnVwdC1wYXJl
bnQgPSA8JnBsaWM+Owo+PiBAQCAtMTE5OSwyMiArMTIwMCw5MiBAQCBjc2lfcGh5OiBwaHlAMTk4
MjAwMDAgewo+PiAgCQkJI3BoeS1jZWxscyA9IDwwPjsKPj4gIAkJfTsKPj4gIAo+PiArCQlkYzgy
MDA6IGRpc3BsYXlAMjk0MDAwMDAgewo+PiArCQkJY29tcGF0aWJsZSA9ICJ2ZXJpc2lsaWNvbixk
YyI7Cj4+ICsJCQlyZWcgPSA8MHgwIDB4Mjk0MDAwMDAgMHgwIDB4MjgwMD47Cj4+ICsJCQlpbnRl
cnJ1cHRzID0gPDk1PjsKPj4gKwkJCWRtYS1ub25jb2hlcmVudDsKPj4gKwo+PiArCQkJcG93ZXIt
ZG9tYWlucyA9IDwmcHdyYyBKSDcxMTBfUERfVk9VVD47Cj4+ICsKPj4gKwkJCWNsb2NrcyA9IDwm
dm91dGNyZwo+PiBKSDcxMTBfVk9VVENMS19EQzgyMDBfQ09SRT4sCj4+ICsJCQkJPCZ2b3V0Y3Jn
Cj4+IEpINzExMF9WT1VUQ0xLX0RDODIwMF9BWEk+LAo+PiArCQkJCTwmdm91dGNyZwo+PiBKSDcx
MTBfVk9VVENMS19EQzgyMDBfQUhCPiwKPj4gKwkJCQk8JnZvdXRjcmcKPj4gSkg3MTEwX1ZPVVRD
TEtfREM4MjAwX1BJWDA+LAo+PiArCQkJCTwmdm91dGNyZwo+PiBKSDcxMTBfVk9VVENMS19EQzgy
MDBfUElYMT47Cj4+ICsJCQljbG9jay1uYW1lcyA9ICJjb3JlIiwgImF4aSIsICJhaGIiLCAicGl4
MCIsCj4+ICJwaXgxIjsKPj4gKwo+PiArCQkJcmVzZXRzID0gPCZ2b3V0Y3JnCj4+IEpINzExMF9W
T1VUUlNUX0RDODIwMF9DT1JFPiwKPj4gKwkJCQkgPCZ2b3V0Y3JnCj4+IEpINzExMF9WT1VUUlNU
X0RDODIwMF9BWEk+LAo+PiArCQkJCSA8JnZvdXRjcmcKPj4gSkg3MTEwX1ZPVVRSU1RfREM4MjAw
X0FIQj47Cj4+ICsJCQlyZXNldC1uYW1lcyA9ICJjb3JlIiwgImF4aSIsICJhaGIiOwo+PiArCQl9
Owo+PiArCj4+ICsJCWhkbWlfc3Vic3lzdGVtOiBoZG1pQDI5NTkwMDAwIHsKPj4gKwkJCWNvbXBh
dGlibGUgPSAic3RhcmZpdmUsamg3MTEwLWhkbWktCj4+IHN1YnN5c3RlbSI7Cj4+ICsJCQlyZWcg
PSA8MHgwIDB4Mjk1OTAwMDAgMHgwIDB4NDAwMD47Cj4+ICsKPj4gKwkJCS8qCj4+ICsJCQkgKiBU
aGlzIE1GRCdzIFBIWSBjaGlsZCBpcyB0aGUgZmlyc3QgZGV2aWNlCj4+IGluIHRoZSB2b3V0Cj4+
ICsJCQkgKiByZWdpb24gdG8gdG91Y2ggcmVnaXN0ZXJzLCBzbyBpdCBvd25zIHRoZQo+PiBOb0Mg
ZGlzcGxheQo+PiArCQkJICogYnVzIGNsb2NrICsgcmVzZXQgdGhhdCBnYXRlIGFjY2VzcyB0byB0
aGUKPj4gcmVnaW9uLgo+PiArCQkJICogUERfVk9VVCBpcyBwb3dlcmVkIG9uIGJ5IGdlbnBkIHZp
YSBwb3dlci0KPj4gZG9tYWlucy4KPj4gKwkJCSAqLwo+PiArCQkJcG93ZXItZG9tYWlucyA9IDwm
cHdyYyBKSDcxMTBfUERfVk9VVD47Cj4+ICsJCQljbG9ja3MgPSA8JnN5c2NyZwo+PiBKSDcxMTBf
U1lTQ0xLX05PQ19CVVNfRElTUF9BWEk+Owo+PiArCQkJcmVzZXRzID0gPCZzeXNjcmcKPj4gSkg3
MTEwX1NZU1JTVF9OT0NfQlVTX0RJU1BfQVhJPjsKPiAKPiBJIHRoaW5rIHRoZSBOT0MgY2xvY2tz
L3Jlc2V0cyBzaG91bGQgYmUgYWxzbyBuZWVkZWQgYnkgdGhlIERDODIwMAo+IGVpdGhlcj8KPiAK
PiBBbHRob3VnaCBwYXRjaGluZyB0aGUgREM4MjAwIGRyaXZlciB0byBhZGQgc3VwcG9ydCBmb3Ig
dGhlc2UKPiBjbG9ja3MvcmVzZXRzIGxvb2tzIGEgbGl0dGxlIGRpcnR5Li4uCj4gCj4gTWF5YmUg
aXQncyBzdGlsbCBnb29kIHRvIGhhdmUgYSB2b3V0IHN1YnN5cyBpbnN0ZWFkIG9mIGEgaGRtaSBz
dWJzeXMuLi4KClllYWggdGhhdCB3YXMgdGhlIGlkZWEgYXMgaXQgd2FzIG1vZGVsaW5nIGhhcmR3
YXJlIGNvcnJlY3RseSwgaG93ZXZlcgppbmRpcmVjdGx5IGl0IHdvcmtzIHRoYW5rcyB0byB0aGUg
cHJvYmluZyBvcmRlci4gVGhlIHByb2JsZW0gd2l0aCB0aGUKZXh0cmEgdm91dCBzdWJzeXMgYXMg
c2hvd24gaW4gdGhlIFJGQyB3YXMgdGhhdCBhbiBleHRyYSBkcml2ZXIgYW5kIGV4dHJhCmR0LWJp
bmRpbmcgd2VyZSBuZWVkZWQgd2hpY2ggc2VlbWVkIHRvIGNvbXBsaWNhdGUgdGhpbmdzIGEgYml0
LiBCdXQgaXQKZG9lcyBzZWVtIG1vcmUgY29ycmVjdCBpbiBhIHNlbnNlIHRoYXQgaXQncyBtb2Rl
bGluZyB0aGUgcmVsYXRpb25zaGlwCmNvcnJlY3RseSBzbyBJJ2xsIGJyaW5nIGl0IGJhY2sgZm9y
IHYzLgoKCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lA
c2Ftc3VuZy5jb20+Cgo+IAo+IFRoYW5rcywKPiBJY2Vub3d5Cj4gCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
