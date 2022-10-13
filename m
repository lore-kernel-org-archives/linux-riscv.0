Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AA9C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTs09r90W+ra8pi3nGPwPorrKyo7eCzqmE3il4x27RA=; b=YAbcI/wj5GV7hR
	oL1/8QPJHQ8gI8HT16E3/iqwG4Y98AQ4gv39mL0f2SrnCIszB6HsriNNZw/G/+t4T2CIYCXUQj26w
	Nx/OOaVlyIKfD9R67+XNLJqxfy78TTFrvKkoFYvsH94JAdFSU2vqLMhh9d6FZHMJaYe/SUjwM7RG9
	I4peRs4zFxHilFYc+iaHN+C2aeDNF6Lnp6KsSOmiHIzYAwu4SWM+vjXO7hdXw9M5ll4924uHbg71P
	z8cpdkWQraBxh/NUor1rCx2dUgpxqT/GAbvS18YSN0vYoa+zD6BDvqn790SZgpQgjgNqApFWcW3//
	yJD7+cKflGSsTgC5uXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyfu-00C2D1-W9; Thu, 13 Oct 2022 13:55:03 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyYq-00Byxq-QJ
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 13:47:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id s2so2728946edd.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RTHZiWY9sdI5ZDa7IdshZZ4z3UbImNvZVyHoCA+ebzo=;
        b=f4KrUbOUgRD1QAy8jOnbmvJrSu4fppJkUha+l+47ojimJoIDuU/vtCuW5QvqUPqIwP
         /psYhrn2kk4YhXgA9z1nbCMHTjefAS42kM5SG36JeCVcGFP31IDHNibSJi1pZDG9h/7S
         6kX7hT4t0RV1gDmZ0gsb5Xq6cMaIOZt0E4f/iPRllrzrIGIuWgyJAM9p4R8H3bkJutDn
         gtIm2V66bc/E8utcpCVPzM1FdJ3F+PKepWZ55kT+76xWDk98yzUIfmfF153DqIrPrLhi
         jPR8Tmud6F74msE+Jp6B785b/j8iTvogrE28JUKlQXJYenOTESZJLeGL0103dKjWbqnU
         ypzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTHZiWY9sdI5ZDa7IdshZZ4z3UbImNvZVyHoCA+ebzo=;
        b=kc4a0jOeh3vjZ3d8eAi0L8AAXeoIDmysUyHucBbiNA9OCi8lXVNtxoYJDNZUfVIdD1
         hpYRfHOFrD1EPCqjBr/k7yQtlnUk1lxdoRmtSEcqAnfks5xU+irtDReTSuDd9UncnLS9
         kcYDOSB+nHRU1k4Fms3vsg6Yd//oTebjFs+XoXnEM/woaVGCyseRdoQSPpDRpeeAfHgH
         k/JJ3ldrGqAPKOs5fMQa/E4f7Bn4GoO4gzgc7gBdKjsD2TqRDdgNl8Dfsdx8eAu8za3p
         MMdxltsdEKXjix+v0hEihz52rhOL9JfUuWLuYysjAUkhMN/LEnXasVmWHiG+Nm6flb0L
         A6+Q==
X-Gm-Message-State: ACrzQf2qi5sS6hhHOPG9M+hLtMlKHv6B0GARMAAWRWwlWcOdZo+D4LsP
	919ndI1Z5YTzx5CWh6CExw/TYSkIOjV1DduyG0qYnQ==
X-Google-Smtp-Source: AMsMyM47BvPZcAVHzj67wtqBIjhznlJ3D7wtu6hVwnd8HeP3IhY/rBCNZmQ0/JrpKmWkGwEwoTr1VOFcVo/uBKezlHA=
X-Received: by 2002:aa7:d39a:0:b0:458:a612:f805 with SMTP id
 x26-20020aa7d39a000000b00458a612f805mr31742042edq.49.1665668862967; Thu, 13
 Oct 2022 06:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221013134217.1850349-1-ajones@ventanamicro.com>
In-Reply-To: <20221013134217.1850349-1-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 19:17:31 +0530
Message-ID: <CAAhSdy3j6rA34+bY_X0CTkjOF8Ubj0OGMbbXy30tFbN_sc-Kyg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
To: Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, conor.dooley@microchip.com, vernon2gm@gmail.com, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_064745_071995_7647E826 
X-CRM114-Status: GOOD (  25.03  )
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

On Thu, Oct 13, 2022 at 7:12 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> be available and riscv_init_cbom_blocksize() should always be
> invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
> is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> instructions in the kernel" not "pretend there isn't zicbom, even
> when there is". When zicbom is available, whether the kernel enables
> its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> Ensure we can build KVM and that the block size is initialized even
> when compiling without RISCV_ISA_ZICBOM.
>
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

This is quite similar to the code movement patch I had in the PMEM series.

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

@Palmer, let me know if you are okay with this going through the KVM tree.

Regards,
Anup

> ---
>  arch/riscv/include/asm/cacheflush.h |  8 ------
>  arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
>  3 files changed, 38 insertions(+), 49 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 273ece6b622f..1470e556cdb1 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -42,16 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>
>  #endif /* CONFIG_SMP */
>
> -/*
> - * The T-Head CMO errata internally probe the CBOM block size, but otherwise
> - * don't depend on Zicbom.
> - */
>  extern unsigned int riscv_cbom_block_size;
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
>  void riscv_init_cbom_blocksize(void);
> -#else
> -static inline void riscv_init_cbom_blocksize(void) { }
> -#endif
>
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  void riscv_noncoherent_supported(void);
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..8525f4a2d598 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>
> +#include <linux/of.h>
>  #include <asm/cacheflush.h>
>
>  #ifdef CONFIG_SMP
> @@ -86,3 +87,40 @@ void flush_icache_pte(pte_t pte)
>                 flush_icache_all();
>  }
>  #endif /* CONFIG_MMU */
> +
> +unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL(riscv_cbom_block_size);
> +
> +void riscv_init_cbom_blocksize(void)
> +{
> +       struct device_node *node;
> +       unsigned long cbom_hartid;
> +       u32 val, probed_block_size;
> +       int ret;
> +
> +       probed_block_size = 0;
> +       for_each_of_cpu_node(node) {
> +               unsigned long hartid;
> +
> +               ret = riscv_of_processor_hartid(node, &hartid);
> +               if (ret)
> +                       continue;
> +
> +               /* set block-size for cbom extension if available */
> +               ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> +               if (ret)
> +                       continue;
> +
> +               if (!probed_block_size) {
> +                       probed_block_size = val;
> +                       cbom_hartid = hartid;
> +               } else {
> +                       if (probed_block_size != val)
> +                               pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> +                                       cbom_hartid, hartid);
> +               }
> +       }
> +
> +       if (probed_block_size)
> +               riscv_cbom_block_size = probed_block_size;
> +}
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index b0add983530a..d919efab6eba 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -8,13 +8,8 @@
>  #include <linux/dma-direct.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/mm.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>
> -unsigned int riscv_cbom_block_size;
> -EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> -
>  static bool noncoherent_supported;
>
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>         dev->dma_coherent = coherent;
>  }
>
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -void riscv_init_cbom_blocksize(void)
> -{
> -       struct device_node *node;
> -       unsigned long cbom_hartid;
> -       u32 val, probed_block_size;
> -       int ret;
> -
> -       probed_block_size = 0;
> -       for_each_of_cpu_node(node) {
> -               unsigned long hartid;
> -
> -               ret = riscv_of_processor_hartid(node, &hartid);
> -               if (ret)
> -                       continue;
> -
> -               /* set block-size for cbom extension if available */
> -               ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> -               if (ret)
> -                       continue;
> -
> -               if (!probed_block_size) {
> -                       probed_block_size = val;
> -                       cbom_hartid = hartid;
> -               } else {
> -                       if (probed_block_size != val)
> -                               pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> -                                       cbom_hartid, hartid);
> -               }
> -       }
> -
> -       if (probed_block_size)
> -               riscv_cbom_block_size = probed_block_size;
> -}
> -#endif
> -
>  void riscv_noncoherent_supported(void)
>  {
>         WARN(!riscv_cbom_block_size,
> --
> 2.37.3
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
