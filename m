Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB54EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 07:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cujStKf4tBFwUhG13yjWw0iab+3Pjcv5n31CwXafgws=; b=NL75y6NWuvnllQ
	r2UvPZg9t0K3o0UPhgJonKHyvOnVgLzJ++MpyHjJV/XKdrAm5NVqPsb1SeKjDx9a9estEhxH1Daow
	kGsp8tJPEIorZ2WlKiC33+r6grpx1QcBYNMpqvGJRCGwkXq5YcPJtmJL7Ec53C9UH2En9iPh8jN8X
	0yVerqpqU9cfNJkeUAZYjKqnvsss3fVgPJMLxCTIr7tciXDlOnwJ1ZdUrVRrt19EQzWH2ri/fmuE3
	rZ/Z4sJPuEvc9raYvF73XXjzP4bkL8I/+e6UgmWc/6z0ePaC0uy8//5MAC2g/NFYfXJEAAuW2lUth
	Eg0rAIE1X4tP29lIqROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGa7p-00COSD-0t;
	Tue, 04 Jul 2023 07:07:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGa7k-00COQV-2l
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 07:06:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417272F4;
	Tue,  4 Jul 2023 00:07:30 -0700 (PDT)
Received: from [10.57.76.103] (unknown [10.57.76.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 574903F762;
	Tue,  4 Jul 2023 00:06:45 -0700 (PDT)
Message-ID: <82d3332e-beff-85ff-c1fd-0d46345b69b5@arm.com>
Date: Tue, 4 Jul 2023 08:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] mm: riscv: fix an unsafe pte read in huge_pte_alloc()
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Hugh Dickins <hughd@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, James Houghton <jthoughton@google.com>
References: <20230703190044.311730-1-jhubbard@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20230703190044.311730-1-jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_000656_949109_20F723E1 
X-CRM114-Status: GOOD (  24.35  )
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

On 03/07/2023 20:00, John Hubbard wrote:
> The WARN_ON_ONCE() statement in riscv's huge_pte_alloc() is susceptible
> to false positives, because the pte is read twice at the C language
> level, locklessly, within the same conditional statement. Depending on
> compiler behavior, this can lead to generated machine code that actually
> reads the pte just once, or twice. Reading twice will expose the code to
> changing pte values and cause incorrect behavior.
> 
> In [1], similar code actually caused a kernel crash on 64-bit x86, when
> using clang to build the kernel, but only after the conversion from *pte
> reads, to ptep_get(pte). The latter uses READ_ONCE(), which forced a
> double read of *pte.
> 
> Rather than waiting for the upcoming ptep_get() conversion, just convert

I'm not sure there is any upcoming ptep_get() conversion for riscv? Not from me
at least - my focus was on the generic code to suficiently encapsulate it as an
enabler for some follow on arm64 changes.

> this part of the code now, but in a way that avoids the above problem:
> take a single snapshot of the pte before using it in the WARN
> conditional.
> 
> As expected, this preparatory step does not actually change the
> generated code ("make mm/hugetlbpage.s"), on riscv64, when using a gcc
> 12.2 cross compiler.
> 
> [1] https://lore.kernel.org/20230630013203.1955064-1-jhubbard@nvidia.com
> 
> Suggested-by: James Houghton <jthoughton@google.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/riscv/mm/hugetlbpage.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 542883b3b49b..96225a8533ad 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -73,7 +73,11 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
>  	}
>  
>  out:
> -	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
> +	if (pte) {
> +		pte_t pteval = ptep_get_lockless(pte);
> +
> +		WARN_ON_ONCE(pte_present(pteval) && !pte_huge(pteval));
> +	}
>  	return pte;
>  }
>  
> 
> base-commit: 0a8d6c9c7128a93689fba384cdd7f72b0ce19abd


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
