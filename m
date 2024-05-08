Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7FEC19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zQglq+DS8XD1f3SfOzRCiw8u8Q6LI9e+Zesfw0Nbn4=; b=L54kmBh1yXQTy6hZskI+F8fLJr
	oDnqhlbI6ATp2ykd90UU1a+SdxCZMHaCOTwMfU0ZtSURcsR/jK0PGWJX2RUkfA1b2KlWVIguQ+e4c
	wFcBk7nYKd3AKNb8KLhBboziWew+xxYH1MUMP3Kjgao2AbDfP2UHRXvYvN5mntW3WMg1pkW0ev7Nq
	BZps2FhGdiYfIxpP8+2lDueCxptbqd27UEjeTMI5XqrSYyZXrItpdAobWO2X9nyzVj3gQufXkGYmJ
	T1wu2ZMYpGgk9rXsgfCQ7iSbYOMRq/vyGeQZe5+g0QlKsHCXLQVYYm1c23p3Ra9TS1oBGVJWwaGeA
	F/g0KhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4jTy-0000000G3qJ-1lby;
	Wed, 08 May 2024 15:45:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fWt-0000000FErv-0ypa;
	Wed, 08 May 2024 11:32:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CB8920009;
	Wed,  8 May 2024 11:32:05 +0000 (UTC)
Message-ID: <a45ae760-8d83-494c-8688-ccf8cdd3c7c1@ghiti.fr>
Date: Wed, 8 May 2024 13:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20240508111829.16891-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240508111829.16891-1-alexghiti@rivosinc.com>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_043211_805715_4C434516 
X-CRM114-Status: GOOD (  18.02  )
X-Mailman-Approved-At: Wed, 08 May 2024 08:45:24 -0700
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

I should not have unplugged this outlet...Sorry, ignore this series, I'm 
sending a RESEND right away.

On 08/05/2024 13:18, Alexandre Ghiti wrote:
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
>
> This patchset was tested by running the libhugetlbfs testsuite with 64KB
> and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).
>
> [1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/
>
> Changes in v2:
>    - Rebase on top of 6.9-rc3
>
> Alexandre Ghiti (9):
>    riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
>    riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
>    mm: Use common huge_ptep_get() function for riscv/arm64
>    mm: Use common set_huge_pte_at() function for riscv/arm64
>    mm: Use common huge_pte_clear() function for riscv/arm64
>    mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
>    mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
>    mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
>    mm: Use common huge_ptep_clear_flush() function for riscv/arm64
>
>   arch/arm64/Kconfig                  |   1 +
>   arch/arm64/include/asm/pgtable.h    |  56 +++++-
>   arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
>   arch/riscv/Kconfig                  |   1 +
>   arch/riscv/include/asm/hugetlb.h    |   2 +-
>   arch/riscv/include/asm/pgtable-64.h |  11 ++
>   arch/riscv/include/asm/pgtable.h    | 153 +++++++++++++--
>   arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
>   arch/riscv/mm/pgtable.c             |   6 +-
>   mm/Kconfig                          |   3 +
>   mm/Makefile                         |   1 +
>   mm/contpte.c                        | 272 ++++++++++++++++++++++++++
>   12 files changed, 480 insertions(+), 544 deletions(-)
>   create mode 100644 mm/contpte.c
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
