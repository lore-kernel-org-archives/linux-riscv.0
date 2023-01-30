Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB8EC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpM0Kos2xYuGdwGtee0hzV9EEmKpyOs75Muo0eOJe7w=; b=u4+fwpKWz1GqUb
	RiRzBYHBwbz6JXbPqsKX8/Hqr2Go+3HAei+lLtLeSCyoZsSOTmtKProfDMoHKz75+4DPJ85nM+3OE
	s2nMc84ZUtrgaipwqGHRwsvSkaJ3CGV4kaJvLdSSr5JQEdCScQRcvfu3MmHGMth2sqvP2apxbNC9d
	AvZ2z0KX2AXW38FX7QzZRTZ3G91ZlJH9tvct2NaJ1WSa6V7XS2LkDNHFNyodh3Bmad0Y5ej9zi1io
	6OxavZtOSKq0lByNsnnXMMAs8jSqcYF7FcDmcZGg28rwhypUg3x1PDVkPFPirrhoaKk1aWVFWz9k1
	s343tHESYJXRYO6Jp6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMP8j-002bXC-70; Mon, 30 Jan 2023 08:03:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMP8e-002bWC-P5
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 08:03:42 +0000
Received: by mail-ed1-x529.google.com with SMTP id g11so10058974eda.12
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 00:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXhgrx+8aABBN03aqv8NpM1kL1rTCrronJKmcZLJLfQ=;
        b=Yo5FHAn/eJ0SQZJKpF7ozdZdUsBeP/HcyFjcmuz3rkC5uBkA/oieSH82gRhM4om0WF
         W38kKqGx3sU5NM8lF6WCyUBK31EJp6PrHeM1wpvXvMZ4FEBJ8kGkNQnQIx3/qpDFAaXi
         k5iG+NQPmsSkSY2yAaB2+Mjf1xy2cVsX9EvkaXT91vdU50GA4FjuCd/FzhumzukdD6aZ
         ESc4coOFWzum5RB1e+anXmoqcsLG1vhE6vHU4sPuFOI6hNNct4qzgIdaRavav97/o4+M
         cO83CVV8Wl75XqPgGZMs6Lkp3kmnT/AQ/67Vm5vYcfhPsFAi4wlgTugBudTI0X04oe3p
         BG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXhgrx+8aABBN03aqv8NpM1kL1rTCrronJKmcZLJLfQ=;
        b=IW2wpaGJBAAWw85O5Hz/XLk0WZHW3fXOF/YSC3+e5Sa0qN2CB+DbCVCyIjZ3oo3Mzl
         vpv8xy6JJOe36PACNMmEi39GasA0U5Gm8NPMjTMURqia0cwSe0qgp+o1dw/tKT/5AeRp
         IB1D/HRryAOpy3VI95ioxiM1Bd/YOLMBRnSSWeoi0hSzeQjjfI98u184p48UBzsWBG7I
         ZTZibeFUMjwtK6si5fil1ocrQxT5qKyHs4TeR6ThrJMgdlfme0Z9gt01hBWIQQrpoI8p
         MX2XWXAiFQVJu7wJ+2793oqsa6ubB63jDPQ+8axEPbPSkLqqCWRhTs1afmIdZNaDo874
         +Ocg==
X-Gm-Message-State: AO0yUKVswG3wFuJuXD8lNlqNqDaMu/9o9u84FpaRum/YSBuxVlrp26D7
	yrcnyeN1gsKzYn1gaHnfNN980w==
X-Google-Smtp-Source: AK7set8ZlzQ4Jtl8cPEAKaki+Q5RFrouudrSHcCq6i+7IMBC7ozWCzussOiwQSqAwP2frlWERHNhpg==
X-Received: by 2002:aa7:c993:0:b0:4a2:112c:ca11 with SMTP id c19-20020aa7c993000000b004a2112cca11mr12297989edt.31.1675065816986;
        Mon, 30 Jan 2023 00:03:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w11-20020a50fa8b000000b0049e09105705sm6370345edr.62.2023.01.30.00.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 00:03:36 -0800 (PST)
Date: Mon, 30 Jan 2023 09:03:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Nanyong Sun <sunnanyong@huawei.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: mm: Implement pmdp_collapse_flush for THP
Message-ID: <20230130080335.3immrf355ameqqyh@orel>
References: <20230130074815.1694055-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130074815.1694055-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_000340_841059_D04AECD0 
X-CRM114-Status: GOOD (  25.48  )
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

On Mon, Jan 30, 2023 at 01:18:15PM +0530, Mayuresh Chitale wrote:
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

Please add a changelog here under the --- to explain the differences
between this version and the last version. b4-diff shows me what
changed, but the changelog should be present to explain why it
changed.

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

These checks should come before the use of variables being checked, as is
done in the common version of the function.

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
> +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
