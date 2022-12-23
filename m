Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78273C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOPwrk9JOLnOUmCwJ1zGN2LN5NHugn04eSn66Xq+F8g=; b=kOSdp2mMrqFb+v
	IDvIX6L611le+hMz66mdUvHK6/xAAmWFnyDXD6wPMtxOsH24t8cl5kCZY1ujjBf/zKuVrj7rLEZXM
	SUckUu/txRtxEIVAPIAnZCtehkepBiLzxwDTcTrzF9+vPAq+z/FKEFhtAvJirhoPaZioyeoedX7Vd
	i/mf1fNBeUuliMprurWOB2C3aqEVgP6zTdycQHxAIGPbj9EXK4PqG5oQcHv5sauAuw3LsFLStFfF9
	pdCFAgzmyek6INPYz/J/5HcLxigxbsb6dueVhWMDTKSV0xCN0xyGUu68qgYjkIPyiPEqDptIZD3aG
	2dEUUBHxNlO/CXfjXmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ktq-009ykZ-6z; Fri, 23 Dec 2022 16:27:58 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8kt4-009yDY-Rs; Fri, 23 Dec 2022 16:27:10 +0000
Date: Fri, 23 Dec 2022 08:27:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@suse.com>, Peter Xu <peterx@redhat.com>,
	Nadav Amit <nadav.amit@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
Message-ID: <Y6XW3hMtB7PrTSM5@infradead.org>
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
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

>  		unsigned long size = vma->vm_end - vma->vm_start;
>  
>  		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA64].dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #ifdef CONFIG_COMPAT_VDSO
>  		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA32].dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #endif

So for something called zap_vma_page_range I'd expect to just pass
the vma and zap all of it, which this and many other callers want
anyway.

> +++ b/arch/s390/mm/gmap.c
> @@ -722,7 +722,7 @@ void gmap_discard(struct gmap *gmap, unsigned long from, unsigned long to)
>  		if (is_vm_hugetlb_page(vma))
>  			continue;
>  		size = min(to - gaddr, PMD_SIZE - (gaddr & ~PMD_MASK));
> -		zap_page_range(vma, vmaddr, size);
> +		zap_vma_page_range(vma, vmaddr, size);

And then just call zap_page_range_single directly for those that
don't want to zap the entire vma.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
