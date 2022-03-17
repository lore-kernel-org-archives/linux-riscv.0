Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D4BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBgdHZMtrJOPzn3fWgDFjj9KxoeTL4HITgrI0zCYwgo=; b=zO5DK2STklSQA6
	XCRXmnrcggN1+qITe5840kf7TjujiIx0nUlGEo4ncFJwIEQ1WoGeYr016vngucSvfBFSYngMc0iUu
	LlSNzQehsZsqxzlHzaf+c173ueQtO77rGCI7A3n9njzur5HOi7IA6AOKjN9bATpht5gdbSFNdFX6T
	vcS9StYNQz0fo/vqS7aZoBEbb2vA23LUV0lOJMfyztu63xXfgtQz9Z9X4IJq5GorRwCFKa+aktzZz
	MAQI0SjzO4ZKB39cNBghWjvdXH82Q79ChEDw9mrRmj564p1WvT3nGfRmCxRcRR/k/spxsYxYFwuZ3
	UObDc74C3DiGdOzzFDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUvMM-00H5NI-OG; Thu, 17 Mar 2022 19:00:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUvM8-00H5FD-0w; Thu, 17 Mar 2022 19:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84A4AB81F79;
 Thu, 17 Mar 2022 19:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4176C340E9;
 Thu, 17 Mar 2022 19:00:08 +0000 (UTC)
Date: Thu, 17 Mar 2022 19:00:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next 3/4] arm64: mm: add support for page table check
Message-ID: <YjOFNEvj7EfBasCI@arm.com>
References: <20220317141203.3646253-1-tongtiangen@huawei.com>
 <20220317141203.3646253-4-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317141203.3646253-4-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_120016_235497_4B8F195C 
X-CRM114-Status: GOOD (  12.05  )
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

On Thu, Mar 17, 2022 at 02:12:02PM +0000, Tong Tiangen wrote:
> @@ -628,6 +647,25 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  #define pud_leaf(pud)		pud_sect(pud)
>  #define pud_valid(pud)		pte_valid(pud_pte(pud))
>  
> +#ifdef CONFIG_PAGE_TABLE_CHECK
> +static inline bool pte_user_accessible_page(pte_t pte)
> +{
> +	return (pte_val(pte) & PTE_VALID) && (pte_val(pte) & PTE_USER);
> +}

There is another class of user mappings, execute-only, that have both
PTE_USER and PTE_UXN cleared. So this logic should be:

	pte_valid(pte) && (pte_user(pte) || pte_user_exec(pte))

with pte_user() as:

#define pte_user(pte)	(!!(pte_val(pte) & PTE_USER))

Do we care about PROT_NONE mappings here? They have the valid bit
cleared but pte_present() is true.

> +static inline bool pmd_user_accessible_page(pmd_t pmd)
> +{
> +	return pmd_leaf(pmd) && (pmd_val(pmd) & PTE_VALID) &&
> +		(pmd_val(pmd) & PTE_USER);
> +}

pmd_leaf() implies valid, so you can skip it if that's the aim.

Similar comment to the pte variant on execute-only and PROT_NONE
mappings.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
