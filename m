Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737F9C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 04:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ob/wr2uNSaDtUElAdDGyFN6kss+P4VwugyXF54Fgnso=; b=VB0+8hyjd7qkwn
	8fEebI3BSB624PNfCPTs48yd0ZElnbcEfnjdTovINFcyQCjb/kMV0V1LBdSltuNAfPnk6K4wK8IC2
	iNNwTKMxEcoPMRfSW6IeehlhuTnE5repr/xRJY4hlC/3iPMYT1OeG+WK2As3zN4xXEIAcI6PnyjFK
	Sn1TyTyumHF+lpr+Pslof13iVyY8fyCMH9QfPWwcwLeTuuCC4uyPyIWzNi3YbSkNq/X4wIEJLM0Nt
	0O/uolUGIQLAQz0dXkeBE1PiP46OXmJiz/kYqzDCHiyi92XhxEy190w/aG421Ctcv3a5vdrTSlpI3
	ZooCC54oPOOnzOs+jzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDI2B-00Ap4Q-Du; Mon, 18 Jul 2022 04:07:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDI28-00Ap2y-8A
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 04:07:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id j1so10800247wrs.4
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 21:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqKqAsiuT2ci7oRoFpphbORkfNF9Sqdp2GAmlBxKgV4=;
        b=k6u7OoZnhtF2M0wYb5Ye/+qhGhYm0AWbwVrohe57R7ni8v92EpBP6R6TjsbolXypA1
         AahSW2NhR1X7hhjzZjDIVC1DS2dWM5MmBjEby9TCxPFmNmL4Vo+TyrPWxTa0+44/FwmY
         VjLl3xocn+U42excfVnEy/r1Kc3XhiuwTM3cGalvwKUnyPx9xyXsWSklura+LdvJsnRM
         WByOWuo2kWAzegVNbvKWRuw/KacEQwRwk0U2mgwy5YlYqR7u7qh1ltkCgYnus6yoYbgU
         hQTa7H9PdHBRC6Db+cZ9mxT//oY9oKI7poriDZ8xYHHrJ9lOUEVRnBoAaglE3EoiGBTO
         yI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqKqAsiuT2ci7oRoFpphbORkfNF9Sqdp2GAmlBxKgV4=;
        b=YLJlaA7uHVZ+3qbYtU03jcADdJfLNMcOYpBGx7M9m62jUNdn5jVFO+y/ii6y3d+rDR
         Hc3huGGXK7asLjTMf/ONOuMjHGn1/FiG6oGtibrbsFwuy/Kfa+gbU/45Ou15FdAnTAqC
         7IeiijgyEid0UjyLQfaIFwzAbOTQ2WvRwW5iVUZkWgxdMErySoW3jDiQ8PvD+FVcjvp5
         cjRyBne5EqOhhDaC8/5wk9vQPgi0s3WoApzbZjNJKGniP0ntssym0Zbo7GZg5et8kK3N
         croo/MU7OCs96T/XDzcI0U2SZ+dApApNiTssEtDEFn+whLUwzdL4yh1f3aFRl1wS4nnJ
         oO8A==
X-Gm-Message-State: AJIora/W58EoW3tmFVrNVvuNkX3bEKvSDPlCKUnNM1Rv/kxoJQnSVIGh
	eGfdVnAuYNvSgkAA4XsdLT7bWUOtqi1OVyFgajGemg==
X-Google-Smtp-Source: AGRyM1s+p/AHIWOyiFZ9AUYgPg2KUVC5CRbMvj1HvlqIf98hSHNCbUqdpykA32xYLeeKZqwM9lbiIuUv3Hc14M7gIAw=
X-Received: by 2002:a5d:67c4:0:b0:21d:6d91:7b1a with SMTP id
 n4-20020a5d67c4000000b0021d6d917b1amr20926351wrw.313.1658117218369; Sun, 17
 Jul 2022 21:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com>
 <20220707145248.458771-4-apatel@ventanamicro.com> <CAOnJCU++MsxgPyGqumWMLrB7ihDk3UmzwwD_voW0Rfnf-BVPWQ@mail.gmail.com>
In-Reply-To: <CAOnJCU++MsxgPyGqumWMLrB7ihDk3UmzwwD_voW0Rfnf-BVPWQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jul 2022 09:36:46 +0530
Message-ID: <CAAhSdy2fbr-GtYNYgCW5Y3xCvxx7Cworev5q+xtpYhDJzd=sqg@mail.gmail.com>
Subject: Re: [PATCH 3/5] RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_210700_324674_5D30939D 
X-CRM114-Status: GOOD (  19.98  )
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

On Wed, Jul 13, 2022 at 6:56 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The in-kernel AIA IMSIC support requires on-demand mapping / unmapping
> > of Guest IMSIC address to Host IMSIC guest files. To help achieve this,
> > we add kvm_riscv_stage2_ioremap() and kvm_riscv_stage2_iounmap()
> > functions. These new functions for updating G-stage page table mappings
> > will be called in atomic context so we have special "in_atomic" parameter
> > for this purpose.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h |  5 +++++
> >  arch/riscv/kvm/mmu.c              | 18 ++++++++++++++----
> >  2 files changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 59a0cf2ca7b9..60c517e4d576 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -284,6 +284,11 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
> >  void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
> >                                unsigned long hbase, unsigned long hmask);
> >
> > +int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> > +                            phys_addr_t hpa, unsigned long size,
> > +                            bool writable, bool in_atomic);
> > +void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
> > +                             unsigned long size);
> >  int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> >                          struct kvm_memory_slot *memslot,
> >                          gpa_t gpa, unsigned long hva, bool is_write);
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index b75d4e200064..f7862ca4c4c6 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -343,8 +343,9 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
> >         kvm_flush_remote_tlbs(kvm);
> >  }
> >
> > -static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> > -                         unsigned long size, bool writable)
> > +int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> > +                            phys_addr_t hpa, unsigned long size,
> > +                            bool writable, bool in_atomic)
> >  {
> >         pte_t pte;
> >         int ret = 0;
> > @@ -353,6 +354,7 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> >         struct kvm_mmu_memory_cache pcache;
> >
> >         memset(&pcache, 0, sizeof(pcache));
> > +       pcache.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0;
> >         pcache.gfp_zero = __GFP_ZERO;
> >
> >         end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
> > @@ -382,6 +384,13 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> >         return ret;
> >  }
> >
> > +void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
> > +{
> > +       spin_lock(&kvm->mmu_lock);
> > +       gstage_unmap_range(kvm, gpa, size, false);
> > +       spin_unlock(&kvm->mmu_lock);
> > +}
> > +
> >  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
> >                                              struct kvm_memory_slot *slot,
> >                                              gfn_t gfn_offset,
> > @@ -517,8 +526,9 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >                                 goto out;
> >                         }
> >
> > -                       ret = gstage_ioremap(kvm, gpa, pa,
> > -                                            vm_end - vm_start, writable);
> > +                       ret = kvm_riscv_gstage_ioremap(kvm, gpa, pa,
> > +                                                      vm_end - vm_start,
> > +                                                      writable, false);
> >                         if (ret)
> >                                 break;
> >                 }
> > --
> > 2.34.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.20.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
