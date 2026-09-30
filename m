Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94A7CA5FBA
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mU5/INscHSDhCM2fE3M9eyBOYF7G/VbL7/AfNuzRvfM=; b=sekHBXSDSvQFh4
	qe2jgbWT22MzSFKi2NDfmAgus0ZIwUAm786bOLCZWA+40bT7aABlv7mKGUtcE9Lvfdz0csIJSA8Wj
	ZCUyrCvXMsG8awRr4hCoXPZd7fqVk/SNLVn9VT7RMUezVwiRxwdaSyrewwaGizL84pFvXo6anoxe1
	mkOqGrmP54JzNl+E49ltkyur+6ShdzIo/vZj8v9hhrnAtlMTDzO6pPeDEwh1iqjLXWBT3l/BjaUAK
	vTq3MQ5hm1rhfit+m84j5JoVqFPAaQzX4JsqVe5dOzeuwXN6X05HdpwWQjjRcb1KLkoHFwzw+g2nj
	0n0RmQnsLXCv3NqfvQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLQ-00000005ha2-00mZ;
	Wed, 30 Sep 2026 10:15:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLC-00000005hTN-48id;
	Wed, 30 Sep 2026 10:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YnX8T7gNfbhjxb0T3bPJtC5F74MskXCpLp0g/w+uC24=; b=PFyDfeMpH3GUhceUzHw8U6vjAh
	+pbimKosYpwiYpvqRSM8M8KN56UH2sqmTDbnFapdjJVHOp1fqBOnur+Lq4UUVq+KoUuvepT7ROP8l
	W+ETNPOdDvQGYoEJRltDdow6dAxHod9nEPbkT5oHk620Dvoklk6LCrWULUK5pFAQQI/Y3Wwqo1K4t
	DY8rk8c75iARF1onE5Mrz50GrmP6TWheIvLczRGHW2ndTxeJL6Nqi80JM1sKbRZe7UPprm47ssp82
	JrJ3dKTNZkTEDiqE8GpJ5GCQoFHRLTKq+a99oe7T1w88Uc/RboWIz5Vcko5fJlxps2Peq9bgQeRu4
	SeCqz2Dg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrKw-00000003dEA-44f0;
	Wed, 30 Sep 2026 10:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YnX8T7gNfbhjxb0T3bPJtC5F74MskXCpLp0g/w+uC24=; b=aZGZGfJGrtsB20BtlHvOPFQKSe
	AZVuyaf4pho61ToIbowX2dFtcUR1oOw8x7uPdS14NJadzDDQ2RLI69MhxozNFa1H4KsLGCx8j55Q3
	dMhTWz1qQTyilGbZZPovjP9NLeuLpRHDeI/8xmfvrD85DXGbXfChVP30VXyK0J6q3aA/gpMWZeLj5
	fHO6cXX6d32eZ8cyOVsKMB0/6LBq9lD19lVRLXTT9RebJUybRmZV0Tf/SCokesG1QZsavYz4AqY43
	MgRXkJdKSjJ9IUdwOzH2f9FhaEksRgk6PswKV+l7pnz/7VyAAO3LlNHjkC4gSXpdwgEPUgFaR+Bm+
	oPVV8jjg==;
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
Subject: Re: [PATCH v5 18/21] phy: rockchip: inno-hdmi: Use the common Innosilicon PHY
 helpers
Date: Wed, 30 Sep 2026 12:14:31 +0200
Message-ID: <7069377.kQq0lBPeGt@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103243eucas1p25abf97a357cfae14640092e35fe479fc@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111507_291030_6CC28679 
X-CRM114-Status: GOOD (  13.46  )
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

QW0gRGllbnN0YWcsIDI5LiBTZXB0ZW1iZXIgMjAyNiwgMTI6MzE6MTUgTWl0dGVsZXVyb3DDpGlz
Y2hlIFNvbW1lcnplaXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPiBUaGUgUkszMzI4IHBy
ZS1QTEwgcHJvZ3JhbW1pbmcsIGl0cyB0YWJsZSBsb29rdXAgYW5kIGl0cyByZWNhbGNfcmF0ZSBh
bmQKPiBkZXRlcm1pbmVfcmF0ZSBpbXBsZW1lbnRhdGlvbnMgYXJlIHRoZSBnZW5lcmljIElubm9z
aWxpY29uIG9uZXMsIHNvIGRyb3AKPiB0aGUgbG9jYWwgY29waWVzIGFuZCB1c2UgdGhlIHNoYXJl
ZCBoZWxwZXJzIGluc3RlYWQuCj4gCj4gVGhlIFJLMzIyOCBwcmUtUExMIHNpdHMgYXQgZGlmZmVy
ZW50IHJlZ2lzdGVyIGFkZHJlc3Nlcywgc28gaXQga2VlcHMgaXRzCj4gb3duIHJlZ2lzdGVyIGxl
dmVsIGNvZGUgYW5kIG9ubHkgc2hhcmVzIHRoZSB0YWJsZSBsb29rdXAuCj4gCj4gVGhlIG5vdyB1
bnVzZWQgUkszMzI4IHByZS1QTEwgcmVnaXN0ZXIgbWFjcm9zIGdvIHdpdGggaXQsIGFzIGRvZXMg
dGhlCj4gbG9jYWwgcHJlLVBMTCBjb25maWcgbG9va3VwIHdyYXBwZXI7IGJvdGggY2FsbCBzaXRl
cyBhbHJlYWR5IGhhdmUgdGhlCj4gVE1EUyBjbG9jayB0byBoYW5kIGFuZCBjYWxsIGlubm9faGRt
aV9waHlfcHJlX3BsbF9sb29rdXAoKSBkaXJlY3RseS4KPiAKPiBUaGUgUkszMzI4IHJlY2FsY19y
YXRlIHVzZWQgdG8gbG9nIHRoZSBwcmUtUExMIG91dHB1dCBhcyAidmNvIi4gVGhlCj4gc2hhcmVk
IGhlbHBlciBsb2dzIGl0IHRvbywgYW5kIHJlcG9ydHMgdGhlIGFjdHVhbCBWQ08gZnJlcXVlbmN5
Cj4gYWxvbmdzaWRlIHRoZSByYXRlLCB3aGljaCBpcyB0aGUgdmFsdWUgd2l0aCB0aGUgMS40LTMu
MiBHSHogY29uc3RyYWludC4KPiAKPiBUaGUgcmVnaXN0ZXIgd3JpdGVzLCB0aGVpciBvcmRlciBh
bmQgdGhlIHZhbHVlcyB3cml0dGVuIGFyZSB1bmNoYW5nZWQuCj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UgaW50ZW5kZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hhb3lpIENoZW4gPGNoYW95aS5j
aGVuQHJvY2stY2hpcHMuY29tPgoKUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0Bz
bnRlY2guZGU+CgpPbmx5IHRoaW5nIEkgY2Fubm90IHJlYWxseSBtYWtlIHVwIG15IG1pbmQgYWJv
dXQsIGlzIGlmIHRoaXMgYW5kIHRoZQpwcmV2aW91cyBwYXRjaCBzaG91bGQgYmUgbWVyZ2VkICgi
bW92ZSBjb21tb24gY29kZSBmcm9tIHJvY2tjaGlwCnZhcmlhbnQgdG8gc2hhcmVkIGhlbHBlciIp
LgoKQXMgSSBzYWlkLCBjYW4ndCByZWFsbHkgZGVjaWRlIHdoYXQgd291bGQgYmUgdGhlIGJldHRl
ciBzb2x1dGlvbiA7LSkgLgoKCkhlaWtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
