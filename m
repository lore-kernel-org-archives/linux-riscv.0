Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC78C64E8A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 10:21:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC52207BC
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 10:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DkmAAJPk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="VDQYTXZA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC52207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=af0kF6mKwK03K8aiM44Jlqd96cKYtGnIgVo4KpP/UsU=; b=DkmAAJPkKghYABQOXJ3r7Gq4d
	rt4EJ8+lUxXh/MHNJhUqLfbYaZd6Ff6n9BPwhRrLCw0fL4wFzznmbYnitLjrjoCXNJLcxZu3fCV9Q
	RcYBDFICLP/jrIieu0fydrkElKpiSuLEMCHUhsM7yxby/wYNi1yrfvfbJU1XHN0gCM5XSpdANwZSg
	XSeQzx0aksS8Bq/i8F8EzHRZerNfAbC9eCiQH5hJd6TB8+v4zlMgySXr9KbOsNqUh3hbUKaND0BiJ
	nShvavlSb858S6cd+KqV6U+PF7dIRBfC+F57N7yxEYABIEemknQZFt9RhntdDD0HJmu7jLw0DNj9n
	tHDc8Deug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjgJY-0004xF-P1; Mon, 30 Nov 2020 10:21:48 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjgJW-0004wE-5I
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 10:21:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id d3so14709368wmb.4
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 02:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fClK9dYPgSK1URS64wSbMulejn6T5yvpN8jKUjDOmSs=;
 b=VDQYTXZA9JFPGhZ+UKdSNhvFmqlc/Lc5kkB3FkebjR6HzNooh88aluRs6YSmHfsBcI
 Kgxj1m8crgwwpPEWkBssWVhXvuL54FcDlf/uu65aH9JbMQ7Zdk7ObiptMwd+/TcbfX6v
 cHD1y9SFGO1h3i/lY4cKPEv8xUiFGYTnRhd0Vhvtl6JZ0WzYrGWYHbcvgUk75FtfJZU8
 0m4QsIF7NpfLKUdoiwnYdjV2s/PV75ReEQOIEmZUvJOFBFfS5mqIBglFGsQP51cMOO9o
 AoXAwFIiwF2AOyfdXvfs7jy3cq5K2R0luMhl+t32By/ye7m0I06pkouc9hgDpFL4b/4M
 hwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fClK9dYPgSK1URS64wSbMulejn6T5yvpN8jKUjDOmSs=;
 b=rqORoYh+nAxYK70P9lWQdv5j0m3Op7VwPXcTcjbB1BfcyTQwkhC33vEA7OEbXPBqG/
 ODEBvGy97i0Yr/a0LLd41EHolkGxHDMMDTvzc8QEJqXviYueUYAX7FVO0EoLIX+Qb+07
 Qng4qkx+L+CObURsYxR/Z/p1T80Kl4SK90n6fBZ0lEr74hrMLaVlygMS/B9ILEKEwHel
 p0JJKOSMq84rh+DFElhyD2BFS6wvuGspqQFSQfuM1UdhL7Xn4i4fMi3WXypsBgPLe9qy
 kRNw8sGNmUC9QaPEN4Go7mqE2uj3sdeaRVhCnoWwwLGA/uCkva5WcS1DUf7ek9xzKtHs
 qyEA==
X-Gm-Message-State: AOAM530hDF7Yph+YmCxU6M7m3F9Ih4FxKGkfBMTZEvj5XTB2tBp8iU82
 nVoRNwsZD5eW9Ue3BGYsmPtWz/e6KWL+TuE6W8bfkw==
X-Google-Smtp-Source: ABdhPJzib+BpTbU31xlUoWNFiPqoHFb5TY4jwtgOrWeTXAM7S/LG4dEzhQ2uSNYnr4smOgLLxmVzcrTTZd50LNIwqzU=
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr4115261wmf.134.1606731703433; 
 Mon, 30 Nov 2020 02:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20201109113240.3733496-1-anup.patel@wdc.com>
 <20201109113240.3733496-11-anup.patel@wdc.com>
 <186ade3c372b44ef8ca1830da8c5002b@huawei.com>
 <CAAhSdy1sx_oLGGoGjzr5ZrPStwCyFF4mBDEBw5zpsbSGcCRJjg@mail.gmail.com>
In-Reply-To: <CAAhSdy1sx_oLGGoGjzr5ZrPStwCyFF4mBDEBw5zpsbSGcCRJjg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Nov 2020 15:51:31 +0530
Message-ID: <CAAhSdy13nQqzfK-Voz-aBtGzEfjw_0V1fOrydijc3FLWy_W4nw@mail.gmail.com>
Subject: Re: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
 programming
To: Jiangyifei <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_052146_426528_5A85B27F 
X-CRM114-Status: GOOD (  39.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Alexander Graf <graf@amazon.com>,
 yinyipeng <yinyipeng1@huawei.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 "Wubin \(H\)" <wu.wubin@huawei.com>, "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 2:56 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Nov 16, 2020 at 2:59 PM Jiangyifei <jiangyifei@huawei.com> wrote:
> >
> >
> > > -----Original Message-----
> > > From: Anup Patel [mailto:anup.patel@wdc.com]
> > > Sent: Monday, November 9, 2020 7:33 PM
> > > To: Palmer Dabbelt <palmer@dabbelt.com>; Palmer Dabbelt
> > > <palmerdabbelt@google.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> > > Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Alexander Graf <graf@amazon.com>; Atish Patra <atish.patra@wdc.com>;
> > > Alistair Francis <Alistair.Francis@wdc.com>; Damien Le Moal
> > > <damien.lemoal@wdc.com>; Anup Patel <anup@brainfault.org>;
> > > kvm@vger.kernel.org; kvm-riscv@lists.infradead.org;
> > > linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Anup Patel
> > > <anup.patel@wdc.com>; Jiangyifei <jiangyifei@huawei.com>
> > > Subject: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
> > > programming
> > >
> > > This patch implements all required functions for programming the stage2 page
> > > table for each Guest/VM.
> > >
> > > At high-level, the flow of stage2 related functions is similar from KVM
> > > ARM/ARM64 implementation but the stage2 page table format is quite
> > > different for KVM RISC-V.
> > >
> > > [jiangyifei: stage2 dirty log support]
> > > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >  arch/riscv/include/asm/kvm_host.h     |  12 +
> > >  arch/riscv/include/asm/pgtable-bits.h |   1 +
> > >  arch/riscv/kvm/Kconfig                |   1 +
> > >  arch/riscv/kvm/main.c                 |  19 +
> > >  arch/riscv/kvm/mmu.c                  | 649
> > > +++++++++++++++++++++++++-
> > >  arch/riscv/kvm/vm.c                   |   6 -
> > >  6 files changed, 672 insertions(+), 16 deletions(-)
> > >
> >
> > ......
> >
> > >
> > >  int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu, @@ -69,27 +562,163 @@
> > > int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
> > >                        gpa_t gpa, unsigned long hva,
> > >                        bool writeable, bool is_write)
> > >  {
> > > -     /* TODO: */
> > > -     return 0;
> > > +     int ret;
> > > +     kvm_pfn_t hfn;
> > > +     short vma_pageshift;
> > > +     gfn_t gfn = gpa >> PAGE_SHIFT;
> > > +     struct vm_area_struct *vma;
> > > +     struct kvm *kvm = vcpu->kvm;
> > > +     struct kvm_mmu_page_cache *pcache = &vcpu->arch.mmu_page_cache;
> > > +     bool logging = (memslot->dirty_bitmap &&
> > > +                     !(memslot->flags & KVM_MEM_READONLY)) ? true : false;
> > > +     unsigned long vma_pagesize;
> > > +
> > > +     mmap_read_lock(current->mm);
> > > +
> > > +     vma = find_vma_intersection(current->mm, hva, hva + 1);
> > > +     if (unlikely(!vma)) {
> > > +             kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> > > +             mmap_read_unlock(current->mm);
> > > +             return -EFAULT;
> > > +     }
> > > +
> > > +     if (is_vm_hugetlb_page(vma))
> > > +             vma_pageshift = huge_page_shift(hstate_vma(vma));
> > > +     else
> > > +             vma_pageshift = PAGE_SHIFT;
> > > +     vma_pagesize = 1ULL << vma_pageshift;
> > > +     if (logging || (vma->vm_flags & VM_PFNMAP))
> > > +             vma_pagesize = PAGE_SIZE;
> > > +
> > > +     if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> > > +             gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> > > +
> > > +     mmap_read_unlock(current->mm);
> > > +
> > > +     if (vma_pagesize != PGDIR_SIZE &&
> > > +         vma_pagesize != PMD_SIZE &&
> > > +         vma_pagesize != PAGE_SIZE) {
> > > +             kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
> > > +             return -EFAULT;
> > > +     }
> > > +
> > > +     /* We need minimum second+third level pages */
> > > +     ret = stage2_cache_topup(pcache, stage2_pgd_levels,
> > > +                              KVM_MMU_PAGE_CACHE_NR_OBJS);
> > > +     if (ret) {
> > > +             kvm_err("Failed to topup stage2 cache\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
> > > +     if (hfn == KVM_PFN_ERR_HWPOISON) {
> > > +             send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
> > > +                             vma_pageshift, current);
> > > +             return 0;
> > > +     }
> > > +     if (is_error_noslot_pfn(hfn))
> > > +             return -EFAULT;
> > > +
> > > +     /*
> > > +      * If logging is active then we allow writable pages only
> > > +      * for write faults.
> > > +      */
> > > +     if (logging && !is_write)
> > > +             writeable = false;
> > > +
> > > +     spin_lock(&kvm->mmu_lock);
> > > +
> > > +     if (writeable) {
> >
> > Hi Anup,
> >
> > What is the purpose of "writable = !memslot_is_readonly(slot)" in this series?
>
> Where ? I don't see this line in any of the patches.
>
> >
> > When mapping the HVA to HPA above, it doesn't know that the PTE writeable of stage2 is "!memslot_is_readonly(slot)".
> > This may causes the difference between the writability of HVA->HPA and GPA->HPA.
> > For example, GPA->HPA is writeable, but HVA->HPA is not writeable.
>
> Yes, this is possible particularly when Host kernel is updating writability
> of HVA->HPA mappings for swapping in/out pages.
>
> >
> > Is it better that the writability of HVA->HPA is also determined by whether the memslot is readonly in this change?
> > Like this:
> > -    hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
> > +    hfn = gfn_to_pfn_prot(kvm, gfn, writeable, NULL);
>
> The gfn_to_pfn_prot() needs to know what type of fault we
> got (i.e read/write fault). Rest of the information (such as whether
> slot is writable or not) is already available to gfn_to_pfn_prot().
>
> The question here is should we pass "&writeable" or NULL as
> last parameter to gfn_to_pfn_prot(). The recent JUMP label
> support in Linux RISC-V causes problem on HW where PTE
> 'A' and 'D' bits are not updated by HW so I have to change
> last parameter of gfn_to_pfn_prot() from "&writeable" to NULL.
>
> I am still investigating this.

This turned-out to be a bug in Spike which is not fixed.

I will include following change in v16 patch series:


diff --git a/arch/riscv/include/asm/kvm_host.h
b/arch/riscv/include/asm/kvm_host.h
index 241030956d47..dc2666b4180b 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -232,8 +232,7 @@ void __kvm_riscv_hfence_gvma_all(void);

 int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
              struct kvm_memory_slot *memslot,
-             gpa_t gpa, unsigned long hva,
-             bool writeable, bool is_write);
+             gpa_t gpa, unsigned long hva, bool is_write);
 void kvm_riscv_stage2_flush_cache(struct kvm_vcpu *vcpu);
 int kvm_riscv_stage2_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index fcaeadc9b34d..56fda9ef70fd 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -689,11 +689,11 @@ int kvm_test_age_hva(struct kvm *kvm, unsigned long hva)

 int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
              struct kvm_memory_slot *memslot,
-             gpa_t gpa, unsigned long hva,
-             bool writeable, bool is_write)
+             gpa_t gpa, unsigned long hva, bool is_write)
 {
     int ret;
     kvm_pfn_t hfn;
+    bool writeable;
     short vma_pageshift;
     gfn_t gfn = gpa >> PAGE_SHIFT;
     struct vm_area_struct *vma;
@@ -742,7 +742,7 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,

     mmu_seq = kvm->mmu_notifier_seq;

-    hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
+    hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writeable);
     if (hfn == KVM_PFN_ERR_HWPOISON) {
         send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
                 vma_pageshift, current);
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index f054406792a6..058cfa168abe 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -445,7 +445,7 @@ static int stage2_page_fault(struct kvm_vcpu
*vcpu, struct kvm_run *run,
         };
     }

-    ret = kvm_riscv_stage2_map(vcpu, memslot, fault_addr, hva, writeable,
+    ret = kvm_riscv_stage2_map(vcpu, memslot, fault_addr, hva,
         (trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
     if (ret < 0)
         return ret;

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
