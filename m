Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A1ECA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxYJa3NkKpG4Vum98wqWSJYLFG3IVDZZKJNKWhtAqCc=; b=gdQd9qYt72w7PE
	h0CKl/mT6K3rh8GYamgLVPcydLUWeO3ut2A4/cGjLM+GQhUoAqc0gvEFQZ6hsGp2gzzLHTFiSjwOD
	6/vFVsXXd+tWh+ZTCLW8m6oKg3gcKn7onZJH535krUEOsHMngaFlVvQJP6+1Gsw7CFkvxwiDldp3d
	aeAd0Ahkj0z3FwHZqEHO7QGsvMAHVJ59wxBbcmtT99YIn6fBKfaAApH9o9iMoSfy2eyHlUV19X/WA
	KH2ag7zHyfgfxtauOMbYXTTtVR2XAu8kI6BhCrQP6Jej1xPEwx57Lm3I+4waAu2INa3mlrEXc7Rs/
	gWwwMXpPav/OS005VRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrIU-00000005glM-3Pmw;
	Wed, 30 Sep 2026 10:12:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrIS-00000005gk0-0RkV;
	Wed, 30 Sep 2026 10:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e2EiqEtrZ1QVkcER2vy49AcVi3JCtBleuVlk1SuHSqo=; b=dApBVEqQ3Zj/y8iVK+Ak9kZrvm
	7uhqTNvm4GP2v86I+gKeaIw+WSSP+knR2eHTB83CEM29XGBIaYiRfLQgnf5Mb4y979km0f+y54NUy
	Lkfas+H5XC5HebCxmVI6enCYsKMswafOxTlVYNfXXQ8mEsIOaCOm0oLKZPqirNrDy8WgD7BreZPFk
	e88PjHYCQAIHYN8oeM88vJi0BzAuPCVD+0nwjbLn7Kde8SLhzwS+AuNBfeVtGlJ4+qwjFUnI999Xm
	F8q9iJAbe4qk5GOkbNDjDvAI+z86rYZyC3XC/Qm/a0DlhVdCteTmIi5r8Wg2DO5NWJk3DRqmlnbcZ
	qzqXGmsw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrIO-00000003cvk-25Md;
	Wed, 30 Sep 2026 10:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e2EiqEtrZ1QVkcER2vy49AcVi3JCtBleuVlk1SuHSqo=; b=R7PSEE70K/QFTnGHB9WIW4gzJc
	1ylFt7T+MWYG5qEfkLdhthKgNWTrT0nMsJQ79ejoq6nXfOfR4GVRmY+EeEVUoZvG1iPZ1D17prYHL
	0RXzRYXPYHt3EtkXtzTzpWKTrW+EMq0gKFLJaDDtzPL/h3RRwNowfSnX7h3l4DVifWlXY6I4uf1A7
	1JEG90bi/jOCwWqixhWUnR743rng4WyQwfovKgU9x20lDMqrtqCLBCepb23bfEcSa52gqMHn2pLqe
	mDE2tnd1KVAsFMIOZjOBNjEKl8qxry72aGveQPMyTUdx7bOEmXmUkCryFovVt2jDg8GcmHtQT8jTb
	liz/qjGQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v5 17/21] phy: Add common Innosilicon HDMI PHY helpers
Date: Wed, 30 Sep 2026 12:11:50 +0200
Message-ID: <5147655.PYKUYFuaPT@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-17-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103241eucas1p27d80c31d14062ea876a2c16ddbd71e3a@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-17-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111216_772933_74F3C2D1 
X-CRM114-Status: GOOD (  10.69  )
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

QW0gRGllbnN0YWcsIDI5LiBTZXB0ZW1iZXIgMjAyNiwgMTI6MzE6MTQgTWl0dGVsZXVyb3DDpGlz
Y2hlIFNvbW1lcnplaXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPiBUaGUgSW5ub3NpbGlj
b24gSERNSSBQSFkgSVAgaXMgdXNlZCBieSBzZXZlcmFsIFNvQ3MuIFRoZXkgZGlmZmVyIGluCj4g
d2hlcmUgdGhlIFBIWSByZWdpc3RlciBibG9jayBzaXRzIGluIHRoZSByZWdpc3RlciBzcGFjZSBh
bmQgaW4gd2hpY2gKPiBwaXhlbCBjbG9ja3MgdGhleSBzdXBwb3J0LCBidXQgdGhlIHByZS1QTEwg
cHJvZ3JhbW1pbmcgc2VxdWVuY2UgYW5kIHRoZQo+IGxheW91dCBvZiBpdHMgcmVnaXN0ZXJzIGFy
ZSB0aGUgc2FtZS4KPiAKPiBBZGQgYSBzbWFsbCBsaWJyYXJ5IGhvbGRpbmcgdGhhdCBzaGFyZWQg
cGFydDogdGhlIHByZS1QTEwgY29uZmlndXJhdGlvbgo+IHRhYmxlIGZvcm1hdCwgYSBsb29rdXAs
IGNsa19vcHMgZGV0ZXJtaW5lX3JhdGUgYW5kIHJlY2FsY19yYXRlIGhlbHBlcnMsCj4gYW5kIHRo
ZSBwcmUtUExMIHJlZ2lzdGVyIHByb2dyYW1taW5nLiBDYWxsZXJzIHBhc3MgYSByZWdtYXAsIGEg
cmVnaXN0ZXIKPiBvZmZzZXQgZm9yIHRoZSBQSFkgYmxvY2ssIGFuZCB0aGVpciBvd24gcGl4ZWwg
Y2xvY2sgdGFibGUuCj4gCj4gTm8gZHJpdmVyIHVzZXMgaXQgeWV0OyB0aGUgdXNlcnMgYXJlIGNv
bnZlcnRlZCBzZXBhcmF0ZWx5Lgo+IAo+IFJldmlld2VkLWJ5OiBDaGFveWkgQ2hlbiA8Y2hhb3lp
LmNoZW5Acm9jay1jaGlwcy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEpvc2h1YSBQZWlzYWNoIDxqcGVp
c2FjaEB1YnVudHUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+CgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtv
QHNudGVjaC5kZT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
