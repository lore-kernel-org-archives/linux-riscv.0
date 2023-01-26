Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356A8C54EED
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2YCyczQ4/w9uWAFnkTKQt50cCHPX9CVa0B8l+g2Z+c=; b=CIierKJuZylgSD
	96KzDIxKxVqNNxgZ+f5ts7pSaVKKgTrO9tByCj/cH3dVji3O1tofCP0t6Zk7YDCyLJeYKHR9j1sTS
	rWFVvdvKzIOjm+CHAQAP6S9zEbqX/x5nB0FPwvn0gTOuSoxBuQmeER8fKlYLFWcmid7xSiXymVPAc
	+jNe31fLh168IvTrtpeu7l2PJwD6bDYVOVdzyGNtXsP/DhMySmV3qpjm9cS3usT36VHn2khznVMxL
	sIvfaTQE3P5bZh6XdUJsntB6klgpkWnx35mK6rfvHAMAFyjx5Nj8ZY3d63fyo3AeUlIVv2/uazJgT
	t4iYoer3tUPO6XqzS3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4G4-00BXy5-2t; Thu, 26 Jan 2023 15:33:48 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4FS-00BXhE-Qd
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 15:33:12 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 27B471C0010;
	Thu, 26 Jan 2023 15:33:01 +0000 (UTC)
Message-ID: <117752cf-c02b-4264-87c3-42c81aa429f7@ghiti.fr>
Date: Thu, 26 Jan 2023 16:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: mm: Implement pmdp_collapse_flush for THP
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Nanyong Sun <sunnanyong@huawei.com>, Anup Patel
 <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>
References: <20230125125512.2494577-1-mchitale@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230125125512.2494577-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_073311_139679_B30F67DD 
X-CRM114-Status: GOOD (  24.41  )
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

Hi Mayuresh,

On 1/25/23 13:55, Mayuresh Chitale wrote:
> When THP is enabled, 4K pages are collapsed into a single huge
> page using the generic pmdp_collapse_flush() which will further
> use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
> the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> using address specific SFENCEs which results in repetitive (or
> unpredictable) page faults on RISC-V implementations which cache
> non-leaf PTEs.


That's interesting! I'm wondering if the same issue will happen if a 
user maps 4K, unmaps it and at the same address maps a 2MB hugepage: I'm 
not sure the mm code would correctly flush the non-leaf PTE when 
unmapping the 4KB page. In that case, your patch only fixes the THP 
usecase and maybe we should try to catch this non-leaf -> leaf upgrade 
at some lower level page table functions, what do you think?

Alex


> Provide a RISC-V specific pmdp_collapse_flush() which ensures both
> cached leaf and non-leaf PTEs are invalidated by using non-address
> specific SFENCEs as recommended by the RISC-V privileged specification.
>
> Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4eba9a98d0e3..6d948dec6020 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -721,6 +721,30 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>   	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
>   }
> +
> +#define pmdp_collapse_flush pmdp_collapse_flush
> +static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> +					unsigned long address, pmd_t *pmdp)
> +{
> +	pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
> +
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
> +	 */
> +	flush_tlb_mm(vma->vm_mm);
> +	return pmd;
> +}
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
>   /*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
