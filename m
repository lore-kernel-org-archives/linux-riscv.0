Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283DAC433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:08:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC704610D2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC704610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vFp1oHRJCy3/sgsSrKMlzr3mARJvWU0TtI+HimPsVlU=; b=fHxWEql2GMV4llo6yO+9MGU6Q
	to3WKaNA01Xc8HEyVPppBB2I2KFmz6of33Gk4vrZ1ezYDAXXwNkjyYrIRiBi0EwzX3ulLcdVtkuzJ
	UMYghgElhl5KclcMx5Q66dCyUc4xprOJLlhTinAfhMJbflvwWh4UsdrKQCSBQx9aLwa55IDnepISZ
	rfZ0TWJMhqqED7imEMEGXGrxjg0PLvOQUzMFx3VDT0SXWEWQrbqEKLVJn9lwFZnrTJWJPjXRw0aiD
	1tvczhxYCdXXKKAVLS3rsq1ZC0W1YbgFFckdGCS0olXjhOEKiNlndc4CqS5ksVVT2oAhNOIxY5KL+
	1cKwS4g5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSB6c-00Bto4-Ca; Fri, 02 Apr 2021 04:08:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSB6W-00Btnk-5Z
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:08:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so1799946wmf.5
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r29s2NuB4h8xDuoc4V2TUkw3k2SQOmwLpoFzxMpsSfU=;
 b=uO9cVaFbcLWG2qSj/V5Qkp9SImi/1O/PNF5uCdkXCUUYZJA9vpqlZt2zRX/qXJ+oah
 rO4VamcAG68UI6cC43pmYE6l2QOlTbqrFGjbSxNuXrWd/OtmqO6rMnqhxjBVRyqFyxlC
 OUKieCjk5HQ7Tftt13rMzjeAfydRy7xK+3jCFtWg8v5ll3hzus2DVE8HIb+pwdbsI7yC
 QVCqXkHxo8PllGMMtIKKFuW4k/d3AriUj05NbOe4teBaYbR9X2E74zD2YaXYDn5M4r7L
 PIglkR+DonJicpVCPf6bYjXpdXpqh5F3TGvDZnH7i+ffnm5eBtVnpMfc7h/1w6E2v96N
 XOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r29s2NuB4h8xDuoc4V2TUkw3k2SQOmwLpoFzxMpsSfU=;
 b=McAQx7st+OwqRZuQTPkwekM+ITKfVgjebqaqXPUW14tvq0TQ2zaXZV1ibDmWNab+G3
 1Q+tVNQA9dPbazGbNbHmvUliqBAxjDq2RZxYG9ZlK4qGw9Aj/sTrLnBBp2UrrMtIjPFA
 ejZE8pWJ3S7ZBKcAvc7XHdPHmKumODHLgOhQ3HDGUTJJy4qa/Otwi/E1HUtJxbsHjDd9
 uQgqGhz56RTJqIUpmiGUFXhShYPF6fflCE3pDO7PM+k2VStJo1lQN9nvVyG9i0q8/VTy
 AF838qihPDFkvZlI/15pup8svHva0dovSZP6BlhING/iMjVhcz0houTthiGwhhlAEmad
 3i7g==
X-Gm-Message-State: AOAM530/3Hsttf/gKUVrJGlIlDCAnLilCodMFSqTDfc6CnKl3Fsu4gkc
 xdbybVS6Jr0BUqrpUPa4UEm0LE2dzCxINdM3PEOgXw==
X-Google-Smtp-Source: ABdhPJzufLcR/4YtyTXgyOTuNyEx/ynwbR2Yl8q78bJ+i0nAQpDxD5IjgzH727vIE/K26GxxXakVKXJN8RA1Zji4Frc=
X-Received: by 2002:a05:600c:9:: with SMTP id
 g9mr11022806wmc.134.1617336493632; 
 Thu, 01 Apr 2021 21:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210401002442.2fe56b88@xhacker> <20210401002518.5cf48e91@xhacker>
In-Reply-To: <20210401002518.5cf48e91@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Apr 2021 09:38:02 +0530
Message-ID: <CAAhSdy0CgxZj14Jx62CS=gRVzZs9c9NUysWi1iTTZ3BJvAOjPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] riscv: add __init section marker to some functions
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_050816_456349_B2E229F4 
X-CRM114-Status: GOOD (  21.51  )
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

On Wed, Mar 31, 2021 at 10:00 PM Jisheng Zhang
<jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> They are not needed after booting, so mark them as __init to move them
> to the __init section.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/traps.c  | 2 +-
>  arch/riscv/mm/init.c       | 6 +++---
>  arch/riscv/mm/kasan_init.c | 6 +++---
>  arch/riscv/mm/ptdump.c     | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 1357abf79570..07fdded10c21 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -197,6 +197,6 @@ int is_valid_bugaddr(unsigned long pc)
>  #endif /* CONFIG_GENERIC_BUG */
>
>  /* stvec & scratch is already set from head.S */
> -void trap_init(void)
> +void __init trap_init(void)
>  {
>  }

The trap_init() is unused currently so you can drop this change
and remove trap_init() as a separate patch.

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 067583ab1bd7..76bf2de8aa59 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -57,7 +57,7 @@ static void __init zone_sizes_init(void)
>         free_area_init(max_zone_pfns);
>  }
>
> -static void setup_zero_page(void)
> +static void __init setup_zero_page(void)
>  {
>         memset((void *)empty_zero_page, 0, PAGE_SIZE);
>  }
> @@ -75,7 +75,7 @@ static inline void print_mlm(char *name, unsigned long b, unsigned long t)
>                   (((t) - (b)) >> 20));
>  }
>
> -static void print_vm_layout(void)
> +static void __init print_vm_layout(void)
>  {
>         pr_notice("Virtual kernel memory layout:\n");
>         print_mlk("fixmap", (unsigned long)FIXADDR_START,
> @@ -557,7 +557,7 @@ static inline void setup_vm_final(void)
>  #endif /* CONFIG_MMU */
>
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> -void protect_kernel_text_data(void)
> +void __init protect_kernel_text_data(void)
>  {
>         unsigned long text_start = (unsigned long)_start;
>         unsigned long init_text_start = (unsigned long)__init_text_begin;
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 4f85c6d0ddf8..e1d041ac1534 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -60,7 +60,7 @@ asmlinkage void __init kasan_early_init(void)
>         local_flush_tlb_all();
>  }
>
> -static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
> +static void __init kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
>  {
>         phys_addr_t phys_addr;
>         pte_t *ptep, *base_pte;
> @@ -82,7 +82,7 @@ static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long en
>         set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(base_pte)), PAGE_TABLE));
>  }
>
> -static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
> +static void __init kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
>  {
>         phys_addr_t phys_addr;
>         pmd_t *pmdp, *base_pmd;
> @@ -117,7 +117,7 @@ static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long en
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
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Apart from above, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
