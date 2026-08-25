Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA06C61DBD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 22:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Lc8HwaSrazhSVn2s8uP6Ob/UOVcftvPoa/GflcIuTo=; b=OS8PMdgeY9kkE1
	2NNFfIAtuoHFNoUn58uJdLzeS8U11/5N1h2L18dezN64IJjbYq0zgmcriXBeKj2veUU2OWh0BnN+6
	yDmMwmV8ld3Ts81AChVW6tdbKmpJVVOE4TnWsNhovnhyoSbkkx8IZFEO0VJYzbArx+8xOrieV6s2x
	kVXo+eTmCehcFb11sU6wOW4RDdTyY8IZdWWk+YLwDIuNljAbCaCcIRQJuV0Bknq+ExyYyVsKuRfeq
	xqmQt7a4k9m2yp02zkmad979t9gfDJaoyp+AKPofRJBbtXP4wv5tPACg20rnqbcTT42IzsmeG0unR
	xM518LLSUl8r8OiWmdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzx6-00000001dl8-3k2O;
	Tue, 25 Aug 2026 22:49:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzx5-00000001dkz-3eMd
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 22:49:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49BE240ADA;
	Tue, 25 Aug 2026 22:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF801F000E9;
	Tue, 25 Aug 2026 22:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787698147;
	bh=CzUHjTtV9HFnqkDD5ZY7/R1QxL3nnbBXEJln8CdDQHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P84R/7/Zls1qOfDS4je1zyj9Q/90iuLhMrjK48eMbHzufiyIt+FJV1XrlcdCUzPt/
	 M1ly0jEgma7al/m7RHoOQF8ugeC1/uFtm0gHCjToSwJTyjVPjeG8zsHLeGAoW2pH8U
	 tRspCrc0ID7qzRgsr1Nt3LhOvK++CvROTHKDPVuyx/WxWTFJGodK8atzmupMBf5v4Y
	 XnD/WVc1TMXXPRXw5TqX/+rbFW7V1B/9GKF/t37DjCvc2YC9axTmxd0PZ7yrh8rpkL
	 yqHI4JXavUBupfz/waDBYdR8N0nmOzsyluzIhtFP3Zj3O1LpXxj+3Za721xhq1Qtjm
	 E8mxDLrJIvj7A==
Date: Tue, 25 Aug 2026 22:49:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1
 thermal sensor
Message-ID: <20260825224905-GKD631715@kernel.org>
References: <20260825052233.66850-1-bbanelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825052233.66850-1-bbanelli@gmail.com>
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

Hi Bruno,

On 07:22 Tue 25 Aug     , Bruno Banelli wrote:
> Two blocks on SpacemiT K1 boards are unreachable from a stock defconfig
> build:
> 
>  - USB_DWC3 is not enabled, so the dwc3 controller that drives all of
>    the USB 3.0 ports on boards like the Milk-V Jupiter never probes.
> 
>  - SPACEMIT_K1_TSENSOR has no default in its Kconfig and is not listed
>    here, so a K1 board comes up with no temperature readings at all,
>    even though k1.dtsi describes five thermal zones.
> 
> Enable both.
> 
The patch itself looks good to me, but since it deal with two diferent drivers
So, can you split it into two patches? which easy to review and manage

> Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5..03d9ac2f7 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -209,6 +209,8 @@ CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_PLATFORM=y
> +CONFIG_USB_DWC3=y
> +CONFIG_USB_DWC3_GENERIC_PLAT=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_HCD_PLATFORM=y
>  CONFIG_USB_OHCI_HCD=y
> @@ -260,6 +262,7 @@ CONFIG_CLK_SOPHGO_SG2042_PLL=y
>  CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>  CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
>  CONFIG_SPACEMIT_K1_CCU=y
> +CONFIG_SPACEMIT_K1_TSENSOR=y
>  CONFIG_SPACEMIT_K3_CCU=y
>  CONFIG_SUN8I_DE2_CCU=m
>  CONFIG_SUN50I_IOMMU=y
> 
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
