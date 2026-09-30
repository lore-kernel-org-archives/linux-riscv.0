Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BF7CA5FBE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nkcq3oTLlmOTEWFzjlbc5Ay89jGHXIyVifwcx8KMUD0=; b=Sddf8+7tMQzazh
	RYprboQUtdJzuaA+zPDr/0YVVzLwgYyM5SDKb4kpzh2JTyUFG6Pyex0tUlGVdAIP0ockK+nf1G7SK
	02CFgMf4Bk46N+l+0eH7PfBlhSoHgN9yDDKar6FSXt77Ga4pTSXaB90blkZR9iQamPbqZw3BcBd0e
	wGcD0s3WkbOnLiBjlm6N4ig04gkwNpezn+86PITSsbevSa1VPpiekEx2lVf8SuhWDYk4szefWMFi6
	1aT7cGd33fb8pZcukKPM4thh+FLFRZG2rnWlkGhmkZ/C3zmVxIZgEIU5cze5puOqoMCWeD92CRP8A
	3blYLlhdkO/PBKUvez3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrEH-00000005ftg-39Qb;
	Wed, 30 Sep 2026 10:08:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrEE-00000005frw-0pKc;
	Wed, 30 Sep 2026 10:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SHJ8hA6cabe4Iy/NBsVsa6CmVruqC9L/5DF3S0RW1vM=; b=eGdlbMWQKzvcgAr9rF59gzttIy
	jXONQXqjCqmZb+u+8sNnSDDe5skaRKLMeyYQoUIIkcy6HJUOWKNlnI7ksYql+vlBiLdcgvzrogEv7
	PLBHtKCRmBsZXFFKy40faSAFGvnWPQTXnBnb+4Kvof8aib58IF1z6yOIjhq2BNvYszN69p1CBsYzr
	eXQX1glxoZF+RH85bDcvcAhFgnRWk+sCqNOQsRCfT+464eRQhiEpILP9h9pCqQUnd/Eo1HmscTBTL
	7RSQnrYdBIabM4vgGm5f8uMlKOKwx5/emEh6AH8Jjb46UsVtYJqp2q8LV8ZDgqVm/Dnl8V0SRwsQW
	gVUsPr4Q==;
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
Subject: Re: [PATCH v5 10/21] drm/bridge: inno-hdmi: Add .disable platform operation
Date: Wed, 30 Sep 2026 12:07:35 +0200
Message-ID: <14018012.nUPlyArG6x@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-10-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103227eucas1p1a8ef8d6ebb77a6f2cca192e8bc0b4e1c@eucas1p1.samsung.com>
 <20260929-jh7110-clean-send-v5-10-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_030758_240611_665B7241 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

QW0gRGllbnN0YWcsIDI5LiBTZXB0ZW1iZXIgMjAyNiwgMTI6MzE6MDcgTWl0dGVsZXVyb3DDpGlz
Y2hlIFNvbW1lcnplaXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPiBUaGUgSW5ub3NpbGlj
b24gSERNSSBkcml2ZXIgc3VwcG9ydHMgcGxhdGZvcm0tc3BlY2lmaWMgYmVoYXZpb3IgdGhyb3Vn
aAo+IHRoZSBgaW5ub19oZG1pX3BsYXRfb3BzYC4gV2hpbGUgaXQgcHJvdmlkZXMgYW4gYC5lbmFi
bGVgIGhvb2sgZm9yCj4gcGxhdGZvcm0tc3BlY2lmaWMgcG93ZXIgdXAgc2VxdWVuY2VzIChsaWtl
IGVuYWJsaW5nIFBIWXMpLCBpdCBsYWNrcyBhCj4gY29ycmVzcG9uZGluZyBob29rIGZvciBwb3dl
ciBkb3duLgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBgLmRpc2FibGVgIG9wIHRvIHRoZSBg
aW5ub19oZG1pX3BsYXRfb3BzYCBzdHJ1Y3QKPiBhbmQgY2FsbHMgaXQgYXQgdGhlIGJlZ2lubmlu
ZyBvZiBgaW5ub19oZG1pX2JyaWRnZV9hdG9taWNfZGlzYWJsZSgpYC4KPiAKPiBUaGlzIGFsbG93
cyBwbGF0Zm9ybSBzcGVjaWZpYyBkcml2ZXJzLCBzdWNoIGFzIHRoZSBTdGFyRml2ZSBKSDcxMTAs
Cj4gdG8gaW1wbGVtZW50IHRoZWlyIG93biBwb3dlciBkb3duIHNlcXVlbmNlIChlLmcuLCBjYWxs
aW5nCj4gcGh5X3Bvd2VyX29mZigpIGFuZCBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSkuCj4gCj4g
UmV2aWV3ZWQtYnk6IEpvc2h1YSBQZWlzYWNoIDxqcGVpc2FjaEB1YnVudHUuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpS
ZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
