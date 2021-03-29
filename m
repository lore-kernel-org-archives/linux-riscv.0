Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA4EC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:11:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD3F06192F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD3F06192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24OmTgMGabFkhnS9K5GBVHcpVDFJwrp41yA+MF3Grl0=; b=WsYm4zs4P2D1A0
	ajm9N+mPEAPveIL2Ait7hUn46bUp1lW8iT81f1V3iWh6GIrx/7gficbP1FFCriHEXiSJgNWa0SWil
	CQ3+/ZGexKgDfn6t6PktyFB5p/GdeWZpQrfZ+vSZ/eAJ/VEAUK1RNX7ygM7jK1afoROXIBRQe3jsW
	WLfalmQS1XjoW/I5+sOyrbsYorR1UKhJuLUPCfAU3dQHFVwS/I9r8kuHFn8d/je9zxDauzFQsGaGv
	o6SBjPiiwqYqjYg7QxkwFITpiVa7Xbvv9cYSgjNiuXJnH+2k+hhwknb7FtgSodKEE5Ivgp/P06MJb
	oGAKjMcKhxgfNKFKCP1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1yb-0028Ec-V3; Tue, 30 Mar 2021 00:11:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQxKu-001CGg-Pz
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 19:14:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36C9461936;
 Mon, 29 Mar 2021 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617045243;
 bh=ToS0MidpfphiNtS55x67RiSvWClxRs/ZhbXeO1EBtAw=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=oQfZOPcCqmdWePI7Lw64BaJIMp8Fg02xLSjbmILupDBGx799hmQd5C/AhhnXHzQPh
 Fo5TIF3XxWugMx0k7kmS8Ub6sBSGHfY8Pu5uk3SgFlHTuHOhPS0/l2ulNsQzLRsyry
 iQUpHuII7FhbQZDUyDqx5our/WCk8VKvumz8VEwUPLkHxyZoFrJ+iG5/NBTnpIgHhe
 ba8T5QPdvcUOTLUrJhsIQt0T3nqIJYvxBhwZ9gmmxDPeT8QDBvAgZcJoNndcspOyw8
 RvPJunEY33GrQTQsxgpSTYG+qxr+qMtywMxS3CcMthZ2PpH3T2TYfJFvaAew8UQeGF
 MW7BaGRcOa81g==
MIME-Version: 1.0
In-Reply-To: <91d016e59bab9d9175168a63e7bcd81fdb69b549.1615954046.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <91d016e59bab9d9175168a63e7bcd81fdb69b549.1615954046.git.greentime.hu@sifive.com>
Subject: Re: [PATCH v2 2/6] clk: sifive: Use reset-simple in prci driver for
 PCIe driver
From: Stephen Boyd <sboyd@kernel.org>
To: alex.dewar90@gmail.com, aou@eecs.berkeley.edu, bhelgaas@google.com,
 devicetree@vger.kernel.org, erik.danie@sifive.com, greentime.hu@sifive.com,
 hayashi.kunihiko@socionext.com, helgaas@kernel.org, hes@sifive.com,
 jh80.chung@samsung.com, khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, vidyas@nvidia.com,
 zong.li@sifive.com
Date: Mon, 29 Mar 2021 12:14:02 -0700
Message-ID: <161704524201.3012082.13807741329367593907@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_201409_433853_F0807D53 
X-CRM114-Status: UNSURE (   9.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Greentime Hu (2021-03-17 23:08:09)
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 71ab75a46491..f094df93d911 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -173,7 +173,7 @@ config RESET_SCMI
>  
>  config RESET_SIMPLE
>         bool "Simple Reset Controller Driver" if COMPILE_TEST
> -       default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC
> +       default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC || RISCV

This conflicts. Can this default be part of the riscv defconfig instead?

>         help
>           This enables a simple reset controller driver for reset lines that
>           that can be asserted and deasserted by toggling bits in a contiguous,
> @@ -187,6 +187,7 @@ config RESET_SIMPLE
>            - RCC reset controller in STM32 MCUs
>            - Allwinner SoCs
>            - ZTE's zx2967 family
> +          - SiFive FU740 SoCs
>  
>  config RESET_STM32MP157
>         bool "STM32MP157 Reset Driver" if COMPILE_TEST

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
