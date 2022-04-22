Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 05:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edK8blAbPoHRXKekQtWQnHr1cbUEr6lWsfuKJfXaBWo=; b=jJAHDVkEngxTDj
	R0uXi484L0XNafe5hgHWAnyCv+YtdtVAhFS8LMPr+FafUj6YOSplDS26ZkSftMIaOgZyfI0g+dInX
	8sMQpyNmtNb4cxmeh4yUtqFaJSWW9DdAhwpicUCVQJvlOHZI/uca8FhvbNogtfr3RrIx9fBGmcca4
	ZF775ThxNjbNbtEGAhiN6FAF48kFkwOlx1NG9Pf8Xr8kOUKNlCHZWC/4YHVoIYgUTmbeV/jtSNucm
	sWgzmHq+0TYWIGPc1DoqIZBcpDeH/V5jjjsCKsBsCKL+gkjO9LHe8Zj0UiWBru7mRZGVlToGmJOIY
	g33LVGRcVw+QT/pqsc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhla1-00GBTN-P2; Fri, 22 Apr 2022 05:11:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlZK-00GB8t-8b; Fri, 22 Apr 2022 05:11:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B38E11570;
 Thu, 21 Apr 2022 22:10:56 -0700 (PDT)
Received: from [10.163.40.48] (unknown [10.163.40.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD00C3F5A1;
 Thu, 21 Apr 2022 22:10:47 -0700 (PDT)
Message-ID: <905f22d6-0671-21b2-a341-bdc5ba02e59c@arm.com>
Date: Fri, 22 Apr 2022 10:41:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v5 2/5] mm: page_table_check: move
 pxx_user_accessible_page into x86
Content-Language: en-US
To: Tong Tiangen <tongtiangen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
 <20220421082042.1167967-3-tongtiangen@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220421082042.1167967-3-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_221058_530746_E7A8E75A 
X-CRM114-Status: GOOD (  18.58  )
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

Similar to previous commits on the same file, the following subject
line format, would have been preferred.

mm/page_table_check: <description>

On 4/21/22 13:50, Tong Tiangen wrote:
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
> 
> The pxx_user_accessible_page() check the PTE bit, it's

s/check/checks			 ^^^^

> architecture-specific code, move them into x86's pgtable.h
The commit message should have been more clear, atleast complete in
sentences. I dont want to be bike shedding here but this is definitely
incomplete. These helpers are being moved out to make the page table
check framework, platform independent. Hence the commit message should
mention this.

> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  arch/x86/include/asm/pgtable.h | 19 +++++++++++++++++++
>  mm/page_table_check.c          | 17 -----------------
>  2 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index b7464f13e416..564abe42b0f7 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1447,6 +1447,25 @@ static inline bool arch_has_hw_pte_young(void)
>  	return true;
>  }
>  
> +#ifdef CONFIG_PAGE_TABLE_CHECK
> +static inline bool pte_user_accessible_page(pte_t pte)
> +{
> +	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
> +}
> +
> +static inline bool pmd_user_accessible_page(pmd_t pmd)
> +{
> +	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) &&
> +		(pmd_val(pmd) & _PAGE_USER);
> +}
> +
> +static inline bool pud_user_accessible_page(pud_t pud)
> +{
> +	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) &&
> +		(pud_val(pud) & _PAGE_USER);

A line break is not really required here (and above as well). As single
complete line would still be within 100 characters.

> +}
> +#endif
> +
>  #endif	/* __ASSEMBLY__ */
>  
>  #endif /* _ASM_X86_PGTABLE_H */
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index eb0d0b71cdf6..3692bea2ea2c 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -52,23 +52,6 @@ static struct page_table_check *get_page_table_check(struct page_ext *page_ext)
>  	return (void *)(page_ext) + page_table_check_ops.offset;
>  }
>  
> -static inline bool pte_user_accessible_page(pte_t pte)
> -{
> -	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
> -}
> -
> -static inline bool pmd_user_accessible_page(pmd_t pmd)
> -{
> -	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) &&
> -		(pmd_val(pmd) & _PAGE_USER);
> -}
> -
> -static inline bool pud_user_accessible_page(pud_t pud)
> -{
> -	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) &&
> -		(pud_val(pud) & _PAGE_USER);
> -}
> -
>  /*
>   * An enty is removed from the page table, decrement the counters for that page
>   * verify that it is of correct type and counters do not become negative.

With above mentioned code cleanup and commit message changes in place.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
