Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13149CA9ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PQufQozOPDtFp1vUlAIuzPENg2EgX6hTTZk5V634Es=; b=x/+FumXrOwikw2
	plKdJBW8ZAR/7P3u5BE40FyubyP6IQmRDv8tq9He4jYS+DeM3EYqqF3UsiYwLYyTkD1Q5xiQq0D/8
	fa/ft8zUml/OIHpZDM3E+LCCdg4ExLJzkMeCPp/Z3mkTs9tFKwBGGPT9d3KS5irUBlBfd6HlkSlw+
	v8keyMOAlvfqibnzUX8eps7GZLomlNtOCl2Vp8XQwqwnkpnma494DsvdvDU0Uw/je1VOSjh1314e7
	x5UNn5FjIlYvX3tCoUc7UMnrIFNMvc7X8tDXRbkOEGfrFu3QLKenr5Frd7OI+rkGjIhgYdcunsivk
	Gcn9JPBkhFUbTnOoBYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGE04-0000000AKRa-4A4p;
	Mon, 12 Oct 2026 11:15:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGE00-0000000AKQk-22HP
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 11:15:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1003944f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791803718; x=1792408518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOcvEm9msY+cl7KKbAZfMaogQnVH3/RbIaSfojxkTRo=;
        b=ZXkIfO0fQOTTXBdXlFXyj5wcCcxJLHmbf+oBHtZQB06I+RYWbB/HVl8bPBRDzkzs8d
         bF1ftHACenCDRt5Tf+eHIRpNQ5oYx3drI4wzjIcbkOvFX7KZcWYhI4rCrzvYZjTgrKIf
         p4FTdLdOjii6X7cWH0m27YgdNrV6AiGKUrTXFbhLeq8KEfSWY1Wg9e6QetVn2svYgPwb
         bX7gtJpMBvAboUQq7f+KHHevA4wkfCWQ9nUmfqibrLGIrA+0xdIZa9jpDnI0ZCPXaLp5
         xIkm1KQg9zDMuDNnmZPiUVDo5TSs1ONTD3tLA5MUc0Wl/NRSFJM9nt1EtBy49nZch/4q
         2jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803718; x=1792408518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOcvEm9msY+cl7KKbAZfMaogQnVH3/RbIaSfojxkTRo=;
        b=Vm5RMLg8AZDUQoG4c6ngpoRhPWMdfs8h+j9K4CnCRwnonWbVCJXRQDkhwCEHb2AgmK
         GngGCv0UnF9t2b+yBDeLCtEC+LS78sbix6gUM3BMufh3nkDYTPmS0vpcOts2oU3CjfkV
         e4GOVy1Rk69CZt8vEDcMxWAEqtB2sOi/qXl6TUu6ruJTMkesAdz7wUluQuvCc1AHEJ11
         k1fKtvP8dyFEL4nhqcyuK5YjWITRMBZg0XHVXIKOMxHsCYmhwxClN2LAZMIRd7kA0ynT
         bCJZz/3N9izo42oqMjkwWTWEVs95MlzjEuSKiUqIeAQ5kljAIHTnPPXzyc5koKrxsO2s
         0G9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsReMxk6UZmEEl5ENveDcrB4QHFTKZX4yQeZefkpSW62765rGixsh1XXzXKx0igMTnYurJTob8elwhyg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL3FJqEC1MRnBrJiQBjoInQG9g/LGkKwKHsSKcxrOwFDF+MF0p5
	dG+dnpLInRxeIaisYydocBt5NVQ0rF3eXIduzDYtr1kC+vWqqOtu6Ivh
X-Gm-Gg: AYBFou3VNay7KYaUjkfRQrYEDRafP1WYGyGw0yj0i5AVdVHPcBn/eZyX3/crsDsQeIe
	HV2Otn7T0U8apClocfuUDKKk7iJWITFmH/4bLMurFpV7QcPKmsMDule4ibeX+vuyt8WPuHo1SnR
	MuKOBwwpLA43JIuqbWaRbVD1VC37+x9O6NlZdnjqxorjZAMtHqvMu2YtjiKipsTdTSTt4wTPFuq
	wI+mwpdx58C0EkvMOJjt6BXvbJzjMCkBWpBzJYUk0/OjqTCZE6YbqDrWY+qkrNjPiKE7MuAZi6A
	xh2i0ypBrwXQGpVbpDyqh+ELIUq21gggMzR/dcrVXH+ACr/6O5PStAzxzOnIcj9mpFRvdpAEvWg
	5Qt8ZN8LPGHQtHGqYJp4GmwgA0gdoaJ7MNFvK9kmzg8qBhAw9Skd60SCoXwrmS6Lh3HYYjcG16t
	uQokOWijJRxo4g2UOBcZYAM+DVY/wvxzOHtOhroDkNfYJu/D3E4QUoWN+L+L4RyWAo46Nhqw==
X-Received: by 2002:adf:e005:0:10b0:48d:dec7:974c with SMTP id ffacd0b85a97d-48ddec797bfmr346783f8f.7.1791803718021;
        Mon, 12 Oct 2026 04:15:18 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20034954f8f.9.2026.10.12.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:15:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:15:14 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
Message-ID: <asy-b7_C3SjnmSaS@gmail.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010112457.49485-2-songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_041520_578771_12D50D42 
X-CRM114-Status: GOOD (  25.97  )
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

On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
> tables.
> 
> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
> splitting a PMD. Restoring the vmemmap backing pages does not collapse
> the PTE table, so a later memory hot-remove eventually frees it through
> pagetable_free() on x86-64. That releases the page without running the
> matching destructor and leaves NR_PAGETABLE elevated.
> 
> Make pagetable_free() detect constructor-backed pages and run the
> destructor before releasing their memory to fix the problem.
> 
> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
> Cc: stable@vger.kernel.org

is the x86 case covered for 6.16-6.18? as far as I can see, x86
free_pagetable() only uses pagetable_free() since bf9e4e30f353
("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
change anything there. or am I missing something?

> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Move destructor handling from x86 into pagetable_free() (suggested by
>   David Hildenbrand)
> - Trim and update the commit message (requested by Dave Hansen)
> ---
>  include/linux/mm.h | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5cca90fc1df6..771a7d60b0a5 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3969,23 +3969,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
>  	__pagetable_free(pt);
>  }
>  #endif
> -/**
> - * pagetable_free - Free pagetables
> - * @pt:	The page table descriptor
> - *
> - * pagetable_free frees the memory of all page tables described by a page
> - * table descriptor and the memory for the descriptor itself.
> - */
> -static inline void pagetable_free(struct ptdesc *pt)
> -{
> -	if (ptdesc_test_kernel(pt)) {
> -		ptdesc_clear_kernel(pt);
> -		pagetable_free_kernel(pt);
> -	} else {
> -		__pagetable_free(pt);
> -	}
> -}
> -
>  #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
> @@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
>  	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>  }
>  
> +/**
> + * pagetable_free - Free pagetables
> + * @pt:	The page table descriptor
> + *
> + * pagetable_free frees the memory of all page tables described by a page
> + * table descriptor and the memory for the descriptor itself.
> + */
> +static inline void pagetable_free(struct ptdesc *pt)
> +{
> +	if (PageTable(ptdesc_page(pt)))
> +		pagetable_dtor(pt);
> +
> +	if (ptdesc_test_kernel(pt)) {
> +		ptdesc_clear_kernel(pt);
> +		pagetable_free_kernel(pt);
> +	} else {
> +		__pagetable_free(pt);
> +	}
> +}
> +
>  static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
>  {
>  	pagetable_dtor(ptdesc);
> -- 
> 2.54.0
> 
> 

-- 
cheers,
jose a. p-a

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
