Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC83C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nq1kuoknzqpIQEEQvEi8/SrXEp/s0LA/fL64D63odHQ=; b=xXgvRRpXrvtoc2kqpDhHtusl/3
	oEaQU0/FWdCoraoleccfuLjweo64x7aDNfwbFIvp6O1ySbxmtPjDmBc59ZTIZ0Gw7EjlbxU2mXnke
	s5L0CX2Nwckapwrhv1jNyaRt+LcZIMDELmDd0vzYi9DxbEmVpE2OG5Hd23yM7YC9d2BVNEnP7pmRo
	NWLQ+CVaFPkCA01ZKePoRz7c8FsOou5MIeavZwy6AlO3eLvGdxXZD7R8Qn2zni+U890r9SiatvEoZ
	8EqWGPUHgJmaQ4G865ePPLagzC7yXbb8nxG8zAs3xQR0WMKfBPizN+3dfyqKq3yew90BOcDw6/7Xm
	qA7r9VMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAga-00EseK-1e; Tue, 14 Dec 2021 16:29:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgD-00EsKu-UA
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id u80so18260850pfc.9
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UUeDg3UbpK4Lk35DpDi+VxMMtiqCVAzMEDO0lgDAodA=;
 b=23ODNl+wM18aXgMSOm5njgveUa5CPCbR4uXfDKVl1dvvNY1fnEGi0hpEL4h37pWPQY
 youwEY8axQ+mS7bu/2Zjm9pEJ7dMWpR2uxp+Y+cqmZ8XNmuBXuAp9uWT19lkr86RsWqu
 pX8dOKjAiiuAjt/okoat/j9KpyTyOASzmy3C28wjjof16XzDgXkJuErZsPNLWBVoTwRN
 A7mJAdUoLO0D8GWeD69IWxUA7uiIt6ZZe9Hot8/YWqjk1WoyXItUpsZ4PSJhhG3U/fHL
 1lSTB5WcGw7sJgS464udCNGBMhTXPFoJs5p8KWr4xAonEUNoG9Ec85ENulYEsmEx24Mn
 qbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UUeDg3UbpK4Lk35DpDi+VxMMtiqCVAzMEDO0lgDAodA=;
 b=vNpJhOLQZtU3b3nqVt2P2Ba3ZYxL6IumFTdNkRxvw5a2Je0bmMDo46POwMvrlc7cLW
 gl8FNQLszMwrORGvCTZ6ypt36Z+qJk/WA6nlc7mc044zTaCrs+0PGjYrMX8NAUr7kmA7
 4Bbr29eRNuf6W/03c3xkqRJZGYtNwQm4wtC5NOQPmX7MXKI51qWDX1VDQb0gWQBFbeHe
 s7K12ILywVoJPJRm6ygbo1nelKXVCNIc/xX9OaBdOijoYK1GmoR9zApAgU+HgEJSlndx
 d1coJHDw2s//WzFIIcSId0mq4skAYDAd0H3O7+tXn4K2IOCoATH5v50r3DhSxaf7VcA/
 tdLA==
X-Gm-Message-State: AOAM532F8QW0DnzCedWTgfcCNtDRZIsjaXCv8h35sOy2Rmfd0HuTPn/5
 KCdIWnA7AKWV6jQniNse/CLJzQ==
X-Google-Smtp-Source: ABdhPJwWH2ZfN4mw7218/OZV1XCCHiMfE6h7+SNjJtrxOnsnE8Q/TJAvaJwj1YTOHl18aZga8qbpnw==
X-Received: by 2002:a62:1b51:0:b0:49f:a8d8:84b with SMTP id
 b78-20020a621b51000000b0049fa8d8084bmr5108326pfb.31.1639499365439; 
 Tue, 14 Dec 2021 08:29:25 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id t191sm260609pgd.3.2021.12.14.08.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:24 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:24 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 18:23:15 PST (-0800)
Subject: Re: [PATCH v9 05/17] riscv: Add vector feature to compile
In-Reply-To: <2684ea9e25a63c7a88faf46680a26e560027e444.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-e9e08b2d-bb86-43e5-9975-bb497350e770@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082930_015849_3AF47DF2 
X-CRM114-Status: GOOD (  20.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Nov 2021 01:48:17 PST (-0800), greentime.hu@sifive.com wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This patch adds a new config option which could enable assembler's
> vector feature.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/Kconfig  | 9 +++++++++
>  arch/riscv/Makefile | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f076cee11af6..0311579920b9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -389,6 +389,15 @@ config FPU
>
>  	  If you don't know what to do here, say Y.
>
> +config VECTOR
> +	bool "VECTOR support"
> +	default n
> +	help
> +	  Say N here if you want to disable all vector related procedure
> +	  in the kernel.
> +
> +	  If you don't know what to do here, say Y.
> +
>  endmenu

As the kernel build robot points out, this should have some sort of 
dependency on a vector toolchain.  Not sure if there's a better way to 
do it that cc-option, looks like there are some other tests for 
assembler arguments that way.

>
>  menu "Kernel features"
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 37de70df4fae..f109214a2d7f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -57,6 +57,7 @@ riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
>  riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
>  riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
>  riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
> +riscv-march-aflags-$(CONFIG_VECTOR)		:= $(riscv-march-aflags-y)v
>
>  KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
>  KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
