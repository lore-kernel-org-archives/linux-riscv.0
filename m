Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9FAC48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtvODNtVyaJJ74gVnVqd7XCvErOZ7FsZc+0uavDBIIM=; b=QcdDafDp3a5kzK
	fi+8nyIDBrtRR2vPEgcXkOfiQnYNNGWyuzCFhJvr8nKag1wHoZ9dwXvza22Pk/aU5iVPpAyj9giO+
	9iJiJsPNZ0K2yoIoEcYzoOxU0nsV9+yMdlGS+XPguxSVKsRXFSEF+/OqU56M/V/hg5Z5eE8aViAYE
	k6Sm/KaSgMKk/uDXHjswcKpF4KKyjT7xb2LrjIL+tLNYfM1+8OV9XPUBrPbz/7/nlJIph6GFGzSwo
	ifRrPjiiDBiII9TBSV9nGJQd9BhHDe535YOcPi6ezFkHjUknUGDmPJ9jRD2oCEiyhah77ZPQs5HFi
	4JOkk6ohUdrUVLBko0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxkq-0000000Cm1u-3wYr;
	Thu, 08 Feb 2024 06:19:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxkn-0000000Cm0h-24fM;
	Thu, 08 Feb 2024 06:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A15361B60;
	Thu,  8 Feb 2024 06:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E073C433C7;
	Thu,  8 Feb 2024 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373160;
	bh=sykn19xSWWObW9qLEcBLaerZOcbUqhpMGC17aR+qXjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIr3HcQ5b0bG8W1uCJ8Xs3AwCdkv1B8MN9avDtnOskKLP0MGsSA5FdVe/qlbwHlcW
	 ij75Se4Sr0M/mlXPbTkg0ExM3s0WbaPDmBB2z0afJU/DgLRzJylJTpMBlkaFq6genb
	 UGrNOEd0VDk8McWIYbPInEhmtVwApod8E7+c/sGa2tGsu8eSLCSRKoYuzxYXt8WRCQ
	 9cQouplzvU1R7Agn51n6p8mDjqipAaZ8nccLsae0oyB1d4PDPTePnX+SGrmuqMGd6I
	 jV18g7gasEz+BfWfvdqPK2SfzN57x1dswOCBjsVrob3m65Q37nQIWq9pBNrosyAwa/
	 8XrfQqz5PFmrw==
Date: Thu, 8 Feb 2024 08:18:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 07/15] sparc/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRyT9qil3f-Jot5@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-8-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-8-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221921_589201_2A1FB567 
X-CRM114-Status: GOOD (  14.70  )
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

On Mon, Jan 29, 2024 at 01:46:41PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/sparc/include/asm/pgtable_64.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index a8c871b7d786..652af9d63fa2 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -929,6 +929,8 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  	maybe_tlb_batch_add(mm, addr, ptep, orig, fullmm, PAGE_SHIFT);
>  }
>  
> +#define PFN_PTE_SHIFT		PAGE_SHIFT
> +
>  static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		pte_t *ptep, pte_t pte, unsigned int nr)
>  {
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
