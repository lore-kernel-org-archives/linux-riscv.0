Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E3DC5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 10:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zWPjJTLHYaFJgmwSLRQdlaXaPRpmn/zY5+2KQBPn5I=; b=4/p5vdp/8f9T04
	WQVWXi9HuI09RcZjWGGQusxhkrgY9+tlbpaO0s2Br6SUqZwrIjEd9F7rwWG0e41V3Tm2cc/ohm8h7
	Or1L8Y/skhSNI+FexwvoXoi29VT5lAITg7MJEjpkRQtEvgzrXz/SUz2KjzyxA4z3e3sWCTBt8I5t6
	ici79TAgAc14xKOiLb++OIEkNQWRqWehbe18SI23yNIcHMdZ0pqJNKdj6Rhk4N+TA0g9NbTHfANW0
	tvqOcrGliH4Cirs2fPkz0eOVex3gWjPVe6l4TBy96ej81GJE/Htsmqb331vLA87iRg5tg87UmKoqG
	v2emks/xKnSZgD6RRW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0OY-0000000HQkZ-2Ptz;
	Fri, 01 Mar 2024 10:45:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0OU-0000000HQhu-2Hzn;
	Fri, 01 Mar 2024 10:45:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C3E211FB;
	Fri,  1 Mar 2024 02:46:11 -0800 (PST)
Received: from [10.57.68.58] (unknown [10.57.68.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191AD3F762;
	Fri,  1 Mar 2024 02:45:30 -0800 (PST)
Message-ID: <b99f47f9-18d0-4619-aae7-19274197b85e@arm.com>
Date: Fri, 1 Mar 2024 10:45:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240301091455.246686-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_024534_943124_F80E2864 
X-CRM114-Status: GOOD (  19.17  )
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

Hi Alexandre,

I confess I haven't looked at the patches yet, but this cover letter raises a
few quesions for me. I'll aim to look at the actual patches in due course.

On 01/03/2024 09:14, Alexandre Ghiti wrote:
> This patchset intends to merge the contiguous ptes hugetlbfs implementation
> of arm64 and riscv.
> 
> Both arm64 and riscv support the use of contiguous ptes to map pages that
> are larger than the default page table size, respectively called contpte
> and svnapot.
> 
> The riscv implementation differs from the arm64's in that the LSBs of the
> pfn of a svnapot pte are used to store the size of the mapping, allowing
> for future sizes to be added (for now only 64KB is supported). That's an
> issue for the core mm code which expects to find the *real* pfn a pte points
> to. Patch 1 fixes that by always returning svnapot ptes with the real pfn
> and restores the size of the mapping when it is written to a page table.

Yes that makes sense to me. The intention for mTHP (!hugetlb) is to fully
encapsulate PTEs beind set_ptes(), ptep_get() and friends, so what's actually
written to the pgtable is arch-specific and well abstracted.

> 
> The following patches are just merges of the 2 different implementations
> that currently exist in arm64 and riscv which are very similar. It paves
> the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
> reimplementing the same in riscv.

You seem to be talking about both hugetlb (which uses the "huge" pte helpers)
and contpte for THP (i.e. mTHP, which uses the regular pte helpers). They are
pretty separate in my mind, so not sure why you would be modifying them both in
the same series?

Thanks,
Ryan

> 
> This patchset was tested by running the libhugetlbfs testsuite with 64KB
> and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/
> 
> Alexandre Ghiti (9):
>   riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
>   riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
>   mm: Use common huge_ptep_get() function for riscv/arm64
>   mm: Use common set_huge_pte_at() function for riscv/arm64
>   mm: Use common huge_pte_clear() function for riscv/arm64
>   mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
>   mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
>   mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
>   mm: Use common huge_ptep_clear_flush() function for riscv/arm64
> 
>  arch/arm64/Kconfig                  |   1 +
>  arch/arm64/include/asm/pgtable.h    |  59 +++++-
>  arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
>  arch/riscv/Kconfig                  |   1 +
>  arch/riscv/include/asm/hugetlb.h    |   2 +-
>  arch/riscv/include/asm/pgtable-64.h |  11 ++
>  arch/riscv/include/asm/pgtable.h    | 120 +++++++++++-
>  arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
>  mm/Kconfig                          |   3 +
>  mm/Makefile                         |   1 +
>  mm/contpte.c                        | 268 +++++++++++++++++++++++++
>  11 files changed, 456 insertions(+), 528 deletions(-)
>  create mode 100644 mm/contpte.c
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
