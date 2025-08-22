Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF58CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkk303d1DjXNfjkl/HNFSNYPfUg4R2/CpQwUgsyOZPo=; b=wuwH0uacmB8clo
	VYKRlWrMMd3IyIOcZ6MXCO2mHJ81EVMz4ViZBJQGKMZy0/QVkrndQVqJdSzPxtteF28V7OqBz554e
	SQyUf27L6uK2sAsSaU98t2x2nOPaCPrgUhWmYXl8b/8pbAynicE+9fr6pICn5SKCkxLnT/EHN6LQV
	y9kMogb+FLVETgbDE33L+qH6r+sTcNjgT1YPkoTziLeVrOqq+ce3vM5ZwvAnq/K0/M90nSLvQs5tt
	a0LnD805nJRufUXBUGdDsM00Fle2MB3U5tfXQ7+llBPO0eFj8jgs7535jOei22nPgzaT8HX+xowTM
	PPVSzbqvqy5p9Iidfk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphoK-000000042bE-35pf;
	Sat, 23 Aug 2025 06:33:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTQV-00000002xiM-2K8G;
	Fri, 22 Aug 2025 15:11:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 219FB43D9F;
	Fri, 22 Aug 2025 15:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F592C4CEED;
	Fri, 22 Aug 2025 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755875495;
	bh=rc5zcs7H/rwUO91qIX5/bnlTkYSpGUvTxw3AvvnVpgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRecik1RzOUe7VdTvcc0EcLADz/mKysoydFvtTn4cfOEbzFak66IoD8RswcXIl++W
	 0JrxrhU6r8rw3Rel5dqU8nYGlVw/2R4GMYdlnsDBOb0uCL2XHxwEJUUyalZseg+HbP
	 ojxZNI9JDYfBXowD+zk2cDjkd/X2gLPj2YAMAFQrqAiVt67gixZc2zUWEIs1PEFEnh
	 u/54dc2/F5+HgoL/3u8WAtJfXS1fic7KNsc1oDRVsP0U8C+smARqERYGhyzCH9Dh7c
	 YOJX+I+90OjDlMTGi/6ZeV8dheyMuNVGakKdZ62M1XRu7XMwWJbBU4054PZh/HiG9z
	 LoqbRJKMrdvRw==
Date: Fri, 22 Aug 2025 18:11:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 03/35] s390/Kconfig: drop superfluous "select
 SPARSEMEM_VMEMMAP"
Message-ID: <aKiIkwzNoJudCNLz@kernel.org>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-4-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821200701.1329277-4-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_081135_629488_4656E6A4 
X-CRM114-Status: GOOD (  14.88  )
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

On Thu, Aug 21, 2025 at 10:06:29PM +0200, David Hildenbrand wrote:
> Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
> is selected.
> 
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/s390/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index bf680c26a33cf..145ca23c2fff6 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -710,7 +710,6 @@ menu "Memory setup"
>  config ARCH_SPARSEMEM_ENABLE
>  	def_bool y
>  	select SPARSEMEM_VMEMMAP_ENABLE
> -	select SPARSEMEM_VMEMMAP
>  
>  config ARCH_SPARSEMEM_DEFAULT
>  	def_bool y
> -- 
> 2.50.1
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
