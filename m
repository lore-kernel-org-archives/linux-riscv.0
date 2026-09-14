Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16177C88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 21:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47jqSanRQV/dX8UnGpSyVNC0YWMpgzXm8dtsi9QkWwA=; b=fKn8YWqdNXP1FV
	kUu7qJtFZDk6Ogg8bZ/dV3Ye5rUJrI/1fZ2Ldi3WssSB3/1LKglt4NXs/ZVPWWlyueMLlCV+D48rx
	t2THtC1E6u/AGhWm+FH/F5F7bF/J1XtgUIwYznC3pf2+MnOegkq781j2bwwmWXEbUr94S3moITMU5
	Av/d/uV4oOUySR4gblXbFDQ3J8SMl9guFPvPfzfcOOx4tMunrRFyYcD+jWs4H1WMMt8BtMPyZDVnx
	DFYSSelMmmcHtfAi90icSYAtA6vdtYdW4lx8ZYtDJADiRWRRjY2/rhNeco9dS+CiCJYsEKCeG6YzJ
	7v+5AShiYBsdHZW7dQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EVG-00000004jk9-2BWS;
	Mon, 14 Sep 2026 21:46:18 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EVC-00000004jjF-0v0k;
	Mon, 14 Sep 2026 21:46:16 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260914214607euoutp0298349186b776b9ecf42a4bf0e7f739a9~VTims6U5X2157721577euoutp02a;
	Mon, 14 Sep 2026 21:46:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260914214607euoutp0298349186b776b9ecf42a4bf0e7f739a9~VTims6U5X2157721577euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789422367;
	bh=Y4xIEcssZKWWAvbTH7TLXmgPRORXbepFbz/dh0noRbo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=DBTeMmmWwRxbmdVpM20Nu8zuMdEAEFE+/dOsYDxgSS9crjm3ehe9Ra2pMO1CTwjkp
	 LJzCe4yelf/KotZpTT/jbdq07pxfM6l3YcTDY3WqQJztYNMva+VobG8k87ffGM52eZ
	 grgKhMAQmYnyS8kpgMxdkRkZ5nwuLdFZGx2RVOI4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914214607eucas1p2a107876f411b6812cdcc505d99eb9022~VTimB3gp42703627036eucas1p2x;
	Mon, 14 Sep 2026 21:46:07 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260914214605eusmtip2f9720a98b374ac418c59f98ea4b5c125~VTikOVkOp2978529785eusmtip2r;
	Mon, 14 Sep 2026 21:46:05 +0000 (GMT)
Message-ID: <fba2ac39-fe79-4065-b9f5-8618c449010b@samsung.com>
Date: Mon, 14 Sep 2026 23:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
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
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ap50F4QOw7jbcvI6@monoceros>
X-CMS-MailID: 20260914214607eucas1p2a107876f411b6812cdcc505d99eb9022
X-Msg-Generator: CA
X-RootMTR: 20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada
X-EPHeader: CA
X-CMS-RootMailID: 20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
	<ap50F4QOw7jbcvI6@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_144614_551376_78DB50E2 
X-CRM114-Status: GOOD (  12.73  )
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

CgpPbiA5LzcvMjYgMTA6MjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvIE1pY2hh
ZWwsCj4gCj4gT24gRnJpLCBTZXAgMDQsIDIwMjYgYXQgMDM6Mjc6MTJQTSArMDIwMCwgTWljaGFs
IFdpbGN6eW5za2kgd3JvdGU6Cj4+ICsjaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+
Cj4+IFsuLi5dCj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gCj4gUGxl
YXNlIGRvbid0IGFkZCBpbmNsdWRlcyBmb3IgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPiBhcyBp
dCBpbnRyb2R1Y2VzCj4gbWFueSB1bm5lZWRlZCBidWlsZCBkZXBlbmRlbmNpZXMuIEVpdGhlciBy
ZWx5IG9uCj4gPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPiBwcm92aWRpbmcgb2ZfZGV2aWNlX2lk
IChJTUhPIHByZWZlcnJlZCksIG9yCj4gaW5jbHVkZSA8bGludXgvZGV2aWNlLWlkL29mLmg+IGRp
cmVjdGx5Lgo+IAo+IFRoZSBzYW1lIGFwcGxpZXMgdG8gdHdvIG1vcmUgcGF0Y2hlcyBpbiB0aGlz
IHNlcmllcy4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKClRoYW5rIHlvdSBmb3IgeW91ciByZXZp
ZXcuIFRoaXMgd2lsbCBiZSBmaXhlZCBmb3IgdjQuCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwg
V2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
