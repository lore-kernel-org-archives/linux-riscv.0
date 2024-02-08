Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B63C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3qino3CjtrQYNVgEdekQDMXOoCk/YlTgz2YtCgIcs8=; b=MIKJXV399Y1fFm
	3Gm1PvjR56ehD6y7TalE8gnOqTs4KUtkc3amx8ADUj8CXagaPpB7nolZ3Np3Q9K4cykfNgaP/NMGK
	sbbzOhZA5gWq/KpTk24ZLiC8PY+op6FcuI+TqWliUqHYXY/KFAg/WO3wSn76WUiuchir/U1u35vcS
	H1Gj4zqE1RztAMNb0D6eZSeeFH+xi1v6JJG2o9LbXKgKMOUi0gP5fEy8Q0j9DxxNPLBc6lAQGzwmJ
	I4AwPOJa9+/Wo36biIA/kXkAJDnETET1MfMtzGXoYGy880csLkf+G7TcT4WZ6YIclY9uehhNANOMl
	1apU9N5kPdqxABJSVhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxt4-0000000CoDy-13TF;
	Thu, 08 Feb 2024 06:27:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxt0-0000000CoCm-2ux2;
	Thu, 08 Feb 2024 06:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E94BB61B13;
	Thu,  8 Feb 2024 06:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0D4C433C7;
	Thu,  8 Feb 2024 06:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373669;
	bh=wxaBvjOQruR4Ppe5iBXVeEd+wF2Ez98jfGSuez99hUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOdTKonuPOHT47MMueyUa62BOnNiiM/wNlezDtex/q6A6C+C0/4I75w1hs6HgvTcM
	 6hzU/xNlN2o7mllZJQrfNN8OS6yllsdwkypMwhdT9Zppi/oCLVm5oi0rjh8531W++l
	 VyhzaLbe16SPL0h9xcRPSV+cCkOkyBpKxf4y5KkH108vuZcpzPDikPbUG6HlcbyEC6
	 jTwJS9vdlSE+DGYuaJ63tvvk0g/PUUXVgtbv8Zylz7Hox9kBt886iEEM3kege/8EOf
	 NJ+pl0uRULV4iQ598Nv8XuegThQZaF4ao5iEmjzKtdYeRjwmfPMTOqKkZ7RotF7fHW
	 dTB19Ug9MhA4w==
Date: Thu, 8 Feb 2024 08:27:24 +0200
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
Subject: Re: [PATCH v3 12/15] mm/memory: pass PTE to copy_present_pte()
Message-ID: <ZcR0TF5d75ucLjBm@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-13-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-13-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_222750_801807_2BAAA968 
X-CRM114-Status: GOOD (  18.86  )
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

On Mon, Jan 29, 2024 at 01:46:46PM +0100, David Hildenbrand wrote:
> We already read it, let's just forward it.
> 
> This patch is based on work by Ryan Roberts.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/memory.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index a3bdb25f4c8d..41b24da5be38 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -959,10 +959,9 @@ static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
>   */
>  static inline int
>  copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
> -		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
> -		 struct folio **prealloc)
> +		 pte_t *dst_pte, pte_t *src_pte, pte_t pte, unsigned long addr,
> +		 int *rss, struct folio **prealloc)
>  {
> -	pte_t pte = ptep_get(src_pte);
>  	struct page *page;
>  	struct folio *folio;
>  
> @@ -1103,7 +1102,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  		}
>  		/* copy_present_pte() will clear `*prealloc' if consumed */
>  		ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
> -				       addr, rss, &prealloc);
> +				       ptent, addr, rss, &prealloc);
>  		/*
>  		 * If we need a pre-allocated page for this pte, drop the
>  		 * locks, allocate, and try again.
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
