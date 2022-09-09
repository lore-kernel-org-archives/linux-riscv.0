Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EF9ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 05:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbQ2B+6dqGkFRdWHz1PePkegxaZEsQQld3bWtmi4bmc=; b=L02JAH9Rt1i7CZ
	CUJsLnw0MSzT7wd5HVF40RFlBjTZyDpO2yJNjn998JPBjOoJUJFfxHrSFkj9zTj+rBmIc0Mv3OoFQ
	ds++3vO96OBEasLztHdp5DjCLyQEMSPDSIGVNHRudWynIgd9krFZULlC+ZFC/RyHbxQRXCYbCEvsO
	6oiEJhRZue1js/snZgUCqSTs4vHpWUT5FBj4JfMV364mOtFzdH2CisDJfJC7gg4HPc3ssSw60Elj+
	c6xeR8/0XMxJpe+bYDjWfqEYca1Jic3uYgqnjo+FDI3R6nGnufMVxJnuhG9VVkUNGRJtSlw9N/v/J
	2za79B/qtKC5ScZKIyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWWWp-00CkxW-QD; Fri, 09 Sep 2022 05:26:11 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWWWe-00CkpC-CH; Fri, 09 Sep 2022 05:26:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id b16so886006edd.4;
        Thu, 08 Sep 2022 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cKunQQ0ZtQ4nnTnNWhEV+IwjuR7Legc2WXx2uSMRff4=;
        b=K5NPQOoD2unggSwwL1R9l1FwEM796OlvgFahRNG76jAXm6Fu9iMvOVLWbCimG2ht+T
         LKzy9J/hTCSyCTF/rQrr0bpa2Y9KKyCMWf9MijKRMruE755hBY69pl/f+hD4IS5d+FuO
         k6tS+UWr5kPeids83zMaAoi0kUvkkRYTHPE+EYrET3hBQFXhbJaUNxbinszB5XrleIQg
         PYyk2MrpBbW1FZa9yhZtC0pyxBX+8cbWZRwzJ4JPWiH+uHyU7vTEeQ06A4uCtTqD1bo/
         go0f0JeVm/zjkhF7LI/kCMxxI68r3aApEKLi7PFVol74wzV96P9w1ZZoRLSK0sh81p0I
         a4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cKunQQ0ZtQ4nnTnNWhEV+IwjuR7Legc2WXx2uSMRff4=;
        b=4SKk0lvogANA9vLv7BRDFlkifyZdeB9L6l497P9BuJkW+OnjOtuRn+KCqAcN8VHKyj
         r3XKFCTnp9kNcX5nrJC8YcS/duT2g1xrDfD6jSjgs0mYqJdxw6Iy4E8tPEnR3mbOYcQX
         X580SmrsMRxaYGO2zHxQBeYMYehMUBuj+CzM8wSmnhO3GQMmWElcRgzp3dO7lytG/FwN
         VgmjifZRZNY6G1b9sYMBEkR6Qqx0xBI0JXeQfx6UZ8Bv5HSb6iXfXRlw0UkTTGbyvfHf
         +yrxxHXM96KS+E9VPmO2nX+Y72wespeMZ04LnYT2Hvd3X3Q1Fl5+f4hq9urnmUcOhTR9
         FklA==
X-Gm-Message-State: ACgBeo0YhGtZvPoJJT/hGMSHC9MFSnsaS/YkV/MB0x8DsDs0pFUJvN7g
	Y3GbJ+9kKfBM5O1Ao7fRQXULQX7pPcuFAmZtcKI=
X-Google-Smtp-Source: AA6agR7i5YbyJh5uFUq/HewUo3qsQmRLHmO66JkCO6+jFdtZyHpagVWgUZsTDLOc6vdsVMb1Fp03UDprdSw68rIMZbM=
X-Received: by 2002:aa7:cb87:0:b0:43b:e650:6036 with SMTP id
 r7-20020aa7cb87000000b0043be6506036mr10106507edt.350.1662701157430; Thu, 08
 Sep 2022 22:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-4-yangyicong@huawei.com>
 <b621dbb6-a98f-003e-3578-fc8b0f512d4a@arm.com>
In-Reply-To: <b621dbb6-a98f-003e-3578-fc8b0f512d4a@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Sep 2022 17:25:46 +1200
Message-ID: <CAGsJ_4wW3FM5WLxYnGnwOn-rnc-3Jz_0Oq89GPqx6Rn6Od0U6Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mm: rmap: Extend tlbbatch APIs to fit new platforms
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, yangyicong@hisilicon.com, huzhanyuan@oppo.com, 
	lipeifeng@oppo.com, zhangshiming@oppo.com, guojian@oppo.com, 
	realmz6@gmail.com, linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, 
	Barry Song <v-songbaohua@oppo.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_222600_457562_87642447 
X-CRM114-Status: GOOD (  29.12  )
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

On Fri, Sep 9, 2022 at 4:51 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Add uaddr to tlbbatch APIs so that platforms like ARM64 are
>
> I guess 'uaddr' refers to a virtual address from the process address
> space itself ? Please be more specific.
>
> > able to apply this on their specific hardware features. For
> > ARM64, this could be sending tlbi into hardware queues for
> > the page with this particular uaddr.
>
> This subject line and commit message here are misleading. The patch
> adds an address argument to arch callback arch_tlbbatch_add_mm() as
> arm64 platform could use that to perform the TLB flush batching ?
>
> This patch can be folded into the next one, so that the requirement
> for an additional argument 'uaddr' in the arch callback will be self
> evident. OR if this is going to be a preparatory patch, then it must
> explain how 'uaddr' argument is helpful on platforms like arm64 while
> performing TLB flush batching. But TBH, just folding it to next patch
> explains the context better.

The intention was to keep each change small, while still functionally
independent,
so that it was easier to be reviewed.

but yes, i agree in this particular case, if we fold this one to the
last one, we are
actually able to make the modification self-evident while the new patch seems
still small.

>
> >
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Nadav Amit <namit@vmware.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Tested-by: Xin Hao <xhao@linux.alibaba.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >  arch/x86/include/asm/tlbflush.h |  3 ++-
> >  mm/rmap.c                       | 10 ++++++----
> >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> > index 8a497d902c16..5bd78ae55cd4 100644
> > --- a/arch/x86/include/asm/tlbflush.h
> > +++ b/arch/x86/include/asm/tlbflush.h
> > @@ -264,7 +264,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
> >  }
> >
> >  static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> > -                                     struct mm_struct *mm)
> > +                                     struct mm_struct *mm,
> > +                                     unsigned long uaddr)
> >  {
> >       inc_mm_tlb_gen(mm);
> >       cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index a17a004550c6..7187a72b63b1 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -642,12 +642,13 @@ void try_to_unmap_flush_dirty(void)
> >  #define TLB_FLUSH_BATCH_PENDING_LARGE                        \
> >       (TLB_FLUSH_BATCH_PENDING_MASK / 2)
> >
> > -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> > +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> > +                                   unsigned long uaddr)
> >  {
> >       struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
> >       int batch, nbatch;
> >
> > -     arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
> > +     arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
> >       tlb_ubc->flush_required = true;
> >
> >       /*
> > @@ -725,7 +726,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
> >       }
> >  }
> >  #else
> > -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> > +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> > +                                   unsigned long uaddr)
> >  {
> >  }
> >
> > @@ -1587,7 +1589,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >                                */
> >                               pteval = ptep_get_and_clear(mm, address, pvmw.pte);
> >
> > -                             set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> > +                             set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
> >                       } else {
> >                               pteval = ptep_clear_flush(vma, address, pvmw.pte);
> >                       }

Thanks
Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
