Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A89C48BCF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 03:59:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EBF6120A
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 03:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45EBF6120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ud23/sDRcItTPmyHm31zsM7dI6WajXQnTaDqNWsntLg=; b=q5YcqjM+oeFrSYjbkWoL6mQt18
	o7CU+o9G33SIjAEZc/IYTvPDKlI2mBOOjHG9ioGRe2KuZIr5QCHesNvylSABdqepqVCOjEXYYRCKW
	amepguy7wWFkSm75RVFLRXK00rbg8/o0D88N3Z2NkSWAAtb+imtdQLAf6FMxfafV5NX25HmUjj869
	W8yrxFMPuXeERsQRqJoEIqOGobh0AimOjuJ3qrycLrkeMIcqd/FmdPGhF6rmUapRojxNbG8Z4qh9K
	zDQinIKv9FPa2BbQdWldBj4OCrj+MQ7Nfi4qMZVCMAvBnwntWbrayUvJwx/v1uTzrG4X+uNtto4UR
	GZGlaTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrulR-007k1v-2m; Sat, 12 Jun 2021 03:56:53 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrulM-007k0N-GD
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 03:56:49 +0000
Received: by mail-pf1-f175.google.com with SMTP id c12so6041493pfl.3
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 20:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OBgHgvMUoAyJJHJDZalDtHjcCyRI0iHp+vvdhmh2FIU=;
 b=e1LnunDq90BOgvFBM+DkGVmeY9/YNQ2kFPstTuUNTqgVMj0TnDDbudA+9PQsIU7Hv2
 aGWzaUUXtswWJXl9tQucg1PY6fxHIPjdenGSS2X6cvkvmvxigPNqklQwmwMggKbPANlG
 MDSQp3dgxS3OPfsO+wkKqRjIMw4EjAKW1F0SDOAv+fVkD2XuXp+Dq7B0fHvO3vvoZq4B
 sLo9KfE+HK/GbelfnHYJq+IRT7v6KQeIcrAtKpudKvtV3N4LEpJFXN/5iZdUcQU+VXMf
 VwHqdfnAEPqkVLI92mjkWp8nIa99aUxTihWJECQJAcY6ND8gV/kJlpNQILCGR6hhVYrb
 TMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OBgHgvMUoAyJJHJDZalDtHjcCyRI0iHp+vvdhmh2FIU=;
 b=FK0Q5ztIYgiPMWxZjYrvm8qBCpdjnv+NOLpwCcmAaoAm8TlCc5J/ByEJhI2PX7fey+
 FLdV7Gdq17AJyhbNnBM/bdCcAIW2BqU4E1Bex9nlDULNOvRb4qVc5utL8N2FKCrJQpad
 ih+YR/VZrJcNIBtXMkAQVea+O7sf/QifVgAK05MoZLLaCY4cxal8zSkl0smhYqPDz7uK
 HEaq+3bENR9SO+PKr9EW9BKU7SwqB5DvHqaiTKEggRQ2ya8sqM+NPCKCL1z7fpvU8YpF
 QzOB6ZkWgiS249IEcnECHv2MH5zrcChoAlMLMMocMaX1NtL7jg/XtAyznbTqNcKRwmSX
 pFFQ==
X-Gm-Message-State: AOAM5327YyEZiX1G9xW3IeyzZ0sWUCzd/lf2uvjw47ngIyt7i5S7/PVL
 fx+FY2kcVXZ2+yWcW7nvZ0PxoA==
X-Google-Smtp-Source: ABdhPJyypsRXQ8z0u6aFQf73imQPZN0k8d8xQMcoRVZfS5VxiexXQXbCL1WQ4EdQgwz+tmo11GKCbw==
X-Received: by 2002:a63:dd4a:: with SMTP id g10mr6700247pgj.144.1623470147746; 
 Fri, 11 Jun 2021 20:55:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f17sm6518738pgm.37.2021.06.11.20.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 20:55:47 -0700 (PDT)
Date: Fri, 11 Jun 2021 20:55:47 -0700 (PDT)
X-Google-Original-Date: Fri, 11 Jun 2021 20:54:39 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: Remove va_kernel_xip_pa_offset symbol from
 !XIP case
In-Reply-To: <20210603205237.645607ca@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alex@ghiti.fr, vitaly.wool@konsulko.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-8f445bdf-66ea-44cb-8f2b-bffd3a5b76c2@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_205648_562801_8B435ED5 
X-CRM114-Status: GOOD (  14.54  )
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

On Thu, 03 Jun 2021 05:52:37 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> The va_kernel_xip_pa_offset is only accessed for XIP case, so make it
> only available for XIP.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/mm/init.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ae32f78207f0..ca2826778989 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -194,10 +194,8 @@ EXPORT_SYMBOL(va_kernel_pa_offset);
>  #endif
>  #ifdef CONFIG_XIP_KERNEL
>  #define va_kernel_pa_offset    (*((unsigned long *)XIP_FIXUP(&va_kernel_pa_offset)))
> -#endif
>  unsigned long va_kernel_xip_pa_offset __ro_after_init;
>  EXPORT_SYMBOL(va_kernel_xip_pa_offset);
> -#ifdef CONFIG_XIP_KERNEL
>  #define va_kernel_xip_pa_offset        (*((unsigned long *)XIP_FIXUP(&va_kernel_xip_pa_offset)))
>  #endif
>  unsigned long pfn_base __ro_after_init;

This is used outside of XIP now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
