Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5BDE7D0BC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yKOu8w+1uqJMJcMI2o6LhXau2ybba+OtYwQ1VdLqs8=; b=yLQVQdtDt+hREU
	zfrpZda8oYe3SLOOB7mnddQfui67B9pmaTJLfJgfcTxJbOLfr9fPMk05tgZK0p4kRLMu13A/zqrCb
	6tQBDey0rNbv5CMAJDTVryRiprWCqNALYDwhMBiAvydRC3fPzdaJb1NproBNoA8kOrpOYr4pNHxEU
	sMo7S3h5r6cIIvb4TG6E4lIuIgBIIli2WahFYwq8hA11kwLZfOCksa0exPa9QQen5ckcFDBAelg1c
	PUWhr05RO5EuEPeM3XOMtFE6A6nD4PqCXIXlPqGaFTck8cBZ315/bF7r6liO5+6PRIzDaGxj86El6
	f6fmiadSQvQ3ZApol5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjV6h-007ZKJ-1o;
	Fri, 22 Sep 2023 01:37:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjV6d-007ZIF-1E;
	Fri, 22 Sep 2023 01:37:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0642EB820DA;
	Fri, 22 Sep 2023 01:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2723CC433C8;
	Fri, 22 Sep 2023 01:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695346635;
	bh=zRyL223DT0AFJx1gaOEUn6WcLlX2Kysk+6Fs0mtLrOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PNAAsjxZ/e5mSgGg/LPftlkbNKpcN/rnJGyJdb//w0VkNEAdvtPkglz83EUpi+iRP
	 CUifgPcEfIXikkO8FSBVWAewa4zbTOyW/Yl5flrqUDllqJAE3SzG2kmjrjAZrmJDHo
	 crbAM8SWYY+JnkBboXDn+/Qz7CHhlgXE7xG/2qP2x0dmB0tprvlPXeP9NzkYvk+r3s
	 0uxngMBI0XN0BvxVhCId+ACbyTDCZOXDjS5wdL3TxpEGcwtg23dBoXZkT0xPOs4c86
	 SSz1LUNN37N0YRjVtKgcGjRfXwPjXi9P2JOPVjrrrvT7bUtXub+Siisb+MvwlrdxSE
	 a+KWdAyrmeGOA==
From: SeongJae Park <sj@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 6/8] mm: hugetlb: Convert set_huge_pte_at() to take vma
Date: Fri, 22 Sep 2023 01:37:11 +0000
Message-Id: <20230922013711.100278-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-7-ryan.roberts@arm.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_183719_682801_9197DC77 
X-CRM114-Status: GOOD (  18.85  )
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

Hi Ryan,

On Thu, 21 Sep 2023 17:20:05 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:

> In order to fix a bug, arm64 needs access to the vma inside it's
> implementation of set_huge_pte_at(). Provide for this by converting the
> mm parameter to be a vma. Any implementations that require the mm can
> access it via vma->vm_mm.
> 
> This commit makes the required modifications to the core mm. Separate
> commits update the arches, before the actual bug is fixed in arm64.
> 
> No behavioral changes intended.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

For mm/damon/ part change,

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ


> ---
>  include/asm-generic/hugetlb.h |  6 +++---
>  include/linux/hugetlb.h       |  6 +++---
>  mm/damon/vaddr.c              |  2 +-
>  mm/hugetlb.c                  | 30 +++++++++++++++---------------
>  mm/migrate.c                  |  2 +-
>  mm/rmap.c                     | 10 +++++-----
>  mm/vmalloc.c                  |  5 ++++-
>  7 files changed, 32 insertions(+), 29 deletions(-)
> 
> diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
> index 4da02798a00b..515e4777fb65 100644
> --- a/include/asm-generic/hugetlb.h
> +++ b/include/asm-generic/hugetlb.h
> @@ -75,10 +75,10 @@ static inline void hugetlb_free_pgd_range(struct mmu_gather *tlb,
>  #endif
>  
>  #ifndef __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> -static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -		pte_t *ptep, pte_t pte)
> +static inline void set_huge_pte_at(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, pte_t pte)
>  {
> -	set_pte_at(mm, addr, ptep, pte);
> +	set_pte_at(vma->vm_mm, addr, ptep, pte);
>  }
>  #endif
>  
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 5b2626063f4f..08184f32430c 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -984,7 +984,7 @@ static inline void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>  						unsigned long addr, pte_t *ptep,
>  						pte_t old_pte, pte_t pte)
>  {
> -	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +	set_huge_pte_at(vma, addr, ptep, pte);
>  }
>  #endif
>  
> @@ -1172,8 +1172,8 @@ static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  #endif
>  }
>  
> -static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -				   pte_t *ptep, pte_t pte)
> +static inline void set_huge_pte_at(struct vm_area_struct *vma,
> +				   unsigned long addr, pte_t *ptep, pte_t pte)
>  {
>  }
>  
> diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> index 4c81a9dbd044..55da8cee8fbc 100644
> --- a/mm/damon/vaddr.c
> +++ b/mm/damon/vaddr.c
> @@ -347,7 +347,7 @@ static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
>  	if (pte_young(entry)) {
>  		referenced = true;
>  		entry = pte_mkold(entry);
> -		set_huge_pte_at(mm, addr, pte, entry);
> +		set_huge_pte_at(vma, addr, pte, entry);
>  	}
>  
>  #ifdef CONFIG_MMU_NOTIFIER
[...]


Thanks,
SJ

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
