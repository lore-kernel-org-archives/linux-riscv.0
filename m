Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F074C88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhr64vWuFR6UiA0XyF/j8/ap7NPtnlaVl8s8AVpKVNE=; b=1150MwTGgAkROs
	70i20XAmmFZY45JXVfH0rcdi/yvHCBrVu6As1njRQeedWFxfTRSvbFp8MXHbsh/YRLYnD3ZglqSaZ
	Ja6UOIHnjwkmAb6/ebCeOW7IvzTtaBEgynSgPeshiITG5mzoma9itJSpDXVI7lWoGT3CaBc9MRFm/
	/Vr0Y43jKF10ZYVG/Gd1YpwHcAzG6/EtFIoD52c78CVzyp8oUDrPFgd9398lnCiW+v7M7nT3m7THA
	/RslPyVOShoUP3cUcJstOVQzhAbqZmDaZOM8qEDmWE8awuw9u8hTWGKvqN6BqD2e2Fu7DWaL3HZLS
	kVMy/GcG6u2JvShPnJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68wc-00000004DUJ-2Zzp;
	Mon, 14 Sep 2026 15:50:10 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68wZ-00000004DTR-2l6A;
	Mon, 14 Sep 2026 15:50:09 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260914155005euoutp024857e7c81b11d5fa43dd19719ba10c24~VOrvnkiwZ2332323323euoutp02q;
	Mon, 14 Sep 2026 15:50:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260914155005euoutp024857e7c81b11d5fa43dd19719ba10c24~VOrvnkiwZ2332323323euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789401005;
	bh=PG34NheEGUUklmbyGFWYH3mof2VB5KJYIWGOux9Ay9A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=B0aPZ9smvU/W3vvxmV5yAM2Ch3FcHIHY/3mfNFpS9oQ99QhxWXbYADiggA+iaBKMX
	 fwhPEzKL7GeEg9ncES+hJrw4lapRIImw5Q7M1TBAKBr+qQfLiMhaaBMFYW5Q3887Ok
	 Gu6F9PZ9ipRUXQfKhJM8CbHNPb8Wb0Ut3yRW0p/A=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914155004eucas1p298df2ff60a38fa5dc11e23802962b7f3~VOru0bBrZ2376623766eucas1p29;
	Mon, 14 Sep 2026 15:50:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260914155002eusmtip115f5f2e6e07eb44713898bdf244ca8e7~VOrsrfT6w0990109901eusmtip1F;
	Mon, 14 Sep 2026 15:50:02 +0000 (GMT)
Message-ID: <4ba79aa9-6a21-41f6-a088-98207d32a098@samsung.com>
Date: Mon, 14 Sep 2026 17:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] drm: starfive: jh7110: Enable display
 subsystem
To: Dominique Belhachemi <domibel@debian.org>, Maud Spierings
	<maud_spierings@murena.io>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp
	Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal
	Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Andy
	Yan <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Graham
	Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAAvaLCzU_-JdPHSSQS2HxGnrkRk+u_QOZ91SmxcC+nouubCtXA@mail.gmail.com>
X-CMS-MailID: 20260914155004eucas1p298df2ff60a38fa5dc11e23802962b7f3
X-Msg-Generator: CA
X-RootMTR: 20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915
X-EPHeader: CA
X-CMS-RootMailID: 20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915
References: <CGME20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<ea529e06-2eab-4e3b-92af-ba17de44091c@murena.io>
	<CAAvaLCzU_-JdPHSSQS2HxGnrkRk+u_QOZ91SmxcC+nouubCtXA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_085007_960719_2DAA809A 
X-CRM114-Status: GOOD (  20.79  )
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

CgpPbiA5LzYvMjYgMDU6NTUsIERvbWluaXF1ZSBCZWxoYWNoZW1pIHdyb3RlOgo+IE9uIFNhdCwg
U2VwIDUsIDIwMjYgYXQgMToyMeKAr0FNIE1hdWQgU3BpZXJpbmdzIDxtYXVkX3NwaWVyaW5nc0Bt
dXJlbmEuaW8+Cj4gd3JvdGU6Cj4gCj4+IEhlbGxvIE1pY2hhbCwKPj4KPj4gVGhpcyBuZXcgdmVy
c2lvbiBhZGRlZCBzb21lIG1vcmUgaXNzdWVzIG9uIG15IGZtbDEzdjAxIGJvYXJkLCB0aGlzIHRp
bWUKPj4gMiByZWdpc3RlcnMgaW4gdGhlIFZPVVRfQ1JHIGFyZSBtaXNjb25maWd1cmVkIHRoYXQg
d2VyZSBjb3JyZWN0IGluIHYyLAo+PiBuYW1lbHk6Cj4+Cj4+IDB4Mjk1YzAwMDQgd2FzIDB4MDAw
MDAwMDQgb24gdGhlIHByZXZpb3VzIHZlcnNpb24gYnV0IGlzIG5vdyAweDAwMDAwMDA2Cj4+IDB4
Mjk1YzAwMWMgd2FzIDB4ODEwMDAwMDAgb24gdGhlIHByZXZpb3VzIHZlcnNpb24gYnV0IGlzIG5v
dyAweDgwMDAwMDAwCj4+Cj4+IHh4MDQgc2V0cyBhIHNsaWdodGx5IGRpZmZlcmVudCBjbG9jayBk
aXZpZGVyLCBidXQgaXQgZG9lc24ndCBzZWVtIHRvCj4+IG1hdHRlciwgZGlzcGxheSBhbHNvIHdv
cmtzIHdpdGggdGhpcyBjaGFuZ2VkIHZhbHVlLgo+Pgo+PiB4eDFjIHNlZW1zIHRvIHNlbGVjdCB0
aGUgd3JvbmcgY2xvY2sgbXV4Pwo+Pgo+PiBBZnRlciBjb3JyZWN0aW5nIDB4Mjk1YzAwMWMgKGFu
ZCB0aGUgb25lcyB0aGF0IEkgbWVudGlvbmVkIGJlZm9yZSBpbiB0aGUKPj4gaGRtaXR4IGJsb2Nr
KSwgdGhlIGRpc3BsYXkgY29tZXMgdG8gbGlmZSBhZ2Fpbi4KPj4KPj4gTm90IHN1cmUgd2h5IHRo
ZXNlIGFyZSBjaGFuZ2VkLgo+Pgo+PiBTYW1lIGhlcmUgb24gYSBWaXNpb25GaXZlIDIuIFRoZSBk
YzgyMDBfcGl4MCBtdXggcmVnaXN0ZXIgKDB4Mjk1YzAwMWMpCj4gY29tZXMgdXAgMHg4MDAwMDAw
MCBpbnN0ZWFkIG9mIDB4ODEwMDAwMDAgKHdoaWNoIHNlbGVjdHMgaGRtaXR4MF9waXhlbGNsawo+
IGZyb20gdGhlIFBIWSkuCj4gCj4gdjMgYWRkZWQgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5UIHRv
IHN0b3AgY2xrX3NldF9yYXRlKCkgZnJvbSBzaWxlbnRseQo+IHN3aXRjaGluZyB3aGljaCBjbG9j
ayBmZWVkcyB0aGUgZGlzcGxheSwgYnV0IG5vdGhpbmcgdGhlbiBhc3NpZ25zIHRoZQo+IHBhcmVu
dCwKPiBzbyBpdCBpcyBsZWZ0IG9uIHdoYXRldmVyIHRoZSBib290bG9hZGVyIHNlbGVjdGVkLgo+
IAo+IFlvdSBjb3VsZCBwaW4gdGhlIHR3byBwaXhlbC1jbG9jayBtdXhlcyB0byB0aGUgSERNSSBQ
SFksIGlzIHRoYXQgYWNjZXB0YWJsZT8KPiAKPiBkYzgyMDA6IGRpc3BsYXlAMjk0MDAwMDAgewo+
ICAgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZ2b3V0
Y3JnCj4gSkg3MTEwX1ZPVVRDTEtfREM4MjAwX1BJWDA+LAo+ICAgKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2b3V0Y3JnCj4gSkg3MTEwX1ZPVVRDTEtf
REM4MjAwX1BJWDE+Owo+ICAgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXNzaWduZWQt
Y2xvY2stcGFyZW50cyA9IDwmaGRtaV9waHk+LAo+IDwmaGRtaV9waHk+Owo+IH07Cj4gCj4gSSB0
ZXN0ZWQgdGhpcyBvbiB0aGUgdmYyLgoKVGhhbmsgeW91IE1hdWQgYW5kIERvbWluaXF1ZSwKCgpJ
J3ZlIHRlc3RlZCB0aGlzIGFzIHdlbGwgYW5kIGl0IGRvZXMgc2VlbSBsaWtlIGEgZ29vZCBmaXgs
IHdpbGwgaW5jbHVkZQp0aGlzIGluIGEgdjQuCgo+IAo+IEJlc3QKPiAtRG9taW5pcXVlCj4gCgpC
ZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
