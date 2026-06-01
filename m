Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FD2CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nW2O1rV/oPnzoORhAq+MCe9I4STne+6Ok9TTWy0gSaM=; b=N140Hwt0B9NF7i
	e/wtJxSk3ZwDI+9sNJsrH0GSwaR4uF+oEttP37tVPai6F0v9t+eMS4R59b/v1Bw06PmTPTCMqihcf
	h6d7/hFlWwGNBxA3BCWevlSRjKrAVH16IRvA8eea18C9RnIQkEZPkTQlpAlT3YI5xvh0kWthqZXgG
	OfqR27LFv4SHE0u2UnyuOeWYLd845XyWWZJzBcU0iMe+41y72H/iX0gtdTPUp3G4CFjfLKdMMwwgV
	c80Px/WaWwxTekvI5kay0XcHVbeSj2GjFLJVTj7UG1pTJdLm2xVEan4INTapf4w2z0gB1eWrYuGxu
	f3AUIj1cv7Qdq5ku92Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwqX-0000000AHok-1C1J;
	Mon, 01 Jun 2026 07:14:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwqV-0000000AHoJ-3iJm
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 07:13:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED67E601E5;
	Mon,  1 Jun 2026 07:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14EDD1F00898;
	Mon,  1 Jun 2026 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780298038;
	bh=uJvEmv+W0qDNB0rejgQapdJuH96Fa9lGuF//EYZmLLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GikPScST/JdGxywFRDULWNH7RT2OD7214GAe1g7QCDbKOyunBXFEScW2eXeSdFBPX
	 1nmcWK2mHQDwPeaDPZXRm/6Bvs/9e5PY0+uhi6uaM8IM3pMX3wxGR1mqYzxqKy9xXN
	 ae/gKZTG6FKLOXf0W8IqggTU5Qm1U2lkWpnzmJcCIPd/8GPvwIjoIPiMTQYXz9zgM3
	 OkrKoMuqeZLFrg+CgQybiH1dWrvfv/PMV20Px6ijnfJ2omnTN7SO/hCx0nccWkLV7p
	 Jf6WK823XOMgBj7INRW39n3G9pazy3NTIE1Ix6CtCLZRH0GMC/mD4oQdQtJZKDtell
	 zPk8/h+cl6k2Q==
Date: Mon, 1 Jun 2026 10:13:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] riscv: mm: Call mark_new_valid_map() after hotplugging
 vmemmap
Message-ID: <ah0xLeD1_6oRKDkx@kernel.org>
References: <20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn>
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

Hi,

On Mon, May 25, 2026 at 12:23:29PM +0800, Vivian Wang wrote:
> section_activate() creates new mappings in the vmemmap range without
> flushing TLB, which may cause faults on some RISC-V implementations that
> cache non-present PTEs and crashes.
> 
> This seems to be most easily reproduced with DEBUG_VM=y and
> PAGE_POISONING=y, which causes these newly mapped struct pages to be
> poisoned i.e. written to immediately after mapping.
> 
> Add a hook vmemmap_populate_finalize() in __populate_section_memmap(),
> and implement it as calling mark_new_valid_map() on RISC-V, which
> arranges for the exception handler to deal with these faults if they
> happen.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> I'm not sure if this is the right place to add this hook. I didn't add
> it to vmemmap_populate because it doesn't seem to be called in all
> cases. Please advise.

Indeed it looks like we'd need a new hook to let architectures run
post-populate actions.

The explanation that says why a new hook is needed should be a part of the
changelog.
 
> Depends on my earlier kfence fixes for mark_new_valid_map() [1].
> 
> Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
> ZONE_DEVICE requires another fix [2].
> 
> [1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
> [2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn
> ---
>  arch/riscv/mm/init.c | 6 ++++++
>  include/linux/mm.h   | 1 +
>  mm/sparse-vmemmap.c  | 6 ++++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 706f43523935..cf9ae4099f82 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1360,6 +1360,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  	 */
>  	return vmemmap_populate_hugepages(start, end, node, altmap);
>  }
> +
> +void __meminit vmemmap_populate_finalize(void)
> +{
> +	/* Avoid faults on cached non-present TLB entries. */
> +	mark_new_valid_map();
> +}
>  #endif
>  
>  #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0b776907152e..65deccbd7e31 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4882,6 +4882,7 @@ int vmemmap_populate_hugepages(unsigned long start, unsigned long end,
>  			       int node, struct vmem_altmap *altmap);
>  int vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		struct vmem_altmap *altmap);
> +void vmemmap_populate_finalize(void);
>  int vmemmap_populate_hvo(unsigned long start, unsigned long end,
>  			 unsigned int order, struct zone *zone,
>  			 unsigned long headsize);
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 6eadb9d116e4..2b860d2b1703 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -544,6 +544,10 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>  
>  #endif
>  
> +void __weak __meminit vmemmap_populate_finalize(void)
> +{
> +}
> +

The existing hooks in sparse-vmemmap use #ifdef <hook> rather than __weak
functions. Take a look at vmemmap_can_optimize() and
vmemmap_populate_compound_pages().

Let's keep it consistent.

>  struct page * __meminit __populate_section_memmap(unsigned long pfn,
>  		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
>  		struct dev_pagemap *pgmap)
> @@ -561,6 +565,8 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
>  	else
>  		r = vmemmap_populate(start, end, nid, altmap);
>  
> +	vmemmap_populate_finalize();
> +
>  	if (r < 0)
>  		return NULL;
>  
> 
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260525-mark-after-vmemmap-populate-68bd790839c9
> prerequisite-message-id: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
> prerequisite-patch-id: fdc42f2647e21d111f44a6532887a6705cd470a9
> prerequisite-patch-id: 096fa339c84c36643ae4311fd8362dc63e23d950
> prerequisite-patch-id: 305c876a5f4a23a840a8142aea79b796ed297545
> prerequisite-patch-id: d78cb55d6a616b1170f06a401c8fd44acd11e5d5
> prerequisite-patch-id: b02b4a76e94f3e2821291d4c23b46f6e5ecf5203
> 
> Best regards,
> --  
> Vivian Wang <wangruikang@iscas.ac.cn>
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
