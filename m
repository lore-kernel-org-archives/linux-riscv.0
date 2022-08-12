Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D603DC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ybn5X4V6nI6YPK7zUlM/8wcv/O1OGX088FVdd3BtSC8=; b=p/ckJkdfhAIhni
	j4AV574jUnZ/IgORHwzbL8hEmEaddXdfWl//rtIAN/3yGYWynJTnoItsNINZGvhEFpP73YIxeDUnX
	Yy/KqSPwrIiRwhe6eT+GNKPrDeH6CsOQpJmInsFVhEV+n9I6sv35NiOIbltRhI6E6SuLEJGxLf0q1
	tMiZ/9ps6iJH+kZQM2bzg7QHaa5QEtNoZFH1q+VzwzMHYilhC1bDETXYMF2o8ppJpdwHVaGTSS982
	/PxoecZRtoPlaP2U8vOck9BLaMOvt2zwPAHni11SNQQzTEMP282n3IVk4yDqms8zkX44o7MipsjA0
	sE1dIB1sh2Fuoeh7CAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMYh1-00BfId-El; Fri, 12 Aug 2022 17:43:31 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMYgm-00Bf88-58
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 17:43:18 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 199so2535588ybl.9
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1z0Zq2sgc5y5a0KA2ktDUwYOcv85tZVbUMP8ZEM5kEs=;
        b=rOq0xwJ1SUBFw3aahLql26ivKG0EXmX/Ie+Jl6zEQnzuW4ayMoz93DhPW9/TCCjQ9V
         Qdmy6aADrPcAIQ8NBzsCicJcohxNiHXDqzWUEKo6fOhvAXH6BrDfzArpiPFCErTlh5qB
         L9iFJHlzHJg+H2h6qLevTI0z3JI4GTRIJriPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1z0Zq2sgc5y5a0KA2ktDUwYOcv85tZVbUMP8ZEM5kEs=;
        b=tVp6ALdFgMu40LRiiRYTjv9cZRj30n2kKxTDu7CbpMuYVxwbLqxaphSx4NpDDUeOMR
         zdbn0UJ/LJegKR13l6AXK2xbKmVMvOcSs9GSyE3/JyXVmOqthcDvOEDfr4AGDuqmqA7R
         azdwhlRhLflG6GUHjsG7ylPGkwRJXPJ4yey4TfdkXzeg+HlZ4C3MIvuVhBQe4dbfD3+R
         Q9nQzTrQvtqJp7rfYpOlfIDhYOVlxnKpbPjxNE8la3bceYe+5mzDUZa+ydBH5CbbnJvq
         EJzrw5gbL/64W8Xa1Qo3QsKYt7JESFc7ZgahWOyWF68EP28zoXFq8StekWp+PE88FBV1
         ArKQ==
X-Gm-Message-State: ACgBeo0Dt31/TAbB/YM9TPBRdZRZBi3nDmsvV7yq6aYyWBAbSYXMZJSi
	+0r6x+5SZdYqrnSOcQ1MOfxPgGGbEJ4qu1zjk6M5
X-Google-Smtp-Source: AA6agR6i+gmIQvOwZOs/Y6O3RASi4YFfOlAGLoEvtZ1sRwSEx1GaT2E6vmixCtA0nwU5kRSKekZc6It1Oj9b4ltFndQ=
X-Received: by 2002:a5b:8c2:0:b0:682:cd10:c896 with SMTP id
 w2-20020a5b08c2000000b00682cd10c896mr3256805ybq.237.1660326193089; Fri, 12
 Aug 2022 10:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220812154010.18280-1-palmer@rivosinc.com>
In-Reply-To: <20220812154010.18280-1-palmer@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Aug 2022 10:43:02 -0700
Message-ID: <CAOnJCUL2_qJzDfX_9FVUqMtHcKf9xdg551HqoQ_kVsL_Pp=XAQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_104316_432467_3319E2AA 
X-CRM114-Status: GOOD (  28.24  )
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

On Fri, Aug 12, 2022 at 9:06 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> This fixes two issues: I truncated the warning's hart ID when porting to
> the 64-bit hart ID code, and the original code's warning handling could
> fire on an uninitialized hart ID.
>
> The biggest change here is that riscv_cbom_block_size is no longer
> initialized, as IMO the default isn't sane: there's nothing in the ISA
> that mandates any specific cache block size, so falling back to one will
> just silently produce the wrong answer on some systems.  This also
> changes the probing order so the cache block size is known before
> enabling Zicbom support.
>
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> ---
>
> Changes since v1 <https://lore.kernel.org/all/20220812142400.7186-1-palmer@rivosinc.com/>:
>
> * Everything but the unsigned long cbom_hartid.
> ---
>  arch/riscv/kernel/setup.c       |  2 +-
>  arch/riscv/mm/dma-noncoherent.c | 22 ++++++++++++----------
>  2 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 95ef6e2bf45c..2dfc463b86bb 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
>         setup_smp();
>  #endif
>
> -       riscv_fill_hwcap();
>         riscv_init_cbom_blocksize();
> +       riscv_fill_hwcap();
>         apply_boot_alternatives();
>  }
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..3aa3572715d6 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,7 +12,7 @@
>  #include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>
> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> +static unsigned int riscv_cbom_block_size;

What is the expected behavior if the block size is zero in CMO
operations ? As per my understanding, it will be equivalent to a nop.
Let me know if I am wrong.

If that is the case, this is misleading as well. Maybe we should just
disable CMO extension altogether if it can't find the DT property.

>  static bool noncoherent_supported;
>
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -80,37 +80,39 @@ void riscv_init_cbom_blocksize(void)
>  {
>         struct device_node *node;
>         int ret;
> -       u32 val;
> +       u32 val, probed_block_size;
>
> +       probed_block_size = 0;
>         for_each_of_cpu_node(node) {
> -               unsigned long hartid;
> -               int cbom_hartid;
> +               unsigned long hartid, cbom_hartid;
>
>                 ret = riscv_of_processor_hartid(node, &hartid);
>                 if (ret)
>                         continue;
>
> -               if (hartid < 0)
> -                       continue;
> -
>                 /* set block-size for cbom extension if available */
>                 ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>                 if (ret)
>                         continue;
>
> -               if (!riscv_cbom_block_size) {
> -                       riscv_cbom_block_size = val;
> +               if (!probed_block_size) {
> +                       probed_block_size = val;
>                         cbom_hartid = hartid;
>                 } else {
> -                       if (riscv_cbom_block_size != val)
> +                       if (probed_block_size != val)
>                                 pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
>                                         cbom_hartid, hartid);
>                 }
>         }
> +
> +       if (probed_block_size)
> +               riscv_cbom_block_size = probed_block_size;
>  }
>  #endif
>
>  void riscv_noncoherent_supported(void)
>  {
> +       WARN_ON(!riscv_cbom_block_size,
> +               "Non-coherent DMA support enabled without a block size\n");
>         noncoherent_supported = true;
>  }
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
