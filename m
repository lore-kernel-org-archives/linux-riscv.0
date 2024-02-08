Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69803C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRAfDUie7X5ts1WZ5UEvRUk4GfRAePo224Xm8NV1yeY=; b=wnaoC2ScQiQ3JN
	QxzpbIC1Cyov5aA4e+3kHPiXxKFg8Nw0Kmprrmy6+1cvnNhp3lXXQV3c93SjzLwkbpEUa0eqTr2Ux
	wJiOHOfbDv/E/jwFzPt1gwHeAyKWg7W4dNsETHLsG3vHA4BImbaqrrmWEtb50oWS9bnUW2k/A3SHJ
	jWzEoZkMxZ3qXlUht8NBCSkDRCshIca5tOjkqq1cNRKB0a74P/RqzoJZ2Qgi3V4A5lf9W5tASWnUQ
	NsDMaNUQnYdyRKDlBbFuklKD6XR+CQu7z+DATQEeyLYQ9Z6rnI/3+X2iOZW2gH8k+9l+dXQqMhfsY
	Q4LUG+ea/NqsiriUyuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxfn-0000000Cl3w-3fms;
	Thu, 08 Feb 2024 06:14:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxfl-0000000Cl2b-0Y0y;
	Thu, 08 Feb 2024 06:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ED8D61B8C;
	Thu,  8 Feb 2024 06:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F03C433F1;
	Thu,  8 Feb 2024 06:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372848;
	bh=4QzBds67XGtNERWYDx/aWm1ENgSNhTtOrGmuQ4p3/TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLAWOOleFLG4hRBau/SC1x4YiU+yav60epvbD/PBxvZknWftP+db02erpl8/XutxW
	 uey6GkKb/C3I2U0iRfZhMgOeBcOD0odNJyLJw9mVBIDLXfayM0jVcXiDYHffi29bE9
	 mVDI6jdFirFyhd8X6DPXQAgJ6w7Emw3JvMDQauyxGuk+5quPjETb0qH0w+WdUqQkMI
	 /vuHrzGJzlEVOMEX6bJ+1KW/tveopwAdW5hTT+sewWvbXo/YCZyMOIheTEWJMkvqlP
	 1vgwzSaIYuL0CjVbngFLUeJsZbhKg1++8Uzl+V8pAzA3VKJEivhTaCRxOlOK+cTZnG
	 bgRWPEBmybWPQ==
Date: Thu, 8 Feb 2024 08:13:42 +0200
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
Subject: Re: [PATCH v3 04/15] powerpc/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRxFksWIcN5Cdgx@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-5-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-5-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221409_231498_4B6991E5 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, Jan 29, 2024 at 01:46:38PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/powerpc/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 9224f23065ff..7a1ba8889aea 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -41,6 +41,8 @@ struct mm_struct;
>  
>  #ifndef __ASSEMBLY__
>  
> +#define PFN_PTE_SHIFT		PTE_RPN_SHIFT
> +
>  void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  		pte_t pte, unsigned int nr);
>  #define set_ptes set_ptes
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
