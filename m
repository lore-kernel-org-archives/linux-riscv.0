Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1436EC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTyOzATHgMND5k1uA8PjBDH+yyFnJDYSZYy1wUFSrRM=; b=sqDpPmSYlCu6qq
	XzasrpQ5FcP7VIGIMVFn9qGNx7r0J+D6axRmHZkK1KXfhXy73BXZfAV9ueU19jickcaYFKcspDiGd
	VAY/3m5Vtlf6ziRdoxXeprD+rcJm+wsEKsFpmsxXMUYkRsDr4Qjt821PHJUnNYDP3LmBZHNbx7L7c
	QlbxBxxOnHRlOjLB0NvnYXj7ZVOOK9tNDA0pVundLsWh7nse5kj2fsHwqJ+d898c8svIHPZTJY0j3
	3IWq1Jq//8zn0uRHnDXHhojlwqjcmx6lUCGw5eeM4P36plpb2cTzCAOWiY2DL9BFNs94h+wNWU0Yq
	5yB0LcxRRC0/HWusgjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxgr-0000000ClRl-2uWa;
	Thu, 08 Feb 2024 06:15:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxgn-0000000ClQI-2yF3;
	Thu, 08 Feb 2024 06:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AF3261B60;
	Thu,  8 Feb 2024 06:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F90C433F1;
	Thu,  8 Feb 2024 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372912;
	bh=GtOxHpQlJPbwoRannd2MAAO/IcfWNYmAXcwGmqFXwjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAN3NWHUgAp6xKLvQ0e8yFo37cydTMg89g97KgoVIregyOwzbHZk4hqQ3sub2hCoQ
	 hwe0CdW4bLnS5IePSVLUqqS0MuuGvJA+5FdWAqCBJPZGNUnGeQCtpVOkvjE1Gz9XSo
	 5xjczVpDmR6gYjOyqEkppqllHNPtdfx9WSEBmpQNcCQ2hUtwmJ6ZdiUOZTqrfTdnLZ
	 Mj0yGe+GtEY945WdAUDvOC+bojkB9gTWZGJtrrYvw6T2MmSzxu91pmMkOX3+8wCpJN
	 2nJc45RuQ04OQl9ZjLVBanjRZpBun16YaB8T9shpv+hT3YI4fkzjzytGNhBmxHHxa+
	 nPwOFg0DIBeAw==
Date: Thu, 8 Feb 2024 08:14:47 +0200
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
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 05/15] riscv/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRxVwWdvIjva9Vz@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-6-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-6-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221513_811991_875BFBFE 
X-CRM114-Status: GOOD (  14.67  )
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

On Mon, Jan 29, 2024 at 01:46:39PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/riscv/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 0c94260b5d0c..add5cd30ab34 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -523,6 +523,8 @@ static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
>  	set_pte(ptep, pteval);
>  }
>  
> +#define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
> +
>  static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		pte_t *ptep, pte_t pteval, unsigned int nr)
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
