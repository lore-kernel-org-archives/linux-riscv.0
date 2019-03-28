Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAABC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:18:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA5E21773
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gGJxaqEP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA5E21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kx1as/dQLGSofgJ/e+k34OD5IjIR/LsP/YLs54aPmz4=; b=gGJxaqEPOr9Nda
	OBRc6I44ITSfI1Au8P96+w+b/qlH68EFN49w+m+VaJPcIYh11N6dUr1WncGdKFbHHFsF2yjUbRYoL
	/uSuLtqpoTsIpy2FjiMCD2g9MPPBUA7IOctmAgnT7Oai+KiA5SLqpAH0ga8qYl1TVQL91kajaxz01
	foQwxOP+UDmP4FpeEFcb6XJH2xCnRXwxKVUA8aTUZvMSDyN+4tUrwJROr5bBMZfYe3B01YXThGbe1
	FK7+taVV55PD5/Mkin1nZZ36y5e/6Qc/HbRqlPX5h17rezvIjr5pqTdZzD1U4pW+RmTtISEM0kjIW
	Z+rVPnOzxCyx8WaguOwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Xj5-0002oX-44; Thu, 28 Mar 2019 16:17:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h9Xj3-0002oE-8q; Thu, 28 Mar 2019 16:17:57 +0000
Date: Thu, 28 Mar 2019 09:17:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Message-ID: <20190328161757.GB27879@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <d60a62cfbbf63382a47e3c2226c5dd6148f8b814.1553647082.git.gary@garyguo.net>
 <20190327072557.GE3210@infradead.org>
 <3bef1053-34b5-08f5-6a90-f9270445129e@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bef1053-34b5-08f5-6a90-f9270445129e@garyguo.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 01:56:28PM +0000, Gary Guo wrote:
> >> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
> >> +	unsigned long addr)
> >> +{
> >> +	__asm__ __volatile__ ("sfence.vma %0, %1"
> >> +			      : : "r" (addr), "r" (0)
> >> +			      : "memory");
> >> +}
> > 
> > Why do we pass the vma argument here even if it is never used?  That
> > just seems to create some rather pointless churn.  Also I'd add
> > local_flush_tlb_mm below local_flush_tlb_page to avoid churn as well,
> > nevermind that it seems the more logical order to me >
> This isn't used now, but we need that for ASID support. It also more 
> consistent with the non-SMP flush signature, and more consistent with 
> code of other architectures.

I'd rather keep it simple for now.  For ASID support I suspect you'll
only need it to get the asid from the mm_struct pointer to by the
vma, right?  I'd rather pass the asid directly in that case.

> >> +static unsigned long tlbi_range_threshold = PAGE_SIZE;
> > 
> > I really hate having this is a tunable in the kernel code.  I think
> > the right answer is to have a device tree entry to carry this number
> > so that the platform can supply it.  Btw, what are examples of
> > platforms that flush globalls vs per-page at the moment?  What is a good
> > larger value for the latter based on your testing?
> > 
> This is discussed in previous versions of this patch, and we arrived at 
> the conclusion that a boot parameter is the best way to do it now, as at 
> the moment we have no other ways to get this information. The actual 
> value really depends on the actual implementation. If the implementation 
> has a super large TLB where full invalidation would be super expensive, 
> they might even want the value to be 511.

Sorry, I might not have been clear above - the tunable is ok for
playing around and benchmarking, but it is not the kind of interface we
should have regular users to poke at for good performance.  So I don't
mind keeping the paramter in, but we also really need to define a way
how the value could be passed through the device tree so that we get
a good default.

And I'd still like an answer for my sectond question above - what
were the good values for say the sifive u54 and qemu in your tests?

> > Also I wonder if we should also split this tunable and the optional
> > global flush into a separate patch.  This is in this first patch
> > just make use of the asid,  and then another patch to add the threshold
> > for doing the full flush.
> I don't think we should. This patch is more like a rewrite to old logic 
> rather than patching things up incrementally.

Well, we have two pretty distinct changes - one is to use a threshold
to do a global(-ish) flush instead of a per-page one, and the other is
to use AISD 0 explicitly.  In Linux we generally try to keep things at
the smallest logical change.  I'm not going to push hard for this, but
that is just how we normally do it.


> >> +	while (start < end) {
> >> +		__asm__ __volatile__ ("sfence.vma %0, %1"
> >> +				      : : "r" (start), "r" (0)
> >> +				      : "memory");
> > 
> > I think this should just call local_flush_tlb_page.
> > 
> I do this to minimise changes we need if we want to add ASID (in which 
> case we want to avoid retrieving ASID from atomic variable multiple times).

We can take vare of that later, preferably with a nice helper that gets
the ASID as an argument (see my local_flush_tlb_page comment above).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
