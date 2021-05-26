Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781D0C47087
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 02:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB0861260
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 02:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB0861260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAw7IGUtNl3tUCbzOqJMU6C2a8VVuCVDIJKq2EYPC7g=; b=w4L2NQybZvAd/U
	D4rJYnvcsXKG8BbOzq1dyGl8Cp0UDVzhibCDAJ6UCzDC/lL8Hh9tlMQH+fCi8+wjK+FqfYeQ1dhgo
	FppLm1W6IzI8MtBa0/01J8M/eyPQx/vyaAA/v4saUZXkvGDUbBC0gSgHeUCisWP3h+D2Z1WjuJIVg
	Moeq9SfqE8Oxx6hnCdkTaYroEz4oOeWoVMjyPP9DFWRs1uo5ApkQKKunSO3YWIs+q8DpSsxr18byv
	LLEQfS4+tvx1DEHGvX12T0crL5ja4Dg0wkEJwsTKFZq2VrkENcXRpZESXfijWCG6cGlxE7rJ+PI6r
	EyEPPtSfXQ/C5wlfJiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lliwi-00A0Um-U6; Wed, 26 May 2021 02:06:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lliwZ-00A0TW-9R
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 02:06:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 976956128D
 for <linux-riscv@lists.infradead.org>; Wed, 26 May 2021 02:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621994806;
 bh=yRr75FXBDkkX6XLpZgf/r8ILJmMAe0Rn0jw76SQB5fU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HxqB9QXadza+92feVmfiJr0l8ONPm4BbzOMPBgsjDVHEaJq73542HPp1zGpMa1HgU
 9cAUCVmpj3/FJxdaXrwE3o7Id+LEuVoCaT6jOwAGcOHzJl0/UpfqivPhGNVRpVaLIv
 EvEI9sPIJRY1N2iivViNbS02uvoRV+M1vlW14Y1pavPqAD8BcB0LECLj7tV/hUYUvT
 K2hHNTg6nPy5N+ZpGLqixXKirhUOhVwjyO139vMlCAXGUUkFzSybJwQUxm+GFoGJnD
 e0Jttoe6+ywFvlOx05GKX79atc7ohdY5+PKY7M2IgUvXpF9nZonpR9VDcVg75QxeLU
 XHUkIWlfVUjaQ==
Received: by mail-lj1-f174.google.com with SMTP id t17so23991889ljd.9
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 19:06:46 -0700 (PDT)
X-Gm-Message-State: AOAM530Gj2AsiFBtV6+94pyzxylld1ZG0/JNaxFcCjR40wzLZUVGbv0c
 WGYRvDZEER4taeHNYWxFZtkYfzMfIX1FpGhqImw=
X-Google-Smtp-Source: ABdhPJxvzHi5wR2bxJ1FRaG/UA35jIYFHUzKTYzsu/MTRD8c5prpdij+urvuWwGp7gCfRvxKrhFG98Rfggw/X7Q+Y7Y=
X-Received: by 2002:a2e:1416:: with SMTP id u22mr386289ljd.498.1621994804881; 
 Tue, 25 May 2021 19:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <1621945234-37878-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621945234-37878-1-git-send-email-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 26 May 2021 10:06:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTaw3WyFoSyK9O6WOxJwsxphX+xu3C+dSFVH6F6fQa3Ww@mail.gmail.com>
Message-ID: <CAJF2gTTaw3WyFoSyK9O6WOxJwsxphX+xu3C+dSFVH6F6fQa3Ww@mail.gmail.com>
Subject: Re: [PATCH] arch: Cleanup unused functions
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Michal Simek <monstr@monstr.eu>, Christoph Hellwig <hch@lst.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_190647_396885_1DDE7801 
X-CRM114-Status: GOOD (  20.76  )
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

Hi Arnd,

Could you help add the patch to your next-tree?

Also, please append below:

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anup Patel <anup@brainfault.org>

Thx

On Tue, May 25, 2021 at 8:21 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These functions haven't been used, so just remove them. The patch
> has been tested with riscv, but I only use grep to check the
> microblaze's.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>  arch/microblaze/include/asm/page.h |  3 ---
>  arch/riscv/include/asm/page.h      | 10 ----------
>  2 files changed, 13 deletions(-)
>
> diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> index bf681f2..ce55097 100644
> --- a/arch/microblaze/include/asm/page.h
> +++ b/arch/microblaze/include/asm/page.h
> @@ -35,9 +35,6 @@
>
>  #define ARCH_SLAB_MINALIGN     L1_CACHE_BYTES
>
> -#define PAGE_UP(addr)  (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)        ((addr)&(~((PAGE_SIZE)-1)))
> -
>  /*
>   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
>   * it is set to the kernel start address (aligned on a page boundary).
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 6a7761c..a1b888f 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -37,16 +37,6 @@
>
>  #ifndef __ASSEMBLY__
>
> -#define PAGE_UP(addr)  (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)        ((addr)&(~((PAGE_SIZE)-1)))
> -
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)  (((addr)+((size)-1))&(~((size)-1)))
> -#define _ALIGN_DOWN(addr, size)        ((addr)&(~((size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr, size)     _ALIGN_UP(addr, size)
> -
>  #define clear_page(pgaddr)                     memset((pgaddr), 0, PAGE_SIZE)
>  #define copy_page(to, from)                    memcpy((to), (from), PAGE_SIZE)
>
> --
> 2.7.4
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
