Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16EBC2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 06:23:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EB2223BD
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 06:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3t3ApsP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="NnCu7EK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9EB2223BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2FdJluba2f3c/kGtixH84gDmp3E+SZvQhWL/mD/cO7I=; b=F3t3ApsPrCXPSZOfmt89/HNuR
	JOrOfJiS12Oz3vDIEn10VI1lvazSuDosI1Z3sdg6Xr1KZBTUhTCMSSKB1SCiGNk1CzVHk9+PmPh/3
	8wymgVzGt3R+nwSYwmXqCW6bf9mnB5jLp2o2pHcaiXteBxthOq6HzoGBLVfMME0g9NLPiPoNP8qpI
	U3ppNcnjls16FIh4yE7W0NLSOxA0JZT9oW7fUkxljfKhXDjFrSO9hJN9EjE6STdYDuEvi3LHROADE
	JAuN7UU9yorFWAwm7bQxPcwAiDvgtCFizL1FBWzlUfSqRlGmlAB0n9OQgFex5S7iasymdwg60aLjD
	95liKsoig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keuOe-0006lR-G0; Tue, 17 Nov 2020 06:23:20 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keuOb-0006kx-Kn
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 06:23:18 +0000
Received: by mail-io1-xd43.google.com with SMTP id s24so19970306ioj.13
 for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2020 22:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bHV0hvrzXLzEja0Fa1UvLGBFqLjFNwE0NgtDSkB+Nys=;
 b=NnCu7EK6Y33s/EN/ksCjKSO4j5OKX5oQV1VdWDAQywrHXXEaLHBreKnItuvpFHrdXN
 xE6HHArgS42njCIDJ1tzB6KPLD00RnPAotpOqJ2Ba5lbG3KJi68CmYuWSP2r9tORHCEX
 WWs9rIjXZ3zRZYO7e9JecPutoMGVXObwO7r5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHV0hvrzXLzEja0Fa1UvLGBFqLjFNwE0NgtDSkB+Nys=;
 b=PMtxlMHVD9yY5XhJFl+rB95ki+L/NC3RSQD36JZIeTqjWcCRhP+cAM8wGdiT1WBvoq
 KxSuSJ7PYsuCvjhDrH4CseB290jamRtXXuGyBJvlp8Iw7gYLLJCvFimY0NIn5Fp2QTaD
 v76SnkqC5BnvXYbSmzA4ZRtHZ7E1pEOcXXjsoYMtVoqby89g3GxRoxKI2IVpyZQCRMmJ
 chKe7uQ7zEOg7l78PkiF7AVlEoHFcLlEXkoOi/d5rlzz3/0oj42zh4MM7eR7r80BJFSW
 G4v8Vii4BhauOV0UsDhmZE/LVA9yAzMbbRQ3k7oL8dt4CM+CobYMPMMJlqE1jHzlAfPE
 mg3A==
X-Gm-Message-State: AOAM532bYSB9B8ulCfMmVesK1hZaohiu0Pdrye/Q1dMqXYuQgV3NvEs7
 LON5dkALcVMzi9zHpC88p9vXuQ4jj0nRiz9IfhBs
X-Google-Smtp-Source: ABdhPJxQ7SXWMGop/Dwil6NOeSGhywknWCSzZmWKJyvVLPl9suMgBlfTdz+zNOG8Phpwdx+HGoJZu4/bAZcZnRGRQXI=
X-Received: by 2002:a05:6602:2d93:: with SMTP id
 k19mr10278404iow.51.1605594193506; 
 Mon, 16 Nov 2020 22:23:13 -0800 (PST)
MIME-Version: 1.0
References: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
In-Reply-To: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 16 Nov 2020 22:23:02 -0800
Message-ID: <CAOnJCUJ6zsD3iP-MmBzqR3jOXfC6f9Tg0ryUVgZdAtn0=e=6Rw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
To: Sebastien Van Cauwenberghe <svancau@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_012317_868658_C54E5302 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 4:58 AM Sebastien Van Cauwenberghe
<svancau@gmail.com> wrote:
>
> From 5690c2f91d87a007babb13e2d2c9c45d1ff68b7a Mon Sep 17 00:00:00 2001
> From: Sebastien Van Cauwenberghe <svancau@gmail.com>
> Date: Mon, 16 Nov 2020 13:37:32 +0100
> Subject: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX is
>  disabled
>
> Allows the sections to be aligned on smaller boundaries and
> therefore results in a smaller kernel image size.
>
> Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
> ---
>  arch/riscv/include/asm/set_memory.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 4c5bae7ca01c..172e63d942b0 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -27,14 +27,14 @@ int set_direct_map_default_noflush(struct page *page);
>
>  #endif /* __ASSEMBLY__ */
>
> -#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
> +#ifdef CONFIG_STRICT_KERNEL_RWX
>  #ifdef CONFIG_64BIT
>  #define SECTION_ALIGN (1 << 21)
>  #else
>  #define SECTION_ALIGN (1 << 22)
>  #endif
> -#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> +#else /* !CONFIG_STRICT_KERNEL_RWX */
>  #define SECTION_ALIGN L1_CACHE_BYTES
> -#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> +#endif /* CONFIG_STRICT_KERNEL_RWX */
>
>  #endif /* _ASM_RISCV_SET_MEMORY_H */
> --
> 2.28.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks for the fix.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
