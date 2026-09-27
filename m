Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EDBC9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sanpN88azU3loD7QzsVG/RqCF2bYJ5LP22lpqi2pBcA=; b=xU1kJ0W/ZSW5f2
	Vkr5JyDgeGnqT3Gt/Qy5Fr1pGkbw31CgVuq4oTXBQEKT6UpMighXLQ0mEGvim0cMDKVg9AOVAYjcR
	YMxWojeHqE102xghYC0ry1mfDI2feyacyOU1eXiFGYQ3w9E7epPlME1QzOeXh0P8gixT9JX14RD+V
	git0n9WHeVdQdXEof5Q4Y4wBtOj0b9NfeuLtZOTcBvaLZmkp6oEC4yo6CqVCqImy/UclbSelY01fF
	G97yYS6lYjFYjXk3Zm1kBtoyUxm4RXL97nEgeb3hmsZkGrW8WuCtTFXQnaIYYngD7WjUBEmvr0phy
	VC5Srhk6Y2+BQm3lvVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAndc-0000000GHww-1qpB;
	Sun, 27 Sep 2026 12:05:48 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAndY-0000000GHvf-2er4;
	Sun, 27 Sep 2026 12:05:47 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260927120537euoutp019c6217f2f172d5798b71ccad819cde66~ZLAeRpbfb0961109611euoutp01G;
	Sun, 27 Sep 2026 12:05:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260927120537euoutp019c6217f2f172d5798b71ccad819cde66~ZLAeRpbfb0961109611euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790510737;
	bh=XG8+gWff0Kb6xp+rIzHqMb+FVejaqE783kZJda9sveQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GfNjHoD7g834Dcl8ZapG6XaA2n8JLOknTzlw7hqfOTAo9LAYC2MsOnIIDyjT8ZLP2
	 l5hKnOlzHW9ec1yco0+wCoH4olnd4//rBjjAIeXDtkaOcBZYd7z4B8k29ZiShT270L
	 oFgdZaGafVbmpg9ZujF/q9SlESV9rt/e7uROppyI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260927120537eucas1p2940a6c268f23ab72fb7eb581fe0bfee8~ZLAd4yZaM2953129531eucas1p2J;
	Sun, 27 Sep 2026 12:05:37 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260927120535eusmtip28a1a6cb637e2a20e2b9abd75be01ad38~ZLAbod2Iw3245532455eusmtip2F;
	Sun, 27 Sep 2026 12:05:34 +0000 (GMT)
Message-ID: <4b1d51e9-1d83-4ad7-ac60-36de54e57bc2@samsung.com>
Date: Sun, 27 Sep 2026 14:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/20] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Dominique Belhachemi <domibel@debian.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
X-CMS-MailID: 20260927120537eucas1p2940a6c268f23ab72fb7eb581fe0bfee8
X-Msg-Generator: CA
X-RootMTR: 20260915153246eucas1p289987fd8757c89ff865c99b6465708a8
X-EPHeader: CA
X-CMS-RootMailID: 20260915153246eucas1p289987fd8757c89ff865c99b6465708a8
References: <CGME20260915153246eucas1p289987fd8757c89ff865c99b6465708a8@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<20260915-jh7110-clean-send-v4-18-f0e4fd6f2cc8@samsung.com>
	<CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_050545_227780_9E7DC1E5 
X-CRM114-Status: GOOD (  19.87  )
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

SGkgRG9taW5pcXVlLAoKT24gOS8yNi8yNiAwNTozMSwgRG9taW5pcXVlIEJlbGhhY2hlbWkgd3Jv
dGU6Cj4gT24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMTE6MzLigK9BTSBNaWNoYWwgV2lsY3p5bnNr
aQo+IDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Pgo+PiArc3RhdGljIGludCBz
dGFyZml2ZV9oZG1pX3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAr
ewo+PiArICAgICAgIHJldCA9IGNsa19zZXRfcmF0ZShpbm5vLT5waHljbGssIDI5NzAwMDAwMCk7
Cj4+ICsgICAgICAgaWYgKHJldCkgewo+PiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJG
YWlsZWQgdG8gc2V0IGRlZmF1bHQgcmF0ZTogJWRcbiIsIHJldCk7Cj4+ICsgICAgICAgICAgICAg
ICBnb3RvIGVycl9kZWxfY2xrX3Byb3ZpZGVyOwo+PiArICAgICAgIH0KPiAKPiBIaSBNaWNoYWws
Cj4gCj4gQ2FuIHdlIGRyb3AgdGhlc2UgNSBsaW5lcz8KPiBXaGVuIG15IDRLIG1vbml0b3IgY29t
ZXMgdXAgaW4gbW9kZSAoMzg0MHgyMTYwQDMwLCAyOTcgTUh6KSB0aGUgc2NyZWVuCj4gc3RheXMg
YmxhbmsuCj4gCj4gV2hlbiB0aGUgZmlyc3QgcmVhbCBtb2Rlc2V0IHJlcXVlc3RzIGEgbW9kZSB3
aG9zZSBwaXhlbCBjbG9jayBpcyBhbHNvIDI5NyBNSHosCj4gY2xrX3NldF9yYXRlKGhkbWlfcGNs
aywgMjk3MDAwMDAwKSB0aGVuIHNlZXMgY3VyID09IHdhbnQgYW5kIGRvZXMgbm90aGluZy4KPiBT
byB0aGUgcHJlLVBMTCBpcyBuZXZlciBhY3R1YWxseSBwcm9ncmFtbWVkLgo+IAo+IFdpdGhvdXQg
dGhlc2UgNSBsaW5lcyBpbm5vLT5waXhjbG9jayBzdGF5cyAwLAo+IHNvIHRoZSBmaXJzdCBtb2Rl
c2V0J3MgY2xrX3NldF9yYXRlKCkgYWx3YXlzIHJ1bnMgLnNldF9yYXRlKCkgZm9yIHJlYWwuCj4g
Cj4gVG9nZXRoZXIgd2l0aCBteSBmb3Jnb3R0ZW4gZml4IGZyb20gTWF5IHdlIGNhbiBoYXZlIHdv
cmtpbmcgNEtAMzAgb24gdGhlIFZGMi4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NjA1MjgxODQxNDUuMzg0MTE0LTEtZG9taWJlbEBkZWJpYW4ub3JnLwoKWWVhaCwgdGhlc2UgbGlu
ZXMgYXJlIGEgcHJvYmxlbSBpbiBhbm90aGVyIHdheSB0b28uIE1hcmVrIFN6eXByb3dza2kKcmVw
b3J0ZWQgdGhhdCB2NCBoYW5ncyB3aGVuIGV2ZXJ5dGhpbmcgaXMgYnVpbHQgYXMgbW9kdWxlcywg
d2hpY2gKaXMgd2hhdCBtYWRlIG1lIGxvb2sgYXQgdGhlbS4KClRoZSB3cml0ZSBsYW5kcyBpbiBy
ZWdpc3RlcnMgZ2F0ZWQgYnkgdGhlIGNvbnRyb2xsZXIncyBzeXN0ZW0gY2xvY2ssCmluc2lkZSBQ
RF9WT1VUIGFuZCB0aGUgUEhZIGhvbGRzIG5laXRoZXIgLSBpdCBjYW5ub3QgaG9sZCB0aGF0IGNs
b2NrCndpdGhvdXQgY3JlYXRpbmcgYSBwcm9iZSBjeWNsZSB3aXRoIHZvdXRjcmcuIEhpcyBjb25m
aWcgaXMgYXMgZm9sbG93czoKQ09ORklHX0NMS19TVEFSRklWRV9KSDcxMTBfVk9VVD15IHdpdGgg
dGhlIHZvdXQgc3Vic3lzdGVtLCBoZG1pCnN1YnN5c3RlbSwgY29udHJvbGxlciBhbmQgcGh5IGFs
bCBhcyBtb2R1bGVzIHNvIHZvdXRjcmcgaXMgdXAgbG9uZwpiZWZvcmUgdGhlIFBIWSBhcnJpdmVz
IGZyb20gdXNlcnNwYWNlLiBJZiBub3RoaW5nIGlzIGhvbGRpbmcgaGRtaV90eF9zeXMKYnkgdGhl
biAtIGNsa19kaXNhYmxlX3VudXNlZCgpIGdhdGVzIGl0IGF0IGxhdGVfaW5pdGNhbGxfc3luYyAg
YW5kIHRoZQp3cml0ZSB3ZWRnZXMgdGhlIGJ1cy4gSSBjb3VsZCBub3QgcmVwcm9kdWNlIGhpcyBl
eGFjdCBmYWlsdXJlLCBidXQgY291bGQKcmVwcm9kdWNlIHRoaXMgd2l0aCBmd19kZXZsaW5rPW9m
ZiBob3BlZnVsbHkgdGhpcyBpcyBmaXhpbmcgaGlzIGlzc3VlIGFzCndlbGwuCgpBbnl3YXkgdGhp
cyBjb2RlIHdpbGwgYmUgcmVtb3ZlZCBpbiB2NS4KCj4gCj4gQmVzdAo+IC1Eb21pbmlxdWUKPiAK
CkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3Vu
Zy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
