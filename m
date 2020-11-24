Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327DFC56201
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 09:28:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BD92075A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 09:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itPISSJL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="mTKhkigH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BD92075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K8fSQAB7cMMG/5DCtdEm3S3vZTgovDyWBY/t2srTEj8=; b=itPISSJLQAdz1OayW0YdUlo+O
	0TSagBUpDFU3HNAzMs3TOlouC8IBvPlbBBUYnalgd7pE4mPBNrEHBBLafXbqsntiM9PogV6NxJZPi
	V5RfPBtOnNoXd0a3lPEQlSuraWFEfqcWzECbY0UHHCWsRJ+rMyHJg64GTtm9h+lk6rKgstP/sZx29
	ZQBsll3qZcIQ03/QIz+gwywJAM9p8Tze6U9+Rhj91GKy01Dpscoq8VqlNHEiKQPVcY+BOedQVZss4
	7zRmCyxV/+9nQ0+ImE4BCOLakJdNXo7XTcfUiZ7EFTf7zHR/Xe2bnatc/OPWMBXjt7RfzMf/JmQrH
	uk3paD9xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khUcS-0005bi-2b; Tue, 24 Nov 2020 09:28:16 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khUbE-000522-B7
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 09:27:04 +0000
Received: by mail-lj1-x243.google.com with SMTP id r18so6433360ljc.2
 for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2020 01:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kukcRBKUzlxamYfGZyLQcYKTY8NzjKcvgUjtKw6Awcs=;
 b=mTKhkigHDoPSK5lJonpLM+ptC9nzL1l0tydMD89elegFPdySD76uSEJsbq+YHeYnxf
 Rz4FfjcDwKYN8FfQRRD+CLwKIrxw+xcIQTUUulqIGLJnGJJtpBcYxFzRdgpwQ6SWMOo+
 q3PkgZauF0skJeSgzy6EUgoeZeJJIR3+wesynyuOYU7UUggGUuSO4MnumIkz/7FpUgH7
 bPgZc731EbjWDEHb8hURC9bd0FVBXY8DcP4BR/R1Jo7TNsiP+2/tiOAVr2NZKsL2GNJp
 Jz0F1Lwi4OR9qB/Gy/s392aYCVV5Fn7wwJXzfaxfm5gTj6TFxF3WmE5GY7WRrHhjdS8B
 IXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kukcRBKUzlxamYfGZyLQcYKTY8NzjKcvgUjtKw6Awcs=;
 b=X4vLEa4dMdsWnIKaBzgqWDfeRIAo5aoseFwxm+mspy7lfzUSFp1qqQYkIjfSz8zw3g
 KEAR9YPdozm6Yo4d3wnGXToaF31gPOPRX89KrDFUJFs8GU8UWXDMMctudMezafnZZxs2
 rRMarAR5IJ986yI8sOR1YqiWrO1kWZSWdj1Oxel+NxFwVHrHF2ZOL6J0+39TYQ4lU97d
 wLjbhMuVW7JCVrHhKQv2Nc+UdttSkW1fgaN0KSj2dhVxJQ2fP5hzaYMEtMyNJxe9Kr6/
 w+RsQeoZ02YSJ5QNQSgVtGxC3iaJlqLSNQHEx/WOE/wDTjqX1b0LwgqB8J665Vqb2Y+B
 VFfg==
X-Gm-Message-State: AOAM532rio9EnuWAi6LpXgpgm+sU2Hs0MqJ0rpwQfYfM5Bjtem+uAgtQ
 4UN0knExi+c4aQSi4EWkny0p0JPCHtR/Ex8hWhrywg==
X-Google-Smtp-Source: ABdhPJwOkzwqjm2LNBXyYJWEcdhsLWfHn+ob5iB1SDuNQIbquePN0gEeSNq06vXwo6W+kH3ODe5+sRqpAfJ/VDCKf+s=
X-Received: by 2002:a05:651c:134f:: with SMTP id
 j15mr1495677ljb.469.1606210016792; 
 Tue, 24 Nov 2020 01:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20201109113240.3733496-1-anup.patel@wdc.com>
 <20201109113240.3733496-11-anup.patel@wdc.com>
 <186ade3c372b44ef8ca1830da8c5002b@huawei.com>
In-Reply-To: <186ade3c372b44ef8ca1830da8c5002b@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Nov 2020 14:56:43 +0530
Message-ID: <CAAhSdy1sx_oLGGoGjzr5ZrPStwCyFF4mBDEBw5zpsbSGcCRJjg@mail.gmail.com>
Subject: Re: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
 programming
To: Jiangyifei <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_042700_723132_D3776395 
X-CRM114-Status: GOOD (  31.36  )
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

On Mon, Nov 16, 2020 at 2:59 PM Jiangyifei <jiangyifei@huawei.com> wrote:
>
>
> > -----Original Message-----
> > From: Anup Patel [mailto:anup.patel@wdc.com]
> > Sent: Monday, November 9, 2020 7:33 PM
> > To: Palmer Dabbelt <palmer@dabbelt.com>; Palmer Dabbelt
> > <palmerdabbelt@google.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> > Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Alexander Graf <graf@amazon.com>; Atish Patra <atish.patra@wdc.com>;
> > Alistair Francis <Alistair.Francis@wdc.com>; Damien Le Moal
> > <damien.lemoal@wdc.com>; Anup Patel <anup@brainfault.org>;
> > kvm@vger.kernel.org; kvm-riscv@lists.infradead.org;
> > linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Anup Patel
> > <anup.patel@wdc.com>; Jiangyifei <jiangyifei@huawei.com>
> > Subject: [PATCH v15 10/17] RISC-V: KVM: Implement stage2 page table
> > programming
> >
> > This patch implements all required functions for programming the stage2 page
> > table for each Guest/VM.
> >
> > At high-level, the flow of stage2 related functions is similar from KVM
> > ARM/ARM64 implementation but the stage2 page table format is quite
> > different for KVM RISC-V.
> >
> > [jiangyifei: stage2 dirty log support]
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h     |  12 +
> >  arch/riscv/include/asm/pgtable-bits.h |   1 +
> >  arch/riscv/kvm/Kconfig                |   1 +
> >  arch/riscv/kvm/main.c                 |  19 +
> >  arch/riscv/kvm/mmu.c                  | 649
> > +++++++++++++++++++++++++-
> >  arch/riscv/kvm/vm.c                   |   6 -
> >  6 files changed, 672 insertions(+), 16 deletions(-)
> >
>
> ......
>
> >
> >  int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu, @@ -69,27 +562,163 @@
> > int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
> >                        gpa_t gpa, unsigned long hva,
> >                        bool writeable, bool is_write)
> >  {
> > -     /* TODO: */
> > -     return 0;
> > +     int ret;
> > +     kvm_pfn_t hfn;
> > +     short vma_pageshift;
> > +     gfn_t gfn = gpa >> PAGE_SHIFT;
> > +     struct vm_area_struct *vma;
> > +     struct kvm *kvm = vcpu->kvm;
> > +     struct kvm_mmu_page_cache *pcache = &vcpu->arch.mmu_page_cache;
> > +     bool logging = (memslot->dirty_bitmap &&
> > +                     !(memslot->flags & KVM_MEM_READONLY)) ? true : false;
> > +     unsigned long vma_pagesize;
> > +
> > +     mmap_read_lock(current->mm);
> > +
> > +     vma = find_vma_intersection(current->mm, hva, hva + 1);
> > +     if (unlikely(!vma)) {
> > +             kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> > +             mmap_read_unlock(current->mm);
> > +             return -EFAULT;
> > +     }
> > +
> > +     if (is_vm_hugetlb_page(vma))
> > +             vma_pageshift = huge_page_shift(hstate_vma(vma));
> > +     else
> > +             vma_pageshift = PAGE_SHIFT;
> > +     vma_pagesize = 1ULL << vma_pageshift;
> > +     if (logging || (vma->vm_flags & VM_PFNMAP))
> > +             vma_pagesize = PAGE_SIZE;
> > +
> > +     if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> > +             gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> > +
> > +     mmap_read_unlock(current->mm);
> > +
> > +     if (vma_pagesize != PGDIR_SIZE &&
> > +         vma_pagesize != PMD_SIZE &&
> > +         vma_pagesize != PAGE_SIZE) {
> > +             kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
> > +             return -EFAULT;
> > +     }
> > +
> > +     /* We need minimum second+third level pages */
> > +     ret = stage2_cache_topup(pcache, stage2_pgd_levels,
> > +                              KVM_MMU_PAGE_CACHE_NR_OBJS);
> > +     if (ret) {
> > +             kvm_err("Failed to topup stage2 cache\n");
> > +             return ret;
> > +     }
> > +
> > +     hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
> > +     if (hfn == KVM_PFN_ERR_HWPOISON) {
> > +             send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
> > +                             vma_pageshift, current);
> > +             return 0;
> > +     }
> > +     if (is_error_noslot_pfn(hfn))
> > +             return -EFAULT;
> > +
> > +     /*
> > +      * If logging is active then we allow writable pages only
> > +      * for write faults.
> > +      */
> > +     if (logging && !is_write)
> > +             writeable = false;
> > +
> > +     spin_lock(&kvm->mmu_lock);
> > +
> > +     if (writeable) {
>
> Hi Anup,
>
> What is the purpose of "writable = !memslot_is_readonly(slot)" in this series?

Where ? I don't see this line in any of the patches.

>
> When mapping the HVA to HPA above, it doesn't know that the PTE writeable of stage2 is "!memslot_is_readonly(slot)".
> This may causes the difference between the writability of HVA->HPA and GPA->HPA.
> For example, GPA->HPA is writeable, but HVA->HPA is not writeable.

Yes, this is possible particularly when Host kernel is updating writability
of HVA->HPA mappings for swapping in/out pages.

>
> Is it better that the writability of HVA->HPA is also determined by whether the memslot is readonly in this change?
> Like this:
> -    hfn = gfn_to_pfn_prot(kvm, gfn, is_write, NULL);
> +    hfn = gfn_to_pfn_prot(kvm, gfn, writeable, NULL);

The gfn_to_pfn_prot() needs to know what type of fault we
got (i.e read/write fault). Rest of the information (such as whether
slot is writable or not) is already available to gfn_to_pfn_prot().

The question here is should we pass "&writeable" or NULL as
last parameter to gfn_to_pfn_prot(). The recent JUMP label
support in Linux RISC-V causes problem on HW where PTE
'A' and 'D' bits are not updated by HW so I have to change
last parameter of gfn_to_pfn_prot() from "&writeable" to NULL.

I am still investigating this.

Regards,
Anup

>
> Regards,
> Yifei
>
> > +             kvm_set_pfn_dirty(hfn);
> > +             mark_page_dirty(kvm, gfn);
> > +             ret = stage2_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> > +                                   vma_pagesize, false, true);
> > +     } else {
> > +             ret = stage2_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> > +                                   vma_pagesize, true, true);
> > +     }
> > +
> > +     if (ret)
> > +             kvm_err("Failed to map in stage2\n");
> > +
> > +     spin_unlock(&kvm->mmu_lock);
> > +     kvm_set_pfn_accessed(hfn);
> > +     kvm_release_pfn_clean(hfn);
> > +     return ret;
> >  }
> >
>
> ......
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
