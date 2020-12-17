Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23B4C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:10:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F1723600
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88F1723600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RkdS5coM77UCmT/Ll/fJTAEHqr0qAp8/hG1hAQt96Fs=; b=vAkMy1Vw2Rtq0hX92fGlgpK3P
	VDq7rtmd/t0Nmfl1hXJEe5+91cSuINIuBu4tBL/aJXSkd9mwjM6rsoOnTZ9ZhsjAzmTdGcj6ZqR9w
	dUXtf2DAL2r/JgIUZhtV+IjMGKqg9879juj71yHeGvWuBj50KEF71ZgI4WN5c1SE1D2fFVAzeOBia
	VzCaqIj+LvAAExEykhM0FDqLbfvFc0uyUfcImnLKQraDNPy4gkzkcF8DcOZcVYEYHwHmLGEm/RAj+
	Q25TzG/Y/9LZ03EM+JqBqP35lqMsgn10QGR6HMgOfYX31Orh8Y8obnnOvaE/WSzMaroieDllckzOf
	5pn5CfY6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpoMU-0002QA-5J; Thu, 17 Dec 2020 08:10:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpoMN-0002P8-Ma
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 08:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608192601;
 bh=T619GpfnsNUVG7ybqE3r/JQVeRBCmUlACnAIeSE4AqA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OM8byHptyPa3OKLYRZOSAc14KRCWWU1twEt5rHxS5eARrOH+ZysLdhvatygQavIuc
 0XflD+WPOVqpB2O3RrIhZoKGYIm9oBcBShJRRcVLzRqdDhGQKI+tkuvYXpgA2UFIeN
 j10zGERr8pnso5JmPFsgLcGHrtZhoFeUjUrDg1oJ+Fyw5GOwUVrNBP0WxGKN79BXBu
 eNIz2MLeP1qvE6rVisggyUS9kU6riYJnpzLv47VNzBgDIlYopQx01HhIpQ3sCcQpSy
 C933xf963fhkOCz0zo9SpIVXWtkZhHuX9i9tGPDfOqZZt5aZSS/Yt58CG58bzjEjjM
 fRu9mOjfIn4Zw==
MIME-Version: 1.0
In-Reply-To: <20201213135056.24446-10-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,
 k210-clk bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 17 Dec 2020 00:09:59 -0800
Message-ID: <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_031004_108515_58941124 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-12-13 05:50:42)
> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
> index 5a2fd64d1a49..b2de702cbf75 100644
> --- a/include/dt-bindings/clock/k210-clk.h
> +++ b/include/dt-bindings/clock/k210-clk.h
> @@ -3,18 +3,51 @@
>   * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>   */
> -#ifndef K210_CLK_H
> -#define K210_CLK_H
> +#ifndef CLOCK_K210_CLK_H
> +#define CLOCK_K210_CLK_H
>  
>  /*
> - * Arbitrary identifiers for clocks.
> - * The structure is: in0 -> pll0 -> aclk -> cpu
> - *
> - * Since we use the hardware defaults for now, set all these to the same clock.
> + * Kendryte K210 SoC clock identifiers (arbitrary values).
>   */
> -#define K210_CLK_PLL0   0
> -#define K210_CLK_PLL1   0
> -#define K210_CLK_ACLK   0
> -#define K210_CLK_CPU    0

This seems to open a bisection hole. I see that ACLK is used in the
existing dtsi file, and that is the same as CLK_CPU, but after this
patch it will change to not exist anymore. Can we leave ACLK around
defined to be 0? I imagine it won't be used in the future so we can
remove it later. I can then apply this for v5.11-rc1 and then merge the
clk driver patch in clk tree.

> +#define K210_CLK_CPU   0
> +#define K210_CLK_SRAM0 1
> +#define K210_CLK_SRAM1 2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
