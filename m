Return-Path: <SRS0=GwCz=SY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCACC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 16:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3004C20874
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 16:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MwEBleDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3004C20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QICSpNVD42Yqfk6uU/nNOEtQ8s54wELUpoxzUdspV8g=; b=MwEBleDQ2iNJDy
	scB3Rhql5t592HC0+EiIeotqxUNl74mpnjIDn6aU18dHbR0BUbSFym0aQ7YxrmXlapQmAtxVDWQJi
	qfY0auTfPB9kzCXjLkTbjNH4rIpyXLXArb06Xwn2Vg1BHtO04OA/Vo7FPiKCrjac+P1HTzSEe5/48
	pIt/o96daOJDCphmnIUibQhiqv2VRu4O8dWd9qB0J5oE37s4fU4eSr6hReunqtjzspctNrKG7H/dl
	jOf47VzHRTQwfM9KKb0eY8fB+s7e3CcNNgqo7KW1G1FPzyTBo4feL5rvM5iW3ZMpygSiMnC76Hc8m
	1nsTSm2HbB8QxsCLNo5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIbeQ-0007Ni-Ii; Mon, 22 Apr 2019 16:18:38 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIbeM-0007Me-KB
 for linux-riscv@lists.infradead.org; Mon, 22 Apr 2019 16:18:36 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0C73668AFE; Mon, 22 Apr 2019 18:18:15 +0200 (CEST)
Date: Mon, 22 Apr 2019 18:18:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Message-ID: <20190422161814.GA30694@lst.de>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555947870-23014-1-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_091834_960108_8C950ED7 
X-CRM114-Status: GOOD (  18.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 Andrew Waterman <andrew@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Vincent Chen <vincentc@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 ren_guo@c-sky.com, Scott Wood <swood@redhat.com>,
 linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 tech-privileged@lists.riscv.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 22, 2019 at 11:44:30PM +0800, guoren@kernel.org wrote:
>  - Add _PAGE_COHERENCY bit in current page table entry attributes. The bit
>    designates a coherence for this page mapping. Software set the bit to
>    tell the hardware that the region of the page's memory area must be
>    coherent with IOs devices in SOC system by PMA settings.
>    If IOs and CPU are already coherent in SOC system, CPU just ignore
>    this bit.
> 
>    PTE format:
>    | XLEN-1  10 | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
>          PFN      C  RSW  D   A   G   U   X   W   R   V
>                   ^
>    BIT(9): Coherence attribute bit
>           0: hardware needn't keep the page coherenct and software will
>              maintain the coherence with cache clear/invalid operations.
>           1: hardware must keep the page coherenct and software needn't
>              maintain the coherence.
>    BIT(8): Reserved for software and now it's _PAGE_SPECIAL in linux
> 
>    Add a new hardware bit in PTE also need to modify Privileged
>    Architecture Supervisor-Level ISA:
>    https://github.com/riscv/riscv-isa-manual/pull/374
> 
>  - Add SBI_FENCE_DMA 9 in riscv-sbi.
>    sbi_fence_dma(start, size, dir) could synchronize CPU cache data with
>    DMA device in non-coherency memory model. The third param's definition
>    is the same with linux's in include/linux/dma-direction.h:

Please don't make this an SBI call.  We need a proper instruction
for cache flushing and invalidation.  We'll also need that for pmem
support for example.  I heard at least one other vendor already
had an instruction, and we really need to get this into the privileged
spec ASAP (yesterday in fact).

If you have your own instructions already we can probably binary
patch those in using the Linux alternatives mechanism once we have
a standardized way in the privileged spec.

We should probably start a working group for this ASAP unless we can
get another working group to help taking care of it.

> +#define pgprot_noncached pgprot_noncached
> +static inline pgprot_t pgprot_noncached(pgprot_t _prot)
> +{
> +	unsigned long prot = pgprot_val(_prot);
> +
> +	prot |= _PAGE_COHERENCY;
> +
> +	return __pgprot(prot);

Nitpick: this can be shortened to

	return __pgprot(pgprot_val(prot) | _PAGE_COHERENCY));

Also is this really a coherent flag, or an 'uncached' flag like in
many other architectures?

> +++ b/arch/riscv/mm/dma-mapping.c

This should probably be called dma-noncoherent.c

It should also have a user visible config option so that we don't
have to build it for fully coherent systems.

> +void arch_dma_prep_coherent(struct page *page, size_t size)
> +{
> +	memset(page_address(page), 0, size);

No need for this memset, the caller takes care of it.

> diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
> index bd2f2db..f6aaf1e 100644
> --- a/arch/riscv/mm/ioremap.c
> +++ b/arch/riscv/mm/ioremap.c
> @@ -73,7 +73,7 @@ static void __iomem *__ioremap_caller(phys_addr_t addr, size_t size,
>   */
>  void __iomem *ioremap(phys_addr_t offset, unsigned long size)
>  {
> -	return __ioremap_caller(offset, size, PAGE_KERNEL,
> +	return __ioremap_caller(offset, size, PAGE_KERNEL_COHERENCY,
>  		__builtin_return_address(0));
>  }
>  EXPORT_SYMBOL(ioremap);

I think ioremap is a different story, and should be a separate patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
