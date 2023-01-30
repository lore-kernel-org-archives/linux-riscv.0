Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B65C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4KXEYB/b7/vnsZwG9jEMLgQ3yY62ShQkpEokEqXGR8=; b=bujLtAYqti62lG
	mdwJYbB6mdhO4cB//3AcVT3H3OJatcwFI+SXIGhv1HQMk4xEcA7jLZr8EXwS0zW52gYu2bJ5KPFiX
	4a4oWBYklEJJk4l3ZMagEQeDR7VOkPX7s6GJoP+r7QWDtdnKaG/IvPkCRAKFoMsfRvuS2HJVGZgbG
	7jEJMAeI2oX1/yRhVsAEWJpYvVpVshdnwJxoIOfxYO4E2rStx2WwkHtq3lj6CRltSXJ+RvjqoAy7U
	dAyCDkX4WCNFauyH7vyytVNH+6G8vIl97tEpQlobFD3/+GYauQYmcgpfSG8GhujyT7xhpokj9ttM9
	9j9iI5fAfpWfkANc/XIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOgw-002YrT-4a; Mon, 30 Jan 2023 07:35:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOgs-002Ypz-Rm
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 07:35:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id z31so7065548pfw.4
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 23:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PSFcznM8oLXcGYnw2YgXjqOWIUhHG7VfbaX2iG2FtTk=;
        b=NG4BBwI+uJML4sRHYI0jVWbAGEVf0L0Dz6z7HDRDUM/7XQDWi3w2mYmmqum07ri99E
         pxOXkjGoEBoI3VgsawL69ztrqcH9bpXsQh4VsNZV15WwvI3UzVfbT3QmRqxiZ2BvgT8x
         t0HwRZ5eSQseybNyX9G6rAhvZP89XCWBgTppcxObTgsNkCBPCYjTm7D7wwM5AHskMKRd
         JrMXytsV5OZQgPr5HRIMwFvgLZdEwy9SAZ0OrdirqDPKPIK9w6gMn3772CvY2+0EwvCd
         r1n7KigtD2IVO5RDfQTckXhRkPjIYvRjtqcAY9T/Ns2URttKJ/Gu0d26ZkBsc0+VLVnB
         DUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSFcznM8oLXcGYnw2YgXjqOWIUhHG7VfbaX2iG2FtTk=;
        b=ejXLws3PhVqUvrW8fZHN/PctbBdtaAmqmCcJL+RBC+bc0q9ZlefRZOQ0zqo0RU4KZI
         au7lJkVYWse4AGhckO9VE86YXZ4o8MzCgO5iP1WNI1C4o0asj4GJd2AsEpUduwPw9ilk
         rmMRf1KtPWTWgrl6EvWGJj6MAiz3zICyNZ7L1+ZmTmYsVBXEp89qf5XqP/FmmiGjDwoD
         pgPmUDhFXyl+ugKAdvVbPIVrbk+Y7A4RaEe3l87TlfT1ajfWwcuhXmJCkOj1rZkA9TVz
         ztzrv9L5cuZ1s/VUeuJI8qV++4yAE4WJf7Hf0EIqHB0+3u1zXJJKCT9Rr8zdZ6pqvDGg
         5Szw==
X-Gm-Message-State: AFqh2kq+HDAYrv4SUXlI927Ux3Co1Ps+rTIWZcyiyTKPrs48ZqirGRIs
	OvOK5qSgxrQq+BgEnqjbvHBU/g==
X-Google-Smtp-Source: AMrXdXtfBy0+2epm4trq+BhDjqML2GFqSW6YcJtConQWcksTSniNBAPqaxlm0BcFytlbPVH8UXqk5Q==
X-Received: by 2002:aa7:91c1:0:b0:58a:fddd:9b1d with SMTP id z1-20020aa791c1000000b0058afddd9b1dmr43216433pfa.10.1675064096645;
        Sun, 29 Jan 2023 23:34:56 -0800 (PST)
Received: from [192.168.1.5] ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t63-20020a628142000000b00585cb0efebbsm6892731pfd.175.2023.01.29.23.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 23:34:56 -0800 (PST)
Message-ID: <8862f0ae4c742e4709e145b45ad2352e584e83e1.camel@ventanamicro.com>
Subject: Re: [PATCH] riscv: mm: Implement pmdp_collapse_flush for THP
From: mchitale@ventanamicro.com
To: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, Nanyong Sun <sunnanyong@huawei.com>,
 Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 30 Jan 2023 13:04:50 +0530
In-Reply-To: <cb2ddcc7-3be0-4ebb-9ed6-b13124466f89@ghiti.fr>
References: <20230125125512.2494577-1-mchitale@ventanamicro.com>
	 <117752cf-c02b-4264-87c3-42c81aa429f7@ghiti.fr>
	 <CAK9=C2Wc_S8zN8mK2aiYyUbu9XkJaeZyz60Af_S4Bed+_rPPfA@mail.gmail.com>
	 <cb2ddcc7-3be0-4ebb-9ed6-b13124466f89@ghiti.fr>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_233458_934526_C0B954D0 
X-CRM114-Status: GOOD (  40.44  )
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

On Fri, 2023-01-27 at 09:41 +0100, Alexandre Ghiti wrote:
> On 1/26/23 19:14, Anup Patel wrote:
> > On Thu, Jan 26, 2023 at 9:03 PM Alexandre Ghiti <alex@ghiti.fr>
> > wrote:
> > > Hi Mayuresh,
> > > 
> > > On 1/25/23 13:55, Mayuresh Chitale wrote:
> > > > When THP is enabled, 4K pages are collapsed into a single huge
> > > > page using the generic pmdp_collapse_flush() which will further
> > > > use flush_tlb_range() to shoot-down stale TLB entries.
> > > > Unfortunately,
> > > > the generic pmdp_collapse_flush() only invalidates cached leaf
> > > > PTEs
> > > > using address specific SFENCEs which results in repetitive (or
> > > > unpredictable) page faults on RISC-V implementations which
> > > > cache
> > > > non-leaf PTEs.
> > > 
> > > That's interesting! I'm wondering if the same issue will happen
> > > if a
> > > user maps 4K, unmaps it and at the same address maps a 2MB
> > > hugepage: I'm
> > > not sure the mm code would correctly flush the non-leaf PTE when
> > > unmapping the 4KB page. In that case, your patch only fixes the
> > > THP
> > > usecase and maybe we should try to catch this non-leaf -> leaf
> > > upgrade
> > > at some lower level page table functions, what do you think?
> > This issue can happen whenever existing/valid non-leaf PTE is
> > modified.
> > 
> > We hit this issue in the THP case but we can also hit this issue in
> > other
> > scenarios where the page table programming pattern is similar.
> 
> Then what about trying to get all those cases at once? We can easily 
> catch those spurious page faults as the pte would be valid: we would 
> just have to flush_tlb_mm at the first page fault, if any.

IMO, we can consider fixing those cases in a separate patch.
> 
> 
> > Regards,
> > Anup
> > 
> > > Alex
> > > 
> > > 
> > > > Provide a RISC-V specific pmdp_collapse_flush() which ensures
> > > > both
> > > > cached leaf and non-leaf PTEs are invalidated by using non-
> > > > address
> > > > specific SFENCEs as recommended by the RISC-V privileged
> > > > specification.
> > > > 
> > > > Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> > > > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > > > ---
> > > >    arch/riscv/include/asm/pgtable.h | 24
> > > > ++++++++++++++++++++++++
> > > >    1 file changed, 24 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/pgtable.h
> > > > b/arch/riscv/include/asm/pgtable.h
> > > > index 4eba9a98d0e3..6d948dec6020 100644
> > > > --- a/arch/riscv/include/asm/pgtable.h
> > > > +++ b/arch/riscv/include/asm/pgtable.h
> > > > @@ -721,6 +721,30 @@ static inline pmd_t pmdp_establish(struct
> > > > vm_area_struct *vma,
> > > >        page_table_check_pmd_set(vma->vm_mm, address, pmdp,
> > > > pmd);
> > > >        return __pmd(atomic_long_xchg((atomic_long_t *)pmdp,
> > > > pmd_val(pmd)));
> > > >    }
> > > > +
> > > > +#define pmdp_collapse_flush pmdp_collapse_flush
> > > > +static inline pmd_t pmdp_collapse_flush(struct vm_area_struct
> > > > *vma,
> > > > +                                     unsigned long address,
> > > > pmd_t *pmdp)
> > > > +{
> > > > +     pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address,
> > > > pmdp);
> > > > +
> > > > +     /*
> > > > +      * When leaf PTE enteries (regular pages) are collapsed
> > > > into a leaf
> > > > +      * PMD entry (huge page), a valid non-leaf PTE is
> > > > converted into a
> > > > +      * valid leaf PTE at the level 1 page table. The RISC-V
> > > > privileged v1.12
> > > > +      * specification allows implementations to cache valid
> > > > non-leaf PTEs,
> > > > +      * but the section "4.2.1 Supervisor Memory-Management
> > > > Fence
> > > > +      * Instruction" recommends the following:
> > > > +      * "If software modifies a non-leaf PTE, it should
> > > > execute SFENCE.VMA
> > > > +      * with rs1=x0. If any PTE along the traversal path had
> > > > its G bit set,
> > > > +      * rs2 must be x0; otherwise, rs2 should be set to the
> > > > ASID for which
> > > > +      * the translation is being modified."
> > > > +      * Based on the above recommendation, we should do full
> > > > flush whenever
> > > > +      * leaf PTE entries are collapsed into a leaf PMD entry.
> > > > +      */
> > > > +     flush_tlb_mm(vma->vm_mm);
> > > > +     return pmd;
> > > > +}
> > > >    #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > > > 
> > > >    /*
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
