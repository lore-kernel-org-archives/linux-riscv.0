Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4F9C2D0E4
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C6322403
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sx8fTxp+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0hdfK3g9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C6322403
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=lJOQUrjNz8WqrgVKK3hQVYWgwg1i5T7LxslAMwaijUQ=; b=Sx8fTxp+PZG24FcpKhSaEq8vZ
	pemFy/flGkjEKfp/in8Q/1cx+MaO5JfWO4Yy0bVDj0lcnRHKPWAUq4wS7nazdj74KVxGz4UQD8Wgi
	0SigrrRO1ljHmNWe2QqNkGpfoyINzwuXiRVNIiTWvFLydLUxnxuqfkShJrMDP/e83yITkkX1P3ifO
	76nO+ina3t96L6XQA5dJ4rV2r++w5Jl1gG+pFsE4cA/8g5CF+G3eHlrgfNGcRs+wfjqIMYnWEw/7U
	3hqRZUky0xFdzWMwbJXATbh6MMr5tEZG2Iwxm5u1KU63ZOWrop6KqadR1VDstgdhur8aYW1HQzEJm
	Xjz5ZUQOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgHiV-0004iE-H2; Sat, 21 Nov 2020 01:29:32 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgHiS-0004hC-Ft
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 01:29:29 +0000
Received: by mail-pg1-x544.google.com with SMTP id f17so297342pge.6
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NTIUti1OpkmP1EJeSjOGSHTMPVhCrbNNUIn61ZG384k=;
 b=0hdfK3g94oTXJCO7jmp7feme5W90zhh8KAtY4W/xPC+Ibe6jZH2suPKRs191Ut85UR
 UjJ5PHVkzHLT0nD6DP3GgEliyuZ48VjcPkCX+QVWsbn6EWhZEqvXnjp/g8Etx/0xEhvl
 CmRGem/xk/JPkKj6IH5nf6odmNH3Rk5UrS2gXhR1YbNkHGDhsv9ONWrH+IyIFoHeYrLr
 dvADzjiSbrdp+8p7foWvwPYeloHAUcCdhowFqWObmHNbK4zU8GJcWHq+p1ZgMqgv3XRX
 edAbKn7A+QN1aJhxaEpOQpVp6JY/wyJoqntRngNj1JG0CT3WIaNLQK+ID5m9LUF9WO6N
 XMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NTIUti1OpkmP1EJeSjOGSHTMPVhCrbNNUIn61ZG384k=;
 b=VwXz8u+FN99KQrRDRwbyilvE7983eBchUscPzXhgtSG6igBCy7gkq72Eh/8pThI9ae
 7nqIIdPPnh5IbCpzd3BjLCn4OOgYSpMRoCI8bqOJ+NyNSPsQjpsgXuo/OHzybA9jRWK2
 jc5oYfHvBrF1YSicVcZ3UoRaeTZ/Wh0DzGSY+9jUY4csuMzmExCADW/+nrwUi3b32i/F
 zgBehY56Qz9XeO7mwCuNyX9CU9WCQkmxieJpKtmyZIT4vapz4eUyl4jZYINwiYbhzQ43
 M2fbgCP01eNJktLnyA65E+9D0UnJeq/agU3sg1Ctp5OQ6Y/eJkOiq3mEbTDCc43C9AZB
 MXTw==
X-Gm-Message-State: AOAM530nGAn1YvKIKQJRg7q6sBIrM86jZuRFhbSE3kLzNa1M25aqAeV2
 u09vv24yNq9ehXORyKCuqM5UUAxBJrz37Q==
X-Google-Smtp-Source: ABdhPJwtPQZRmI58LwYU51aWQz3nyqvtfTqielZw6ubxzFmOwxLpqzzFzT/rB6dE8mPtjlTSgaLuBA==
X-Received: by 2002:a63:8149:: with SMTP id t70mr19717409pgd.80.1605922164501; 
 Fri, 20 Nov 2020 17:29:24 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s21sm4339168pgk.52.2020.11.20.17.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 17:29:23 -0800 (PST)
Date: Fri, 20 Nov 2020 17:29:23 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 17:13:18 PST (-0800)
Subject: Re: [PATCH v4 2/4] clk: sifive: Use common name for prci configuration
In-Reply-To: <20201111100608.108842-3-zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-ca3ea720-b6b1-4b6e-a58f-43fadd7f1c18@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_202928_551663_2F4FC9B1 
X-CRM114-Status: GOOD (  21.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, pragnesh.patel@openfive.com,
 yash.shah@sifive.com, schwab@linux-m68k.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Pragnesh.patel@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 02:06:06 PST (-0800), zong.li@sifive.com wrote:
> Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> patch is prepared for fu740 support.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> ---
>  arch/riscv/Kconfig.socs     | 2 +-
>  drivers/clk/sifive/Kconfig  | 6 +++---
>  drivers/clk/sifive/Makefile | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 8a55f6156661..3284d5c291be 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -5,7 +5,7 @@ config SOC_SIFIVE
>  	select SERIAL_SIFIVE if TTY
>  	select SERIAL_SIFIVE_CONSOLE if TTY
>  	select CLK_SIFIVE
> -	select CLK_SIFIVE_FU540_PRCI
> +	select CLK_SIFIVE_PRCI
>  	select SIFIVE_PLIC
>  	help
>  	  This enables support for SiFive SoC platform hardware.
> diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> index f3b4eb9cb0f5..ab48cf7e0105 100644
> --- a/drivers/clk/sifive/Kconfig
> +++ b/drivers/clk/sifive/Kconfig
> @@ -8,12 +8,12 @@ menuconfig CLK_SIFIVE
>
>  if CLK_SIFIVE
>
> -config CLK_SIFIVE_FU540_PRCI
> -	bool "PRCI driver for SiFive FU540 SoCs"
> +config CLK_SIFIVE_PRCI
> +	bool "PRCI driver for SiFive SoCs"
>  	select CLK_ANALOGBITS_WRPLL_CLN28HPC
>  	help
>  	  Supports the Power Reset Clock interface (PRCI) IP block found in
> -	  FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
> +	  FU540 SoCs. If this kernel is meant to run on a SiFive FU540 SoC,

This just removes the double-space.  Presumably in should also remove the
"FU540", as this clock driver will now function for multiple SiFive SOCs?

>  	  enable this driver.
>
>  endif
> diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
> index 627effe2ece1..fe3e2cb4c4d8 100644
> --- a/drivers/clk/sifive/Makefile
> +++ b/drivers/clk/sifive/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += sifive-prci.o
>
> -obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)	+= fu540-prci.o
> +obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= fu540-prci.o

Probably best to rename the source file as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
