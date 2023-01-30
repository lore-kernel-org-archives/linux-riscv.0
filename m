Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2C9C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLDFX2rj7v/oUv5QqsbcxhjF3UeWb1yi0OJZKUpUDTg=; b=AIAVXEYED/5s4r
	gI0K86GR13QKT39gKhtB5VoYDq2bkMwjEZbOlqXW0asXSS024Kq2WS9Bpf5l24gE/GYCdIuFiV0pZ
	J7IhB9xz09Xa66dkg6yYdBiqSptbrna/2fQHSmT40Zop871WEo3SALc2p2B8XojKYv4V+9ra168NY
	am/7SQvnvmeMeuOerlO2rS9Ddr12Nm0uGK5UTPdlnWVqWKZfpDFq9eiifTe80kVoq6oVw6ZNFBC4m
	R5tcbnwjDZeDzYVwqQkrYsx4Fx+WMBIZQSl2MsnsqITPM+RJuzB7+guUvJPBpKs+7+hAyO4bxJZVP
	kNnHB+nvef8y8wY/LAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOYW-002XWx-1o; Mon, 30 Jan 2023 07:26:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOYT-002XWP-0e
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 07:26:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id jm10so10633372plb.13
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 23:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6qOw62Kq+kSpyDO75vhgQOUbMVbeeLWsHBNPK1QAqWI=;
        b=iwKOvnjMJidxi41sf/cMLokwkwYmtqoom3F6YmPzndNVqw8EFfD4RGvCEBBUsLuEhM
         ikyLFuYhGCgynNVS1P8qYl5t8ZuY5DtIb6N/VeFPXgErIlLQ1qf+e3Qf+2hunDR3pAh5
         sQHmJxogdIfTN1hOpSpX6AX/3QscS8KV/TzmpNzPr1+7nrHsntTA3dF8WyCFvKCR8YyA
         4SqaZ5Ka/gyjKAvmdoc0qBiPbm9taZ7JtKUeJj0qXDasvlJvEKsk3Cr9HkW3gFCKZLXJ
         ZLXunqevE/u5AHUfkQ6+Mc5nD0Ztmx6jIiMW+deci2eCOv/z2/oLcHEU9KSm0rPdtYUt
         Ssng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6qOw62Kq+kSpyDO75vhgQOUbMVbeeLWsHBNPK1QAqWI=;
        b=MUNpCUOmckigtztOLlHJZW22U7I87b8QynJwUdR5A64I8QsZ/9mM81Ob8r/sGFHWGE
         A9IJ70CJGh1h3F8ZLA0ZoHfXvEfMIOv43ygruwv6YMh6IkL8gxoWc2YildcphnSsBQaJ
         v+iVEyEHJxCGKWQxcjtVzDP33HXkB/i2VMFaYi7XMskSWkwOHr93c+G6FYIhsx81N2me
         M035qkW6tWyVPA9pe+0yb7kTy5wTswgDuAOicKVZW5dlbJZz5fWVXFoblKQh0Waoga2w
         N5BwgpV+4Aq7tGCqbveobqMniHFPqKhvqjXSgvopc+IyS0VhRxiJcFXrZJiun+DTwR5/
         6RJQ==
X-Gm-Message-State: AO0yUKXSCyl3qUojCUNvizx5pjSg1ODxlHQvxqFL+/CSrjk7zGQRVD4M
	yVIPqgbg32gBJLsvwn0KHL+9gA==
X-Google-Smtp-Source: AK7set/kGef4Ypx4OJvmJEDm6b5yRX3a9H0n9bSq2x6Jjix6iqOhUkALI1V5e4wfZwwUTOchsSDXCA==
X-Received: by 2002:a17:902:d4cb:b0:196:6b41:cf33 with SMTP id o11-20020a170902d4cb00b001966b41cf33mr8675592plg.34.1675063573140;
        Sun, 29 Jan 2023 23:26:13 -0800 (PST)
Received: from [192.168.1.5] ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902db0300b001897e2fd65dsm7054625plx.9.2023.01.29.23.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 23:26:12 -0800 (PST)
Message-ID: <3e70e7e4c75e9bdaf6fdea2584bf32edb1c1d44a.camel@ventanamicro.com>
Subject: Re: [PATCH] riscv: mm: Implement pmdp_collapse_flush for THP
From: mchitale@ventanamicro.com
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, Nanyong Sun <sunnanyong@huawei.com>, Anup
 Patel <apatel@ventanamicro.com>
Date: Mon, 30 Jan 2023 12:56:06 +0530
In-Reply-To: <20230125153544.lgukbnh2qkntph4l@orel>
References: <20230125125512.2494577-1-mchitale@ventanamicro.com>
	 <20230125153544.lgukbnh2qkntph4l@orel>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_232617_111272_85A7BBBD 
X-CRM114-Status: GOOD (  29.33  )
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

On Wed, 2023-01-25 at 16:35 +0100, Andrew Jones wrote:
> On Wed, Jan 25, 2023 at 06:25:11PM +0530, Mayuresh Chitale wrote:
> > When THP is enabled, 4K pages are collapsed into a single huge
> > page using the generic pmdp_collapse_flush() which will further
> > use flush_tlb_range() to shoot-down stale TLB entries.
> > Unfortunately,
> > the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> > using address specific SFENCEs which results in repetitive (or
> > unpredictable) page faults on RISC-V implementations which cache
> > non-leaf PTEs.
> > 
> > Provide a RISC-V specific pmdp_collapse_flush() which ensures both
> > cached leaf and non-leaf PTEs are invalidated by using non-address
> > specific SFENCEs as recommended by the RISC-V privileged
> > specification.
> > 
> > Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/pgtable.h
> > b/arch/riscv/include/asm/pgtable.h
> > index 4eba9a98d0e3..6d948dec6020 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -721,6 +721,30 @@ static inline pmd_t pmdp_establish(struct
> > vm_area_struct *vma,
> >  	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
> >  	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp,
> > pmd_val(pmd)));
> >  }
> > +
> > +#define pmdp_collapse_flush pmdp_collapse_flush
> > +static inline pmd_t pmdp_collapse_flush(struct vm_area_struct
> > *vma,
> > +					unsigned long address, pmd_t
> > *pmdp)
> > +{
> > +	pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
> 
> The generic version of this function has a couple sanity checks for
> kernels compiled with CONFIG_DEBUG_VM. Shouldn't we duplicate those?

Ok. I will add those checks too.
> 
> Thanks,
> drew
> 
> > +
> > +	/*
> > +	 * When leaf PTE enteries (regular pages) are collapsed into a
> > leaf
> > +	 * PMD entry (huge page), a valid non-leaf PTE is converted
> > into a
> > +	 * valid leaf PTE at the level 1 page table. The RISC-V
> > privileged v1.12
> > +	 * specification allows implementations to cache valid non-leaf 
> > PTEs,
> > +	 * but the section "4.2.1 Supervisor Memory-Management Fence
> > +	 * Instruction" recommends the following:
> > +	 * "If software modifies a non-leaf PTE, it should execute
> > SFENCE.VMA
> > +	 * with rs1=x0. If any PTE along the traversal path had its G
> > bit set,
> > +	 * rs2 must be x0; otherwise, rs2 should be set to the ASID for
> > which
> > +	 * the translation is being modified."
> > +	 * Based on the above recommendation, we should do full flush
> > whenever
> > +	 * leaf PTE entries are collapsed into a leaf PMD entry.
> > +	 */
> > +	flush_tlb_mm(vma->vm_mm);
> > +	return pmd;
> > +}
> >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >  
> >  /*
> > -- 
> > 2.34.1
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
