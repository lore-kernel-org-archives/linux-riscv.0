Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23E2C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:06:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A444060EBB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A444060EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNsqbMib8pUchLwNs6uDuX7kQpucCusBbJMzFKuOgOI=; b=clLLp2213V65JH
	7qgvzue6mKb5rjtYj4hsBYfLo4GuJYRha6gfecyIW0ebOXBOtc9i8isetny8/Qd740EFCvclaL5yc
	jEKUz1waoMg8KOTeTvla29DlOLHg2LH+YEyxTS9AVVzeqht13Pl7qYPiHptmgnlVoN1FGoIKO8xAs
	dt5+80BnAOxLSJPS+uWUHYPwOTIqnj34475BgS7y6/L1M8CJm64VRS7IVB0DB/ULfBoMUKMbS9c6w
	VLife3hHM+gjoBkhc8sKgjIoKpHcrcUUShrZQ/r3NOwFsDo2hUSRYuxCX2PyztuseKnKpF0mxCh4P
	g5A6IHEzuxzofXFDuB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maIQ5-00D7fD-5o; Tue, 12 Oct 2021 14:06:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maIQ2-00D7ee-4k
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 14:06:15 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1maIQ0-0006DE-Q2; Tue, 12 Oct 2021 16:06:12 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1maIPx-0002gx-Jv; Tue, 12 Oct 2021 16:06:09 +0200
Message-ID: <9446163d07a2ff135965c7bff249f76bd0da5fb8.camel@pengutronix.de>
Subject: Re: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby
 <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, Sagar
 Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>, Atish
 Patra <atish.patra@wdc.com>,  Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Date: Tue, 12 Oct 2021 16:06:09 +0200
In-Reply-To: <20211012134027.684712-10-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-10-kernel@esmil.dk>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_070614_205342_BE67209B 
X-CRM114-Status: GOOD (  17.40  )
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

Hi Emil,

On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
> Add a driver for the StarFive JH7100 reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  MAINTAINERS                           |   7 ++
>  drivers/reset/Kconfig                 |   8 ++
>  drivers/reset/Makefile                |   1 +
>  drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 drivers/reset/reset-starfive-jh7100.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d2b95b96f0ec..f7883377895e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17854,6 +17854,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
>  F:	drivers/clk/starfive/clk-starfive-jh7100.c
>  F:	include/dt-bindings/clock/starfive-jh7100.h
>  
> +STARFIVE JH7100 RESET CONTROLLER DRIVER
> +M:	Emil Renner Berthing <kernel@esmil.dk>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> +F:	drivers/reset/reset-starfive-jh7100.c
> +F:	include/dt-bindings/reset/starfive-jh7100.h
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@redhat.com>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index be799a5abf8a..8345521744b3 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -92,6 +92,14 @@ config RESET_INTEL_GW
>  	  Say Y to control the reset signals provided by reset controller.
>  	  Otherwise, say N.
>  
> +config RESET_STARFIVE_JH7100
> +	bool "StarFive JH7100 Reset Driver"
> +	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on OF
> +	default SOC_STARFIVE
> +	help
> +	  This enables the reset controller driver for the StarFive JH7100 SoC.
> +

Please keep these in alphabetical (config symbol name) order.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
