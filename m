Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51424C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 11:41:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EAE60231
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 11:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EAE60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0maV26BfsQufdsbIsKibtw+nhmr+Wu3IFtUoV3u6uNw=; b=ZVhFe3dNcO1sHW
	hdkP8luJl9zV5Eq82FWSPw8BpxpCTC+UsZwn/QJ2vKJuu8K75lCxYzmufzRZGZ0u1xmseEYWb3E+J
	zha22sndqs5OVRmDdbBPBC0Vxn9ElHoVWWve+nQvBFw+HUe1C5RT84JUcR5RGSlf7B2wq7cdUivI0
	2mUagBm5hTpwbTs2OB5cbYDzwdpAnPC10uZxVjsTYfGDudH/QcYQS1Vxa3LTweL4jffIo6n50PROo
	0RZQ/i4BAOoZTO/Mr3zK2397jlVomQBHUE8cjy5jU2gWBZOX+Rb7TO54Mkt8kQB5hgcVqudagXJ+F
	C0iJuKwwbNL6ePBGChUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loliq-008OhT-UR; Thu, 03 Jun 2021 11:41:12 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lolin-008OfN-DW
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 11:41:10 +0000
Received: by mail-wr1-f45.google.com with SMTP id a11so3624986wrt.13
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jun 2021 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dYpmgRyaGdNiF1ga7YiU1y1buioqsQI13Dyz7fcF4zU=;
 b=e6JkglIV14AN/ZpXb9f8lfWO87m04PkKP8T54Z02esIUvyA2cNi3cNCw+N/dr8zLT0
 QVM24Nqm3BD46X0/xLevxfHHvTHi2X3lo0kUdR32Y8iO0xJCKwvOYPZp5qIx9gad8rYL
 Qa0mQsg5zfe3rBxta5CaqyVbEQR/M1Yf5UCKnAC+Bols2CmSi3z0id4GiBewWBCCPY4W
 Se51uRDDv7HFXSdvUJETd89kt66DrCZdly6D3uBrzaHA9Z4FWLLIISlCgJp5G8FA0O0f
 v0pZr4myh4JH+INsyw1FSgI7mxfaoiu88tW6Anm5kYWNszyaOzjXUzIZJmKS2rFgkcKQ
 buSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dYpmgRyaGdNiF1ga7YiU1y1buioqsQI13Dyz7fcF4zU=;
 b=DosTuzfbU4UsEX//9+CpZ6IOzMpbKZVJ4Wv7UVndGB3Cm9szvJ4ivAw8fRkSgn0ZSi
 g9DsINQJshGVeBiUjWxVHYMD+cm69AUR3PVAi6/IZob3QOYv0vlcafv7S2gGwGaBfBn8
 6eUATyKatZcsv+2SMaDNwfA8nS/YAj4fkG1+H2C8bBMHwCCBZrBiXMDOnvz5yqfYwAoQ
 9mr2RzPjYA3oQPglhKEqZtEL4rbIJXuxNjQ8hsqQkwHvFZc3osy7/5aDOFoOp6Iyjg76
 YSfauD16MEY6eq98WKyFJOP7xT0zyZyuHIYP78jBMcKMqjFaCJs4OsTEA9c4chvju1+L
 Ig6Q==
X-Gm-Message-State: AOAM530UkbgNbwKNvjKksXG7htwe644It6CwU8D5vQr5I0WigpjhJ6cK
 4MU2JjofC7jmBfnFc4oGV6Kd08S7i1+RXKiQjGPhBg==
X-Google-Smtp-Source: ABdhPJzWs24S7KvixuXlVGA5sJEbS4CgNMowpCDSL9j4He92oJi3LqU6BSluuEMD2qXIrXaHegJgdzOCgOlCkz/jQKc=
X-Received: by 2002:a5d:540b:: with SMTP id g11mr11184759wrv.390.1622720407576; 
 Thu, 03 Jun 2021 04:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210603082749.1256129-1-alex@ghiti.fr>
 <20210603082749.1256129-2-alex@ghiti.fr>
In-Reply-To: <20210603082749.1256129-2-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 3 Jun 2021 17:09:56 +0530
Message-ID: <CAAhSdy2O2o4Dpgwo3keT1P_Qutb21Zb_kEbZNnXKyw2duTJu1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: Factorize xip and !xip kernel address
 conversion macros
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Zong Li <zong.li@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_044109_496519_D38D90D2 
X-CRM114-Status: GOOD (  17.02  )
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

On Thu, Jun 3, 2021 at 1:59 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> To simplify the kernel address conversion code, make the same definition of
> kernel_mapping_pa_to_va and kernel_mapping_va_to_pa compatible for both xip
> and !xip kernel by defining XIP_OFFSET to 0 in !xip kernel.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

I think subject of the patch should be:
"Simplify address conversion macros for xip and !xip kernel"

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/page.h    | 14 +++-----------
>  arch/riscv/include/asm/pgtable.h |  2 ++
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 6a7761c86ec2..6e004d8fda4d 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -93,9 +93,7 @@ extern unsigned long va_pa_offset;
>  #ifdef CONFIG_64BIT
>  extern unsigned long va_kernel_pa_offset;
>  #endif
> -#ifdef CONFIG_XIP_KERNEL
>  extern unsigned long va_kernel_xip_pa_offset;
> -#endif
>  extern unsigned long pfn_base;
>  #define ARCH_PFN_OFFSET                (pfn_base)
>  #else
> @@ -103,6 +101,7 @@ extern unsigned long pfn_base;
>  #ifdef CONFIG_64BIT
>  #define va_kernel_pa_offset    0
>  #endif
> +#define va_kernel_xip_pa_offset 0
>  #define ARCH_PFN_OFFSET                (PAGE_OFFSET >> PAGE_SHIFT)
>  #endif /* CONFIG_MMU */
>
> @@ -110,29 +109,22 @@ extern unsigned long kernel_virt_addr;
>
>  #ifdef CONFIG_64BIT
>  #define linear_mapping_pa_to_va(x)     ((void *)((unsigned long)(x) + va_pa_offset))
> -#ifdef CONFIG_XIP_KERNEL
>  #define kernel_mapping_pa_to_va(y)     ({                                              \
>         unsigned long _y = y;                                                           \
>         (_y >= CONFIG_PHYS_RAM_BASE) ?                                                  \
>                 (void *)((unsigned long)(_y) + va_kernel_pa_offset + XIP_OFFSET) :      \
>                 (void *)((unsigned long)(_y) + va_kernel_xip_pa_offset);                \
>         })
> -#else
> -#define kernel_mapping_pa_to_va(x)     ((void *)((unsigned long)(x) + va_kernel_pa_offset))
> -#endif
>  #define __pa_to_va_nodebug(x)          linear_mapping_pa_to_va(x)
>
>  #define linear_mapping_va_to_pa(x)     ((unsigned long)(x) - va_pa_offset)
> -#ifdef CONFIG_XIP_KERNEL
>  #define kernel_mapping_va_to_pa(y) ({                                          \
>         unsigned long _y = y;                                                   \
>         (_y < kernel_virt_addr + XIP_OFFSET) ?                                  \
>                 ((unsigned long)(_y) - va_kernel_xip_pa_offset) :               \
>                 ((unsigned long)(_y) - va_kernel_pa_offset - XIP_OFFSET);       \
>         })
> -#else
> -#define kernel_mapping_va_to_pa(x)     ((unsigned long)(x) - va_kernel_pa_offset)
> -#endif
> +
>  #define __va_to_pa_nodebug(x)  ({                                              \
>         unsigned long _x = x;                                                   \
>         (_x < kernel_virt_addr) ?                                               \
> @@ -141,7 +133,7 @@ extern unsigned long kernel_virt_addr;
>  #else
>  #define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_offset))
>  #define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
> -#endif
> +#endif /* CONFIG_64BIT */
>
>  #ifdef CONFIG_DEBUG_VIRTUAL
>  extern phys_addr_t __virt_to_phys(unsigned long x);
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index bde8ce3bfe7c..d98e931a31e5 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -77,6 +77,8 @@
>
>  #ifdef CONFIG_XIP_KERNEL
>  #define XIP_OFFSET             SZ_8M
> +#else
> +#define XIP_OFFSET             0
>  #endif
>
>  #ifndef __ASSEMBLY__
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
