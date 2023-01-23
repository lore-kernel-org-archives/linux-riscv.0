Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829D2C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wzTENaUVQOQgjhx6kPKt5+EZP4tos6LDIG4hAQdV3s=; b=Xaw4O9ZoBl4RhA
	b6alzlvFqVhe1ku36kyK3KMvd/0ZQO49cjcvTE+etpGNXS30JN7qz99RG9N7jEdHY4b1YSiV1iYcV
	CeMT585G+xJvt8hTxuWkXi4s796+fjTwXTjgIR2gECBEvah5eNQLEKA49uZB+Zn7xtnqJ9eY8HgJl
	Z1CDZa+1Oscr+xKgkfqTawAXVUwfryBAbicaNn8zEMOtfvO8tElHG5uUzCrTxbrCF/4XuPLjNRGv0
	NB1nf7NndluxoeAYU3QgkVlyVvlFzpFigJ0q/scjzJdwUJ8Hm5xU2qAnBUoWUOYt+hyNtnAfEyG92
	uV+ynhrBfir2eilVvL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJup0-00Gwbb-Tt; Mon, 23 Jan 2023 11:17:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuox-00Gwaj-CA
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 11:17:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so10352000wmb.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5gWL+Pk8xqNJgEc/BiJaFQTjPu8aNsaT1rJQ4ElXFDM=;
        b=fNRC8Ij8xgy1/7RLSZZ03wsQBLesqDAbx9k+SCARCiyPDwsLsK/u3bVOpgvRcWTg9+
         85LVUnNf7Sb6UEd92O9OchScZvPhA6Z5b9s6VN1iQ1vjgE9G3McqrYlnW8Bks0u0reGx
         DCgTDfD6FN+pLnNev9MEhTKUsKqAFEA+JcJQOuXZ1m6opU1B4+54Vv58WWTd/dDKxdzM
         HTx9bYJgL41lPM4VZWJiecVhaZ3LcIHVq79Y3jaIPGmlxGHu3fp5foX3mvKWSXF6ESfv
         vY6Phh1epb8DrQ7H3Pk5UE1KYmG3/pP84SMUPCgaOBPQZvSUmcJ8jDsbWbr8eTfciHZ2
         YVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gWL+Pk8xqNJgEc/BiJaFQTjPu8aNsaT1rJQ4ElXFDM=;
        b=GPArqRcCuVZo7t0+DpOcQGxM3NMcbYERu3FcMGR6xWE39wC5ApgQaBMd/X7PjnTLCQ
         D2LBBgRVZQ6MLUWtCAOEivLtBWcvwzJML6pmd8Qeokl5jR594ir4wnPxTLGqUzkaQoI+
         PQTUDUcEN3SQy1vOlbPDSoWurV7xA2BGCZLpvCiQQSHEBqE4bvBE+IfG5ZudjeFezLym
         jo5ZxDN2+D8ChJYgkARv432GuO98tkNo3JBIYkRmB9obbzcxC6shuDeB9sM1OFqrmULo
         wEE1eggzpZGicnpoBJJercdsiE97xQhi9yOLQ01dZeyvIFACcfgZY1LovPbvpltTMhwT
         qg0w==
X-Gm-Message-State: AFqh2kqIQn82EszwW98vCd/gG6xuRepQ3FguoN8HqF8AgmcDuWt/QDxY
	s2th4iKZWA4+ae1zwnbxV6ydCDR53n87ZIzxeTxpyQ==
X-Google-Smtp-Source: AMrXdXsE7/eis0AnNqg/Sw3AyuZ8/Z3AXvka/LcYo62OTdPK9H6JiGtJJs5MGNiibrB3AxRcoFw8AhQdrPUqPiaPwC0=
X-Received: by 2002:a7b:c4d0:0:b0:3db:459:5847 with SMTP id
 g16-20020a7bc4d0000000b003db04595847mr1328861wmk.5.1674472621696; Mon, 23 Jan
 2023 03:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20230123092928.808014-1-alexghiti@rivosinc.com> <20230123110337.3pmsk7nvip3sxlc4@orel>
In-Reply-To: <20230123110337.3pmsk7nvip3sxlc4@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 23 Jan 2023 12:16:50 +0100
Message-ID: <CAHVXubg+1zi2p=XFX_TYx6S=yNdQPa_u0CLZnjOWSG_Drrao8A@mail.gmail.com>
Subject: Re: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_031703_474590_89CEE7B7 
X-CRM114-Status: GOOD (  19.32  )
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

On Mon, Jan 23, 2023 at 12:03 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:29:28AM +0100, Alexandre Ghiti wrote:
> > At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> > PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> > PGDIR_SIZE into PUD_SIZE.
>
> Can you please add a sentence as to how you found this? Some test case
> or just by analysis?

Just by reading the code! That made me think that we can have more
hugepages for riscv since the introduction of sv48 and sv57, I'll send
this patch later.

>
> Anyway,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,

Alex

>
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/kvm/mmu.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 34b57e0be2ef..dbc4ca060174 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> >       if (!kvm->arch.pgd)
> >               return false;
> >
> > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> >
> >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> >                                  &ptep, &ptep_level))
> > @@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> >       if (!kvm->arch.pgd)
> >               return false;
> >
> > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> >
> >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> >                                  &ptep, &ptep_level))
> > @@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> >       if (logging || (vma->vm_flags & VM_PFNMAP))
> >               vma_pagesize = PAGE_SIZE;
> >
> > -     if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> > +     if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
> >               gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> >
> >       mmap_read_unlock(current->mm);
> >
> > -     if (vma_pagesize != PGDIR_SIZE &&
> > +     if (vma_pagesize != PUD_SIZE &&
> >           vma_pagesize != PMD_SIZE &&
> >           vma_pagesize != PAGE_SIZE) {
> >               kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
> > --
> > 2.37.2
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
