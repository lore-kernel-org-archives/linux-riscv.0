Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFECC48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LN32qvbPg2j88CrKJ+FR+UfsAxJ6T5DOnhkxm+O+KLk=; b=VJUGfhQV+Xj1sW
	giRnJ8wit7MV4qeIBtQaRp2thuVRqp1zq4+1qL4KLCfIB08KS4HKIdlkZmdq9OBfObhloD0ZmefhL
	7uKehp6p2ODsD7rpsHrT6+1Zlc9yy9jCd2xYuyvWwcYapwQWCiA3Z9J3vlOdTRsG1y9k3M9dZp/NF
	3p++qLaJ6mrZ8d6g2TjHIGEDvDXJPW2Xp0Mn3i+ydFiuV23GkEo/CXROZFg+/Rtkwz09f2SRQJ6M/
	k04l1imvmDswZ4TxVXTf8PTZDnVy0VvrgebxcRQGwpMhpqMvj7KPHxgAHqOVnZksIxWJWxAVAWQLg
	ZIid8/PMUPt3JIn2lN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxe3-0000000CkRS-47Fo;
	Thu, 08 Feb 2024 06:12:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxe0-0000000CkQ4-3IHP;
	Thu, 08 Feb 2024 06:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CAB561B0E;
	Thu,  8 Feb 2024 06:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ADEC43390;
	Thu,  8 Feb 2024 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372739;
	bh=L4FBQtW/eF2Uu1SqIrK2nRsbjsKSv4bUFB1aeX49JJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJX01pqqXnG+GEldJgYaVDhgObRa/4ZDUsQRXO0FxxpW+AgXzngnCGwKPtmlrSDNF
	 Cd0wch4ykXrr0mi1Egq91joKDYcLOSWO4CV5+NT+l0PKfU1ySJjGlhsCWGbNmfqv8r
	 W/rtdDJdoiXubGXIwaYbFfQafaBSv8zSGBXWrti3K34px06JngBKtot/k1I6J8kupf
	 7RkJg6zbfIo00oLX58qxCXkm64N8BM0iGfo103B+q498Q8cmvH2+glZIe263m+Hl6Z
	 B7vaV7wzv47KLyOCMCRswjVEGZqlxxnccg4wI4k9pxoaK10TbQYx++1EmVWsPo0kxO
	 3dRtTW0ogm2QA==
Date: Thu, 8 Feb 2024 08:11:54 +0200
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
Subject: Re: [PATCH v3 02/15] arm/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRwqizngdTmd7G8@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-3-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-3-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221220_896950_89471A72 
X-CRM114-Status: GOOD (  14.24  )
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

On Mon, Jan 29, 2024 at 01:46:36PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arm/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> index d657b84b6bf7..be91e376df79 100644
> --- a/arch/arm/include/asm/pgtable.h
> +++ b/arch/arm/include/asm/pgtable.h
> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>  extern void __sync_icache_dcache(pte_t pteval);
>  #endif
>  
> +#define PFN_PTE_SHIFT		PAGE_SHIFT
> +
>  void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		      pte_t *ptep, pte_t pteval, unsigned int nr);
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
