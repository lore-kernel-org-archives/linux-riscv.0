Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B8C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 19:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+WSiTOHkNwcUI7CHFApdLqiVcukllqyKwKT9ovSmq8=; b=rdt1AnetnUVZIB
	sADsX3VPrPMrGQjb12chcZMG/rjDvJ376LF9c76H3jDHV5nlzM18149j1oggAGEQXDDJqu9vmtDbu
	nNxAqZ1G+cPtPyO9rFrHtML8u+emKROzESJdvMKYBGaOcYWdknhCuioGHo//087kieO5F3z2u51FC
	4t4DP8k3J0q64vUigyARwqK40qPLDr6+j3k93GVAj02TO/Ok3gWx7Ju2Su4rtDz26EDmtySCC67Pr
	6npt2OBHMupUf8K80FfvotypNYyJ7hGAannwH5COddvWlXe6seg8TJCj8fBAq9UsiV7lTOgdIIoGM
	Xq8EY3UX8qt0kLwd2vbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obo2u-005UpJ-Qh; Fri, 23 Sep 2022 19:09:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obo2r-005UoA-So
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 19:09:07 +0000
Received: from p508fdd76.dip0.t-ipconnect.de ([80.143.221.118] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1obo2p-0000p4-MB; Fri, 23 Sep 2022 21:09:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, damien.lemoal@opensource.wdc.com, geert@linux-mk68.org, kernel@esmil.dk, arnd@arndb.de, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RFC 07/27] riscv: replace SOC_STARFIVE with ARCH_STARFIVE
Date: Fri, 23 Sep 2022 21:09:03 +0200
Message-ID: <13823003.RDIVbhacDa@phil>
In-Reply-To: <20220923185605.1900083-8-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org> <20220923185605.1900083-8-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_120905_968635_6648931F 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Conor,

Am Freitag, 23. September 2022, 20:55:46 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As discussed at LPC, the SOC_ symbols are being converted to ARCH_
> for the sake of consistency between "incumbent" vendors and those who
> have a legacy from other archs.
> 
> Convert SOC_STARFIVE to ARCH_STARFIVE across arch/riscv
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig.socs               | 2 +-
>  arch/riscv/boot/dts/starfive/Makefile | 2 +-
>  arch/riscv/configs/defconfig          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index c4c7add1516f..910697baf097 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -17,7 +17,7 @@ config SOC_SIFIVE
>  	help
>  	  This enables support for SiFive SoC platform hardware.
>  
> -config SOC_STARFIVE
> +config ARCH_STARFIVE

doesn't this create a bisection issue?
I.e. the clk-Makefile in the following patch will still do

	obj-$(CONFIG_SOC_STARFIVE)             += starfive/

at this point, so if a git bisect lands here, you stop building
the clock-driver (and maybe more).

I guess some intermediate solution might be helpful, like
introduce the ARCH_STARFIVE and make SOC_STARFIVE select it.
Then do the conversions and after that drop SOC_STARFIVE?


Heiko


>  	bool "StarFive SoCs"
>  	select PINCTRL
>  	select RESET_CONTROLLER
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 039c143cba33..7b00a48580ca 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index dac14b95c73d..971986be875f 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -27,7 +27,7 @@ CONFIG_EXPERT=y
>  CONFIG_PROFILING=y
>  CONFIG_ARCH_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
> -CONFIG_SOC_STARFIVE=y
> +CONFIG_ARCH_STARFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
