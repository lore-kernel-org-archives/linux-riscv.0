Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740A5C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NCsapV2WE5waGpR/T+4wDnkV0nTO8QfkIhtbLC2BR0=; b=hMQTf1mvRRYTUL
	Jf8aQ3eWgGGmDEqvL8OyqhwFIKzVJoKVeu2XMz3WR0TLDv99C4HvMD/Cjs6CeAaHDXebSDdtoiZhE
	5rceIqTZw7NYGuY43nax4BQmZC9swEMoRLgxDLm8NPpX3AhZfsJH2fmsbr3h7DjOlViG+ghSA4Yc0
	yfep5y/46PAOv5NVvIhxt4mQRjzV3A0v9/O+1cleUGgPSNtUJSOw9kji5oGHQqVL9J11edMUYnekB
	Ivk9Iho72cKDKTpufe9bsMqNH5FiOpcSZlP1Ysyxduj28TF99qlxVgDLEJ3T7pGO6QXrl6y0JFlcs
	SHA8JlH2uf+DpLP/zGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QdU-00000005RoT-3xfI;
	Fri, 10 May 2024 13:50:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QdO-00000005Rmc-4BXH;
	Fri, 10 May 2024 13:50:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04CFE106F;
	Fri, 10 May 2024 06:50:23 -0700 (PDT)
Received: from [10.57.65.1] (unknown [10.57.65.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02C483F641;
	Fri, 10 May 2024 06:49:55 -0700 (PDT)
Message-ID: <6d37f914-d139-48ea-be63-c428ac767cc1@arm.com>
Date: Fri, 10 May 2024 14:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <20240508113419.18620-1-alexghiti@rivosinc.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240508113419.18620-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_065003_454739_C3EDCEBD 
X-CRM114-Status: GOOD (  28.48  )
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

On 08/05/2024 12:34, Alexandre Ghiti wrote:
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
> 
> The following patches are just merges of the 2 different implementations
> that currently exist in arm64 and riscv which are very similar. It paves
> the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
> reimplementing the same in riscv.

Hi Alexandre,

I've skimmed through this series and the one that moves contpte. I can see there
is definitely value in sharing the implementation, and the rough shape of things
seems appropriate. I had some minor concerns about making it harder to implement
potential future arm64 errata workarounds but on reflection, most of the
now-shared code is really just wrapping the primitives that are still arch-specific.

I'm going to need to spend proper time reviewing it to give detailed feedback,
but I'll be out on paternity leave for 3 weeks from end of Monday at the latest.
So realistically I won't be able to do the detailed review until at least the
first week of June.

Some high level thoughts:

 - huge_ptep_* functions could be working on different sized huge ptes - arm64
supports contpte, pmd, contpmd and pud. Is keeping them in contpte.c
appropriate? Perhaps it's better to keep huge_pte and contpte separate? Also, it
only works on arm64 because we can get away with calling the lower-level pte
functions even when the huge_pte is actually a contpmd/pmd/pud, because the
format is the same. That might present challenges to other arches if the format
is different?

 - It might be easier to review if the arm64 stuff is first moved (without
changes) then modified to make it suitable for riscv, then for riscv to be
hooked up. At the moment I'm trying to follow all 3 parts per-function.

Thanks,
Ryan


> 
> This patchset was tested by running the libhugetlbfs testsuite with 64KB
> and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/
> 
> Changes in v2:
>   - Rebase on top of 6.9-rc3
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
>  arch/arm64/include/asm/pgtable.h    |  56 +++++-
>  arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
>  arch/riscv/Kconfig                  |   1 +
>  arch/riscv/include/asm/hugetlb.h    |   2 +-
>  arch/riscv/include/asm/pgtable-64.h |  11 ++
>  arch/riscv/include/asm/pgtable.h    | 153 +++++++++++++--
>  arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
>  arch/riscv/mm/pgtable.c             |   6 +-
>  mm/Kconfig                          |   3 +
>  mm/Makefile                         |   1 +
>  mm/contpte.c                        | 272 ++++++++++++++++++++++++++
>  12 files changed, 480 insertions(+), 544 deletions(-)
>  create mode 100644 mm/contpte.c
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
