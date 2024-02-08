Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F0DC4829C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0OEBVwI7W01S9ZIzHyZZWlgUZR7MzYA6bPobTHQ1RY=; b=B5E6chYxHgGKIe
	MN+GIWi2P2Ct5knhgjQ91kgqeExI5p1pETX0WA/CbpOKjSwPHZLTJUbOSd9MAh3+uaoodhxYAcvtk
	9IOpJ7nP5RInXqXu7wkhmlCBKlGCatKVqvGzEcYUHKOqLSYp8TBLVA0RhLXDWXzWYSiE0Ish72FxK
	0KnHmuGhtYIODNcln0IrgFGJ59m2y0NF/vncwRajlA+gXKJoyheVIfQmz/nzIcyqdfIXW6nYdMUr3
	ZpakNia3nL27TMxpkDtUyhYADpq0DMWEQaPffzJ3rDoxkcM8RDLjD4IRx4UoAUa00Ks22SNH4NdNA
	11icYpfeNGxXoDVS3k3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxmp-0000000CmkZ-17oD;
	Thu, 08 Feb 2024 06:21:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxml-0000000CmiH-3LKE;
	Thu, 08 Feb 2024 06:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 347BF61B29;
	Thu,  8 Feb 2024 06:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA67C433C7;
	Thu,  8 Feb 2024 06:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373282;
	bh=lD1lrtMMdOBpkeLYHTDECguSxgees/c78w0lL7yv0bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOuzsSbB27uwSEFp6QnBBwF4c8wSiOnHMBpoT0jJuV3IEfQ/f661CpCyRQBuvLibE
	 lLQXgNR3XCQOOP5nvA2vnYrZmZkM/dZXQxbM9FSzlFF4YpKjZv+hycd+20Elp8ywEL
	 LAv0lEURquSyS6AsBFqOIDxwSjBdh4LEyqj78PHMjfRFx1Z2x+WKh2zG2BJ8sNyFaF
	 HujNOdc0xlfRqZUvzM5o9jvnfWteYJRjhw62WISYKo869NMnlPw7V7xJ1+fXv/PF/u
	 pHUOw3YaYaqgO8HS3ztmkMy9JMAmPt1+mxKkvDu4Ht04n+bkQbqIzXeGeuiFUFesQd
	 NG/ZDh6p/DJXg==
Date: Thu, 8 Feb 2024 08:20:57 +0200
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
Subject: Re: [PATCH v3 10/15] powerpc/mm: use pte_next_pfn() in set_ptes()
Message-ID: <ZcRyyTjbq8jxoPWC@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-11-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-11-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_222123_884690_07DB663B 
X-CRM114-Status: GOOD (  15.80  )
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

On Mon, Jan 29, 2024 at 01:46:44PM +0100, David Hildenbrand wrote:
> Let's use our handy new helper. Note that the implementation is slightly
> different, but shouldn't really make a difference in practice.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/powerpc/mm/pgtable.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index a04ae4449a02..549a440ed7f6 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -220,10 +220,7 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  			break;
>  		ptep++;
>  		addr += PAGE_SIZE;
> -		/*
> -		 * increment the pfn.
> -		 */
> -		pte = pfn_pte(pte_pfn(pte) + 1, pte_pgprot((pte)));
> +		pte = pte_next_pfn(pte);
>  	}
>  }
>  
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
