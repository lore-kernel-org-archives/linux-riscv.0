Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904D3D2D0E7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCjnUTHWUT8pyhF5btD7j9tS5QNbCqwYnvLfqKDdy7o=; b=E8a76xT7CWHSLx
	XbNZ4K9tdkAvnh6ZmPwMl4efNKgeth5KcxKwloUbsTE6qzgq0etw6p9+LebnKawJMwPi9Satx0w7E
	hNYkqoar1HI7SvYYsmhxO/zVYbyeo2DJ3ELSFi9khHYTOnvtK3lRknbAYrr1VzjbT2wiTyiWM651C
	WhhHItHq3p/Px2lD+gjF/CpBKwaoUo2Li+KAqdIHXs/ezrNRwJqcajEWZ/NQH1pKmvyjdcZYOiqJp
	aaDjtoscKj3AvzTxaZU+IRENDDF9919L4GLn4lpYCy0rceaG/G4i7boBb7ofoIURlS4XlVCYOiTrh
	/AfG2Frv1ZwehwAtLUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfde4-000000075LT-2xyY;
	Tue, 13 Jan 2026 12:37:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfde0-000000075K9-2ssh
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 12:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FC8D41A58
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 12:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A0DC116C6
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768307827;
	bh=/jEbcQNNf+2y5DghSoCRU+Htja2/wQhqeKPPtGlgrS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=djdbXGFB/0vFYnxrpHaPDsmzQQ20F7Osv04XDibZ2U163NlSPT6o1qMPl+o0mVNbP
	 +bJYC/uONDGWEOcsPMDaJW6nsYc+VkjK795U4Il/TEvVcY1W9Y5QaKATY7Syf5Pn/S
	 K2NEgIZSD6lIohY1OEP4eJkee0IH2jlvRpfZz1cTjBCyl2ePRW8Xy1r+EKGgnUmqhR
	 Y5p2hkTY8XmCFhTtDYEybg3wOd3X3vfFDnANyXDKYeO8LD70k1+8jhfS1623TFn+Ov
	 GW9pnukDXb1nmpYWUO9sFSrv0u1kusskQNElUZ4sA94yQDoIS4w9IWKnG844y3NboS
	 mOgETq9y0Eh8A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fd45a1feso58927191fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 04:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqQ8zFvieZrxLeM2LsSieLwpP2PqqecmIrjjsT483cxTazDASX2rqWDX5v6NlL0ARl9JJhDVh9NHEo/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVo+u4Rd+el0VBzybkwovkM+D/bbsRWJdM16s87HB9tknSpngm
	sDNtSET4Vc0FA/o2MgaLhZucgYDWZ59UGElRPkmo2L2QmhFFCp4+AAldPGLNH0NG6367RgoNygV
	fqPswYdHL0TwVx70ez1RVpMEdbrwke0ZaSw5mRYu3AA==
X-Received: by 2002:a2e:ab19:0:b0:37b:9361:711d with SMTP id
 38308e7fff4ca-38350a55384mr8601501fa.8.1768307826023; Tue, 13 Jan 2026
 04:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com> <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
In-Reply-To: <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 13:36:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
X-Gm-Features: AZwV_QhI9rebW3ffX0n9A2EUYniK94gLsNSjXRbzl9peLeeXv9eI-nHhZ9l6ybY
Message-ID: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_043708_762862_6D557126 
X-CRM114-Status: GOOD (  10.72  )
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMjo0NeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToxNTo0MUFNICswMTAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YnJnbEBrZXJuZWwub3JnPgo+ID4KPiA+IEluIG9yZGVyIHRvIGRyb3AgdGhlIGRlcGVuZGVu
Y3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkKPiA+IGdldHRlcnMg
ZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFuZCBzdG9wIHB1
bGxpbmcKPiA+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4KPiBJcyB0aGUgaW50ZW50aW9u
IHRvIHJlYWQgdGhlc2UgcHJvcGVydGllcyBmcm9tIEFDUEkgdGFibGVzPwo+CgpOby4gT3RoZXIg
dGhhbiBhIGNvdXBsZSBwcm9wZXJ0eSBnZXR0ZXJzIHdoaWNoIGNhbiB1c2UgdGhlIGZ3bm9kZQph
YnN0cmFjdGlvbiwgdGhlcmUncyBub3RoaW5nIGhlcmUgdGhhdCByZXF1aXJlcyB0aGUgT0YgZGVw
ZW5kZW5jZS4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
