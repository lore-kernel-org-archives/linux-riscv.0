Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A99C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4KJ/rGedDBhIdkfL4zDwRQb6uRGfvIZ0qr8JlzoqIU=; b=3txVvaopIf92Gn
	3bAr5fUdP40OAuAR6erV3vtAwzDW+IOhj/ozdDH+otya+vY98FazggNx+l4VsN/CaYfDHI46iJ+GA
	MHsVbp0CBlzq+dPwsaqzA84pFtWzFjOkL4McrZ1HZgQ+FVTqQvSmgnpaAol3XLtV1/COh39AQicdG
	GCdxhXiu8e0omIc8jI2Mx4bTdH9rYe9r+tl5NgHdAoz7PQIyeWPm7WpVnpVZhfax5CnHndN6ua94A
	6j1ncP4NCAp24VMNpWN4L6qqxXOPw50vFdEyTunt69FyxI9sDsLLVwbv+Aod9vv2ZWnMdge0wqI2S
	0j++G9eXiFwvGDsTaZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzov-003l7P-UN; Fri, 18 Nov 2022 11:46:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzos-003l6T-N9
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 11:46:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 08581B8232C;
	Fri, 18 Nov 2022 11:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73120C433C1;
	Fri, 18 Nov 2022 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668771963;
	bh=BHxtre8/LYcerFh38ah/n8Jv/xVfQGTrqxctZy8lgjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNk0o4T0JG0y212MaXGP1b+vZnD5q1YJKiExPzGooj8ENWtUiNlVDp6gN6ksbUTzf
	 fseC+bR7chE9+7j+ts+6XH3mQj+kqe9cfK/YFzYOwDRc7gcYe/vf4/VdffBytaqIy8
	 a73kq03VjgrH78vNs15S8PpySmwsoed8H3FxpcElhMGB3XtyCO8U73iKW6JWJuFps1
	 xGlb8MTObWDrQaB9l4KtD4wNPpi8R2ah38QBdyr7knN81W5ChEP+rx7gqBmq3WioQ8
	 kK9LDRkfnY6rXyJU4btW3RHpbmwFB8/r60em9hVEB0XGsEjJ8mOHkIrbhB2PlviSR2
	 1MndekKJuTZVQ==
Date: Fri, 18 Nov 2022 11:45:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] soc: sifive: ccache: Add StarFive JH7110 support
Message-ID: <Y3dwdXExRRltyp8A@spud>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-6-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118011714.70877-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_034607_069167_F8D64E78 
X-CRM114-Status: GOOD (  25.03  )
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

Hey Emil/Hal,

On Fri, Nov 18, 2022 at 09:17:11AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This adds support for the StarFive JH7110 SoC which also
> features this SiFive cache controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/Kconfig.socs            | 1 +
>  drivers/soc/Makefile               | 2 +-
>  drivers/soc/sifive/Kconfig         | 2 +-
>  drivers/soc/sifive/sifive_ccache.c | 1 +
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..5a40e05f8cab 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,6 +22,7 @@ config SOC_STARFIVE
>  	bool "StarFive SoCs"
>  	select PINCTRL
>  	select RESET_CONTROLLER
> +	select SIFIVE_CCACHE

Please no. I am trying to get rid of these selects + I cannot figure out
why this driver is so important that you *need* to select it. Surely the
SoC is useable without it?

Is this a hang over from your vendor tree that uses the driver to do
non-coherent stuff for the jh7100?

>  	select SIFIVE_PLIC
>  	help
>  	  This enables support for StarFive SoC platform hardware.
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 69ba6508cf2c..534669840858 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -26,7 +26,7 @@ obj-y				+= qcom/
>  obj-y				+= renesas/
>  obj-y				+= rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
> -obj-$(CONFIG_SOC_SIFIVE)	+= sifive/
> +obj-y				+= sifive/

This bit is fine.

>  obj-y				+= sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-y				+= ti/
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index ed4c571f8771..e86870be34c9 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -if SOC_SIFIVE
> +if SOC_SIFIVE || SOC_STARFIVE

As I suppose is this - but hardly scalable. I suppose it doesn't really
matter.

>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 1c171150e878..9489d1a90fbc 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -107,6 +107,7 @@ static const struct of_device_id sifive_ccache_ids[] = {
>  	{ .compatible = "sifive,fu540-c000-ccache" },
>  	{ .compatible = "sifive,fu740-c000-ccache" },
>  	{ .compatible = "sifive,ccache0" },
> +	{ .compatible = "starfive,jh7110-ccache" },

Per my second reply to the previous patch, I am not sure why you do not
just have a fallback compatible in the binding/dt for the fu740 ccache
since you appear to have identical configuration?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
