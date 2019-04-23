Return-Path: <SRS0=K/tH=SZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292F1C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 00:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C3420685
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 00:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cbmmPlPM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpWNj/qZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C3420685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjk0l0RTaPdk3OUPYe5DfHsHvimdZdQeCe9i/PtuBxQ=; b=cbmmPlPMYXHEkL
	LyijWsGUAU8wYE7L6oQrYBSvtIYEW/1Ht7G4xaPJm69el6DGXoTxlZwn3Vr/FDZK8pKeU+tOJOGXx
	Q5tlkANcT4T7IoKNAl9QQJm3K8zSBTZ49QAAILg5Y7WN6Z9mr6U4/3NonCzePyl43rDPn3+WTg2B0
	Dn2y4K+9R07zmZ8iXYe9YubO4ZQgXrF7u3nBfB4jzaTGdIXpjPfdm4K7EJBa7bE5xqFJM4nDlS6xB
	CN0rnUWPy12rDO9doHCoaFVppHNvm4F3jZoS7xu0GDwMXpB//InfUw839pt5dSWS4Z0gqzW80ljSe
	Ti7jkOqC/sSqt+qhNKlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIj4W-0006vn-36; Tue, 23 Apr 2019 00:14:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIj4R-0006uy-OG
 for linux-riscv@lists.infradead.org; Tue, 23 Apr 2019 00:14:01 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D98320685;
 Tue, 23 Apr 2019 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555978436;
 bh=jUT3W1rtS7YmOCZ3sQoFiOEjp5WEQRPO6ykT66B45h4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tpWNj/qZiwyRp2k9/QCMjtYT3QaIA5cCeNOt3XnKN9Fa8+MR70P/2FYCfT9BadWWk
 +iJnspEvEIHRL5E7JxnuBJkCOOjJu1E831ncQhZt93njCMkc2pIzQ0Ei5hDJkWU4dy
 YJ29LMBu5n7TLDJASKdz9kg3QTSYbXOJO/Hh0JXE=
Date: Tue, 23 Apr 2019 08:13:48 +0800
From: Guo Ren <guoren@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Message-ID: <20190423001348.GA31639@guoren-Inspiron-7460>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190422161814.GA30694@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_171359_826068_3E69046E 
X-CRM114-Status: GOOD (  27.24  )
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
 ren_guo@c-sky.com, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Scott Wood <swood@redhat.com>,
 tech-privileged@lists.riscv.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Thx Christoph,

On Mon, Apr 22, 2019 at 06:18:14PM +0200, Christoph Hellwig wrote:
> On Mon, Apr 22, 2019 at 11:44:30PM +0800, guoren@kernel.org wrote:
> >  - Add _PAGE_COHERENCY bit in current page table entry attributes. The bit
> >    designates a coherence for this page mapping. Software set the bit to
> >    tell the hardware that the region of the page's memory area must be
> >    coherent with IOs devices in SOC system by PMA settings.
> >    If IOs and CPU are already coherent in SOC system, CPU just ignore
> >    this bit.
> > 
> >    PTE format:
> >    | XLEN-1  10 | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> >          PFN      C  RSW  D   A   G   U   X   W   R   V
> >                   ^
> >    BIT(9): Coherence attribute bit
> >           0: hardware needn't keep the page coherenct and software will
> >              maintain the coherence with cache clear/invalid operations.
> >           1: hardware must keep the page coherenct and software needn't
> >              maintain the coherence.
> >    BIT(8): Reserved for software and now it's _PAGE_SPECIAL in linux
> > 
> >    Add a new hardware bit in PTE also need to modify Privileged
> >    Architecture Supervisor-Level ISA:
> >    https://github.com/riscv/riscv-isa-manual/pull/374
> > 
> >  - Add SBI_FENCE_DMA 9 in riscv-sbi.
> >    sbi_fence_dma(start, size, dir) could synchronize CPU cache data with
> >    DMA device in non-coherency memory model. The third param's definition
> >    is the same with linux's in include/linux/dma-direction.h:
> 
> Please don't make this an SBI call.  We need a proper instruction
> for cache flushing and invalidation.  We'll also need that for pmem
> support for example.  I heard at least one other vendor already
> had an instruction, and we really need to get this into the privileged
> spec ASAP (yesterday in fact).
> 
> If you have your own instructions already we can probably binary
> patch those in using the Linux alternatives mechanism once we have
> a standardized way in the privileged spec.
> 
> We should probably start a working group for this ASAP unless we can
> get another working group to help taking care of it.
Good news, I prefer to use instructions directly instead of SBI_CALL.

Our instruction is "dcache.c/iva %0" (one cache line) and the parameter is
virtual address in S-state. When get into M-state by SBI_CALL, we could
let dcache.c/iva use physical addres directly and it needn't kmap page
for RV32 with highmem (Of cause highmem is not ready in RV32 now).

> 
> > +#define pgprot_noncached pgprot_noncached
> > +static inline pgprot_t pgprot_noncached(pgprot_t _prot)
> > +{
> > +	unsigned long prot = pgprot_val(_prot);
> > +
> > +	prot |= _PAGE_COHERENCY;
> > +
> > +	return __pgprot(prot);
> 
> Nitpick: this can be shortened to
> 
> 	return __pgprot(pgprot_val(prot) | _PAGE_COHERENCY));
Good.

> 
> Also is this really a coherent flag, or an 'uncached' flag like in
> many other architectures?
There are a lot of features about coherency attributes, eg: cacheable,
bufferable, strong order ..., and coherency is a more abstract name to
contain all of these. In our hardware, coherence = uncached +
unbufferable + (stong order).

But I'm not very care about the name is, uncached is also ok. My key
point is the bits of page attributes is very precious and this patch
will use the last unused attribute bit in PTE.

Another point is we could get more attribute bits by modify the riscv
spec:
 - Remove Global bit, I think it's duplicate with the User bit in linux.
 - Change _PAGE_PFN_SHIFT from 10 to 12, because the huge pfn in RV32 is
   very useless and current RV32 linux doesn't even implement highmem.

And then we could get another three page attribute bits in PTE.

> 
> > +++ b/arch/riscv/mm/dma-mapping.c
> 
> This should probably be called dma-noncoherent.c
> 
> It should also have a user visible config option so that we don't
> have to build it for fully coherent systems.
Ok, dma-noncoherent.c is more clear.

> 
> > +void arch_dma_prep_coherent(struct page *page, size_t size)
> > +{
> > +	memset(page_address(page), 0, size);
> 
> No need for this memset, the caller takes care of it.
Ok

> 
> > diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
> > index bd2f2db..f6aaf1e 100644
> > --- a/arch/riscv/mm/ioremap.c
> > +++ b/arch/riscv/mm/ioremap.c
> > @@ -73,7 +73,7 @@ static void __iomem *__ioremap_caller(phys_addr_t addr, size_t size,
> >   */
> >  void __iomem *ioremap(phys_addr_t offset, unsigned long size)
> >  {
> > -	return __ioremap_caller(offset, size, PAGE_KERNEL,
> > +	return __ioremap_caller(offset, size, PAGE_KERNEL_COHERENCY,
> >  		__builtin_return_address(0));
> >  }
> >  EXPORT_SYMBOL(ioremap);
> 
> I think ioremap is a different story, and should be a separate patch.
Ok

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
