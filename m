Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3CCC48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46SQpSoYCqzJFlnB1R1DTjScQMBrgHk3L0rfYhX2Ihs=; b=e2oZNR5b30zZHX
	j2jndr7382o4HJa7BbqQRNR56d5GFIQPltGjhp0Hfp0pKACymoqW88RLBaXDz2+ME11olZ04knemh
	cRsKrpuWFfO16uoumKXxmO7bDHiWwvMNaIHghQYiqKEKp4Hb7aUL1/ixwnmZqGQIkoS8m/yjvbVjJ
	XfMGtDIRPZOqAw5HsDQXaaZ4VlxebjGtnIlPU6BsM8yuKO/OLGVqyqeoiNSmd3UycSSoBj4ZZvEb5
	sJFv7F7CoEMGC8G6sen5DWg456Bb9GTF9whyzuWa8XUJSl9vLu4O4zRpOgpqJd5XiY/CLhuKa/62I
	HbqvuvTuceTJEUWLi+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxet-0000000Ckjg-48lC;
	Thu, 08 Feb 2024 06:13:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxeq-0000000Ckhw-3V1V;
	Thu, 08 Feb 2024 06:13:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C71B2CE1B88;
	Thu,  8 Feb 2024 06:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14665C433F1;
	Thu,  8 Feb 2024 06:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372790;
	bh=GM6dCu14KCN1BOx/s18QrtfrcQp10p30WtEoq/gOMJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdIp4XnVq2YCQ14TsRYu7WYNhoVL6BtKWfrsAzOeRc9Q/LguXmaF83ZhM1oP2znC0
	 siSpiD4L44v0Kuav3FN/xGm6jWEBJo8+TeNLIF+gp4XZpws4AEcgm0b+gUqDsD4nu/
	 mPww9jaa2QmsL/6Blxo4KILZsLAhwPAv4xojEYk8GtoK6rqv3I2dTvyt0zotDTLn03
	 pIyzShY74h7lo4nvR7U7/QBb8+rwHG007doptEwwKyv2ORXjLL3eJOGKQzSrpnI7gO
	 7Geegg/lj6oFSJVhLduHTHpZgQcBaQWBYS5ib3MOz3fvWQ50+I2DUGSCC0ku6pAFSO
	 q8ndS3rQIwGZA==
Date: Thu, 8 Feb 2024 08:12:44 +0200
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
Subject: Re: [PATCH v3 03/15] nios2/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRw3GoICHW_KgT4@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-4-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-4-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221313_078191_B52F41A7 
X-CRM114-Status: GOOD (  14.96  )
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

On Mon, Jan 29, 2024 at 01:46:37PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/nios2/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
> index 5144506dfa69..d052dfcbe8d3 100644
> --- a/arch/nios2/include/asm/pgtable.h
> +++ b/arch/nios2/include/asm/pgtable.h
> @@ -178,6 +178,8 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
>  	*ptep = pteval;
>  }
>  
> +#define PFN_PTE_SHIFT		0
> +
>  static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		pte_t *ptep, pte_t pte, unsigned int nr)
>  {
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
