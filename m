Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9F8C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 03:51:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E759961027
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 03:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E759961027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Z48WYv/xsQ51IVo6AfpJNSU6/Ux8dSbf6PMQOZ1x00=; b=INLJKzsurVyzHE7D/YQU1lfjS
	z94MoJpTiJD6GgyopEjJzPHn+1mMV/E6r5ijP976WvqHLrw3ExXaZwgeWxux9/76GdsxdxhVP0q71
	uDDAvJTWqzmB2kOFTfEKREavkDF9r3+ODHQsm1gtFodiopRzjrI2ZxT7eZmzdjZOVgbWy/IMsyowx
	yYlR55HnPnV/YiAgWa/kP1u5LY4sQcA/XWqSBa3hlLGM5QCD93tVYcb00noyfsggKDJb3yTqNsJWz
	GwtCQ2+XnWYr+NBUonWgcFuNBwdZLE6qMB9cDID7EaozBquHOX3OMJff2g905K7QMTGRaWALIA5ya
	cO7JaJC2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWA5K-008C1d-2k; Tue, 13 Apr 2021 03:51:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWA5H-008C1O-R9
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 03:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NLcMyvS4Bfbab4x/HInf8ARMVrCM5mdnxbt3TSzvKyM=; b=A67ClId9cFfWHtWwoqlp4MB/8U
 2C0zqR9ehipXEvC0MR4LE5G3ICHza9HJtngDCoWlk3IRsALvRwCZXBi2bpiywCFNh/eai5BeONFHf
 HGa2NevIk9ZZcFw9UHIU66fU4KAW60gLv6XiqM3WYNWSZkmkjLAysd27EFPZv2uuktk4tu7s3NwkR
 To35f69S5ivIsCC7HB+EqO1oo/50Ww/3QQUMtvGwDPXTbO7A/RGb7NRrZBihOHQTNwztudn6vCk4S
 2taNIFfyq3L9IjH5PciAO+docet1BlQ519/tHo0G3KeHtzq36RWR1eSESHblXjQwVLQ5s9YkyQ1GC
 oprZDIkA==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWA5C-006hse-Ph
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 03:51:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r7so2953464wrm.1
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 20:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NLcMyvS4Bfbab4x/HInf8ARMVrCM5mdnxbt3TSzvKyM=;
 b=T2LwnjxDOzLRWHPqcEq8PIec2G8icasDBBoP+sJTv22LbBtNyIv1RYDig7zggkOmYO
 0YptXjHiN2a7Sea3XjbJHspj4yH960AJsGIV01R8FeSG5L8dDg0FPM5K2EEpgHh2ZQdl
 Lzy5nqU3WyKkg6fFTVJljPWl+sx+rek+0LGApDSDYnQou0noSRBoOpstYv3/naBV1tPs
 UWtxwfTkay9xgrMEkHC48mWsZxyw3aahU4N+5b0sLMpN8Ewft9znY53Vchz4O+b5nudH
 keKGlbYQ4eMVEEvf3gwnE4+CiKN7rzfevkbubWd86Zkqjxp7zByQPiVeCNsbq9uFDmIg
 3p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NLcMyvS4Bfbab4x/HInf8ARMVrCM5mdnxbt3TSzvKyM=;
 b=FLhSET7MuGx0Wcq8DMm6uxgBD0CKjGw0L7XdxN8gy5Cw7aFf9kgY3P2ERV5MGAD/sg
 XdEPh8uACn2JvPa/SYOnrq6BEechuk62+ZV5o/SZimYzhJ8UFga8ggxmXXu3uzdNVi8D
 w5WUY8KNWqb7sKkA9uYbf+eKQ7tKVYdexpy8jpVaD2Y9YUFPcyeHIBxU9SpfhMzk4RaD
 Qiw191mjtbEhrbD5vDkei7upF87IQ0j8uWKFL4x4t4mhr9fgCL4Ehu5A6kA+9qBdPpbe
 q7fqfFO7ym+9OWHAm3QUBFf26iKULJjwvluo7BZSk8zKTDf/qxOzHkxmP1mvLSKR/KoK
 ZJ4g==
X-Gm-Message-State: AOAM530x9Rrp8ZdbuRWcnwIPp+mMzwMI0tbpaFjkl582knItASftkbIZ
 WpYnuA758DGOugRVJ8iIgkJ6kYO4IxP00E/vukWx/Q==
X-Google-Smtp-Source: ABdhPJwaFz7sHwMzirdAqwGgVbeq4VCvAZR7WDx7zIjFmE5+OpMtCk+N1dnzc4HFSO+FyUpM3HMyU0+eRzBnK9bSGYI=
X-Received: by 2002:a5d:424f:: with SMTP id s15mr22570167wrr.356.1618285880927; 
 Mon, 12 Apr 2021 20:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210413001110.7209bae6@xhacker> <20210413001228.663f9bc3@xhacker>
In-Reply-To: <20210413001228.663f9bc3@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Apr 2021 09:21:09 +0530
Message-ID: <CAAhSdy0q43HqmJ_-NJBdhBi0P2jn7YMctkH5mFwE52SD2at03w@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] riscv: add __init section marker to some
 functions
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_205122_853302_A8AA27CF 
X-CRM114-Status: GOOD (  19.24  )
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

On Mon, Apr 12, 2021 at 9:47 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> They are not needed after booting, so mark them as __init to move them
> to the __init section.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  arch/riscv/kernel/traps.c      | 2 +-
>  arch/riscv/mm/init.c           | 4 ++--
>  arch/riscv/mm/kasan_init.c     | 6 +++---
>  arch/riscv/mm/ptdump.c         | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ac202f44a670..e4741e1f0add 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -59,7 +59,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>
> -void riscv_fill_hwcap(void)
> +void __init riscv_fill_hwcap(void)
>  {
>         struct device_node *node;
>         const char *isa;
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 0879b5df11b9..041f4b44262e 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -196,6 +196,6 @@ int is_valid_bugaddr(unsigned long pc)
>  #endif /* CONFIG_GENERIC_BUG */
>
>  /* stvec & scratch is already set from head.S */
> -void trap_init(void)
> +void __init trap_init(void)
>  {
>  }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index dbeaa4144e4d..ecd485662b07 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -70,7 +70,7 @@ static inline void print_mlm(char *name, unsigned long b, unsigned long t)
>                   (((t) - (b)) >> 20));
>  }
>
> -static void print_vm_layout(void)
> +static void __init print_vm_layout(void)
>  {
>         pr_notice("Virtual kernel memory layout:\n");
>         print_mlk("fixmap", (unsigned long)FIXADDR_START,
> @@ -553,7 +553,7 @@ static inline void setup_vm_final(void)
>  #endif /* CONFIG_MMU */
>
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> -void protect_kernel_text_data(void)
> +void __init protect_kernel_text_data(void)
>  {
>         unsigned long text_start = (unsigned long)_start;
>         unsigned long init_text_start = (unsigned long)__init_text_begin;
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index ec0029097251..e459290d2629 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -48,7 +48,7 @@ asmlinkage void __init kasan_early_init(void)
>         local_flush_tlb_all();
>  }
>
> -static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
> +static void __init kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
>  {
>         phys_addr_t phys_addr;
>         pte_t *ptep, *base_pte;
> @@ -70,7 +70,7 @@ static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long en
>         set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(base_pte)), PAGE_TABLE));
>  }
>
> -static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
> +static void __init kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
>  {
>         phys_addr_t phys_addr;
>         pmd_t *pmdp, *base_pmd;
> @@ -105,7 +105,7 @@ static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long en
>         set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_pmd)), PAGE_TABLE));
>  }
>
> -static void kasan_populate_pgd(unsigned long vaddr, unsigned long end)
> +static void __init kasan_populate_pgd(unsigned long vaddr, unsigned long end)
>  {
>         phys_addr_t phys_addr;
>         pgd_t *pgdp = pgd_offset_k(vaddr);
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index ace74dec7492..3b7b6e4d025e 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -331,7 +331,7 @@ static int ptdump_show(struct seq_file *m, void *v)
>
>  DEFINE_SHOW_ATTRIBUTE(ptdump);
>
> -static int ptdump_init(void)
> +static int __init ptdump_init(void)
>  {
>         unsigned int i, j;
>
> --
> 2.31.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
