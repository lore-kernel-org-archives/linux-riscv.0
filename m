Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BADCC2B9F7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:23:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B42613BF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7B42613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrEBc6UgGDhxiX33rwjwqX8j7Sf3ZLLPm/WrXelGbWc=; b=zWeQ4VvtrsCDHC
	r3Hp3XTFlTSj/YIhMH4X4hraiRHz/lxIVcIF7JTTZFzZq8tafWP+9BnfzMkYFY2Uh7ZIQLq5FAW3j
	t3sCnQfqZBMKsroXLea4mW8lFDxiO5wlu6DZhqrVd5mABOMCqpnJ1U7AV0Mqb/DpP5OK5t3sddCfr
	AGS0GrKk3BbD05uTeDt2ABAMkzrxPll5OTrs+nTb5XYFxPhhW8jJIBBzXon/QD7GXnkSM1lUWQs6y
	gL9I71ofbkpKaTDKy8zXHxNMl1+mugFG3ClR0s0fLhAckNltcWnTMoMU2ZXtruNP5aiEFhp83959d
	qxgwp/wSnbd2cGF0xCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llm0i-00B9w0-AZ; Wed, 26 May 2021 05:23:16 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llm0f-00B9uD-9s
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 05:23:14 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 46E216736F; Wed, 26 May 2021 07:23:09 +0200 (CEST)
Date: Wed, 26 May 2021 07:23:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 2/2] riscv: Use use_asid_allocator flush TLB
Message-ID: <20210526052308.GA29213@lst.de>
References: <1621945447-38820-1-git-send-email-guoren@kernel.org>
 <1621945447-38820-3-git-send-email-guoren@kernel.org>
 <20210525123556.GB4842@lst.de>
 <CAJF2gTSa3LJKTRBv6NOvg0HtoKPL-5YyP6wY2=AJhQtAZwBBzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSa3LJKTRBv6NOvg0HtoKPL-5YyP6wY2=AJhQtAZwBBzg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_222313_557098_7E059DDE 
X-CRM114-Status: GOOD (  12.64  )
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

On Wed, May 26, 2021 at 11:12:40AM +0800, Guo Ren wrote:
> > static inline void local_flush_tlb_range_asid(unsigned long start,
> >                 unsigned long size, unsigned long asid)
> >
> > > +{
> > > +     unsigned long tmp = start & PAGE_MASK;
> > > +     unsigned long end = ALIGN(start + size, PAGE_SIZE);
> > > +
> > > +     if (size == -1) {
> > > +             __asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
> > > +             return;
> >
> > Please split the global (size == -1) case into separate helpers.
> Do you mean:

No.  Basically a

static inline void local_flush_tlb_ll_asid(unsigned long asid)
{
	__asm__ __volatile__ ("sfence.vma x0, %0"
				:
				: "r" (asid)
				: "memory");
}

and

static inline void local_flush_tlb_range_asid(unsigned long start,
		unsigned long size, unsigned long asid)

{
	unsigned long end = ALIGN(start + size, PAGE_SIZE), tmp;

	for (tmp = start & PAGE_MASK; tmp < end; tmp += PAGE_SIZE) {
		__asm__ __volatile__ ("sfence.vma %0, %1"
					:
					: "r" (tmp), "r" (asid)
					: "memory");
	}
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
