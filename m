Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF418C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 14:09:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B47021773
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 14:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fzFgmDC4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="lbglYn+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B47021773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mM/5JT8H3nSh4BeVKn415HnRNVKSfyxkhPsjw0sTks=; b=fzFgmDC47spM3V
	FD+4/iy/pCeWYl/dhATTn3jNSphEsZpqUR5kEKHL41wfiINnL4j+5E42sd5IXLUEjshvncx0GrxrH
	0gIExQgdh0/JHlz8dn/PgJ1HpyxBxnDU6NS4E57Ac5uiSh3+PY4wk1X17tnGNUBk+IseDSniAycsk
	3qHDwdZfYyoU1nufIgpsDOTYM8RChrQ6L6SmTL0Pg0KS3Cb3l/aejzndCZln9FQJnTgkWZvYRm0eI
	h8uj7KvZgr4H5tRHnFbqXYxiSABg3QnOAAgJ4S3cuWuJPHn4XhLmzHrjmJVkOEVE5Mtqq2WjmMh2Q
	rDjkNQCC8zRCgLslDXNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Viv-0006OO-Qq; Thu, 28 Mar 2019 14:09:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Viq-0006Mf-D8
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 14:09:40 +0000
Received: by mail-wm1-x341.google.com with SMTP id z11so3785408wmi.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGGRb1RTvlWbeLd9Xy/fIsfvzq3g6HZNCIz6RInjNfE=;
 b=lbglYn+49WaSGxsnRM2hGJbR/yEsYbR6GNkpBMBDYidV71aZ6hEECxjzvvziCpPgKo
 Hdx031jAvGYY84hGRM16cYq1LyfRMRHhfq610Q40jXXPmxQfEOzmrJpPsxL9h+wlLpWx
 V9z8fic96+Ts1DAl5Y2Quwpw1SyFVi7G3nCKgTePE3zr+QEjempMF6PBDODGwxDrUhp8
 2UwpIVtQ5Qnzl7lIboUtrBGCTBmw7ZpSwgP64E2Q/zsaSdXg2RGAoSQC05wgNbwpNnP5
 ZsuAKcJOUXnTRgYhWsAuTlL0lRauSuXP1LHoMYSwJNZMJy3MjMObQXmRvTNfpaDk1CPg
 lLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGGRb1RTvlWbeLd9Xy/fIsfvzq3g6HZNCIz6RInjNfE=;
 b=NWLP2mCDaP3D0+U4RUIp4R/I8FWb+ljuyGgLv/07g7NSrMRQGY9Lkjwbp9cpVkK1i+
 FMnQffGTayC9On3u6A+Mtr5h6YIOutBkge6kS84Lsie9kr/60HyuT92koMrvuPQYX0J3
 e2Tu7Q37iLqPq3eWxcSoh0sPbVQ0s/EE8Lr32z5DmrXCeHOvaKq8skEKgx+jUSas3FPi
 J+zsEz3xdxDqmyUssHxtozxeGV2d4DgEGzMEDEw04XiZnDdZeHTU4GV3nBdvwMPPQJFN
 xd2DLB0ehZCitPi/5DFdOKEElftU76toPvgsuQyqJEoQoxmqga8c9+TqoqvvHHvtMeAY
 OrWw==
X-Gm-Message-State: APjAAAVZks/zYcQm/lcgkKO70n5PEgpRF+Nvh6KAWwaMiPGMFQ02ER+f
 UV9LHdsD5lsTWDTLfpdx/8O45sgA7bkzB+jL63cMsRaheYc=
X-Google-Smtp-Source: APXvYqzaKv2sAnxph9fZp7DBJbFJOx27f0uoZcRNKO24KnYtxcYV84IuQB5Vi2/YoPknAZ8rwsa/zosvW+K8dC1k/pQ=
X-Received: by 2002:a1c:e185:: with SMTP id y127mr152247wmg.76.1553782170458; 
 Thu, 28 Mar 2019 07:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190328063211.13052-1-anup.patel@wdc.com>
 <b6872ed0-4b8c-ca1d-4ee0-b01324e40da5@garyguo.net>
In-Reply-To: <b6872ed0-4b8c-ca1d-4ee0-b01324e40da5@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 19:39:19 +0530
Message-ID: <CAAhSdy0muQe23Fz2yA2VP_BTNB9h3U-z7P9TREmSf1n0yu1Xig@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Implement ASID allocator
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_070936_601306_85033536 
X-CRM114-Status: GOOD (  41.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 7:07 PM Gary Guo <gary@garyguo.net> wrote:
>
> Hi Anup,
>
> The code still does not use ASID in TLB flush routines. Without this
> added the code does not boot on systems with true ASID support.

Can you elaborate why flush by ASID is need and flush_tlb_all() will
not work?

>
> We also need to consider the case of CONTEXTID overflow on 32-bit
> systems. 32-bit CONTEXTID may overflow in a month time.

On 32bit systems, upper 24bits of CONTEXTID will be VERSION and
lower 8bits will be HW ASID.

Can you elaborate how did you reach to conclusion that CONTEXID
will overflow in a month time?

>
> Please all see my inline comments.
>
> Best,
> Gary
>
> On 28/03/2019 06:32, Anup Patel wrote:
> > Currently, we do local TLB flush on every MM switch. This is very harsh
> > on performance because we are forcing page table walks after every MM
> > switch.
> >
> > This patch implements ASID allocator for assigning an ASID to every MM
> > context. The number of ASIDs are limited in HW so we create a logical
> > entity named CONTEXTID for assigning to MM context. The lower bits of
> > CONTEXTID are ASID and upper bits are VERSION number. The number of
> > usable ASID bits supported by HW are detected at boot-time by writing
> > 1s to ASID bits in SATP CSR. This means last ASID is always reserved
> > because it is used for initial MM context.
> >
> > We allocate new CONTEXTID on first MM switch for a MM context where
> > the ASID is allocated from an ASID bitmap and VERSION is provide by
> > an atomic counter. At time of allocating new CONTEXTID, if we run out
> > of available ASIDs then:
> > 1. We flush the ASID bitmap
> > 2. Increment current VERSION atomic counter
> > 3. Re-allocate ASID from ASID bitmap
> > 4. Flush TLB on all CPUs
> > 5. Try CONTEXTID re-assignment on all CPUs
> >
> > Using above approach, we have virtually infinite CONTEXTIDs on-top-of
> > limited number of HW ASIDs. This approach is inspired from ASID allocator
> > used for Linux ARM/ARM64 but we have adapted it for RISC-V. Overall,
> > this ASID allocator helps us reduce rate of local TLB flushes on every
> > CPU thereby increasing performance.
> >
> > This patch is tested on QEMU/virt machine and SiFive Unleashed board.
> > On QEMU/virt machine, we see 10% (approx) performance improvement with
> > SW emulated TLBs provided by QEMU. Unfortunately, ASID bits of SATP CSR
> > are not implemented on SiFive Unleashed board so we don't see any change
> > in performance.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net>
> Could you add a Co-developed-by line in addition to Signed-off-by as
> well? Thanks.

Sure, I will add.

> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > Changes since v1:
> > - We adapt good aspects from Gary Guo's ASID allocator implementation
> >    and provide due credit to him by adding his SoB.
> > - Track ASIDs active during context flush and mark them as reserved
> > - Set ASID bits to all 1s to simplify number of ASID bit detection
> > - Use atomic_long_t instead of atomic64_t for being 32bit friendly
> > - Use unsigned long instead of u64 for being 32bit friendly
> > - Use flush_tlb_all() instead of lazy local_tlb_flush_all() at time
> >    of context flush
> >
> > This patch is based on Linux-5.1-rc2 and TLB flush cleanup patches v4
> > from Gary Guo. It can be also found in riscv_asid_allocator_v2 branch
> > of https://github.com/avpatel/linux.git
> > ---
> >   arch/riscv/include/asm/csr.h         |   6 +
> >   arch/riscv/include/asm/mmu.h         |   1 +
> >   arch/riscv/include/asm/mmu_context.h |   1 +
> >   arch/riscv/kernel/head.S             |   2 +
> >   arch/riscv/mm/context.c              | 249 +++++++++++++++++++++++++--
> >   5 files changed, 247 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 28a0d1cb374c..ce18ab8f53ed 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -45,10 +45,16 @@
> >   #define SATP_PPN     _AC(0x003FFFFF, UL)
> >   #define SATP_MODE_32 _AC(0x80000000, UL)
> >   #define SATP_MODE    SATP_MODE_32
> > +#define SATP_ASID_BITS       9
> > +#define SATP_ASID_SHIFT      22
> > +#define SATP_ASID_MASK       _AC(0x1FF, UL)
> >   #else
> >   #define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
> >   #define SATP_MODE_39 _AC(0x8000000000000000, UL)
> >   #define SATP_MODE    SATP_MODE_39
> > +#define SATP_ASID_BITS       16
> > +#define SATP_ASID_SHIFT      44
> > +#define SATP_ASID_MASK       _AC(0xFFFF, UL)
> >   #endif
> >
> >   /* Interrupt Enable and Interrupt Pending flags */
> > diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> > index 5df2dccdba12..42a9ca0fe1fb 100644
> > --- a/arch/riscv/include/asm/mmu.h
> > +++ b/arch/riscv/include/asm/mmu.h
> > @@ -18,6 +18,7 @@
> >   #ifndef __ASSEMBLY__
> >
> >   typedef struct {
> > +     atomic_long_t id;
> >       void *vdso;
> >   #ifdef CONFIG_SMP
> >       /* A local icache flush is needed before user execution can resume. */
> > diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> > index bf4f097a9051..ba6ab35c18dc 100644
> > --- a/arch/riscv/include/asm/mmu_context.h
> > +++ b/arch/riscv/include/asm/mmu_context.h
> > @@ -30,6 +30,7 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
> >   static inline int init_new_context(struct task_struct *task,
> >       struct mm_struct *mm)
> >   {
> > +     atomic_long_set(&(mm)->context.id, 0);
> Parenthesis around mm isn't necessary

Okay, I will update.

> >       return 0;
> >   }
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index fe884cd69abd..c3f9adc0d054 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -95,6 +95,8 @@ relocate:
> >       la a2, swapper_pg_dir
> >       srl a2, a2, PAGE_SHIFT
> >       li a1, SATP_MODE
> > +     li a0, (SATP_ASID_MASK << SATP_ASID_SHIFT)
> > +     or a1, a1, a0
> >       or a2, a2, a1
> >
> >       /*
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 0f787bcd3a7a..1205d33d1b1b 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -2,13 +2,209 @@
> >   /*
> >    * Copyright (C) 2012 Regents of the University of California
> >    * Copyright (C) 2017 SiFive
> > + * Copyright (C) 2019 Western Digital Corporation or its affiliates.
> >    */
> >
> > +#include <linux/bitops.h>
> >   #include <linux/mm.h>
> > +#include <linux/slab.h>
> >
> >   #include <asm/tlbflush.h>
> >   #include <asm/cacheflush.h>
> >
> > +static bool use_asid_allocator;
> > +static unsigned long asid_bits;
> > +static unsigned long num_asids;
> > +static unsigned long asid_mask;
> > +static unsigned long first_version;
> > +
> > +static atomic_long_t current_version;
> > +
> > +static DEFINE_RAW_SPINLOCK(context_lock);
> > +static unsigned long *context_asid_map;
> > +
> > +static DEFINE_PER_CPU(atomic_long_t, active_context);
> > +static DEFINE_PER_CPU(unsigned long, reserved_context);
> > +
> > +static bool check_update_reserved_context(unsigned long cntx,
> > +                                       unsigned long newcntx)
> > +{
> > +     int cpu;
> > +     bool hit = false;
> > +
> > +     /*
> > +      * Iterate over the set of reserved CONTEXT looking for a match.
> > +      * If we find one, then we can update our mm to use new CONTEXT
> > +      * (i.e. the same CONTEXT in the current_version) but we can't
> > +      * exit the loop early, since we need to ensure that all copies
> > +      * of the old CONTEXT are updated to reflect the mm. Failure to do
> > +      * so could result in us missing the reserved CONTEXT in a future
> > +      * version.
> > +      */
> > +     for_each_possible_cpu(cpu) {
> > +             if (per_cpu(reserved_context, cpu) == cntx) {
> > +                     hit = true;
> > +                     per_cpu(reserved_context, cpu) = newcntx;
> > +             }
> > +     }
> > +
> > +     return hit;
> > +}
> > +
> > +/* Note: must be called with context_lock held */
> > +static void __flush_context(void)
> > +{
> > +     int i;
> > +     unsigned long cntx;
> > +
> > +     /* Update the list of reserved ASIDs and the ASID bitmap. */
> > +     bitmap_clear(context_asid_map, 0, num_asids);
> > +
> > +     /* Mark already acitve ASIDs as used */
> > +     for_each_possible_cpu(i) {
> > +             cntx = atomic_long_xchg_relaxed(&per_cpu(active_context, i), 0);
> > +             /*
> > +              * If this CPU has already been through a rollover, but
> > +              * hasn't run another task in the meantime, we must preserve
> > +              * its reserved CONTEXT, as this is the only trace we have of
> > +              * the process it is still running.
> > +              */
> > +             if (cntx == 0)
> > +                     cntx = per_cpu(reserved_context, i);
> > +
> > +             __set_bit(cntx & asid_mask, context_asid_map);
> > +             per_cpu(reserved_context, i) = cntx;
> > +     }
> > +
> > +     /* Mark last ASID as used because it is used at boot-time */
> > +     __set_bit(asid_mask, context_asid_map);
> Looks unnecessary as we always start find_next_zero_bit from idx 1.

This is to ensure that we never use last ASID.

> > +}
> > +
> > +/* Note: must be called with context_lock held */
> > +static unsigned long __new_context(struct mm_struct *mm,
> > +                                bool *need_tlb_flush)
> > +{
> > +     static u32 cur_idx = 1;
> > +     unsigned long cntx = atomic_long_read(&mm->context.id);
> > +     unsigned long asid, ver = atomic_long_read(&current_version);
> > +
> > +     if (cntx != 0) {
> > +             unsigned long newcntx = ver | (cntx & ~asid_mask);
> Shouldn't this be cntx & asid_mask ?

Ahh, typo. Thanks for catching.

> > +
> > +             /*
> > +              * If our current CONTEXT was active during a rollover, we
> > +              * can continue to use it and this was just a false alarm.
> > +              */
> > +             if (check_update_reserved_context(cntx, newcntx))
> > +                     return newcntx;
> > +
> > +             /*
> > +              * We had a valid CONTEXT in a previous life, so try to
> > +              * re-use it if possible.
> > +              */
> > +             if (!__test_and_set_bit(cntx & asid_mask, context_asid_map))
> > +                     return newcntx;
> > +     }
> > +
> > +     /*
> > +      * Allocate a free ASID. If we can't find one then increment
> > +      * current_version and flush all ASIDs.
> > +      */
> > +     asid = find_next_zero_bit(context_asid_map, num_asids, cur_idx);
> > +     if (asid != num_asids)
> > +             goto set_asid;
> > +
> > +     /* We're out of ASIDs, so increment current_version */
> > +     ver = atomic_long_add_return_relaxed(first_version, &current_version);
> > +
> > +     /* Flush everything  */
> > +     __flush_context();
> > +     *need_tlb_flush = true;
> > +
> > +     /* We have more ASIDs than CPUs, so this will always succeed */
> > +     asid = find_next_zero_bit(context_asid_map, num_asids, 1);
> > +
> > +set_asid:
> > +     __set_bit(asid, context_asid_map);
> > +     cur_idx = asid;
> > +     return asid | ver;
> > +}
> > +
> > +static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
> > +{
> > +     unsigned long flags;
> > +     bool need_tlb_flush = false;
> > +     unsigned long cntx, old_active_cntx;
> > +
> > +     cntx = atomic_long_read(&mm->context.id);
> > +
> > +     /*
> > +      * If our active_context is non-zero and the context matches the
> > +      * current_version, then we update the active_context entry with a
> > +      * relaxed cmpxchg.
> > +      *
> > +      * Following is how we handle racing with a concurrent rollover:
> > +      *
> > +      * - We get a zero back from the cmpxchg and end up waiting on the
> > +      *   lock. Taking the lock synchronises with the rollover and so
> > +      *   we are forced to see the updated verion.
> > +      *
> > +      * - We get a valid context back from the cmpxchg then we continue
> > +      *   using old ASID because __flush_context() would have marked ASID
> > +      *   of active_context as used and next context switch we will allocate
> > +      *   new context.
> > +      */
> > +     old_active_cntx = atomic_long_read(&per_cpu(active_context, cpu));
> > +     if (old_active_cntx &&
> > +         !((cntx ^ atomic_long_read(&current_version)) >> asid_bits) &&
> This looks hard to read. Probably
> (cntx &~ asid_mask) == atomic_long_read(&current_version)
> is clearer.

No issues, I am fine with either way. I will update.

> > +         atomic_long_cmpxchg_relaxed(&per_cpu(active_context, cpu),
> > +                                     old_active_cntx, cntx))
> > +             goto switch_mm_fast;
> > +
> > +     raw_spin_lock_irqsave(&context_lock, flags);
> Any reason that we prefer raw_ here?
> > +
> > +     /* Check that our ASID belongs to the current_version. */
> > +     cntx = atomic_long_read(&mm->context.id);
> > +     if ((cntx ^ atomic_long_read(&current_version)) >> asid_bits) {
> Same as above, probably
> (cntx &~ asid_mask) != atomic_long_read(&current_version)
> makes more sense.
> > +             cntx = __new_context(mm, &need_tlb_flush);
> > +             atomic_long_set(&mm->context.id, cntx);
> > +     }
> > +
> > +     atomic_long_set(&per_cpu(active_context, cpu), cntx);
> > +
> > +     raw_spin_unlock_irqrestore(&context_lock, flags);
> > +
> > +switch_mm_fast:
> > +     /*
> > +      * Use the old spbtr name instead of using the current satp
> > +      * name to support binutils 2.29 which doesn't know about the
> > +      * privileged ISA 1.10 yet.
> > +      */
> > +     csr_write(sptbr, virt_to_pfn(mm->pgd) |
> > +               ((cntx & asid_mask) << SATP_ASID_SHIFT) |
> > +               SATP_MODE);
> > +
> > +     if (need_tlb_flush)
> > +             flush_tlb_all();
> I think your intention here is to avoid calling flush_tlb_all when IRQs
> are off in the critical region. However, switch_mm will be called from
> scheduler as well which also turn irqs off, so this still cause issue. I
> think a better way is to force flush_tlb_all to use SBI when IRQs are
> off. What do you think?

We are still waiting for OpenSBI to provide complete implementation.

I agree that we should prefer SBI based remote TLB flush all here. Let's
wait for more comments.

> > +}
> > +
> > +static void set_mm_noasid(struct mm_struct *mm)
> > +{
> > +     /*
> > +      * Use the old spbtr name instead of using the current satp
> > +      * name to support binutils 2.29 which doesn't know about the
> > +      * privileged ISA 1.10 yet.
> > +      */
> > +     csr_write(sptbr, virt_to_pfn(mm->pgd) | SATP_MODE);
> > +
> > +     /*
> > +      * sfence.vma after SATP write. We call it on MM context instead of
> > +      * calling local_flush_tlb_all to prevent global mappings from being
> > +      * affected.
> > +      */
> > +     local_flush_tlb_mm(mm);
> > +}
> > +
> >   /*
> >    * When necessary, performs a deferred icache flush for the given MM context,
> >    * on the local CPU.  RISC-V has no direct mechanism for instruction cache
> > @@ -58,20 +254,49 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >       cpumask_clear_cpu(cpu, mm_cpumask(prev));
> >       cpumask_set_cpu(cpu, mm_cpumask(next));
> >
> > -     /*
> > -      * Use the old spbtr name instead of using the current satp
> > -      * name to support binutils 2.29 which doesn't know about the
> > -      * privileged ISA 1.10 yet.
> > -      */
> > -     csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
> > +     if (use_asid_allocator)
> > +             set_mm_asid(next, cpu);
> > +     else
> > +             set_mm_noasid(next);
> > +
> > +     flush_icache_deferred(next);
> > +}
> > +
> > +static int asids_init(void)
> > +{
> > +     /* Figure-out number of ASID bits in HW */
> > +     asid_bits = (csr_read(sptbr) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
> > +     asid_bits = fls_long(asid_bits);
> > +
> > +     /* Pre-compute ASID details */
> > +     num_asids = 1 << asid_bits;
> > +     asid_mask = num_asids - 1;
> > +     first_version = num_asids;
> Is there any reason we want to have two set-once variables with same value?

Yap, "first_version" looks redundant. I will update.

> >
> >       /*
> > -      * sfence.vma after SATP write. We call it on MM context instead of
> > -      * calling local_flush_tlb_all to prevent global mappings from being
> > -      * affected.
> > +      * Use ASID allocator only if number of HW ASIDs are
> > +      * at-least twice more than CPUs
> >        */
> > -     local_flush_tlb_mm(next);
> > +     use_asid_allocator =
> > +             (num_asids <= (2 * num_possible_cpus())) ? false : true;
> >
> > -     flush_icache_deferred(next);
> > -}
> > +     /* Setup ASID allocator if available */
> > +     if (use_asid_allocator) {
> > +             atomic_long_set(&current_version, first_version);
> >
> > +             context_asid_map = kcalloc(BITS_TO_LONGS(num_asids),
> > +                                sizeof(*context_asid_map), GFP_KERNEL);
> > +             if (!context_asid_map)
> > +                     panic("Failed to allocate bitmap for %lu ASIDs\n",
> > +                           num_asids);
> > +
> > +             __set_bit(asid_mask, context_asid_map);
> > +
> > +             pr_info("ASID allocator using %lu entries\n", num_asids);
> > +     } else {
> If we decide not to use ASID allocator, we will need to set ASID field
> to zero on *all harts* before we do our first switch_mm. Otherwise we
> will end up a hart running non-zero ASID and another running zero ASID
> with different page table.

Yes, I saw that in your implementation but for better readability and
debugability. I have preserved asid_bits that we computed and added
separate use_asid_allocator flag.

In future, I plan to show asid_bits in /proc/cpuinfo as-well.

> > +             pr_info("ASID allocator disabled\n");
> > +     }
> > +
> > +     return 0;
> > +}
> > +early_initcall(asids_init);
> >

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
