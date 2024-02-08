Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA576C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td08c1n8+cvlH4KGurs0n8ZvfPW4rJ8jwQuCj46DcjA=; b=PrvkR1dVLAukbZ
	n2tvoasPX4xR9i7P6lT92yQhEozRpNyA/2gnMoV1ZXzk1RIqsF79KI2Zeo/SDbuz3AA8QkB0fjNjg
	yxNhibU/rgHg3Pmd3LGH2MOAWlfUQhH2LwLuVOUpr4jzIlR82W4F43xUSdS3hU3RJYoIFK3zV0Ix9
	7FQV+Lguhx1HI4lpMNZIl7gNCE2QqKxpRrwS8GwpHpjf1dl7lyVCCIn0wBZEQXPLvl9Mm+EyVAol0
	KgYqyDXM39QDDk8P0xHk3fr61+EPE19zUI/vKi4fHYEKsgnNlbfbd3HM+r2gc++fA1WpMR6E5SciF
	tsFlPspcFHuT2CMggUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxm2-0000000CmUP-1sVH;
	Thu, 08 Feb 2024 06:20:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxlz-0000000CmSe-0LCm;
	Thu, 08 Feb 2024 06:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A01561B0E;
	Thu,  8 Feb 2024 06:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F51C433C7;
	Thu,  8 Feb 2024 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373234;
	bh=7wP0q4tFEy5WW95c3el7rqakiH4FhWwfyKIVHhjI1XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOPbdVlaZ3j/34dFxXa4vB+wTlOrsQtoASWw+x3+65jJdyyCZoBVCQttsp96W2s7h
	 +dA1wJ8Ez9ve5rimAhiY5/4mPY3ZzWQwsKvTsF8Cxkf1yL7WeETY3nbsyR+7vIMF8Q
	 GuW4dxu/JPlWiqXJs/DKi3m2ES/5EmCcjon1rqH0D/VCX6tV4q7cOK3KzzTX7qrvVd
	 SaM/kU/bAIRKAwb3SSP5QVrWdMzjitoySDGdjiasABQyDO4rXXsC3R9hRw7viriNL9
	 SVm1OEQ8+qwo3As8rwgD9NWsvKsOyP5hEKMltiXMj0Y+3MHGqcNEYmdsehVkRtlm8W
	 KYecGRtEzfD7A==
Date: Thu, 8 Feb 2024 08:20:09 +0200
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
Subject: Re: [PATCH v3 09/15] arm/mm: use pte_next_pfn() in set_ptes()
Message-ID: <ZcRymY35KnPAuuzY@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-10-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-10-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_222035_183373_7164CB65 
X-CRM114-Status: GOOD (  16.28  )
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

On Mon, Jan 29, 2024 at 01:46:43PM +0100, David Hildenbrand wrote:
> Let's use our handy helper now that it's available on all archs.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arm/mm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
> index 674ed71573a8..c24e29c0b9a4 100644
> --- a/arch/arm/mm/mmu.c
> +++ b/arch/arm/mm/mmu.c
> @@ -1814,6 +1814,6 @@ void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		if (--nr == 0)
>  			break;
>  		ptep++;
> -		pte_val(pteval) += PAGE_SIZE;
> +		pteval = pte_next_pfn(pteval);
>  	}
>  }
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
