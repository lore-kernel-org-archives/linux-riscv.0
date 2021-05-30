Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C39C4708F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:40:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1FC60698
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1FC60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hw25azBRuKijpXxBik+ccgLf6R0zOf6AikHC+91g7t8=; b=jmW2MKkTyTl+z2
	9eldW2dvs0lLW7aNeXPqwEkyh2+NS/8qBqN0squy93YfljSWdaIjqrShmdBvpDMUz3al6mL3QnpTC
	13gQbo0DOtkkCZhybk8rc8ojaT45MDAoU5nJplQIpb+kPfuLaucPiJLNNecNidG1HqwicGMxN1BR0
	xCM64N7MbZflW+V3lTqGuM0E/vbf9V5Ob0BxVpQ4ZyTshxzQa42d7S52sSfWdDkM8+ACkNCuA3YZN
	6zYF491cLoyiF7F6KkTzgkGsju/kQl969xVmedLzfMMDv+VfhNMuZpU3qi3l4VVLaWxJxTD7o0Geq
	jshshUsyZ1lrZVoJ0isA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln9UV-008hGT-2w; Sun, 30 May 2021 00:39:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln9US-008hFv-LF
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 00:39:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21F3461131
 for <linux-riscv@lists.infradead.org>; Sun, 30 May 2021 00:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622335180;
 bh=zz/QLlDkmcV46YG1G4nPrmU4gw/ajU0Q456WlxmIpsQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FRnl9qol1Fl9+NcwJZNvYDe2LmPLX7eLccJIZMFhkcEm7MS7oD2VefYxb7UQuR+mp
 Fa8VbWtq1A22AyDDg8zNO/rkGAQWYJd8/rICl5FYAd6upnjoxZSV/YStnyHtApbulj
 MegekhUaQgrrh33W9SQjJT9RchLHEakj6GBqTDVH9anfIOYJL3IlXEI8i8eTR/jCfl
 00NjTn2Az+z5rX614BkgdHDu7NuNRvNwDMDI20MjhzzgmDiZsHm+PtQWZZT2Hfspv2
 G2cXU6u7gHtQSO70rekzF7BWSiO774hKRDTfUfU87UbJiFuWDQaCVzHZhe1SlKveA0
 Y+yYQX2HN7w9Q==
Received: by mail-lj1-f172.google.com with SMTP id v5so10055343ljg.12
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 17:39:40 -0700 (PDT)
X-Gm-Message-State: AOAM533idfy6afKfT2wB0u+hkevpuK56WnS/Kq2bw/tU30uv4oaecuXu
 CKCgyR3qqrErDHjx0ekZ1vQqP9hPVBYfiLWT3R4=
X-Google-Smtp-Source: ABdhPJza3/ltlanrLtzL4ty58q8ry4OB11PrKcmfQSEjJ+wlhiaMJ/v7AqzRPrzMJY97GcBxSjLWfA9zOGpPxXvrAcs=
X-Received: by 2002:a05:651c:2d0:: with SMTP id
 f16mr3881029ljo.18.1622335178437; 
 Sat, 29 May 2021 17:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <1622008161-41451-1-git-send-email-guoren@kernel.org>
 <1622008161-41451-3-git-send-email-guoren@kernel.org>
 <20210527070903.GA32653@lst.de>
In-Reply-To: <20210527070903.GA32653@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 May 2021 08:39:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQpDYtEdw6ZrTVZUYqxGdhLPs25RjuUiQtz=xN2oKs2fw@mail.gmail.com>
Message-ID: <CAJF2gTQpDYtEdw6ZrTVZUYqxGdhLPs25RjuUiQtz=xN2oKs2fw@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] riscv: Use use_asid_allocator flush TLB
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_173940_770941_219CFD9E 
X-CRM114-Status: GOOD (  38.46  )
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

On Thu, May 27, 2021 at 3:09 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 26, 2021 at 05:49:21AM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Use static_branch_unlikely(&use_asid_allocator) to keep the origin
> > tlb flush style, so it's no effect on the existing machine. Here
> > are the optimized functions:
> >  - flush_tlb_mm
> >  - flush_tlb_page
> >  - flush_tlb_range
> >
> > All above are based on the below new implement functions:
> >  - __sbi_tlb_flush_range_asid
> >  - local_flush_tlb_range_asid
> >
> > These functions are based on ASID instead of previous non-ASID
> > tlb_flush implementation which invalidates more useful tlb
> > entries.
>
> I still think the commit message is incomplete and rather misleading.
> Here is what I'd come up with from reading the patch:
>
> ---------
> Subject: add ASID-based tlbflushing methods
>
> Implement optimized version of the tlb flushing routines for systems
> using ASIDs.  These are behind the use_asid_allocator static branch to
> not affect existing systems not using ASIDs.
> ---------
>
>
> > +static inline void local_flush_tlb_range_asid(unsigned long start,
> > +                             unsigned long size, unsigned long asid)
> > +{
> > +     unsigned long tmp, end = ALIGN(start + size, PAGE_SIZE);
> > +
> > +     for (tmp = start & PAGE_MASK; tmp < end; tmp += PAGE_SIZE) {
> > +             __asm__ __volatile__ ("sfence.vma %0, %1"
> > +                             :
> > +                             : "r" (tmp), "r" (asid)
> > +                             : "memory");
> > +             tmp += PAGE_SIZE;
> > +     }
>
> This double increments tmp.
Yes, It's a bug for PATCH V4. Thx for point it out.

>
> Also the non-ASID code switches to a global flush once flushing more
> than a single page.  It might be worth documenting the tradeoff in the
> code.
>
> > +static void __sbi_tlb_flush_range_asid(struct cpumask *cmask,
> > +                                    unsigned long start,
> > +                                    unsigned long size,
> > +                                    unsigned long asid)
> > +{
>
> I don't think the calling conventions here are optimal.  I'd pass
> the mm_struct as the first argument, as we can derive both the cpumask
> and asid from it instead of doing that in the callers.
>
> But more importantly I think the static branch check can be moved deeper
> into the code to avoid a lot of duplication.  What do you think of this
> version?
Good idea, but I think "Modifying infrastructure and Adding ASID TLB
flush" should be separated.

I'll try in the next PATCH version.

>
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index b0659413a080..7030837adc1a 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -33,6 +33,8 @@ static inline int init_new_context(struct task_struct *tsk,
>         return 0;
>  }
>
> +DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
> +
>  #include <asm-generic/mmu_context.h>
>
>  #endif /* _ASM_RISCV_MMU_CONTEXT_H */
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 68aa312fc352..45c1b04b105d 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -18,7 +18,7 @@
>
>  #ifdef CONFIG_MMU
>
> -static DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
> +DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
>
>  static unsigned long asid_bits;
>  static unsigned long num_asids;
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 720b443c4528..d8afbb1269d5 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -4,6 +4,33 @@
>  #include <linux/smp.h>
>  #include <linux/sched.h>
>  #include <asm/sbi.h>
> +#include <asm/mmu_context.h>
> +
> +static inline void local_flush_tlb_all_asid(unsigned long asid)
> +{
> +       __asm__ __volatile__ ("sfence.vma x0, %0"
> +                       :
> +                       : "r" (asid)
> +                       : "memory");
> +}
> +
> +static inline void local_flush_tlb_page_asid(unsigned long addr,
> +               unsigned long asid)
> +{
> +       __asm__ __volatile__ ("sfence.vma %0, %1"
> +                       :
> +                       : "r" (addr), "r" (asid)
> +                       : "memory");
> +}
> +
> +static inline void local_flush_tlb_range_asid(unsigned long start,
> +                               unsigned long size, unsigned long asid)
> +{
> +       unsigned long addr, end = ALIGN(start + size, PAGE_SIZE);
> +
> +       for (addr = start & PAGE_MASK; addr < end; addr += PAGE_SIZE)
> +               local_flush_tlb_page_asid(addr, asid);
> +}
>
>  void flush_tlb_all(void)
>  {
> @@ -12,28 +39,43 @@ void flush_tlb_all(void)
>
>  /*
>   * This function must not be called with cmask being null.
> - * Kernel may panic if cmask is NULL.
>   */
> -static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
> +static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>                                   unsigned long size)
>  {
> +       struct cpumask *cmask = mm_cpumask(mm);
>         struct cpumask hmask;
>         unsigned int cpuid;
> +       bool broadcast;
>
>         if (cpumask_empty(cmask))
>                 return;
>
>         cpuid = get_cpu();
> +       /* check if the tlbflush needs to be sent to other CPUs */
> +       broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
> +       if (static_branch_unlikely(&use_asid_allocator)) {
> +               unsigned long asid = atomic_long_read(&mm->context.id);
>
> -       if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
> -               /* local cpu is the only cpu present in cpumask */
> -               if (size <= PAGE_SIZE)
> +               if (broadcast) {
> +                       riscv_cpuid_to_hartid_mask(cmask, &hmask);
> +                       sbi_remote_sfence_vma_asid(cpumask_bits(&hmask),
> +                                                  start, size, asid);
> +               } else if (size != -1) {
> +                       local_flush_tlb_range_asid(start, size, asid);
> +               } else {
> +                       local_flush_tlb_all_asid(asid);
> +               }
> +       } else {
> +               if (broadcast) {
> +                       riscv_cpuid_to_hartid_mask(cmask, &hmask);
> +                       sbi_remote_sfence_vma(cpumask_bits(&hmask),
> +                                             start, size);
> +               } else if (size <= PAGE_SIZE) {
>                         local_flush_tlb_page(start);
> -               else
> +               } else {
>                         local_flush_tlb_all();
> -       } else {
> -               riscv_cpuid_to_hartid_mask(cmask, &hmask);
> -               sbi_remote_sfence_vma(cpumask_bits(&hmask), start, size);
> +               }
>         }
>
>         put_cpu();
> @@ -41,16 +83,16 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
>
>  void flush_tlb_mm(struct mm_struct *mm)
>  {
> -       __sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
> +       __sbi_tlb_flush_range(mm, 0, -1);
>  }
>
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  {
> -       __sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
> +       __sbi_tlb_flush_range(vma->vm_mm, addr, PAGE_SIZE);
>  }
>
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>                      unsigned long end)
>  {
> -       __sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);
> +       __sbi_tlb_flush_range(vma->vm_mm, start, end - start);
>  }



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
