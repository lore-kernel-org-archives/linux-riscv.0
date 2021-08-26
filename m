Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B969FC432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 15:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D5F460F58
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 15:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D5F460F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1d3Mk/hMaXMkohHyAzFH/wkUtJ76xwBXvjZj5TgCO7A=; b=u/evKZOiinb0GbXwhwA2jTAjqU
	LEwnEL8Cwz3AI87ziIFD9T98xvI/aJPtqBiHmt3SOz/ZgDUIerZuRSdMHGdP2jpmPNpjYTRW/GGMH
	Oko8z2RkhmGC7utTShCkgpx6eP0mB1lUe6UPniBQR8tJYz0AimwVZ2DZ4aKxcB3TRg+8vS7lc5pK3
	U8h0fKqYhOUlJkmahwDdHulTeEOTA2pxSg4hFpoZxZx6q38ADM3G4ARDbKzHPDv5fvF5yOXCfL6xz
	Bv/xw4rjWpmo8GnwKQKCxE20+mo83s3/GsLCnXU50fcqU48tiY0U9lS10nzprVWr5pSpb61GEVXP0
	op4RWmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJHbx-00AVdB-R2; Thu, 26 Aug 2021 15:48:13 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJHbv-00AVcr-5k
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 15:48:12 +0000
Received: by mail-pg1-x52c.google.com with SMTP id y23so3420737pgi.7
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JJP+nPxJKAVqphBV0U7M3pCSiiD75owxGS4FYqm3izI=;
 b=B34DZ7GZQQP/RfYnW/796r41LR1R7dUh9UzNNn59z+K2eYT3nNiRTHL9UVBI/5GjjK
 3TfWbQHjHI6ZF1iG6ilkCd3Tnf8CYLTTSVDTJUEoe1CQxI1jWjuJGqVXm6lTN5Ef2pyo
 jgeon94XxOvvTaUC16e7J7meXw4D/txz5Lh9vBxC5ODFBCbGZ50qET4nNP1Uiqfvu2mt
 bEpLA1W5BK/jKZ6DytuHgkwE2H7S8IESmUXCfYKGcFWidLyJXV2aSVlu0hitDWFFfCK0
 5oMMJMJpe8mfHlDqP9O4ot49mUfirHUDOSafWxEpMLvlExgo819A3jbcTY+s3CMqnhaF
 D4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JJP+nPxJKAVqphBV0U7M3pCSiiD75owxGS4FYqm3izI=;
 b=rEe/ZRzDonopD5472nbG1vs+9bmPawEtzEOwo1jQFQOl2acv81JhDhGlwFTokb6qXL
 8vRbEgQ0ufY3U17oWUNTFi7T09o5rTktOMsYjsNkZoYaUAIcympcF4nj8ZLLKyFmn4Bj
 st2R9KMl5NaWRGui4n7+XP5oEJbfM1hNWh6phA3wx9ErKZXlSy9ctpmX8XY520MOOo/Z
 CWJ9rB57JqpRoYwVfvhirCizmVkIl9fvMatXZKCKrfcRmeaq1xTxwh9IusBYM2J63QvB
 4C+jL8/dDbaORltZwNleOF+nKIvJYCYW5dKH3kBMOBE+Xe4Ug15g8ICgLfjysSNadq8v
 FR9g==
X-Gm-Message-State: AOAM531lKZJ2EzIRz5Bqjz5StTxPcrvwOyDbKq+Nul1FBV+84Vh+NvCR
 9ZSFd8xZCdPOXfV2haVuKBF5IA==
X-Google-Smtp-Source: ABdhPJxpwYj7R8tyX7ioeatO8I2WCuwy7Nep0VOM904vJ6/PF9EPA/CqBgda+W0PUJMTOMydi8w+BA==
X-Received: by 2002:a62:e90b:0:b029:30e:4530:8dca with SMTP id
 j11-20020a62e90b0000b029030e45308dcamr4425688pfh.17.1629992889586; 
 Thu, 26 Aug 2021 08:48:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q18sm3530686pfj.46.2021.08.26.08.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 08:48:09 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:48:09 -0700 (PDT)
X-Google-Original-Date: Thu, 26 Aug 2021 08:12:37 PDT (-0700)
Subject: Re: [PATCH] riscv: add support for hugepage migration
In-Reply-To: <20210810135105.2827214-1-chenwandun@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangkefeng.wang@huawei.com, guohanjun@huawei.com, chenwandun@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: chenwandun@huawei.com
Message-ID: <mhng-d4c69614-7786-4d3a-acbe-4a51d57d7ed4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_084811_253092_6FBF64DE 
X-CRM114-Status: GOOD (  16.51  )
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

On Tue, 10 Aug 2021 06:51:05 PDT (-0700), chenwandun@huawei.com wrote:
> Generic arch_hugetlb_migration_supported can provide appropriate
> support for hugepage migration when enable ARCH_ENABLE_HUGEPAGE_MIGRATION,
> so enable it for hugepage migration in riscv.
>
> Signed-off-by: Chen Wandun <chenwandun@huawei.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8ce8382748d5..8bfc89589838 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -13,6 +13,7 @@ config 32BIT
>  config RISCV
>  	def_bool y
>  	select ARCH_CLOCKSOURCE_INIT
> +	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>  	select ARCH_STACKWALK

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
