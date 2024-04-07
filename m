Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5B2CD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2v2FD+Rk58XEWblq2TqHkE7F5o/JKc6cv6rnRoWO94=; b=oXm72N0W0ZpgX8
	S4SauEYDhvKdCndjuXYN9ZSgfZEE4bwYTV92C3PwkuiNz0Dzxzttuu0/9t6UNsYybnmc1tSY+jAkh
	eWF+P5jKVsVyqiqY/8XfMhbS8ITaMNGFOBdwKtkLVpwLxxClRl+oSruOOYvCTLMTPOlPNk7mCGDkZ
	atvBY9zGCvIExPuMTS4O1TQXwGtt97Ne7dvcsH6Hn3YxwXSkyKiHVfhpqcY/cqTWuXjMSgQqe2DDD
	Xq3hEe/sEQ92PS+J18pCO52B97VFFpmONTcuuEJvRJzP1sJSgCt+S3wqhDK0Q9F+gkLbHrEmBxKJA
	TKk3s5BiCLJaA0oGXbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtQcK-0000000CQTC-1GsQ;
	Sun, 07 Apr 2024 11:23:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtQcG-0000000CQSS-3TEY
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 11:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C8C960691;
	Sun,  7 Apr 2024 11:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CEAC43390;
	Sun,  7 Apr 2024 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712488994;
	bh=5suR5ejrCA9fwoRJgZKID0FTG3hpL42flJ7EeEBlYuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL/LcCAMHHwG1RjtRD1qwdMfbicOlrbROY0L21dD4sFAxjAQIvA3VK1O2gzwZ+wj0
	 Nr45B8vc0nqcQk7+dzlaq3tH+e+CbLZRg8NsxvJec3FhtD9U30WhoaJSB2MxZwQnBZ
	 AyZfPmYQv++1o2fksPW93jOdCjg2EXBbWwfWwRJx/vgMdsm1AVgyMWZnz2Hsktf9PX
	 sFmyhXCbht5iJLccVlEHICpgIgPGxPWWWZzwPwDD1H3GoCjrK/27ZUF4HMUMjZ71I1
	 GMh7cySb4Lpi1JBXCun8kedcXSVAjqpNNZ9ro/3q3BsjFtj5KFDOAvGf2QN632m7vb
	 P0Pe0F1hrC/Rg==
Date: Sun, 7 Apr 2024 16:53:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 2/3] soc/sophgo: add top sysctrl layout file for
 CV18XX/SG200X
Message-ID: <ZhKCHlAYxnhhcKnt@matsya>
References: <IA1PR20MB4953F0FAED4373660C7873A2BB3A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49532FB358A842A2ACC5E878BB3A2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49532FB358A842A2ACC5E878BB3A2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_042316_953265_95C4BAE4 
X-CRM114-Status: GOOD (  14.94  )
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

On 29-03-24, 10:04, Inochi Amaoto wrote:
> The "top" system controller of CV18XX/SG200X exposes control
> register access for various devices. Add soc header file to
> describe it.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  include/soc/sophgo/cv1800-sysctl.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 include/soc/sophgo/cv1800-sysctl.h
> 
> diff --git a/include/soc/sophgo/cv1800-sysctl.h b/include/soc/sophgo/cv1800-sysctl.h
> new file mode 100644
> index 000000000000..b9396d33e240
> --- /dev/null
> +++ b/include/soc/sophgo/cv1800-sysctl.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#ifndef CV1800_SYSCTL_H
> +#define CV1800_SYSCTL_H
> +
> +/*
> + * SOPHGO CV1800/SG2000 SoC top system controller registers offsets.
> + */
> +
> +#define CV1800_CONF_INFO		0x004
> +#define CV1800_SYS_CTRL_REG		0x008
> +#define CV1800_USB_PHY_CTRL_REG		0x048
> +#define CV1800_SDMA_DMA_CHANNEL_REMAP0	0x154
> +#define CV1800_SDMA_DMA_CHANNEL_REMAP1	0x158
> +#define CV1800_TOP_TIMER_CLK_SEL	0x1a0
> +#define CV1800_TOP_WDT_CTRL		0x1a8
> +#define CV1800_DDR_AXI_URGENT_OW	0x1b8
> +#define CV1800_DDR_AXI_URGENT		0x1bc
> +#define CV1800_DDR_AXI_QOS_0		0x1d8
> +#define CV1800_DDR_AXI_QOS_1		0x1dc
> +#define CV1800_SD_PWRSW_CTRL		0x1f4
> +#define CV1800_SD_PWRSW_TIME		0x1f8
> +#define CV1800_DDR_AXI_QOS_OW		0x23c
> +#define CV1800_SD_CTRL_OPT		0x294
> +#define CV1800_SDMA_DMA_INT_MUX		0x298

Why are these register defines in soc, all the dma registers should
belong to dma driver and other IPs, why do you need a common header??

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
