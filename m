Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A0C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 05:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOPXOviaqsJlupjnqHFC1LII2HNVtZx+abEssYuazjk=; b=MJ8ZV9JMykrw9b
	HZi5mc8Cy7LgutvlJ+JIosNt+8tK5IGnhpxFdxW3IkCo/YnvT3QhirdxsDiXqZHJeMXS9VMGf+fMY
	WAoOk5My0e5H1bjt/nowoms8MbmWyQN0Hh9wvN1Xbef5kjkHkGPFYxTLeqPg0GyFup3p/d2Wzm7eR
	RsOZInnLBR/zgx31tDzQdQkgYzrTHO6Ybf4KkVFUeTTuVLqlcYAntBfJlHzFKKOOrqRT1DGgOiHeB
	a321t0OYQMRUp8iVinrIGNw65XuJxdXdeandh88sFdmAORqSbhwGT3eXiosqVhbq9kB+1xnJQ2f9K
	c6dylPMYgGZhGP0/GrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLHRk-00DI8U-3i; Fri, 27 Jan 2023 05:38:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLHRf-00DI7Q-Qr
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 05:38:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z11so3820832ede.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 21:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JFUPc+lU7HPxppOgMcNwGj0PM3SP5fzaDIR99v18sAU=;
        b=GAsAwJWc2omReq9wRMhsy8ixlevj5d66DwqJ4FlkYBhSNpcSidZ6gdah1QzYIeOaV3
         Dzf6TpzLYPPm0JMNGHeusI3nRUQxowVHj18tdwIEeXObFXSprtyKJbTkw5CjDeUI7DVA
         KgIbxI88i75Zu2Nxj0qBuhmTGlOTSGk19dtnbts8+G/Xi6dElnsUayJJ4VneM4tJR6Hb
         P0RwvokuJguAkKGx/SdkpK5vS2sg825BSiMS5Lm5U7v0T7UrQ2yciAwHbx3oMLmNQTj2
         A51zvAh3EzkgMBbA+uEfsUqISLSiaFBhhhNtaFrkboKMdy2hD6npK5NwkXmbjSnLwHr0
         Wmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFUPc+lU7HPxppOgMcNwGj0PM3SP5fzaDIR99v18sAU=;
        b=oNDLtGMctUqjL0mNGlEcp3LXDlrJsi8TnPp1z6yLhTCku96+Zk9lrrND7+hI2z0vZt
         Gga2gyRhcp3SoQD9bJZAIrgOOkF0F/senZOKmUOTpPr1qJ2g3l+8SuhrVyqjCFffcMzz
         x6ETdiZArwYmUvzT6yDZ5gv6I36AShgadY1HRcalxueh8JfJJfxT1VZyQCVaLhmRReMX
         kXW0RztokgP3zQdJFqdiWWpp+E843o6czRwHIPpRGVSt0TO96YRcgZ5cnI5YSsRbLfhT
         +x3c7vRw5IabJ//sVgLNeXwtQU5lULhsGHohJTrX9Bcr0Md30R4lHC37cnooP9GWBABZ
         bCeg==
X-Gm-Message-State: AFqh2kqO12PP43CGEXzoHcx+8AZaT7UeTdRJ+FVLfcSfGfsW/m1a5MQn
	b7rDj+Pc0Mp5pTmuvchv3St7Kw3654hen8tQRgtCWg==
X-Google-Smtp-Source: AMrXdXs7S9OHnQa8OaHPiBaDup6GXNYIWliRtThREoOzhrNSBrUwL1ewg84TBMC8dceoEWYGm6yAB/X6MnGnHTNAhG4=
X-Received: by 2002:a05:6402:1008:b0:499:f0f:f788 with SMTP id
 c8-20020a056402100800b004990f0ff788mr6180622edu.25.1674797916410; Thu, 26 Jan
 2023 21:38:36 -0800 (PST)
MIME-Version: 1.0
References: <20230123092928.808014-1-alexghiti@rivosinc.com>
 <bdabafb1-53f3-403c-ab9c-1c2d00421690@ghiti.fr> <CAAhSdy1grLz2EXEJUicGFZO7md7F=Hbnhv7ZqBFFx-vtnkpmmA@mail.gmail.com>
 <CAHVXubjHBu7F9xaERTR6vppsUph2U8JX1DRSrFUAWs-jJ_8ncQ@mail.gmail.com>
In-Reply-To: <CAHVXubjHBu7F9xaERTR6vppsUph2U8JX1DRSrFUAWs-jJ_8ncQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Jan 2023 11:08:24 +0530
Message-ID: <CAAhSdy1FdXvZQo9+bpfqHUA0FD-6NnxbL59Cs-+7zrw8EBcmJg@mail.gmail.com>
Subject: Re: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_213840_160383_220ADD49 
X-CRM114-Status: GOOD (  25.00  )
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

On Mon, Jan 23, 2023 at 8:04 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> On Mon, Jan 23, 2023 at 12:28 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jan 23, 2023 at 3:01 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > >
> > > @Anup: Sorry, forgot to add -fixes to the patch title, as I think this
> > > should go into your fixes branch for 6.2.
> >
> > Can you provide the Fixes: line here ? I will include it at time of
> > adding this patch to my fixes branch.
>
> It actually fixes 2 commits: 9955371cc014 ("RISC-V: KVM: Implement MMU
> notifiers") and 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page
> table programming"). But they were both part of the first KVM
> patchset, so I only took the oldest one, but tell me if you want me to
> split the patch into 2 different patches that fix one commit at a
> time.
>
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")

The Linux-6.3 merge window is near so I have queued this patch
for Linux-6.3

Thanks,
Anup

>
> Thanks,
>
> Alex
>
> >
> > Regards,
> > Anup
> >
> > >
> > > On 1/23/23 10:29, Alexandre Ghiti wrote:
> > > > At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> > > > PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> > > > PGDIR_SIZE into PUD_SIZE.
> > > >
> > > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > > ---
> > > >   arch/riscv/kvm/mmu.c | 8 ++++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > > > index 34b57e0be2ef..dbc4ca060174 100644
> > > > --- a/arch/riscv/kvm/mmu.c
> > > > +++ b/arch/riscv/kvm/mmu.c
> > > > @@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> > > >       if (!kvm->arch.pgd)
> > > >               return false;
> > > >
> > > > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > > > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> > > >
> > > >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> > > >                                  &ptep, &ptep_level))
> > > > @@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> > > >       if (!kvm->arch.pgd)
> > > >               return false;
> > > >
> > > > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > > > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> > > >
> > > >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> > > >                                  &ptep, &ptep_level))
> > > > @@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> > > >       if (logging || (vma->vm_flags & VM_PFNMAP))
> > > >               vma_pagesize = PAGE_SIZE;
> > > >
> > > > -     if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> > > > +     if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
> > > >               gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> > > >
> > > >       mmap_read_unlock(current->mm);
> > > >
> > > > -     if (vma_pagesize != PGDIR_SIZE &&
> > > > +     if (vma_pagesize != PUD_SIZE &&
> > > >           vma_pagesize != PMD_SIZE &&
> > > >           vma_pagesize != PAGE_SIZE) {
> > > >               kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
