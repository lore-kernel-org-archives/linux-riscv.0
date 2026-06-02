Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9A5CD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 04:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qkfygo02Nvxa/PzYHSnyqbkNu+ib3AHzW30nTH8Uvuo=; b=XQ55B8iaUThGGX
	QVREE9kH7WmSw0K/Z5tGGDiSqLQSC5rtihyky8OKDH0XE/wiQeIWFlHXte1V+wG8HMNt5Pqlh9U6C
	fHjRT7Xg2bxDPM/T+ZPtw7JHM6B8vlc+IEIzXfaZGvvrGo1LlKW6lj0dPrfKMTWAkIEI4a/jh7f9m
	Na0DW3tCS1jI/6U9osITKCUXL+gLT/ONgj8GoM3e0c1loD4lR8fb4NmXD7/luBANM1mvJfq9ZXgV9
	op2o0cy14SoPvnuxSsojUtZbqpI6ZN9+A6n5z/hluSv/55wCIqAC01Jq1ABl3QpTIEpYR3gTpC+2f
	ZskjSx2Q+mhM0/kKwMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGxu-0000000CHtY-09pL;
	Tue, 02 Jun 2026 04:42:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGxr-0000000CHsi-0VcD;
	Tue, 02 Jun 2026 04:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EBE56001A;
	Tue,  2 Jun 2026 04:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758F31F00893;
	Tue,  2 Jun 2026 04:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780375374;
	bh=q5LjwyqHv+cuF7cox7QKxMaKT1u+xe8DMZ1+K1paDkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NX7UIQafey5Ppn3S4T1W8ulKWcx4GVHL15p4QQacar67iFhuJ0SNvibBo7j5gjswm
	 JcsAqP7zzZJzRnXqBdU6QzcN+4R7VKIeX8Xdykkre0iNXgb6t953myJbsK50zpg649
	 HE0ZA2rzhJDVPZNjRWV9WaDh9YH2eHkyATGegZvIUvbXG5v8xMKnkL74KMQNC/kNlZ
	 KmgKKRYH1J5c1mXc7/VgzS/aLHeNKUEj83ZfX+Ne/KdABkR9otndfuDAiJoe5YDyPi
	 XDsF7iWnVbPKMaoX/HaJJ0jS+/fBdjlRU2RNdW2K5dYPOAPsoYmXIasV6MVTYSvymN
	 PNjrjnre0i6Pw==
Date: Tue, 2 Jun 2026 06:42:45 +0200
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v3 2/5] arm64/mm: drop vmemmap_pmd helpers and use
 generic code
Message-ID: <ah5fRXPvpOSmKoxl@localhost.localdomain>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-3-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260601084845.3792171-3-songmuchun@bytedance.com>
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

On Mon, Jun 01, 2026 at 04:48:41PM +0800, Muchun Song wrote:
> The generic implementations now suffice; remove the arm64 copies.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Will Deacon <will@kernel.org>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

> ---
> v2->v3:
> - Collect Acked-by from Will Deacon
> ---
>  arch/arm64/mm/mmu.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 24388e5c727d..ea10b0ebecd7 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1776,20 +1776,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
>  }
>  #endif
>  
> -void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
> -			       unsigned long addr, unsigned long next)
> -{
> -	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
> -}
> -
> -int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
> -				unsigned long addr, unsigned long next)
> -{
> -	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> -
> -	return pmd_leaf(READ_ONCE(*pmdp));
> -}
> -
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		struct vmem_altmap *altmap)
>  {
> -- 
> 2.54.0
> 
> 

-- 
Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
