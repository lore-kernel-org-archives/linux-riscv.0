Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2DFC38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9FjWJ38Ejo92BiwVXdgNd3XsVXYd4lvIEQ4iASLsuM=; b=ma5wOz/eEzxN5e
	M/Jx0ZUwqjUm2a7UkFrHV2ovCPYrV9WNqAg3pWGEAX3KjPbF2I2f8OMfSsLjLDiMLHFajxD9M3tim
	W1MWJDY5OOlGSBv+yQKPDUP/VnPJlPjGCkYb2jPvnKSDkioWmAB8FNCc8pf/hoKEuswG4uKYTzw1w
	0pS+DQdqJ2bwAdH5eskstdBJ/cyxyV8R7KYREkoiUcIpP675MsM6LsbUUmjAsCgZuQCO3tCqVjfWi
	X8UJp9YUssbn8DhjR4rRyXclShd5Y0Ojl1RL9FMrsWXq8pgYeknTpb8d1GXVsb2pSowRK+0PQFyS0
	oWQZG6OoRfhKOyRc85Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJv0b-00GyGm-Ts; Mon, 23 Jan 2023 11:29:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJv0Y-00GyEA-97
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 11:29:03 +0000
Received: by mail-ej1-x631.google.com with SMTP id az20so29655649ejc.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 03:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7BRPVAgytXaXdSv+u5YyZxWP4l0mg5orHBmrI9mWeg=;
        b=0wDnlGH3rvVCwUJWtYmtEn2Eg9MLFBRrOs5reZ04bpBHLIZzqBIxzlx7xKTL7xoIsZ
         T1hpFIO2WqgcgaUDCMxWnmtf35fafrq/4wkMx7WN55ze/ZXc/qY0y5XyDM3CHBNwkIrT
         KQ3L8ZqRP6jM/5BPJ1pxq1nmfOmpfNcaypx/JQODpAk0iHV6YcK6X9eY8iOpsynOaHX6
         X50PeTCEl5D4SxM/iNXh1DopkOkG1OawQ306U3iPgKEjO8A7FmsounBgaMkQCXCVIeN8
         6W4Fet7EqWYQbqkk0QuY+6r1Qp3gfcdnOkZ/VFjG+MhNTR9FbdFBFWGY6aaQwXeUnjjw
         78MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7BRPVAgytXaXdSv+u5YyZxWP4l0mg5orHBmrI9mWeg=;
        b=rPukGjTtcIOEmfenr+ZD07QFn4RECSnRwHex8hEgYht8rM8QC3SktjJWuhYSZFGtSb
         /OY5A2lgsr6Hy9IY1QckNXLItbI5Cxu7Oq84hjkD0pB9d44XF7bniIaozmcYJyMP72b/
         +jzLNbd6zA5Kbs/tUFD6/A6m1w8aX5CgBdi7T85zaAku7VOupaQ19BIj6RZ99jLT4LFU
         uFAOK6JR10YakigYFRWwdZ9DsV0YhlGBrxDWbG4daBhM93RWN7ETU2HTfjT6vdCZlHsS
         LjbT4lX0JaRPignxKJJWDsE/1v+Skw7tfJ50xBu7E6CTcfv/ydQZRhITETbz2sMEfqVf
         e6tw==
X-Gm-Message-State: AFqh2koPAmcDum8xNudM/kT8r9gArkZjQaUW1HYxNtbQW20ALI1Dj6H0
	opdddZHBwEhbK4whgLmQb5j0rFbGNiG8jAcd54xPsw==
X-Google-Smtp-Source: AMrXdXtqcNCysMqdMD4mx3Jj+yyU8K/MY3RB0Fli4xwB+fqEtTmBASo6IjedZ6OY+kR4N+23YmywkUCjtwVoDJ4UXik=
X-Received: by 2002:a17:906:d190:b0:84d:4b8d:5652 with SMTP id
 c16-20020a170906d19000b0084d4b8d5652mr2635037ejz.16.1674473337819; Mon, 23
 Jan 2023 03:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20230123092928.808014-1-alexghiti@rivosinc.com> <bdabafb1-53f3-403c-ab9c-1c2d00421690@ghiti.fr>
In-Reply-To: <bdabafb1-53f3-403c-ab9c-1c2d00421690@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Jan 2023 16:58:46 +0530
Message-ID: <CAAhSdy1grLz2EXEJUicGFZO7md7F=Hbnhv7ZqBFFx-vtnkpmmA@mail.gmail.com>
Subject: Re: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_032902_357834_E08DD44B 
X-CRM114-Status: GOOD (  16.93  )
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

On Mon, Jan 23, 2023 at 3:01 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> @Anup: Sorry, forgot to add -fixes to the patch title, as I think this
> should go into your fixes branch for 6.2.

Can you provide the Fixes: line here ? I will include it at time of
adding this patch to my fixes branch.

Regards,
Anup

>
> On 1/23/23 10:29, Alexandre Ghiti wrote:
> > At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> > PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> > PGDIR_SIZE into PUD_SIZE.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >   arch/riscv/kvm/mmu.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
