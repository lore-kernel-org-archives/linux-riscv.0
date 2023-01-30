Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D52C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDcn4lOpgk0ix+c/UypGlbOe3kPaUdXo+1XntGd+LCA=; b=lWiOQN5FdJWA6w
	aBTjdao4zuO6Km8QZlYiQtZ6sj9ZSTTBBIhWg+IbRssCskvQmyIFYnQ0fRRGy+3vdBnHk05pWfYYe
	7Q71S8KSzXrYYa5OTJLIFRAaf3MSkay4T6wGYIzwaTXmgNScDUTYX7qRrVNtYWxTX87Av5HrRoxGI
	hYrrKMyWCbTOBMK27mMHGN/kaV9NbgXg59qFbyyuXQEO2kJPS3GKISnji9vwBvA9CgNtnHwpboHVt
	tUl3vKLnkA4ZgNGktF4q+yK89m8NJxTJ6+uF+tlefk33SnSuttjnjnqCPrWhz2GXhbh9+N7iRzgnx
	S3t/pLfP4X2rIsRwfOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOby-002YO3-Lg; Mon, 30 Jan 2023 07:29:54 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMObw-002YNF-3r
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 07:29:53 +0000
Received: by mail-pg1-x531.google.com with SMTP id d10so6969020pgm.13
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 23:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YWwE9jeS0XA+vIxkZ5tchjD2PTNBCH3jhKsfjA7l1cc=;
        b=ounVwmjnwqkjjqxLeT9rfCPScvjuD6Tnuf35nbRc2b8EQ7e0oKATFvznRfNzzFj1YO
         iQMQgEhfAkc9FNObW+5xvo/gMIwPokB2I8yW4wzeaxNI6vUm+w/DFjldorD+fKY2rjxV
         eTadCHYacSI/BO1NHJ+MZq72PQWSifG2oRKvVGSj8hwrD451z/hezMyRSpJw/TWHNbVq
         wyhqgmknYwT385Crr1CTyUV0lMjdPP0cBOJwWqjLew1r+SXt2x8vRwrVZbTz3K3/XUj/
         GERzubB0VRfTeZENjSkILWAce14w3015AvxvPTU3iV3qhIQXQ7N3jhhDgyB9dlVyaDHh
         9+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWwE9jeS0XA+vIxkZ5tchjD2PTNBCH3jhKsfjA7l1cc=;
        b=i/FC2gIV5GZx9TkMH/eyczwnwkojAkuIUFYXKDM3M8yBrCsm74NYm/VF79nwff1gwV
         WlhSrrzVNhpfdPyDEqtGNDrcYp4Za4D16DQZYsgqC2ac9Z0bnhbHm0uroggcLt/rb7me
         JWUJUQyWZ5wqdCE59cuRhyJHPBjBq8aSSrx9XSLfQAM8UFtiZmNnE/mRA1f2H5Mq02JU
         l2S8UVDAjVeNKtHcowQ7PB3Umb2rF5sO0s10Nq0+dv/HdXw7YwVDL7FuW5XmtsOy8Ly/
         sFnTCtnM5S7tn8H1acdkPv4Tvo6EppgERgGo/H9YlmORqlfymO0dsXJMHJYyDZ0VEhud
         5prw==
X-Gm-Message-State: AFqh2kqpMYkt4GJLb0sGnsaCXnC7pKR08gHHaiD5XEkJFSr1sksrh87h
	oaSdK9lEij9O6o6YTzt1fUicIQoCyxnup+vaoR4=
X-Google-Smtp-Source: AMrXdXvkMXx7WtP9Ahhf9DaMqIyAuDOaEGvQX7+jWRWuXizoV5ppfeoGzCnCrdB4Hq0Zsr79s1cUkw==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id y31-20020a056a00181f00b0058bd244b525mr68137577pfa.17.1675063788628;
        Sun, 29 Jan 2023 23:29:48 -0800 (PST)
Received: from [192.168.1.5] ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n38-20020a056a000d6600b0059072daa002sm6693412pfv.192.2023.01.29.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 23:29:48 -0800 (PST)
Message-ID: <80649c8a017f7e5cbb4b23d7625bbb4737bfe5db.camel@ventanamicro.com>
Subject: Re: [PATCH] riscv: mm: Implement pmdp_collapse_flush for THP
From: mchitale@ventanamicro.com
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Nanyong Sun <sunnanyong@huawei.com>, Anup Patel
 <apatel@ventanamicro.com>,  Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 30 Jan 2023 12:59:42 +0530
In-Reply-To: <117752cf-c02b-4264-87c3-42c81aa429f7@ghiti.fr>
References: <20230125125512.2494577-1-mchitale@ventanamicro.com>
	 <117752cf-c02b-4264-87c3-42c81aa429f7@ghiti.fr>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_232952_188233_AD281A91 
X-CRM114-Status: GOOD (  33.48  )
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

On Thu, 2023-01-26 at 16:33 +0100, Alexandre Ghiti wrote:
> Hi Mayuresh,
> 
> On 1/25/23 13:55, Mayuresh Chitale wrote:
> > When THP is enabled, 4K pages are collapsed into a single huge
> > page using the generic pmdp_collapse_flush() which will further
> > use flush_tlb_range() to shoot-down stale TLB entries.
> > Unfortunately,
> > the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> > using address specific SFENCEs which results in repetitive (or
> > unpredictable) page faults on RISC-V implementations which cache
> > non-leaf PTEs.
> 
> That's interesting! I'm wondering if the same issue will happen if a 
> user maps 4K, unmaps it and at the same address maps a 2MB hugepage:
> I'm 
> not sure the mm code would correctly flush the non-leaf PTE when 
> unmapping the 4KB page. In that case, your patch only fixes the THP 
> usecase and maybe we should try to catch this non-leaf -> leaf
> upgrade 
> at some lower level page table functions, what do you think?

I will look into it but I dont know how to reproduce the issue without
the THP use case. It would be great if you could share the test case or
test code to reproduce it.

> 
> Alex
> 
> 
> > Provide a RISC-V specific pmdp_collapse_flush() which ensures both
> > cached leaf and non-leaf PTEs are invalidated by using non-address
> > specific SFENCEs as recommended by the RISC-V privileged
> > specification.
> > 
> > Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   arch/riscv/include/asm/pgtable.h | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/pgtable.h
> > b/arch/riscv/include/asm/pgtable.h
> > index 4eba9a98d0e3..6d948dec6020 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -721,6 +721,30 @@ static inline pmd_t pmdp_establish(struct
> > vm_area_struct *vma,
> >   	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
> >   	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp,
> > pmd_val(pmd)));
> >   }
> > +
> > +#define pmdp_collapse_flush pmdp_collapse_flush
> > +static inline pmd_t pmdp_collapse_flush(struct vm_area_struct
> > *vma,
> > +					unsigned long address, pmd_t
> > *pmdp)
> > +{
> > +	pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
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
> >   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >   
> >   /*
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
