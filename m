Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA65C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:49:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9140361377
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9140361377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WJGpHic2Vn1lHCz3/FEsMEHwydzByIansqZT85NkvQ=; b=x2/l6PWmrFsaD5
	UBkQFk1r1zb3guYyT7dW55q1oE04aNSjeJFR5IU9cLkMbplParusgXYNKExQoOZ6oLKJgx34f3XXW
	rwL432Y5d4pQyGJSv4UfeVslc9UudEL02ApSlvHSc6xYdFjTMU86odJDWEG1Pek1cFlhTYEqq4GWZ
	aWmFYBkd7IAJphdDFbu89GPs92JrdPNknWFPSpfrSYIB+I4I5t6uAUhdkNrvzMC+629KSTsKVMtuf
	tBO2z3DtilLxDTVqzeVFZKTqQfDiqZgchWwRd2zkwQkg/mWL/ZUvs1nSX6EHxfYi7LViPGrBJ/iIO
	G8H7D1hN9pPs9/gVc2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpvy1-000ZXu-Ua; Sun, 06 Jun 2021 16:49:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvxw-000ZXT-1F
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:49:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9860E61377
 for <linux-riscv@lists.infradead.org>; Sun,  6 Jun 2021 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622998175;
 bh=+dlZ1+pRn7qFEL8vRl1CQP0LmdVJ3FsqCtBW1Ks92zo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JxIcXbbGwUg7w+X0bs7jxIsGL7O0rL6Dv+ss0rP5UzQSON2OnejevQZqP3Sbr8Wv1
 fQ4LJD0giKpGoB3CSZ14IrYdmkxhyFvm1vkjD3mRtWKkapudP2lHEpBLA5qCT2H+rn
 UGiJl41dvmGwELQPzEFAldWtUqQpdYnDpidr1QNF2xgfPVcZWirfDKaa1nKfbVqMO5
 chQeKw/AT+2+5f5xUx76TZ/uE3js73uFqEeRvNuUlpg80LEemJ3RVsn4ZGFo6c2C20
 0ELj9d/kbc/WwA4TYMFLsVbNS+xYz+qbA7I3h5oOLrTioKDMjHV9RuYWm2+cEuCd2r
 ugnkQdA1O2YRg==
Received: by mail-lj1-f175.google.com with SMTP id bn21so18662443ljb.1
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:49:35 -0700 (PDT)
X-Gm-Message-State: AOAM533OJVw/rcHnC2XRfCl38MBTGif+u4ZEu2WPGxk8jW57RaOIK2GG
 +HgV53ehgmtaNIkJtKHAcYLUmGutY1uH8Mnhlaw=
X-Google-Smtp-Source: ABdhPJzaMw0oaO/64gllymgzz6CtohqJWsyGS0iLMIQHqDnuhoqVPS/tqhrHuNesmL8sqjsMsNlm06dJ2w12HofWrmk=
X-Received: by 2002:a2e:b5d8:: with SMTP id g24mr11731604ljn.115.1622998173894; 
 Sun, 06 Jun 2021 09:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210606152050.636038-1-hch@lst.de>
 <20210606152050.636038-3-hch@lst.de>
In-Reply-To: <20210606152050.636038-3-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 00:49:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSa+xYP7YA09znPK_6vuCHFKJJGAfy32ZnU_vfGuwZTvw@mail.gmail.com>
Message-ID: <CAJF2gTSa+xYP7YA09znPK_6vuCHFKJJGAfy32ZnU_vfGuwZTvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: add ASID-based tlbflushing methods
To: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_094936_139582_EA1E411A 
X-CRM114-Status: GOOD (  26.46  )
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

Rebase with "THP supprt for RISCV" & "Add DMA_COHERENT v2" on linux-5.13-rc4.

Tested-by: Guo Ren <guoren@kernel.org>

On Sun, Jun 6, 2021 at 11:21 PM Christoph Hellwig <hch@lst.de> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement optimized version of the tlb flushing routines for systems
> using ASIDs. These are behind the use_asid_allocator static branch to
> not affect existing systems not using ASIDs.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> [hch: rebased on top of previous cleanups, use the same algorithm as
>       the non-ASID based code for local vs global flushes, keep functions
>       as local as possible]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/mmu_context.h |  2 ++
>  arch/riscv/mm/context.c              |  2 +-
>  arch/riscv/mm/tlbflush.c             | 47 +++++++++++++++++++++++-----
>  3 files changed, 43 insertions(+), 8 deletions(-)
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
> index 9bc46ab01c25..6ed696bad558 100644
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
> index b458949fa8df..64f8201237c2 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -4,6 +4,24 @@
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
>
>  void flush_tlb_all(void)
>  {
> @@ -16,21 +34,36 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>         struct cpumask *cmask = mm_cpumask(mm);
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
> -               if (size <= stride)
> +               if (broadcast) {
> +                       riscv_cpuid_to_hartid_mask(cmask, &hmask);
> +                       sbi_remote_sfence_vma_asid(cpumask_bits(&hmask),
> +                                                  start, size, asid);
> +               } else if (size <= stride) {
> +                       local_flush_tlb_page_asid(start, asid);
> +               } else {
> +                       local_flush_tlb_all_asid(asid);
> +               }
It will reduce efficiency in our system, but I'll add
"local_flush_tlb_range_asid(start, start+size, stride, size)" later.

> +       } else {
> +               if (broadcast) {
> +                       riscv_cpuid_to_hartid_mask(cmask, &hmask);
> +                       sbi_remote_sfence_vma(cpumask_bits(&hmask),
> +                                             start, size);
> +               } else if (size <= stride) {
This logic is from the Atish's patch.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/riscv/mm/tlbflush.c?h=next-20210604&id=6efb16b1d5514865d0f7a01910648568ad3225d8

I don't know why not use the range? Maybe fix some hardware issues.

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
> --
> 2.30.2
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
