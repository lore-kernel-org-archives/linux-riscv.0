Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D410C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G29TFmQHwZefbFo5BQr8UeY483FXEeeXnEhWD2/FjZ4=; b=pH/diBpa/EDf19
	PjqmoSJEaU9KF4cVhoWe13bNvA348nibaaLlC3Qe/dxT1uome5/oqqOppJXf8Dp7q+aUjbeoReLwd
	zDh0puQH44viOwM27Alb3drZK5M74zmTufm5myeNy3+3IgT9dyO70fNOcAmpxPSNqTBp8ohfvujCg
	y6ZJIASgEp5Fe86SPeD50F+VMcAdx5ER+fErtaoHxG46oZRVxwxqq4ULw2FSo/wTwKL1WSV/mC1O3
	0seEiJjCL7Y3i096DGrhnmMro7wWKL6q86MAJRCmNVXeC13nMvUVovRuPkouCP34mcR643/txnh1r
	cHqQEj3qGIQUu1cvjrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxhV-0000000Cley-3L9P;
	Thu, 08 Feb 2024 06:15:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxhR-0000000CldS-3M0V;
	Thu, 08 Feb 2024 06:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A82E61B76;
	Thu,  8 Feb 2024 06:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF23C433F1;
	Thu,  8 Feb 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372952;
	bh=4cpBdMWcDp/URDDivrNC/5C2U/2Get9Hcj59TpzJo88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch0eIee+TLQVcxJA1IRkGd00XN03txLrgzYzC4XgFSxqfrFQSz9Zg39KFHirnk8Dn
	 HXqAbI6jaZMcaFtq1/+Jv5yhTQ9qnjaAWh0Up4V4v771H3bVOa0RD6klWQxgL/9ASp
	 H01qOpHlb0gOleU7AQDWReSZtL8qLnAwMAUt1celTZxbjdnteZmnSZq/EFqUAx0mmN
	 AeiyEEztyQtpKTBUo5oFZUSCHlnRBQ6ufZqDEhgsiFbZNBOAR+LBNUD5WKDlfHZnAd
	 6Z+vqa2O+e9MDNRJCcItgHJ2iQFkpDLAcYLkQgY9uErSvCDDSuXkWQjkTilp2CM8Ph
	 nkWZ07IuNEqyg==
Date: Thu, 8 Feb 2024 08:15:27 +0200
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
Subject: Re: [PATCH v3 06/15] s390/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRxfx4Ze-_KXzE7@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-7-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-7-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221553_888970_E8177041 
X-CRM114-Status: GOOD (  14.31  )
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

On Mon, Jan 29, 2024 at 01:46:40PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/s390/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 1299b56e43f6..4b91e65c85d9 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -1316,6 +1316,8 @@ pgprot_t pgprot_writecombine(pgprot_t prot);
>  #define pgprot_writethrough	pgprot_writethrough
>  pgprot_t pgprot_writethrough(pgprot_t prot);
>  
> +#define PFN_PTE_SHIFT		PAGE_SHIFT
> +
>  /*
>   * Set multiple PTEs to consecutive pages with a single call.  All PTEs
>   * are within the same folio, PMD and VMA.
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
