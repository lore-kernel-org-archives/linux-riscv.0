Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B759C25B78
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG1lb7RZ4VjBj9AYeZRL6BdevgapnF51zumRbChEJVQ=; b=NGaKfDpNdel+Qc
	nrV/TjYq4YpHX1Vf0UNIRNfrgXQpHsbrNYpuI6XNvZMfjhN8zo1v/vEg6VhDBL8BhUDL5mLfMaTab
	HjwlsJDs0VlFM5/fCqEW/i1h6PG3wG8j8X1Mb9MND/5Dy356bcM5jSjSi4Qe0FwhHUNyM9Samp42J
	zXFbau5LUmGliI3iUwvO+xiVkiTo37JFvjLsxw4zOpqM4pHUNp0LdDaxNVvXnc+v62pZ/l3HDDpI3
	q/By0P3LrryOOASaET9FIb7xBKYJ9IPuz5aW3rRAaX9UH3eE7MTHw6mU/ZNr+Xq41gXyCM7CUoEke
	7JKqijw+yN03op04uYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbg6-00000006kaf-21Jn;
	Thu, 30 May 2024 09:02:30 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbg0-00000006kXb-1kBW
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 09:02:26 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 51e6d162-1e63-11ef-80c8-005056bdfda7;
	Thu, 30 May 2024 12:02:22 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 12:02:19 +0300
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put()
 cleanups
Message-ID: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_020224_678896_9E505566 
X-CRM114-Status: UNSURE (   9.96  )
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

TW9uLCBNYXkgMTMsIDIwMjQgYXQgMDE6NTk6MDNQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVu
IGtpcmpvaXR0aToKPiBPbiBTYXQsIE1heSA0LCAyMDI0IGF0IDM6MTTigK9QTSBQZW5nIEZhbiAo
T1NTKSA8cGVuZy5mYW5Ab3NzLm54cC5jb20+IHdyb3RlOgoKLi4uCgo+IFlvdSBtaXNzZWQgb25l
IHRyaXZpYWwgY29udmVyc2lvbiwgcHJlc3VtYWJseSBiZWNhdXNlIG5vIGVycm9yIGhhbmRsaW5n
Cj4gYW5kIHRodXMgbm8gb2Zfbm9kZV9wdXQoKSBpcyBpbnZvbHZlZD8KCk5vdGhpbmcgaXMgbWlz
c2VkLiBUaGUgYmVsb3cgaXMgYSByZWR1bmRhbnQgY2hhbmdlLgoKLi4uCgo+IC0gICAgICAgZm9y
X2VhY2hfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpIHsKPiArICAgICAgIGZvcl9lYWNoX2NoaWxk
X29mX25vZGVfc2NvcGVkKG5wLCBjaGlsZCkgewo+ICAgICAgICAgICAgICAgICBpZiAob2ZfcHJv
cGVydHlfY291bnRfdTMyX2VsZW1zKGNoaWxkLCBSWk4xX1BJTlNfUFJPUCkgPiAwKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvdW50Kys7Cj4gICAgICAgICB9Cj4gCj4gSWYgeW91IHByZWZl
ciBub3QgdG8gaW5jbHVkZSB0aGlzCgpJIHByZWZlciB0aGlzIG5vdCB0byBiZSBpbmNsdWRlZCBh
cyBpdCB3aWxsIGdpdmUgYSBtaXNsZWFkaW5nIHNpZ25hbHMgdG8gdGhlCnVzZSBvZiB0aGUgb3Jp
Z2luYWwgQVBJKHMpLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
