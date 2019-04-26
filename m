Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D56EC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 16:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04892077B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 16:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nwipAjwN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1pp8Xn8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D04892077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZcsOlK9WQGK5BJkBploQqiG8n2JGP4n7yzYHh38BtM=; b=nwipAjwN0FXpfx
	DmHK5rpb+5RXTzWlBDM2cgsBQUJGaWIt1OMi3bmG9b9A/rkwN8QOC6GosUOU9dEH1BBiae5H3j1dl
	etOiyHiY2tYbz09my5sD0aBSyRu5yD6CGudFT4mPRHspDGZ1+PTys5BDvXgMcbWWtF3eYRx+xSp55
	vNzDJqyM+BtqI2hH2poZwDqWmCXTjCm6CEO09sSdKM6IPXFwJa1pV/f8q53eYM4WSNXPF9dRZG4Qy
	7DQJ9kQcL/5LKdLFjHnfeEovk9TBi0S1Uoe5tlas78WZpZeJ5GIw7GBoDRBMRi2sHs/1Hwwxq86DW
	uCv9AlJ1OeKL5tgp5mPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3Md-0007uU-3b; Fri, 26 Apr 2019 16:06:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3Ma-0007u4-EL
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 16:06:13 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C6EC2077B;
 Fri, 26 Apr 2019 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556294769;
 bh=355LDZZF5SsAW/JoaL+5ckFu/tIXsBseyPFco5aHxrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s1pp8Xn88ach76ZLeCYA2w9qxm1lphHGjNx7oO7GATQVaoyWuXOvAd/SYTJlD5UoP
 WatczYj6RKG+1P1kAzs5c0tssr3mfz8HNf4CKc+jaXeTljvTVubWZPB7LQhmolXKUF
 ewNIp/eT/coCaaNXeplTnWhSwbkEiewrKuZmg95w=
Date: Sat, 27 Apr 2019 00:05:58 +0800
From: Guo Ren <guoren@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Message-ID: <20190426160558.GA10540@guoren-Inspiron-7460>
References: <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de>
 <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
 <20190424020803.GA27332@guoren-Inspiron-7460>
 <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190424055703.GA3417@guoren-Inspiron-7460>
 <4e6b0816-3fe9-8c0b-a749-f7f6ef7e5742@garyguo.net>
 <20190424142306.GB20974@lst.de>
 <CAK8P3a36V93mKLuR-6hZzNX+j0HVpR_9bM41653PQuD+1xMTVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a36V93mKLuR-6hZzNX+j0HVpR_9bM41653PQuD+1xMTVw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_090612_519137_87778A66 
X-CRM114-Status: GOOD (  24.23  )
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Andrew Waterman <andrew@sifive.com>,
 "tech-privileged@lists.riscv.org" <tech-privileged@lists.riscv.org>,
 Anup Patel <anup.patel@wdc.com>, Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincentc@andestech.com>,
 "ren_guo@c-sky.com" <ren_guo@c-sky.com>, Greentime Hu <green.hu@gmail.com>,
 Gary Guo <gary@garyguo.net>, Scott Wood <swood@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

On Thu, Apr 25, 2019 at 11:50:11AM +0200, Arnd Bergmann wrote:
> On Wed, Apr 24, 2019 at 4:23 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, Apr 24, 2019 at 12:45:56PM +0000, Gary Guo wrote:
> > > The RISC-V privileged spec is explicitly designed to allow the
> > > techniques described above (this is the sole purpose of MSTATUS.TVM). It
> > > might be as high performance as a hardware with H-extension, but is
> > > definitely a legit use case. In fact, it is vital for use cases like
> > > recursive virtualization.
> > >
> > > Also, I believe the PTE format of RISC-V is already frozen -- therefore
> > > it is impossible now to merge GLOBAL and USER bit, nor to replace RSW
> > > bit with another bit.
> >
> > Yes, I do not think we can just repurpose a bit.  Even using a currently
> > unused one would require some gymnastics.
> >
> > That being said IFF we want to support non-coherent DMA (and I think we
> > do as people glue together their SOCs using shoestring and paper clips,
> > as already demonstrated by Andes and C-SKY in RISC-V space, and most
> > arm, mips and ppc SOCs) we need something like this flag.  The current
> > RISC-V method that only allows M-mode to set up such attributes on
> > a small number or PMP regions just doesn't work well with the way how
> > Linux and most non-trivial OSes implement DMA memory allocations.
> >
> > Note that I said well - in theory we can have a firmware provided
> > uncached pool - that is what Linux does on most nommu (that is without
> > pagetables) ports, but the fixed sized pool really does suck and will
> > make users very unhappy.
> 
> You could probably get away with allowing uncached mappings only
> for huge pages, and using one or two of the bits the PMD for it.
> This should cover most use cases, since in practice coherent allocations
> tend to be either small and rare (device descriptors) or very big
> (frame buffer etc), and both cases can be handled with hugepages
> and gen_pool_alloc, possibly CMA added in since there will likely
> not be an IOMMU either on the systems that lack cache coherent DMA.
Generally attributs in huge-tlb-entry and leaf-tlb-entry should be the
same. Only put _PAGE_CACHE and _PAGE_BUF bits in huge-tlb-entry sounds
a bit strange.

The gen_pool_alloc only 256KB by default, but a huge tlb entry is 4MB.
Hardware couldn't setup vitual-4MB to a phys-256KB range mapping in TLB.

> 
> One downside is that you need a little more care for drivers that
> use dma_mmap_coherent() to expose coherent buffers to user space.
> 
> Two other points about the proposal:
> - Aside from completely uncached/unbuffered mappings, you typically
>   want uncached/buffered mappings to cover dma_alloc_wc() that is
>   typically used for frame buffers etc that need write-combining to get
>   acceptable performance
I agree dma_alloc_wc is necessary, and we need add another more attribute
bit in PTE: _PAGE_BUF. 
Perhaps using _PAGE_BUF + _PAGE_CACHE are better then _PAGE_CONHENCY.

> - you need to decide what is supposed to happen when there are
>   multiple conflicting mappings for the same physical address.
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
What's the mulitple confilcing mappings ?

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
