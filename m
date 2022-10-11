Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2526C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 18:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoS3vleqb6ewEpJK6oYik1j7iSQp6n2W+dpqfndEWcA=; b=PxLkUONp8YW/tC
	zHnbjTXuomaj2qk0rKols+scr3oP9AduOXwao3875u4stj70wU2vY2B8iyvwmL35VHzVugfhxbvEs
	AKfxB8eMCADPGU/0UQl9a41Z21UghiVeJiP5tWqJ4Q6PlCrWvSMJSdI7GpG4RS3hM6B3o2MtAxgvp
	QJjuKAbInkaxBXebQ6/tocsjMm+H2KXTatQkF0DQLVeGY5tr5F/hz27UL47sQWqlBqlurpttfxRb7
	86L9TXm9PO8X58/Ps4LfsDrPgSciKQePASVaAZQtgKaqrtJgMcTbOYhcK5og8ZCNiLSA6Uk5on8Hn
	Aal42nX6xRjcoSo4CDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiK3m-005S9R-20; Tue, 11 Oct 2022 18:32:58 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiK3i-005S8l-OB
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 18:32:56 +0000
X-QQ-mid: bizesmtp62t1665513144tf8jdyjh
Received: from [192.168.1.231] ( [113.72.146.141])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Oct 2022 02:32:23 +0800 (CST)
X-QQ-SSF: 0100000000200090B000B00A0000000
X-QQ-FEAT: 7jw2iSiCazqbQ5tBRQTa4DP92tBGuiXW2qhhi7so1L8YQTSdLsD6bEm6SpfGf
	AnLtfynvp3KCljyxHGLpZg2svKBE3NjLJqiOsJHbZqld0xi6C2tJUr+vygbGy7/40QEmzCJ
	b3f2i3KLv3z8jeB9gNzUGEUETkotyseEm/DVu5pRoWsUhq8aaVNMc0szqOJEHy3h3fnaeiu
	Gqqlcg3e52/CIKA3DquCxhklE6WNgDPEmbUue3dxy/d+2kCYK7OnxiLfSATsD7w3EQPslOc
	96vgfeGembZqkA73X+Wqniwr1+sDqMuKSdXKnW2uns/wYmP/O7tsErQt50YdkmtPfV1IVGE
	qs9V4wuExJV4i6tgmUMBOT/AtDG7mdEkioM7aScva/zOmRh7J11AhCpLh2GcQ==
X-QQ-GoodBg: 0
Message-ID: <BC2E1E01B669A06E+eb3ccb04-e930-9aa4-08b9-27621410bbd3@linux.starfivetech.com>
Date: Wed, 12 Oct 2022 02:32:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 30/30] RISC-V: Add StarFive JH7100 and JH7110 SoC
 Kconfig options
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930122318.9244-1-hal.feng@linux.starfivetech.com>
 <YzbjCIfoxjsFCuD1@wendy>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <YzbjCIfoxjsFCuD1@wendy>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_113255_121609_A2599A15 
X-CRM114-Status: GOOD (  18.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 30 Sep 2022 13:37:28 +0100, Conor Dooley wrote:
> On Fri, Sep 30, 2022 at 08:23:18PM +0800, Hal Feng wrote:
> > Add Kconfig options to select the specified StarFive SoC. Select
> > necessary Kconfig options required by the specified SoC for booting.
> > 
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > ---
> >  arch/riscv/Kconfig.socs               | 27 ++++++++++++++++++++++++++-
> >  arch/riscv/boot/dts/starfive/Makefile |  4 ++--
> >  drivers/clk/starfive/Kconfig          | 14 ++++++--------
> >  drivers/pinctrl/starfive/Kconfig      |  6 ++----
> >  drivers/reset/Kconfig                 |  1 -
> 
> Firstly, you cannot change all of these files in one commit, sorry.
> 
> >  5 files changed, 36 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 10f68a4359f9..321c448e7b6f 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -22,10 +22,35 @@ config SOC_STARFIVE
> >  	bool "StarFive SoCs"
> >  	select PINCTRL
> >  	select RESET_CONTROLLER
> > +	select RESET_STARFIVE
> 
> Secondly, we are trying to get rid of selects in arch/riscv at the
> moment, not add them. use "default SOC_STARFIVE" in
> drivers/reset/kconfig instead please.
> 
> > +	help
> > +	  This enables support for StarFive SoC platform hardware.
> > +
> > +if SOC_STARFIVE
> 
> I don't think we want to have per soc selection menus in arch code,
> I think this should move to drivers/soc (a la Renesas) if you want to
> have a per soc selection menu or else just do "default SOC_STARFIVE"
> for both clock and pinctrl drivers in the clk and pinctrl Kconfig
> entries.

Thanks for your helpful comments. I will drop this patch.

Best regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
