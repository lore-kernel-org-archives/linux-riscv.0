Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B496F606A32F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 09:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b37erXr5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1xKU2tT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tb8v4py2vbf+1+3zvRAFwwzkpsgnHeaIL4OdngeoLSk=; b=b37erXr54AfR44Oo2QcCb8NdDw
	TAz5mZf2KEq5g1sLeQwdXf6/crDQzHjoG4HOc/KEGEIVSIbi0J/vIXfUkIT0pFr6Nwd8teS6pirTD
	ERRKO6dAPasv3VQX50tut7SULhlbUvXKl7nOQ/zZ+7yVXaH7Pkkb3okVjoclIuN4lDhNKrs/5WjrF
	FC5ovHZxKVW71LOkSAnjj90vdYeodfjBL9BDO7bES7gPInQh9IKXX21Bd/lojMC+D106HSFoDCr8Q
	SMLbtT3THyrk7mDzwycVq+Sxv4ozj0zvwMNwjtHTPXsf0qRfJ+8PewC2zXafvuw9YKNugZtkdviUI
	jC5QVl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOARR-00000001gaA-3NZe;
	Tue, 03 Nov 2026 09:04:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOARO-00000001gZg-0cB3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 09:04:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1C6A43F03
	for <linux-riscv@lists.infradead.org>; Tue,  3 Nov 2026 09:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A5D1F00A1F
	for <linux-riscv@lists.infradead.org>; Tue,  3 Nov 2026 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696665;
	bh=oqcwif+o3u40FPToGAPLvgMZ6cthmDqENUhGefULOww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h1xKU2tThc+PCjMmTSQl98ISc5OnxMMDKFMUPOC9vnlb9lQ4xXhBteZ2gpKXpRt7I
	 w9lfHpMOf3jD7ltyrds0TP7N7c/b/Jj6B+osimdzSS0PSO++Rw2BGlJCslQ8ZoGQrh
	 s035XhlTsRnNeYdvANd09qtbbDad5FtIteTxYMMEyv2lCo+HSmzUARhSS9QlY0zjzV
	 N4+Kg7jXHxMi3kiA9ATievIktcA60E+48pt0/InTqwfA0sOKN1kO3xUiAcccV8xDT+
	 +8Vutoj+WhzleMS5uiq6PG8imke4kD2NTobGiKFljbN6hq0teze7QLoDKWlRhqdiy5
	 celxtNibeT47g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so31190751fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 01:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwLkq+JrUFxdfZpwBusJgt32e2dkYuvNTOtc3WvacaFWkwBtmkhpp2DKJVQq/c7hpFAYciLvdhj/HEjfw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/2O5dkcUD3VXRVKPOcs0o52l2irfh33+5qDZySx8wTuy8JNBEM
	0jb6xErl5+Q+SjhAKK2oI+wWJygJJ/9MkM6AvnmIJBTDHYjkpcC50XFZ8NDlkT2K+pnLoIIIwH0
	UXCdIQSwD/bWR31q1t5Th96faO5vzNtc=
X-Received: by 2002:a05:651c:198e:b0:3ac:4da3:864f with SMTP id
 38308e7fff4ca-3acb7a9e0f3mr31016591fa.4.1793696664148; Tue, 03 Nov 2026
 01:04:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Nov 2026 10:04:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmoy=--GE4MScaTOa=x9+HAuvhHC7ixA_GYVme2vrcgZQ@mail.gmail.com>
X-Gm-Features: AclHuK8feuY0PnTZqOb4xpNbcV0UYLP8c4l3kas742sFixN6cKUvbMAmIcJa7DE
Message-ID: <CAD++jLmoy=--GE4MScaTOa=x9+HAuvhHC7ixA_GYVme2vrcgZQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, vkoul@kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMiwgMjAyNiBhdCA2OjQw4oCvUE0gPEZyYW5rLkxpQG9zcy5ueHAuY29tPiB3
cm90ZToKCj4gRnJvbTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4KPiBSZXBsYWNlIG9w
ZW4tY29kZWQgYXNzaWdubWVudHMgdG8gY2FsbGJhY2sgYW5kIGNhbGxiYWNrX3BhcmFtIGZpZWxk
cwo+IG9mIHN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciB3aXRoIGNhbGxzIHRvIHRoZQo+
IGRtYWVuZ2luZV9kZXNjX3NldF9jYWxsYmFjaygpIGhlbHBlciBhY3Jvc3MgU1BJIGJ1cyBkcml2
ZXJzLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuIFByZXBhcmUgbWFrZSB0byBz
dHJ1Y3QKPiBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciBwcml2YXRlIHRvIHRoZSBETUEgZW5naW5l
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+CgpNYWtlcyBz
ZW5zZS4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
