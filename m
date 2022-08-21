Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D40C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 05:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2S05cA53twl6M10TG7U9USfjbAJrfAvjDBxfr7qugCM=; b=N1Gpg9cPwY2Roz
	mT+B7abW86AzDX67X8lqBnE0LggJRwjMykbvL97adR5nrcu2Kqgy5asCLl+tp7Pajf5X/AKEvr6/+
	OpwYr6/F538cFsWZ7nB1VqLoELhTL5uFIzYv4KEed/lsSfm9usSN2LT5HGm+qUB8Nlv0DJuqNEO1C
	Sl8sr2jwuk/onj+SdTj/K+5zhGWkGqyQuAGp8ht70rvi1Enve/C9PoKZH5d2D8Co+mPPHKxvCNAz7
	9XgcBGBIu8yoNt+H21GTPJRDJrcXb5RfFXzjNu+9ScNGyFk2wB+u507S0hUUCI5iEFOL/pdzuUQA1
	pY4pv4UHebTgSJXvTlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPdJL-006GaQ-7u; Sun, 21 Aug 2022 05:15:47 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPdJH-006GYx-Hp
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 05:15:45 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-33387bf0c4aso215113567b3.11
        for <linux-riscv@lists.infradead.org>; Sat, 20 Aug 2022 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=LdNSrA/UwC8d9WVId873VHJD2GFt5pC4YthPYYq3GQo=;
        b=Caw8jriSOv6uuTtk7ioMJRlJdgEW+ZwBGSfpVWzzOSqtibBWVdG6Bf0ZafOqu1wQ9k
         wrdSWiZIaJPMLncvg5cff3DIzauItIaQ1kYbWRdGe+bvJegk7QH4OSMnUEyFV9gICDQ3
         yPILvj8ygPMnYDOxzcf/IJ1JakstsBsIm/2aEOCcLsfMsGDfYZU1VLY7Fbz8grIkbWaU
         3q+Hk3eTKej0yDTnMniMp2+i+C+Sd2dB6yYkosNCXzmgXaS398DgY+LnJDlZUASFdlcK
         esnw+5kK9pb8TFX4nJbwTqXFimEZFcai2iKZM6EwjU1XY0KrPfDaLWU5YYt8bHwJ7SJc
         9fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=LdNSrA/UwC8d9WVId873VHJD2GFt5pC4YthPYYq3GQo=;
        b=0qpqc8dOg6rqEk50Wej6R2ggKvgffrl9mqNO/fBFxQdTjbHrz4sHcQwsRC/jj0aJMx
         glDzoaMUOxpIpIwbu0zhRWklEDJ9853PSFMcC2mRaVQoX3RsDjfilKkeLRqOh0+Vd98X
         2GVMuR4hjU8RhQ7UpkQLR+TK2h3kfGc1fHUzl7tSkO7hLCKfW7iXdiqJsc2PezxihJUi
         B/Hz2pyhEqSq5/kpGucR2Iyfx2yfQk9dLkQ5NK4eiHWAo5yawtYxD3xC1m5iNdFb9zYf
         9v+PjwpSkzi4YO7wLfxFaZh42e3OCMII1/MzSNw/4LtwhrXDSB9BbC9r2D7XNopw6P8n
         Q23w==
X-Gm-Message-State: ACgBeo0fFqyBZU21V03ZAazL+gNEAZu5VBB7Z7RVOZX7lO2WBErTBAJz
	bpKb1U1MVHayMCZJU8aeC5ME0CVXp2Y4rv6sKVUXhw==
X-Google-Smtp-Source: AA6agR6JTk+rrrarN9oWlddYU//XLxmZdRA1AcOQG5vqKSMYEdCQYX4aivygkyln9plJJeXamStDdjzEnr8JDiE5LuE=
X-Received: by 2002:a0d:d496:0:b0:335:4877:7dc5 with SMTP id
 w144-20020a0dd496000000b0033548777dc5mr14393770ywd.405.1661058941587; Sat, 20
 Aug 2022 22:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220821013926.8968-1-tjytimi@163.com> <CAAhSdy1Qxwn=Eax6ECEkdRe=mQeL+J0TPCpOc1LMbN1y8-p4UQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1Qxwn=Eax6ECEkdRe=mQeL+J0TPCpOc1LMbN1y8-p4UQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 21 Aug 2022 10:45:30 +0530
Message-ID: <CAAhSdy0idoR87xnTG-F84xwMTTri+pLgrL_dTvqnsQDmkZXPmA@mail.gmail.com>
Subject: Re: [RFC PATCH v1] riscv: make update_mmu_cache to support asid
To: Jinyu Tang <tjytimi@163.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexandre.ghiti@canonical.com, guoren@kernel.org, akpm@linux-foundation.org, 
	heiko@sntech.de, panqinglin2020@iscas.ac.cn, unnanyong@huawei.com, 
	tongtiangen@huawei.com, anshuman.khandual@arm.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	falcon@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_221543_628706_307C1367 
X-CRM114-Status: GOOD (  22.93  )
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

On Sun, Aug 21, 2022 at 10:35 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, Aug 21, 2022 at 7:09 AM Jinyu Tang <tjytimi@163.com> wrote:
> >
> > The `update_mmu_cache` function in riscv flush tlb cache without asid
> > information now, which will flush tlbs in other tasks' address space
> > even if processor support asid. So add a new function
> > `flush_tlb_local_one_page` to flush local one page whether processor
> > supports asid or not. If asid is supported, this function will use it.
> >
> > Signed-off-by: Jinyu Tang <tjytimi@163.com>
>
> This is already covered by PATCH6 of the IPI improvement series.
> https://www.spinics.net/lists/kernel/msg4481428.html

My bad. This patch does not overlap with PATCH6 of the
IPI improvement series but does conflict with that series.

Maybe you can rebase this patch upon the IPI improvement
series ?

Regards,
Anup

>
> Regards,
> Anup
>
> > ---
> >  arch/riscv/include/asm/pgtable.h  |  2 +-
> >  arch/riscv/include/asm/tlbflush.h |  2 ++
> >  arch/riscv/mm/tlbflush.c          | 11 +++++++++++
> >  3 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 7ec936910a96..09ccefa6b6c7 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
> >          * Relying on flush_tlb_fix_spurious_fault would suffice, but
> >          * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
> >          */
> > -       local_flush_tlb_page(address);
> > +       flush_tlb_local_one_page(vma, address);
> >  }
> >
> >  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
> > diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> > index 801019381dea..120aeb1c6ecf 100644
> > --- a/arch/riscv/include/asm/tlbflush.h
> > +++ b/arch/riscv/include/asm/tlbflush.h
> > @@ -30,6 +30,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
> >  #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
> >  void flush_tlb_all(void);
> >  void flush_tlb_mm(struct mm_struct *mm);
> > +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr);
> >  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
> >  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> >                      unsigned long end);
> > @@ -42,6 +43,7 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
> >
> >  #define flush_tlb_all() local_flush_tlb_all()
> >  #define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
> > +#define flush_tlb_local_one_page(vma, addr) local_flush_tlb_page(addr)
> >
> >  static inline void flush_tlb_range(struct vm_area_struct *vma,
> >                 unsigned long start, unsigned long end)
> > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> > index 37ed760d007c..a2634ce55626 100644
> > --- a/arch/riscv/mm/tlbflush.c
> > +++ b/arch/riscv/mm/tlbflush.c
> > @@ -64,6 +64,17 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
> >         put_cpu();
> >  }
> >
> > +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr)
> > +{
> > +       if (static_branch_unlikely(&use_asid_allocator)) {
> > +               unsigned long asid = atomic_long_read(&vma->vm_mm->context.id);
> > +
> > +               local_flush_tlb_page_asid(addr, asid);
> > +       } else {
> > +               local_flush_tlb_page(addr);
> > +       }
> > +}
> > +
> >  void flush_tlb_mm(struct mm_struct *mm)
> >  {
> >         __sbi_tlb_flush_range(mm, 0, -1, PAGE_SIZE);
> > --
> > 2.30.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
