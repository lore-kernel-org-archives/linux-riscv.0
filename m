Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAE4CA5FBA
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HlvE88d0odNr306qMXmwQ/RtS3x4ouhJtEkFIqtqOI=; b=zYRGqVj7qWdH7N
	XVYRO2SErGLPUYY+kaaRw2RT8bxbfAC7cHkGNyc9LbUCNn5ADh8Dztv/iq56G3zGt3XTQ+pW3sGNa
	v+tlGxs7cnkGcFHlY30Ad3M0qev/SF3LUPxC7LaELvqbJc2fJVb3YRFpgRMxdoL/88+/zUxcvC/pZ
	Ak3yU0JmHPFkiwtBWm+PdFWdcaNPQWGKchu5wpdD6LfvAuL0RiG2cclWMF8+ZPpC1V0le6cmcsYly
	IREJKzkOYDfdl/UsPnY1hzXwPioN6E3R6Z0b3cwSycdCOd48FWPnTw/PrAr6lxGjJ7HP9mpDithZe
	/f+geLsWoZYdlWOm4AAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrPq-00000005jn4-1zHN;
	Wed, 30 Sep 2026 10:19:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrPe-00000005jju-2qQt;
	Wed, 30 Sep 2026 10:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jJeVTal18ZboXas5TlF0vpQa6AGU2gJphl8DkP+LlWE=; b=IefxlXqZ3F0hn9gV3v56G+U05y
	1DGNXxCp8HTu7aYwbC0F6nk2OCeioqjdyZFs8d63QWKp89j8zJeAG3Dqks5bbUVcV2vXBfWcqTgJN
	oUJTt7yBPTxfIVgI7WBf8iZ1uaHYCEBy1KwbgAm0wZIWT6/5ldDohbO+PJPaxecY+vFi/iq9W2Nbv
	4vXCZeVFTd+Xrf7m0l6wv2Q6QvujzPhDYI/PuZ8nbyW8UJOzUhZfnmiFfUxSK3HYqhtjFVVjRbfqI
	7FgSE0SfPMMOSFfjDgfUNSrdJ8jcKbzY646X8Zm9c8qLviIHoXuI3QHnnHSfKcLhJqBzOVfklqY/W
	6JZXLhEQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrPb-00000003dqU-2g5E;
	Wed, 30 Sep 2026 10:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jJeVTal18ZboXas5TlF0vpQa6AGU2gJphl8DkP+LlWE=; b=nNpZ6W6XiB5Nc5MTJcyBWGCqKX
	j6cKBfoDGI+MQo2ik+/teJHWq5My68+4ohp1EICY2XTXxoETiH5RxSOIKaYz5uwcM2Eb2A+uPeipm
	QtiyW5CYiCyIOjPZjqLy4HMSFCTKcm+EzdZJnODlw2RsZjvDgJHfSxa7PpiFtye5E6XNoebW9dP78
	6uUC/gndnqMIgVFE4+oAywabv8gajwt1ppnkUA3FIlsNkAi6R1bp+oKw0mNfy9CP0lRaOjC3YVk8b
	ILpDVJhvdbWddVOiV9r2YTk4kjdnK/cZdlOkTuSBdboUBH+YFGOedYVL25tTLbaShqPw/irPKUBjb
	1nRJGHOQ==;
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
Subject: Re: [PATCH v5 11/21] drm/bridge: inno-hdmi: Add .mode_valid platform
 operation
Date: Wed, 30 Sep 2026 12:19:15 +0200
Message-ID: <6458508.5fSG56mABF@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-11-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103229eucas1p2e440f2ec00fdf7986eed7597674bf6a9@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-11-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111944_024402_33F84A6E 
X-CRM114-Status: GOOD (  14.48  )
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

QW0gRGllbnN0YWcsIDI5LiBTZXB0ZW1iZXIgMjAyNiwgMTI6MzE6MDggTWl0dGVsZXVyb3DDpGlz
Y2hlIFNvbW1lcnplaXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPiBpbm5vX2hkbWlfYnJp
ZGdlX21vZGVfdmFsaWQoKSB2YWxpZGF0ZXMgdGhlIHBpeGVsIGNsb2NrIGFnYWluc3QKPiBoZG1p
LT5yZWZjbGssIGJ1dCB0aGF0IGNsb2NrIGlzIG9wdGlvbmFsIGFuZCBpcyBvbmx5IHByZXNlbnQg
b24KPiBwbGF0Zm9ybXMgdGhhdCBkZXNjcmliZSBhICJyZWYiIGNsb2NrLiBQbGF0Zm9ybXMgd2hl
cmUgdGhlIHBpeGVsIGNsb2NrCj4gaXMgcHJvZHVjZWQgYnkgYSBzZXBhcmF0ZSBkZXZpY2UgLSBz
dWNoIGFzIHRoZSBTdGFyRml2ZSBKSDcxMTAsIHdob3NlCj4gUEhZIGlzIGJvdGggdGhlIGNsb2Nr
IGFuZCB0aGUgUEhZIHByb3ZpZGVyIC0gaGF2ZSBubyAicmVmIiBjbG9jaywgc28KPiB0aGUgY2hl
Y2sgaXMgc2tpcHBlZCBlbnRpcmVseSBhbmQgZXZlcnkgbW9kZSBpcyByZXBvcnRlZCBhcyB2YWxp
ZC4KPiAKPiBBIG1vZGUgdGhlIHBsYXRmb3JtIGNhbm5vdCBnZW5lcmF0ZSBpcyB0aGVuIGFkdmVy
dGlzZWQgdG8gdXNlcnNwYWNlLgo+IFRoZSBzdWJzZXF1ZW50IG1vZGVzZXQgYXBwZWFycyB0byBz
dWNjZWVkLCBzaW5jZSB0aGUgYXRvbWljIGVuYWJsZSBwYXRoCj4gY2Fubm90IGZhaWwsIGFuZCB0
aGUgZGlzcGxheSBzaWxlbnRseSBzdGF5cyBibGFuay4KPiAKPiBBZGQgYSAubW9kZV92YWxpZCBw
bGF0Zm9ybSBvcGVyYXRpb24gc28gcGxhdGZvcm1zIGNhbiByZWplY3QgbW9kZXMgdGhleQo+IGFy
ZSB1bmFibGUgdG8gZHJpdmUuIFBsYXRmb3JtcyB0aGF0IGRvIG5vdCBpbXBsZW1lbnQgaXQgYXJl
IHVuYWZmZWN0ZWQuCj4gCj4gUmV2aWV3ZWQtYnk6IEpvc2h1YSBQZWlzYWNoIDxqcGVpc2FjaEB1
YnVudHUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+CgpJbiBwYXRjaCAxOSB5b3UgYWRkIHRoZSBqaDcxMTAtaW5uby1oZG1p
LXBoeSB2YXJpYW50IG9mIHRoZSBwaHkgd2hpY2gKcmVnaXN0ZXJzIGEgY2xvY2sgcHJvdmlkZXIg
Zm9yIHRoZSBwaXhlbCBjbG9jay4gSXNuJ3QgdGhhdCB0aGUgcmVmY2xrIHlvdSdyZQptaXNzaW5n
PwoKVGhhbmtzCkhlaWtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
