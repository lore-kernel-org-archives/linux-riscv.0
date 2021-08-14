Return-Path: <SRS0=nQgR=NF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A0CC4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 05:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE61D61038
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 05:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE61D61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NJ6JAXaDNpZI50JOiE7YmMfejHYe3ahHtj3QK0TPXqo=; b=Jc2msppJcDPPmcL7VnLg7SNFiE
	/1ilDkGIdYQGbs6+xPsJmu9BY0NvzODsq0IdtnM/aUs+YAp2Am1ihXonpblwFkzJpQplCoB2iFgOu
	zO84CZ6a5VmNtMoss8+zEDDJzLrYYsjVcBZXjCQo2KhORxSKmwijhV+0gISYbIlTzU9BK1QJn7S6G
	vNLU6M0wagIKvWeXAUP0+aUGO3LbaubTNLANaEIWEhHJYmg1mWkiRabI6bzLUXQEdVJ8KsQyqpE4s
	PdC3mx4rilUMXDk94CrCGdZJQYdBV+x81aDJ7cNZf4SCHA0mpUj6lnlnVjU7oJY2Y2ezaV953OkNM
	0/25XTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mElmh-00DqrC-FR; Sat, 14 Aug 2021 05:00:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mElmP-00DqpO-2a
 for linux-riscv@lists.infradead.org; Sat, 14 Aug 2021 05:00:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id q2so14605533plr.11
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 22:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EfRJaQhW5bJgW1Ru7ut1p/KkgC/ZKgGbNPyBwIe86wM=;
 b=teCsK6UW6bnW+AQ33g7aLVyoflHiW10++YsV8ysJoPlwTtws3B3kfYo3Rh/uy0h36c
 ezJZnSvdGo2H3xLHgE+/8xqMfYnnstDHcOUD0tkObD8hoJtipD0GWv7lUMTekrkq7kGP
 1nJFZ02SiAidn4V8suYDAB01qdQFOKMG9z6QIbULjgbX32pa+TdhTP4cYB0/tcl+P2Iq
 ogeU1FgJKxXWTKkLnOzPBtSZOKkbukBMD5XDO9H0ilWpIPmXhfjfoANvd+ns80oDWubn
 vQ88vhZ0Bu08JiJcfl0zntuX3FNUdGIAZ0v+YSIeKn7y1OinoN8GkLDMI8rwOl1DB+fx
 rUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EfRJaQhW5bJgW1Ru7ut1p/KkgC/ZKgGbNPyBwIe86wM=;
 b=na/22BCpY6tJ+TfjpkdfxntiWP9brf8jOsFcpIJmr2w2gbzd6+gNjQCA0f2F2LCqoP
 OFBbfz+OukfePIATDR/9L9DmJP4ie+GBczELW2nVIxwScVw9a4C1vnCt0N54YRaKGEDB
 AXfs64cxlQkZiLfKerlLPX75hsd3LlGNJkD8QkCnsPs+Gx/I2Msme3Tgm+D52LqbcgiG
 Bm3q3u0EF2e9fcYi0F2X4SFnBGLOWgFleyKXn/OxIQlWAQeCdRC/pZmbB3CZjVShvyjV
 HFcktO86aM0XK2DoDLuqzI5C1RGlQWNKSz9xJKFCqjphhz7W18fX0Veo8s4ZtuUYHvYl
 GWHA==
X-Gm-Message-State: AOAM533dB+1PJbNBqMRh7i8j3pKaidrtNxVOjylQvZjPm/7Y9sTUHQ7M
 IGfvgdRnQBnY/pxshiqISTYiUJ7q9dU8qQ==
X-Google-Smtp-Source: ABdhPJwLUYFbJsaMXFrx8KSFczUPGE806KQOW2HGuh2D7hzo2UIgvVkXRfX6KyF+HYSTc9ifJU+0aw==
X-Received: by 2002:a17:90a:8405:: with SMTP id
 j5mr921483pjn.160.1628917219908; 
 Fri, 13 Aug 2021 22:00:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g6sm622323pfv.156.2021.08.13.22.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 22:00:19 -0700 (PDT)
Date: Fri, 13 Aug 2021 22:00:19 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Aug 2021 21:40:51 PDT (-0700)
Subject: Re: [PATCH v3] riscv: Add support to allocate gigantic hugepages
 using CMA
In-Reply-To: <20210730124841.178455-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, wangkefeng.wang@huawei.com, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-3020806a-a81d-4741-8720-b99860ba1903@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_220021_157448_9E75D847 
X-CRM114-Status: GOOD (  19.82  )
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

On Fri, 30 Jul 2021 05:48:41 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> Commit 9e953cda5cdf ("riscv: Introduce huge page support for32/64bit
> kernel") adds support gigantic hugepage support for RV64.
>
> This patch adds support to allocate gigantic hugepages using CMA by
> specifying the hugetlb_cma= kernel parameter on RV64.
>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v3: Update changelog and add Reviewed-by.
>  arch/riscv/mm/init.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a14bf3910eec..e547e53cddd2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -19,6 +19,7 @@
>  #include <linux/set_memory.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/crash_dump.h>
> +#include <linux/hugetlb.h>
>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
> @@ -216,6 +217,8 @@ static void __init setup_bootmem(void)
>
>  	early_init_fdt_scan_reserved_mem();
>  	dma_contiguous_reserve(dma32_phys_limit);
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
>  	memblock_allow_resize();
>  }

Thanks.  This is on for-next.  I cleaned up the commit text a bit.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
