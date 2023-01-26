Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5ADC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 18:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6krDc98EJJ5dpEF/AbzsnRCGb1h2m+4Qm2NZmmZJeU=; b=w1bOAIoqSlx357
	XqC+FM3OSwCKDiuuaNGlyCKj7EGLHxbGC8Uxg2h+KLOqQoQ+i0eyO3sZ8b7feZXJEBar6lwtUfIEe
	4u2OsjpJXbYmkqNKNmi3PsF7SDbS0jSYz3zrPsZ21bIPN6zB+aaact5hwxqa8g7BmgP2h73f7y69M
	EGmJBHYvMadf/g1481VziOijFgqOxdXbGXso8/u5akzd0kFUH7ewK5qIRR9I4bKgjfU4+KBsUJmTl
	aoCFTkGWTNsg/IkQzwqKY6oMZ7fOtnVE25eBcYL10RgZKxvjQMnNlvnyqNrFlgYTj9FnZMY3dJBI7
	2rxMNO8/CbYLSywh07yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL6lo-00C7n3-Hj; Thu, 26 Jan 2023 18:14:44 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL6ll-00C7mf-N4
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:14:43 +0000
Received: by mail-vs1-xe29.google.com with SMTP id 3so2785157vsq.7
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xzzxd0r3f3wuDt5Pi6fh27aN9prMaFPZduo2z0Q6ZE0=;
        b=hAM3UvAi1FWrXN5RKglSmy9cfnJY8XOn9F+ENdQJyZj6b0ETdzb9Vp7S6FRDfuwZ1P
         PRzLG0gXW6rS9bvkZDF0m0Gy77hoM7g8u5VRlYJ7Kxk9s7kj7sLvF1CmEYUrV6qrnZ/3
         oxO3vou1P+lXT5onQNAfjOlyPszzEmkHQu0F0/I8omO8Y28MCuB8SWFFLXT3+HeWsOLT
         3w0ZbFPaU1qgeaCGHTlqRZECgJ/21avfJ7qMQlRW1QPiKmEsseEzq4xU4As89CV2usPi
         GN3cchSgo/XMcAHcvPUZTyPZyRAAhnXUeH3caNRgLdzCq6o9lhsdE/HEs1IdCzRYCHlI
         IchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzzxd0r3f3wuDt5Pi6fh27aN9prMaFPZduo2z0Q6ZE0=;
        b=KfCUzzlokzYiaC/JZQtauWIM1RWM/10Ou0pgANSgnh5llhidyrfE31mt3miaJXEwPy
         SgpxAITL4SZZYlFYd2qRKouj05yKjSbIiM7wjXjj0KZMblJZIq9kTMu+yx9R70AXbD6j
         xbqqOqOsD8FPD+IRBWtEh1RpGqqZsmQKZkryP8scMXjVYp0i3iS3CPoFQStMqmUuvnEE
         T8Vl/69/tsH07FzlHfKKGQBvKj+hcg9d/aJGG/KZJK8eqYxfl7hnDlAdeVii8sDDZX+U
         8OYVKX1ehYOwCemnbcP2SEDB97MdlJES5atdTicUtgB8IiD+Vq0rEiwcvEnF70JmSmRr
         yYsg==
X-Gm-Message-State: AFqh2kqSiPRfZmdGAXiTv575S0gObgG/9aCDAEXA1DrIiQziB6iRtLEq
	RZR7eUz+O0lAg+8MCPdEUTLQEToMcXSN2nwkJiBQ8V+kfTS3ca0q
X-Google-Smtp-Source: AMrXdXu1cCHfHHioOkO8UYPNeDDQBhMqONpkFlGpxRH1hVaeB6FNF8q4s5Hvu8bP6zSbt9EwyFixnwi1QL29eBD9+BY=
X-Received: by 2002:a05:6102:c16:b0:3d3:e027:877a with SMTP id
 x22-20020a0561020c1600b003d3e027877amr5029377vss.0.1674756879948; Thu, 26 Jan
 2023 10:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20230125125512.2494577-1-mchitale@ventanamicro.com> <117752cf-c02b-4264-87c3-42c81aa429f7@ghiti.fr>
In-Reply-To: <117752cf-c02b-4264-87c3-42c81aa429f7@ghiti.fr>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 26 Jan 2023 23:44:26 +0530
Message-ID: <CAK9=C2Wc_S8zN8mK2aiYyUbu9XkJaeZyz60Af_S4Bed+_rPPfA@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Implement pmdp_collapse_flush for THP
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Nanyong Sun <sunnanyong@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_101441_771680_720B09D0 
X-CRM114-Status: GOOD (  29.01  )
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

On Thu, Jan 26, 2023 at 9:03 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Mayuresh,
>
> On 1/25/23 13:55, Mayuresh Chitale wrote:
> > When THP is enabled, 4K pages are collapsed into a single huge
> > page using the generic pmdp_collapse_flush() which will further
> > use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
> > the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> > using address specific SFENCEs which results in repetitive (or
> > unpredictable) page faults on RISC-V implementations which cache
> > non-leaf PTEs.
>
>
> That's interesting! I'm wondering if the same issue will happen if a
> user maps 4K, unmaps it and at the same address maps a 2MB hugepage: I'm
> not sure the mm code would correctly flush the non-leaf PTE when
> unmapping the 4KB page. In that case, your patch only fixes the THP
> usecase and maybe we should try to catch this non-leaf -> leaf upgrade
> at some lower level page table functions, what do you think?

This issue can happen whenever existing/valid non-leaf PTE is modified.

We hit this issue in the THP case but we can also hit this issue in other
scenarios where the page table programming pattern is similar.

Regards,
Anup

>
> Alex
>
>
> > Provide a RISC-V specific pmdp_collapse_flush() which ensures both
> > cached leaf and non-leaf PTEs are invalidated by using non-address
> > specific SFENCEs as recommended by the RISC-V privileged specification.
> >
> > Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   arch/riscv/include/asm/pgtable.h | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 4eba9a98d0e3..6d948dec6020 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -721,6 +721,30 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> >       page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
> >       return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
> >   }
> > +
> > +#define pmdp_collapse_flush pmdp_collapse_flush
> > +static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> > +                                     unsigned long address, pmd_t *pmdp)
> > +{
> > +     pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
> > +
> > +     /*
> > +      * When leaf PTE enteries (regular pages) are collapsed into a leaf
> > +      * PMD entry (huge page), a valid non-leaf PTE is converted into a
> > +      * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
> > +      * specification allows implementations to cache valid non-leaf PTEs,
> > +      * but the section "4.2.1 Supervisor Memory-Management Fence
> > +      * Instruction" recommends the following:
> > +      * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
> > +      * with rs1=x0. If any PTE along the traversal path had its G bit set,
> > +      * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
> > +      * the translation is being modified."
> > +      * Based on the above recommendation, we should do full flush whenever
> > +      * leaf PTE entries are collapsed into a leaf PMD entry.
> > +      */
> > +     flush_tlb_mm(vma->vm_mm);
> > +     return pmd;
> > +}
> >   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> >   /*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
