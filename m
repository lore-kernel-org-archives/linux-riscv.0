Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0588C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+88uHEtcLg2ESQ8pD6INISlT28m/ipnoAS5XcRA/9to=; b=bcxStQVhK/A6x/
	+ZjS1B54GeQjgZxTxM+Rz2F6MCi94H+TFjaPrwjqVpeU1/R+BzyZL/p+qmc4L0KTZLRltzJNHUiMK
	ua41VUeYG77dpGPnMeOGLUTojcx7qqh4lgigemTNTftnzPEEGj0HIKTDl9X1XjAw1N/y1rgEFE+jC
	nWYQNILQiEFXD1LhDxQWcmP+cccCfu/4FU3hW+7AFzBC/MyqQnIl6ydnRP8Ha8wGH8N5x91lzm91Y
	KuKczBVp1kzCDPkF5osyVV1j2ox3t8NGM9JTsY21cnrbxrWzvVeAqLHBx80QhvkIxdBaHoZyyCJqS
	wHnXdL+GaVh3uaZugjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxdC-0000000CkDp-0Iq0;
	Thu, 08 Feb 2024 06:11:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxd7-0000000CkCW-35OH;
	Thu, 08 Feb 2024 06:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 041F961B0E;
	Thu,  8 Feb 2024 06:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2565C43390;
	Thu,  8 Feb 2024 06:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372684;
	bh=P03Ra6tKJeIfMl5vzZANDer57SEANPUYFQQ4fYeImD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFaz8r46F2yMGhc4eChQ1bdDMIG2SJbZeO1JsISVjZZY5/QxNPEU574sO9dknngXq
	 YVgyAOL6RSp2qvuoFw3QAZnOLGr4cDN/wpbTmNQ58lmjGGeuChQIAye3TRo4TxFy79
	 V7xNv4sfFz+z0Vk0ON1uEn4vvWgR1e3+QhjIlA+1LT/Ifdm5+CkutQDtm79R+RIM1n
	 4OE0Gfs2UAKksR/gYZdixvQn5xW9+A4inVRJwU+VYyn9RWTX93+YzHhWEvbOkcDwIJ
	 h9Gt9Ms2CBz13jyRvnX4bzQn20gjiMAXZmHcQEZQTyBICBjNVu3/zFAWUGyA2x/MG4
	 oI4EjuUTX0bdA==
Date: Thu, 8 Feb 2024 08:10:59 +0200
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
Subject: Re: [PATCH v3 01/15] arm64/mm: Make set_ptes() robust when OAs cross
 48-bit boundary
Message-ID: <ZcRwc2mEDHIXxgGa@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-2-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-2-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221125_870019_44465FBE 
X-CRM114-Status: GOOD (  25.75  )
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

On Mon, Jan 29, 2024 at 01:46:35PM +0100, David Hildenbrand wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> Since the high bits [51:48] of an OA are not stored contiguously in the
> PTE, there is a theoretical bug in set_ptes(), which just adds PAGE_SIZE
> to the pte to get the pte with the next pfn. This works until the pfn
> crosses the 48-bit boundary, at which point we overflow into the upper
> attributes.
> 
> Of course one could argue (and Matthew Wilcox has :) that we will never
> see a folio cross this boundary because we only allow naturally aligned
> power-of-2 allocation, so this would require a half-petabyte folio. So
> its only a theoretical bug. But its better that the code is robust
> regardless.
> 
> I've implemented pte_next_pfn() as part of the fix, which is an opt-in
> core-mm interface. So that is now available to the core-mm, which will
> be needed shortly to support forthcoming fork()-batching optimizations.
> 
> Link: https://lkml.kernel.org/r/20240125173534.1659317-1-ryan.roberts@arm.com
> Fixes: 4a169d61c2ed ("arm64: implement the new page table range API")
> Closes: https://lore.kernel.org/linux-mm/fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com/
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arm64/include/asm/pgtable.h | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b50270107e2f..9428801c1040 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -341,6 +341,22 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
>  		mte_sync_tags(pte, nr_pages);
>  }
>  
> +/*
> + * Select all bits except the pfn
> + */
> +static inline pgprot_t pte_pgprot(pte_t pte)
> +{
> +	unsigned long pfn = pte_pfn(pte);
> +
> +	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
> +}
> +
> +#define pte_next_pfn pte_next_pfn
> +static inline pte_t pte_next_pfn(pte_t pte)
> +{
> +	return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
> +}
> +
>  static inline void set_ptes(struct mm_struct *mm,
>  			    unsigned long __always_unused addr,
>  			    pte_t *ptep, pte_t pte, unsigned int nr)
> @@ -354,7 +370,7 @@ static inline void set_ptes(struct mm_struct *mm,
>  		if (--nr == 0)
>  			break;
>  		ptep++;
> -		pte_val(pte) += PAGE_SIZE;
> +		pte = pte_next_pfn(pte);
>  	}
>  }
>  #define set_ptes set_ptes
> @@ -433,16 +449,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  	return clear_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
>  }
>  
> -/*
> - * Select all bits except the pfn
> - */
> -static inline pgprot_t pte_pgprot(pte_t pte)
> -{
> -	unsigned long pfn = pte_pfn(pte);
> -
> -	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
> -}
> -
>  #ifdef CONFIG_NUMA_BALANCING
>  /*
>   * See the comment in include/linux/pgtable.h
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
