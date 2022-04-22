Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AC5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 04:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Dcsp1FZFsnuUmC+98uRY2j+3fH0A8xtoEb50scLI20=; b=VRZBDlrxOT1dAW
	KJSplnZQuQxatVoNjVqkUhFrLeiJE2xJ1sDH1XZTUjw7BhCI0ogyA20qlj33udXVWeUf4LyZ4jVL/
	754RThplH1V39fQAtMxJu7foarT91cgYXUlNy4HXxkXUoUElV5XKbDLyMVBNW2yvE4FhjWHZawzCn
	OulWabSckH8QvtKJBa7/GBmE+jPCuILe95k0nIehkou0Oofc0oX8210JvDXKVNH7CSb1aCEHBU/Sq
	NtE0WHxS+lHOmiUqH+5nJ0KgO7aEkE1yKqasQu+in2lRTpoQ+hOMa+ggDdGojwkPak+SL+sZ2SvvD
	rFpkLIJ1HAS/SgpM8Csw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhl6A-00G5S4-Jr; Fri, 22 Apr 2022 04:40:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhl5y-00G5PC-CL; Fri, 22 Apr 2022 04:40:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 476D31570;
 Thu, 21 Apr 2022 21:40:34 -0700 (PDT)
Received: from [10.163.40.48] (unknown [10.163.40.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AA053F5A1;
 Thu, 21 Apr 2022 21:40:26 -0700 (PDT)
Message-ID: <e9faaec1-0ddd-5691-7996-aff6f54ab160@arm.com>
Date: Fri, 22 Apr 2022 10:11:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v5 1/5] mm: page_table_check: using PxD_SIZE instead
 of PxD_PAGE_SIZE
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
 <20220421082042.1167967-2-tongtiangen@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220421082042.1167967-2-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_214038_500631_57D2BB89 
X-CRM114-Status: GOOD (  14.39  )
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



On 4/21/22 13:50, Tong Tiangen wrote:
> Macro PUD_SIZE/PMD_SIZE is more general in various architectures. Using
> PUD_SIZE/PMD_SIZE instead of PUD_PAGE_SIZE/PMD_PAGE_SIZE can better
> support page table check in architectures other than x86 and it is no
> functional impact on x86.> 
> Suggested-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

There are multiple structural problems in the commit message wording
but will leave them upto Andrew, if he could fix while merging.

Otherwise LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  mm/page_table_check.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 2458281bff89..eb0d0b71cdf6 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -177,7 +177,7 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
>  
>  	if (pmd_user_accessible_page(pmd)) {
>  		page_table_check_clear(mm, addr, pmd_pfn(pmd),
> -				       PMD_PAGE_SIZE >> PAGE_SHIFT);
> +				       PMD_SIZE >> PAGE_SHIFT);
>  	}
>  }
>  EXPORT_SYMBOL(__page_table_check_pmd_clear);
> @@ -190,7 +190,7 @@ void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
>  
>  	if (pud_user_accessible_page(pud)) {
>  		page_table_check_clear(mm, addr, pud_pfn(pud),
> -				       PUD_PAGE_SIZE >> PAGE_SHIFT);
> +				       PUD_SIZE >> PAGE_SHIFT);
>  	}
>  }
>  EXPORT_SYMBOL(__page_table_check_pud_clear);
> @@ -219,7 +219,7 @@ void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
>  	__page_table_check_pmd_clear(mm, addr, *pmdp);
>  	if (pmd_user_accessible_page(pmd)) {
>  		page_table_check_set(mm, addr, pmd_pfn(pmd),
> -				     PMD_PAGE_SIZE >> PAGE_SHIFT,
> +				     PMD_SIZE >> PAGE_SHIFT,
>  				     pmd_write(pmd));
>  	}
>  }
> @@ -234,7 +234,7 @@ void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
>  	__page_table_check_pud_clear(mm, addr, *pudp);
>  	if (pud_user_accessible_page(pud)) {
>  		page_table_check_set(mm, addr, pud_pfn(pud),
> -				     PUD_PAGE_SIZE >> PAGE_SHIFT,
> +				     PUD_SIZE >> PAGE_SHIFT,
>  				     pud_write(pud));
>  	}
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
