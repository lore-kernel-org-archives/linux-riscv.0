Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1519CC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 06:57:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832D065243
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 06:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 832D065243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VRrvJJ0yOem91ZNMLAw0CzhLHqnvdY48Peo9TOEZBH4=; b=ppHNvV3OMtL45S6vOu9KjvdFW
	Zbxkhi3MT0fQ/xGWVeU6ZUErhq2EmYzJiZs9NK7gn273Z9y88xzjeHoSXxZSd/OpzKlA6ujpl9PmM
	o7UlKEsVv4NBLliKhwTLZ8IAYea++FpGe5Ztkzxhj4fg4WiGofVFzZ+xcyHVpArOoGfP/K/hOavNP
	RsmKYav0z3W5nNSBlfDXugF74j3m1lQ2XSMI/MTMk23OOU0M5YYPOAZTx37UjC/0LhLu59k1tNTKB
	mVreH5JitrcMn8qo3ruu4cbF6C+wt92nrh04BiN38eL1dep0zd4mWmjkuLzpXXZ6lcgNn2mYgIT52
	ueE6WZDpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM3dn-00HYv2-H0; Tue, 16 Mar 2021 06:57:19 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM3df-00HYtN-Is
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 06:57:14 +0000
Received: by mail-vk1-xa34.google.com with SMTP id d82so3367896vkd.3
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 23:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLahKG9UcbgtTUmPhUD6q014SzN8CK5qg8XOd8M0jpg=;
 b=jwqgfaagcrNOtg7rRAvzlG1mIxL4jPuuAgwmxdPhJDWh1wQw0aNL9B2NdNMJismGdD
 Cv3E2fMW/iRat/JY3i+1DBalATOpz9bpAtL42UMd0SPEPBVxQgcLxdRUIlccXikEcc8s
 mrngsbbAzMJaup+Sc/MNZF7sWgL9actraO6WBxaSIzS1+uUg1L4PE1Fnw5OGXXoxK4E9
 rs/QXPHfMlpfibBLi/2PvgjyVlpzcclPVbN/NpkOe9t0G9tvLQ7bTTYi2bcsAAE3H0gd
 KSCIqEINadP8JIQu5BGBN0jWYV1wCTX7fhT2k5efbvYhj6vVMxa7W//lk8Cx5yXC310I
 DhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLahKG9UcbgtTUmPhUD6q014SzN8CK5qg8XOd8M0jpg=;
 b=Ld/IN30sOkkiwra1VFbdMP8A9KdTx0dnS3UnyPvRLqACl/1321ntGH0V8jvlddpCHd
 r8YB1LIvswiD1tG9ab6J9K22A3GGEkQerGur+TtFOoEjOy116ZcZVKEpPPRfCCwQtrnH
 JKA7RlJP90ujJhcQHwYkO8Mb+6C5CMrHSTwoQflU7w3Ftm4Q0jlzLpn2KgHsdbMcezjP
 NmAVB5i/UuXi0rxh7klEowQxLyD5NjkbpQrH9l3jNBzRXqL5uNKRr3KYL5SpHonp3/bX
 U4EAmhaL6O6YgNXkXn5G4F1pDch8Ab/wJhd9If7/EJjO4lDewPBuwCLc8fPv4nBqnYuF
 6BYA==
X-Gm-Message-State: AOAM533aWIduRgfmiGgr2tYofPjHo+ziSuxhsXm7QBwk58BUHGzugKFW
 6O/21zuQjkSpG1juwrqVsUDyR/UCRjCUo+tIZvcRNU3MUmG4DWsC3Os=
X-Google-Smtp-Source: ABdhPJw/BxdgCSXGvjRU6Xhi3tDr+hELxBBfx9wkHd+qNfINtnzICGtMRohVC2//hnbh5l15mKxZ5vtK/VJU2zOQpbg=
X-Received: by 2002:a1f:a4d5:: with SMTP id n204mr3940314vke.0.1615877830049; 
 Mon, 15 Mar 2021 23:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210316015328.13516-1-liu@jiuyang.me>
 <20210316034638.16276-1-liu@jiuyang.me>
 <CAAhSdy3eEXtba_ebUnPW_OUHRMKsg+O9sBx_DHAmrkTUCfHXNg@mail.gmail.com>
In-Reply-To: <CAAhSdy3eEXtba_ebUnPW_OUHRMKsg+O9sBx_DHAmrkTUCfHXNg@mail.gmail.com>
From: Jiuyang Liu <liu@jiuyang.me>
Date: Tue, 16 Mar 2021 06:56:58 +0000
Message-ID: <CAPM7DZc+Ysd=VQdzc4_4Np8VAMESBrzD3mhk0ueh92x11bFFNg@mail.gmail.com>
Subject: Re: [PATCH] Insert SFENCE.VMA in function set_pte_at for RISCV
To: Anup Patel <anup@brainfault.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Waterman <waterman@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Zong Li <zong.li@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_065711_757443_CDA31000 
X-CRM114-Status: GOOD (  36.87  )
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

> As per my understanding, we don't need to explicitly invalidate local TLB
> in set_pte() or set_pet_at() because generic Linux page table management
> (<linux>/mm/*) will call the appropriate flush_tlb_xyz() function after page
> table updates.

I witnessed this bug in our micro-architecture: set_pte instruction is
still in the store buffer, no functions are inserting SFENCE.VMA in
the stack below, so TLB cannot witness this modification.
Here is my call stack:
set_pte
set_pte_at
map_vm_area
__vmalloc_area_node
__vmalloc_node_range
__vmalloc_node
__vmalloc_node_flags
vzalloc
n_tty_open

I think this is an architecture specific code, so <linux>/mm/* should
not be modified.
And spec requires SFENCE.VMA to be inserted on each modification to
TLB. So I added code here.

> Also, just local TLB flush is generally not sufficient because
> a lot of page tables will be used across on multiple HARTs.

Yes, this is the biggest issue, in RISC-V Volume 2, Privileged Spec v.
20190608 page 67 gave a solution:
Consequently, other harts must be notified separately when the
memory-management data structures have been modified. One approach is
to use
1) a local data fence to ensure local writes are visible globally,
then 2) an interprocessor interrupt to the other thread,
then 3) a local SFENCE.VMA in the interrupt handler of the remote thread,
and finally 4) signal back to originating thread that operation is
complete. This is, of course, the RISC-V analog to a TLB shootdown.

In general, this patch didn't handle the G bit in PTE, kernel trap it
to sbi_remote_sfence_vma. do you think I should use flush_tlb_all?

Jiuyang




arch/arm/mm/mmu.c
void set_pte_at(struct mm_struct *mm, unsigned long addr,
                              pte_t *ptep, pte_t pteval)
{
        unsigned long ext = 0;

        if (addr < TASK_SIZE && pte_valid_user(pteval)) {
                if (!pte_special(pteval))
                        __sync_icache_dcache(pteval);
                ext |= PTE_EXT_NG;
        }

        set_pte_ext(ptep, pteval, ext);
}

arch/mips/include/asm/pgtable.h
static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
                              pte_t *ptep, pte_t pteval)
{

        if (!pte_present(pteval))
                goto cache_sync_done;

        if (pte_present(*ptep) && (pte_pfn(*ptep) == pte_pfn(pteval)))
                goto cache_sync_done;

        __update_cache(addr, pteval);
cache_sync_done:
        set_pte(ptep, pteval);
}


Also, just local TLB flush is generally not sufficient because
> a lot of page tables will be used accross on multiple HARTs.


On Tue, Mar 16, 2021 at 5:05 AM Anup Patel <anup@brainfault.org> wrote:
>
> +Alex
>
> On Tue, Mar 16, 2021 at 9:20 AM Jiuyang Liu <liu@jiuyang.me> wrote:
> >
> > This patch inserts SFENCE.VMA after modifying PTE based on RISC-V
> > specification.
> >
> > arch/riscv/include/asm/pgtable.h:
> > 1. implement pte_user, pte_global and pte_leaf to check correspond
> > attribute of a pte_t.
>
> Adding pte_user(), pte_global(), and pte_leaf() is fine.
>
> >
> > 2. insert SFENCE.VMA in set_pte_at based on RISC-V Volume 2, Privileged
> > Spec v. 20190608 page 66 and 67:
> > If software modifies a non-leaf PTE, it should execute SFENCE.VMA with
> > rs1=x0. If any PTE along the traversal path had its G bit set, rs2 must
> > be x0; otherwise, rs2 should be set to the ASID for which the
> > translation is being modified.
> > If software modifies a leaf PTE, it should execute SFENCE.VMA with rs1
> > set to a virtual address within the page. If any PTE along the traversal
> > path had its G bit set, rs2 must be x0; otherwise, rs2 should be set to
> > the ASID for which the translation is being modified.
> >
> > arch/riscv/include/asm/tlbflush.h:
> > 1. implement get_current_asid to get current program asid.
> > 2. implement local_flush_tlb_asid to flush tlb with asid.
>
> As per my understanding, we don't need to explicitly invalidate local TLB
> in set_pte() or set_pet_at() because generic Linux page table management
> (<linux>/mm/*) will call the appropriate flush_tlb_xyz() function after page
> table updates. Also, just local TLB flush is generally not sufficient because
> a lot of page tables will be used accross on multiple HARTs.
>
> >
> > Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> > ---
> >  arch/riscv/include/asm/pgtable.h  | 27 +++++++++++++++++++++++++++
> >  arch/riscv/include/asm/tlbflush.h | 12 ++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index ebf817c1bdf4..5a47c60372c1 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -222,6 +222,16 @@ static inline int pte_write(pte_t pte)
> >         return pte_val(pte) & _PAGE_WRITE;
> >  }
> >
> > +static inline int pte_user(pte_t pte)
> > +{
> > +       return pte_val(pte) & _PAGE_USER;
> > +}
> > +
> > +static inline int pte_global(pte_t pte)
> > +{
> > +       return pte_val(pte) & _PAGE_GLOBAL;
> > +}
> > +
> >  static inline int pte_exec(pte_t pte)
> >  {
> >         return pte_val(pte) & _PAGE_EXEC;
> > @@ -248,6 +258,11 @@ static inline int pte_special(pte_t pte)
> >         return pte_val(pte) & _PAGE_SPECIAL;
> >  }
> >
> > +static inline int pte_leaf(pte_t pte)
> > +{
> > +       return pte_val(pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC);
> > +}
> > +
> >  /* static inline pte_t pte_rdprotect(pte_t pte) */
> >
> >  static inline pte_t pte_wrprotect(pte_t pte)
> > @@ -358,6 +373,18 @@ static inline void set_pte_at(struct mm_struct *mm,
> >                 flush_icache_pte(pteval);
> >
> >         set_pte(ptep, pteval);
> > +
> > +       if (pte_present(pteval)) {
> > +               if (pte_leaf(pteval)) {
> > +                       local_flush_tlb_page(addr);
> > +               } else {
> > +                       if (pte_global(pteval))
> > +                               local_flush_tlb_all();
> > +                       else
> > +                               local_flush_tlb_asid();
> > +
> > +               }
> > +       }
> >  }
> >
> >  static inline void pte_clear(struct mm_struct *mm,
> > diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> > index 394cfbccdcd9..1f9b62b3670b 100644
> > --- a/arch/riscv/include/asm/tlbflush.h
> > +++ b/arch/riscv/include/asm/tlbflush.h
> > @@ -21,6 +21,18 @@ static inline void local_flush_tlb_page(unsigned long addr)
> >  {
> >         __asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
> >  }
> > +
> > +static inline unsigned long get_current_asid(void)
> > +{
> > +       return (csr_read(CSR_SATP) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
> > +}
> > +
> > +static inline void local_flush_tlb_asid(void)
> > +{
> > +       unsigned long asid = get_current_asid();
> > +       __asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
> > +}
> > +
> >  #else /* CONFIG_MMU */
> >  #define local_flush_tlb_all()                  do { } while (0)
> >  #define local_flush_tlb_page(addr)             do { } while (0)
> > --
> > 2.30.2
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
