Return-Path: <SRS0=K/tH=SZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EF0C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 15:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310B82175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 15:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3+ULzgC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxjGlt/R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310B82175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHbQPhucmg1yXFAzAx9EadpDLupfGBtaOM4g4VGzdCw=; b=L3+ULzgCALhGVB
	epLwpQXjfCCSl61NaiuCJEirrJsbSjF9nFESPR8WUqB8Gj/xNyZTYd02eQdQgugsO5aXPlOTImaUC
	G7pWkb4PfZwcQ+1MJBxcs1PMcBG7aTEkqCzNs2CGlrpLuiHrcz2V9Chxxq//boTTjMd4kQOjfzCFl
	7cA1iENnuMzleDwnXuCLjtUqDc95nxpPaqCaQYjhJenSWH6VqfiqIjzvBqcBX/0mgFnqc0HBLoly7
	kQWMGWTuzuFRXJixSQBumlC1AoPelvEcuYYYeosN8WS3hRsfmyAzsWnlcn3dHnRXGvFdmPQ7CKP3G
	ZqGyPlB7bCRV93217CYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIxdN-0004FM-EP; Tue, 23 Apr 2019 15:47:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIxdI-0004ER-0b
 for linux-riscv@lists.infradead.org; Tue, 23 Apr 2019 15:46:59 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E36B02175B;
 Tue, 23 Apr 2019 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556034415;
 bh=xlGscSs9dL++G38J6mR9vhBpBgSSGaJk6NuPAmkk4ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxjGlt/RLN5FWJu3zm9yn7ED1H8Wq1e8MepLObKBUMimx+34tJgixpBn+zxiMcgdo
 tu7FzUwnpdYI7OVVF28cPpdmDsB6FN5xOUi2vFZeigTCAgcEJ556VywrxjCHFr0qF2
 rBMnPVss4iyiv2MPvrB5GQIkiGcFw4Ds6gd6F/kQ=
Date: Tue, 23 Apr 2019 23:46:42 +0800
From: Guo Ren <guoren@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Message-ID: <20190423154642.GA16001@guoren-Inspiron-7460>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de>
 <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423055548.GA12365@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_084656_090643_2FF8297B 
X-CRM114-Status: GOOD (  24.83  )
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

On Tue, Apr 23, 2019 at 07:55:48AM +0200, Christoph Hellwig wrote:
> On Tue, Apr 23, 2019 at 08:13:48AM +0800, Guo Ren wrote:
> > > We should probably start a working group for this ASAP unless we can
> > > get another working group to help taking care of it.
> > Good news, I prefer to use instructions directly instead of SBI_CALL.
> > 
> > Our instruction is "dcache.c/iva %0" (one cache line) and the parameter is
> > virtual address in S-state. When get into M-state by SBI_CALL, we could
> > let dcache.c/iva use physical addres directly and it needn't kmap page
> > for RV32 with highmem (Of cause highmem is not ready in RV32 now).
> 
> So you only have one instruction variant?  Normally we'd have two or
> three to implement the non-coherent DMA (or pmem) semantics:
dcache.c/iva means three instructions:
 - dcache.cva %0  : writeback     by virtual address cacheline
 - dcache.iva %0  : invalid       by virtual address cacheline
 - dcache.civa %0 : writeback+inv by virtual address cacheline

We also have memory barrier instructions, ref:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/csky/include/asm/barrier.h

> 
> cache writeback, cache invalidate and potentially cache writeback +
> invalidate to optimize that case.  Here is the table how Linux
> uses them for DMA:
> 
>           |   map          ==  for_device     |   unmap     ==  for_cpu
>           |----------------------------------------------------------------
>  TO_DEV   |   writeback        writeback      |   none          none
>  FROM_DEV |   invalidate       invalidate     |   invalidate*   invalidate*
>  BIDI     |   writeback+inv    writeback+inv  |   invalidate    invalidate
> 
>      [*] needed for CPU speculative prefetches
> 
> 
> We already have a discussion on isa-dev on something like these
> instructions:
> 
> https://groups.google.com/a/groups.riscv.org/forum/#!msg/isa-dev/qXbzqaQbDXU/4ThcEAeCCAAJ
> 
> It got a little side tracked, both due to the usual noise on isa-dev
> and due to the proposal including a lot more instructions that might be
> a little more contentious, but it might be a good start to bring this
> into a working group.
I think using sbi_call as a temporary solution is a good choice before
the instruction is determined.

> 
> > > Also is this really a coherent flag, or an 'uncached' flag like in
> > > many other architectures?
> > There are a lot of features about coherency attributes, eg: cacheable,
> > bufferable, strong order ..., and coherency is a more abstract name to
> > contain all of these. In our hardware, coherence = uncached +
> > unbufferable + (stong order).
> > 
> > But I'm not very care about the name is, uncached is also ok. My key
> > point is the bits of page attributes is very precious and this patch
> > will use the last unused attribute bit in PTE.
> 
> I don't care about the name actually, more about having defined semantics.
> Totally uncached should include unbuffered.  I don't think we need the
> strong ordering for DMA memory either.
Yes, memory don't need strong order and strong order in PMA also implies
uncached, unbuffered for IO address. If the entry of PMA is strong
order, the page mapping must be uncached + unbuffered + strong-order
without _PAGE_COHENCY in PTE.

> 
> > Another point is we could get more attribute bits by modify the riscv
> > spec:
> >  - Remove Global bit, I think it's duplicate with the User bit in linux.
> 
> It is in Linux, but it is conceptually very different.
Yes, but hardware could ignore one of them and in riscv linux
_PAGE_GLOBAL is no use at all, see:
grep _PAGE_GLOBAL arch/riscv -r

In fact, the _PAGE_KERNEL for pte doesn't contain _PAGE_GLOBAL and it
works on FU540 and qemu. As I've mentioned page attribute bits is very
precious, define a useless bit make people confused.

> 
> >  - Change _PAGE_PFN_SHIFT from 10 to 12, because the huge pfn in RV32 is
> >    very useless and current RV32 linux doesn't even implement highmem.
> 
> This would seem sensible to me, but I'm not sure everyone agrees.  Even
> then we are very late in the game for changes like that.
Agree.

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
