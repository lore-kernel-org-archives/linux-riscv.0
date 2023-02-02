Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956A9C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 04:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=T6fJaDsEd8xMsNteCfk9NEBPA+pgCBygSjNcQo8/qEA=; b=fJqi8AZmed+QQ5BXY/cV0S+Uwr
	53RwO8wYrINrP4WoQDdeThS7u9Vkft4eZwOh4MXVUBNFJ9zZeATOW/5MHCbemya9aIsDfulRHBOQp
	Iiko+6kMT0y7UbM0Cn2NDZeOnHxcS8hK0U+H8ncfS2liUGz3mIL8V+yuHWCTNsSJjCN1LUfy9MDZw
	9GaCN2MH/DxLekxFsCQTcKQo4bbRYvsjY2Y73YR2TPV3h0huIFUO8uFy35bglDGCd8vRPu2ltu7oA
	orMC0+40sLOc1bJSSw6H/pRMYgZEz+YkQ7heh42QFlJ1VW2X2szgNu66RppC+FOYfgIiSHdoER4ed
	2JR1DArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNRKT-00ELw8-Mx; Thu, 02 Feb 2023 04:36:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNRKN-00ELua-OZ
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 04:36:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id ha3-20020a17090af3c300b00230222051a6so683672pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 20:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lsWs8xu6y8TOJFrVJh4wVkkeM62yHYVb9CAywk8XV0=;
        b=KmCoImL1AE7VPkuauDT2XfqzKBsSi4iJIVhZE3hsIU80Huw90OHCu15uQNzAL0+fz2
         hvzLONADJGKMve34B+hL9hVPiffZZXkd5ZN6dKpkpFpi3rquziK6yUttOxh+u2W3H5Nq
         GPJuK29cWD4hQThkE7JUwhh4Lu0Q86Xji2Ww7Jh8mdKnvTW8fxr20cNs+EAUqHGAq/DY
         EvYRls/XI0GbQfizHAecuwrNGgun+0dNgGN/JhMjv1eb9VyT3w11tZWrPxKKhVZoPR8b
         QP9AdwXk8+mdTZul6vLKzI5i4KbqDtnR6dkHpoIWrSbSkYh5+gJxgUmRxAUbf8RwssIX
         c9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lsWs8xu6y8TOJFrVJh4wVkkeM62yHYVb9CAywk8XV0=;
        b=y/s6rzWuU711pbYKi3tcFgIsqvfoPFKFm5nmzqlBspYf02Gd3vsVRj0jr2lw4mmAfH
         Hr6XIkeDlUifLOzGCnJbBaAoTGaF/skBbjgffhS3ryllSNy2yoFNZO60LopqaNmZV05c
         E6JKB1b+ZHTuPqwCcT6ThnouZb1A188oDz/Xm13v2cqTXsNqlvMODgW82twBwo2ZYVuL
         WnmgKzXBkEnEZlDRo/2yAsYn9tiSFKG11aJugOrPyVhsVwHxKWxfRxhXcgcSKllUq0jS
         imAcIdJt/wIMdHNIcjt8gexuTClTuVW1lgdSh2FZWxlJSK+lJmaVjAl338b/M+logOkI
         uisA==
X-Gm-Message-State: AO0yUKVtBZeFpzB8rZFJhG9rl7ayfDkrvUH/2iqo+v+ALHAw/eb3x8S+
	37VHi35NP23U2k2XTUcVwCgTQg==
X-Google-Smtp-Source: AK7set8z3cVaqSiIAbwcSM7hvUIFWappdzO/Z1BHv877MGrLZjFN+K8p1w9dkaSuEwpdlNPHttcgoA==
X-Received: by 2002:a05:6a20:d68e:b0:bf:65dd:94fd with SMTP id it14-20020a056a20d68e00b000bf65dd94fdmr3103945pzb.59.1675312556722;
        Wed, 01 Feb 2023 20:35:56 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id s134-20020a632c8c000000b004d346876d37sm11473708pgs.45.2023.02.01.20.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 20:35:55 -0800 (PST)
Date: Wed, 01 Feb 2023 20:35:55 -0800 (PST)
X-Google-Original-Date: Wed, 01 Feb 2023 20:35:24 PST (-0800)
Subject: Re: [PATCH v2] riscv: mm: Implement pmdp_collapse_flush for THP
In-Reply-To: <20230130074815.1694055-1-mchitale@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, mchitale@ventanamicro.com, sunnanyong@huawei.com, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com, apatel@ventanamicro.com
Message-ID: <mhng-9764af90-4c82-4d80-9aed-a3234e8b889f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_203603_843709_3E0D1B42 
X-CRM114-Status: GOOD (  30.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 29 Jan 2023 23:48:15 PST (-0800), mchitale@ventanamicro.com wrote:
> When THP is enabled, 4K pages are collapsed into a single huge
> page using the generic pmdp_collapse_flush() which will further
> use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
> the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> using address specific SFENCEs which results in repetitive (or
> unpredictable) page faults on RISC-V implementations which cache
> non-leaf PTEs.
>
> Provide a RISC-V specific pmdp_collapse_flush() which ensures both
> cached leaf and non-leaf PTEs are invalidated by using non-address
> specific SFENCEs as recommended by the RISC-V privileged specification.
>
> Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/pgtable.h |  4 ++++
>  arch/riscv/mm/pgtable.c          | 26 ++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4eba9a98d0e3..3e01f4f3ab08 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -721,6 +721,10 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>  	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
>  }
> +
> +#define pmdp_collapse_flush pmdp_collapse_flush
> +extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> +				 unsigned long address, pmd_t *pmdp);
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>
>  /*
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> index 6645ead1a7c1..5da1916c231e 100644
> --- a/arch/riscv/mm/pgtable.c
> +++ b/arch/riscv/mm/pgtable.c
> @@ -81,3 +81,29 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>  }
>
>  #endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> +					unsigned long address, pmd_t *pmdp)
> +{
> +	pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
> +
> +	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
> +	VM_BUG_ON(pmd_trans_huge(*pmdp));
> +	/*
> +	 * When leaf PTE enteries (regular pages) are collapsed into a leaf
> +	 * PMD entry (huge page), a valid non-leaf PTE is converted into a
> +	 * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
> +	 * specification allows implementations to cache valid non-leaf PTEs,
> +	 * but the section "4.2.1 Supervisor Memory-Management Fence
> +	 * Instruction" recommends the following:
> +	 * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
> +	 * with rs1=x0. If any PTE along the traversal path had its G bit set,
> +	 * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
> +	 * the translation is being modified."
> +	 * Based on the above recommendation, we should do full flush whenever
> +	 * leaf PTE entries are collapsed into a leaf PMD entry.

It's generally best to ignore the recommendations in the commentary 
about flushes, they assume a specific software model that doesn't always 
apply to Linux.  In this case we do need the fence, though, but I 
changed the comment to explain it differently (an fix at least one 
spelling mistake).

I've squashed this in and have it in staging, if that looks good I'll 
put it on fixes.  Thanks!

diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 5da1916c231e..fef4e7328e49 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -90,18 +90,12 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(pmd_trans_huge(*pmdp));
 	/*
-	 * When leaf PTE enteries (regular pages) are collapsed into a leaf
+	 * When leaf PTE entries (regular pages) are collapsed into a leaf
 	 * PMD entry (huge page), a valid non-leaf PTE is converted into a
-	 * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
-	 * specification allows implementations to cache valid non-leaf PTEs,
-	 * but the section "4.2.1 Supervisor Memory-Management Fence
-	 * Instruction" recommends the following:
-	 * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
-	 * with rs1=x0. If any PTE along the traversal path had its G bit set,
-	 * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
-	 * the translation is being modified."
-	 * Based on the above recommendation, we should do full flush whenever
-	 * leaf PTE entries are collapsed into a leaf PMD entry.
+	 * valid leaf PTE at the level 1 page table.  Since the sfence.vma
+	 * forms that specify an address only apply to leaf PTEs, we need a
+	 * global flush here.  collapse_huge_page() assumes these flushes are
+	 * eager, so just do the fence here.
 	 */
 	flush_tlb_mm(vma->vm_mm);
 	return pmd;


> +	 */
> +	flush_tlb_mm(vma->vm_mm);
> +	return pmd;
> +}
> +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
