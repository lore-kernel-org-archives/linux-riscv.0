Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4A4C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:32:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B4EF61019
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B4EF61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ESZtSIPJzEQysKPsL8TFVpUOhiDpH2aSZusbnrZITVg=; b=AZmuLnNpW9JnGGWECNsy6CHkRv
	DBBHGG5DijAkA+6uXVJYoy+4dRYXWlU7gNGwCU0HlSdhgnGPvNeDpX2T+dgtVFvCPoKw5//GOFzXo
	WmWXar1qrMspaal5HzEcs/8+D2xD5+lgp+7lgX1sFRHAJEfTob2CUAORe2bOu5m7xH4s1AdEMUxe/
	QsXJSbIqPmD9fzzrsjjggQmlzArhj1X7wjUHLmsZLGLy03E7dMptiZDbIt8qx3AWqNmWIUdY5O90U
	8RQ6HbMrBeGtKnwVDaJ/0AyUADJqZgigMk+4WzY44Cet5gt3s0G1TbxEE9w6AkgOOunVHBDb0DIvP
	ie3D8YoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5Cj-008uuV-7v; Thu, 12 Aug 2021 07:32:41 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4z4-008sd6-Sg
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 07:18:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 g12-20020a17090a7d0cb0290178f80de3d8so9166854pjl.2
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qamAtbGqWd2cz3VbtrXxIyEPlw8SFc6ZDxX7MvG+W3k=;
 b=zf+RkLQNlJpLGNavfDu7X/k6Cq70FSMcrYQKDa9qkRevTCjHCGMk/Q14gYTiU0HACP
 AZlyi2LK8FHt0NnkU2zWLK6PxMIAckf1nnPbbHyZABELRmCPWE2W3VG+AJ/zkf4lGxvS
 6V1Xw8YJJlBY1nDr+BspV0Uz9VyiiO+Vm8BUy2XglPZ0r9HMy0Xq64/gLxD/FQFKx1/w
 o1T2qVFNSbdUsfm/ICd87bdBZpPJpq+dnqeyZoNHK19LP0t8f1N1CVTGHQBodOum9j12
 iAq4KkiEeTWJzo4ztAIVyxHxAKZS1oQXSoNR9V0w5uVjRss1lB0zwf09FJ8nrB6t8bUV
 l5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qamAtbGqWd2cz3VbtrXxIyEPlw8SFc6ZDxX7MvG+W3k=;
 b=FP7ODa+FUbyP726tAKVCEEJNhrWXrgZrCQxtTzhML9zAx2KWOoHzDPscMJMSfX/kuE
 3eDLFCcjeGP50Xl4x30pPuBjj1AAVn8NgMid1KxoKg59cX8nSQPttG6s3eIfiJpnOwRq
 +GKbk6Jm1bjsRJ87VoHnK81GhfFfDhMTc4g8ObrwpHb5g4SLGKQhvELHi63KIRB9c+Fr
 8njfAbOIfTtmg5Oi1dH9Cjf3HeclfcvkgLvSHGf5hDPTlMjmZ2ISpzr6C/RCOrVuKMvj
 PBYguE/13GSNP5aF8mBIrzyCYLgmhtR0ZpOSJchJDuC1W/HOuNUIK/O+KI77NSDUWc6e
 Bnhg==
X-Gm-Message-State: AOAM531Qmuf9TptLEMZtbEHdWXUu86LB021u8aYwX//ngVaVyv6iYUVb
 Q89moyQVU7Bd7ntQM2MwSyCuSA==
X-Google-Smtp-Source: ABdhPJzEJibdgL8k2XScMKYi/Z59QGIavIA1WuSVqv+zB7YI97mhxl/IUgLJcNlgHo+OHA16rheyAQ==
X-Received: by 2002:a17:90a:5416:: with SMTP id
 z22mr2929072pjh.183.1628752713307; 
 Thu, 12 Aug 2021 00:18:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v20sm2305847pgi.39.2021.08.12.00.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:18:32 -0700 (PDT)
Date: Thu, 12 Aug 2021 00:18:32 -0700 (PDT)
X-Google-Original-Date: Wed, 11 Aug 2021 23:41:26 PDT (-0700)
Subject: Re: [PATCH 0/5] Small cleanup for mm/init.c and address conversion
 macros
In-Reply-To: <20210723130128.47664-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-f4204e85-d2a5-4112-85d6-3f118d1167f1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_001835_040607_3B4CEF05 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, 23 Jul 2021 06:01:23 PDT (-0700), alex@ghiti.fr wrote:
> The first patch allows to have only one definition of the address
> conversion macros for all kernel types.
>
> The following patches bring small cleanups to mm/init.c and the last
> patch makes the size of the DTB early mapping consistent between 32-bit
> and 64-bit kernels.
>
> Alexandre Ghiti (5)
>   riscv: Introduce va_kernel_pa_offset for 32-bit kernel
>   riscv: Get rid of map_size parameter to create_kernel_page_table
>   riscv: Use __maybe_unused instead of #ifdefs around variable
>     declarations
>   riscv: Simplify BUILTIN_DTB device tree mapping handling
>   riscv: Move early fdt mapping creation in its own function
>
>  arch/riscv/include/asm/page.h |  15 +----
>  arch/riscv/mm/init.c          | 121 +++++++++++++++-------------------
>  2 files changed, 54 insertions(+), 82 deletions(-)

Thanks, these are on for-next.  There were some minor merge conflicts, 
let me know if I missed anything.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
