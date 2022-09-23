Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612E3C6FA83
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QS7OBxQwt++y30lf0K4Kj+lEttpYZ5z9G5qDDSBaQmU=; b=tYg2cCg8nhx24g
	1OKDKoaJD72JZky6lOY3kWKtBUKyfFUWZZ2iIgh7ZhEGDmJaqL4HgfZF+BtZktHEy0eYDHc/X80kx
	vUWyt42T19oP3HIRTu0izRHMqRF5/fr+hCLMKhCGxXenuIiGgyUIrvyHpY1/3hZcpuKrvAWQ6tkN3
	bhHSPPsJ0a3uLV/X7mPrYvMKioQcG6YFYT493lrN6JzohvtQJxetLC5eMpAN3UC/yCf9Jv8uLnmw6
	AZKf9AyxDJPZvhOFvgz7aL6Ya+9KPdGNnQUETcVNabxyaY3mX0lDwaJMLrve8qwmvbajJnrN6IC+0
	nmfk6pS/R0DJtZ+74t+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obo8h-005VOV-2b; Fri, 23 Sep 2022 19:15:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obo8e-005VO3-FN
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 19:15:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FCB761AB8;
	Fri, 23 Sep 2022 19:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE08C433C1;
	Fri, 23 Sep 2022 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663960502;
	bh=TigT3jKNDRmQfQyQQPO1S8az0YEb4Ux+3Xe7eJ63fT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ew28b77tfthRantBJ8939302hJF2UjaNS7TAHuDQCAYHqRZOInTaEfstGAu/oj/2v
	 /gSRNdYKKru6A+xhlqq1pTltRZOhTNazHtE9isI0l1Aq4OWltzMA0nwqKv5aQMuzdg
	 rw1o3Lz8/o9fSTfE82oTnfY0/97hP50QDrljl/u3ntdobo6MidEc3xBS/PKDbqJpVK
	 VZgNJccxvTvEPZ2edszUwmBsuIqzgSg4GEWF0/KA7RaYilY3A5qNNqmvJVq9E4WM4A
	 Fn5+wqyguDic477W/mI5Lr4OOs+qaYe3HDm21g58odhIGTaJ8c9rlmkzDZF4Lcc7ZL
	 hroPePbqVKgwA==
Date: Fri, 23 Sep 2022 20:14:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com, geert@linux-mk68.org,
	kernel@esmil.dk, arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RFC 07/27] riscv: replace SOC_STARFIVE with ARCH_STARFIVE
Message-ID: <Yy4FsiNKypEpXwiU@spud>
References: <20220923185605.1900083-1-conor@kernel.org>
 <20220923185605.1900083-8-conor@kernel.org>
 <13823003.RDIVbhacDa@phil>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13823003.RDIVbhacDa@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_121504_634711_FDB7AAA4 
X-CRM114-Status: GOOD (  23.85  )
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

On Fri, Sep 23, 2022 at 09:09:03PM +0200, Heiko Stuebner wrote:
> Hi Conor,
> 
> Am Freitag, 23. September 2022, 20:55:46 CEST schrieb Conor Dooley:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > As discussed at LPC, the SOC_ symbols are being converted to ARCH_
> > for the sake of consistency between "incumbent" vendors and those who
> > have a legacy from other archs.
> > 
> > Convert SOC_STARFIVE to ARCH_STARFIVE across arch/riscv
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/Kconfig.socs               | 2 +-
> >  arch/riscv/boot/dts/starfive/Makefile | 2 +-
> >  arch/riscv/configs/defconfig          | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index c4c7add1516f..910697baf097 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -17,7 +17,7 @@ config SOC_SIFIVE
> >  	help
> >  	  This enables support for SiFive SoC platform hardware.
> >  
> > -config SOC_STARFIVE
> > +config ARCH_STARFIVE
> 
> doesn't this create a bisection issue?

Yeah, I thought of that midway through and then promptly forgot about
it... I'll sort it out for v1.

Thanks.

> I.e. the clk-Makefile in the following patch will still do
> 
> 	obj-$(CONFIG_SOC_STARFIVE)             += starfive/
> 
> at this point, so if a git bisect lands here, you stop building
> the clock-driver (and maybe more).
> 
> I guess some intermediate solution might be helpful, like
> introduce the ARCH_STARFIVE and make SOC_STARFIVE select it.
> Then do the conversions and after that drop SOC_STARFIVE?
> 
> 
> Heiko
> 
> 
> >  	bool "StarFive SoCs"
> >  	select PINCTRL
> >  	select RESET_CONTROLLER
> > diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> > index 039c143cba33..7b00a48580ca 100644
> > --- a/arch/riscv/boot/dts/starfive/Makefile
> > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > @@ -1,2 +1,2 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > -dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
> > +dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index dac14b95c73d..971986be875f 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -27,7 +27,7 @@ CONFIG_EXPERT=y
> >  CONFIG_PROFILING=y
> >  CONFIG_ARCH_MICROCHIP_POLARFIRE=y
> >  CONFIG_SOC_SIFIVE=y
> > -CONFIG_SOC_STARFIVE=y
> > +CONFIG_ARCH_STARFIVE=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> > 
> 
> 
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
