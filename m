Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751B2CAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 02:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89NU4D5MR5GD3Rx8irYpR+VIYQwVlHDOJHD2qypx+CQ=; b=AgvgMjhNEAd8jt
	N32bOkVQtHYUKMZ3Hs/X3IxfIhuXeZ9M8m55wu473v0uIjDqBb2wwWjdKI7SoOy0mZykvbJmVyJS+
	nLXJJAc5n4liWAjga5ph0FKIwJPc6Z5ygpKBChJUj6+nVf8uHW0wPrzCXrQzgWhUhYlRsPewEfXsP
	YXTypcgsSikOVWCQYhIs4FYwmdwn7khiI75Fj2hH3k0mB5mc8iz9HtPD9EP7c4GKo2xasbtB09WgW
	J5RLbUhQB7tk1WzvqftUzgwK6TEsvMiDrwf2GTqms4foHib4LBTJfNHfunnn7Mz7bdUGjCEoWf0pe
	lECjH/N3UTq0Fd7G5v9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6g6m-0000000528Y-2BN8;
	Thu, 09 Oct 2025 02:10:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6g6j-0000000528D-3ATE
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 02:10:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06F7422FC;
	Wed,  8 Oct 2025 19:10:09 -0700 (PDT)
Received: from [10.163.35.84] (unknown [10.163.35.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DDB43F738;
	Wed,  8 Oct 2025 19:10:13 -0700 (PDT)
Message-ID: <c6371fa1-af9c-47b0-988f-aae3d7fd58e7@arm.com>
Date: Thu, 9 Oct 2025 07:40:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/18] mm: Always use page table accessor functions
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Conor Dooley <conor@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-5-samuel.holland@sifive.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251009015839.3460231-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_191017_864010_7F8B59D7 
X-CRM114-Status: GOOD (  17.59  )
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



On 09/10/25 7:27 AM, Samuel Holland wrote:
> Some platforms need to fix up the values when reading or writing page
> tables. Because of this, the accessors must always be used; it is not
> valid to simply dereference a pXX_t pointer.
> 
> Fix all of the instances of this pattern in generic code, mostly by
> applying the below coccinelle semantic patch, repeated for each page
> table level. Some additional fixes were applied manually, mostly to
> macros where type information is unavailable.
> 
> In a few places, a `pte_t *` or `pmd_t *` is actually a pointer to a PTE
> or PMDE value stored on the stack, not a pointer to a page table. In
> those cases, it is not appropriate to use the accessors, because the
> value is not globally visible, and any transformation from pXXp_get()
> has already been applied. Those places are marked by naming the pointer
> `ptentp` or `pmdvalp`, as opposed to `ptep` or `pmdp`.
> 
> @@
> pte_t *P;
> expression E;
> expression I;
> @@
> - P[I] = E
> + set_pte(P + I, E)
> 
> @@
> pte_t *P;
> expression E;
> @@
> (
> - WRITE_ONCE(*P, E)
> + set_pte(P, E)
> |
> - *P = E
> + set_pte(P, E)
> )
> 
> @@
> pte_t *P;
> expression I;
> @@
> (
>   &P[I]
> |
> - READ_ONCE(P[I])
> + ptep_get(P + I)
> |
> - P[I]
> + ptep_get(P + I)
> )
> 
> @@
> pte_t *P;
> @@
> (
> - READ_ONCE(*P)
> + ptep_get(P)
> |
> - *P
> + ptep_get(P)
> )
> 
> Additionally, the following semantic patch was used to convert PMD and
> PUD references inside struct vm_fault:
> 
> @@
> struct vm_fault vmf;
> @@
> (
> - *vmf.pmd
> + pmdp_get(vmf.pmd)
> |
> - *vmf.pud
> + pudp_get(vmf.pud)
> )
> 
> @@
> struct vm_fault *vmf;
> @@
> (
> - *vmf->pmd
> + pmdp_get(vmf->pmd)
> |
> - *vmf->pud
> + pudp_get(vmf->pud)
> )
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> This commit covers some of the same changes as an existing series from
> Anshuman Khandual[1]. Unlike that series, this commit is a purely
> mechanical conversion to demonstrate the RISC-V changes, so it does not
> insert local variables to avoid redundant calls to the accessors. A
> manual conversion like in that series could improve performance.
> 
> [1]: https://lore.kernel.org/linux-mm/20240917073117.1531207-1-anshuman.khandual@arm.com/

Portions of the changes proposed here are already in discussion
and fetched for testing via mm-new/everything.

https://lore.kernel.org/linux-mm/20251007063100.2396936-1-anshuman.khandual@arm.com/
https://lore.kernel.org/linux-mm/20251006055214.1845342-1-anshuman.khandual@arm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
