Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EBCC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248EA2070B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nFUwOyqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 248EA2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jC2P1aNluBIFDrfZ/RqODJIQ5y4/YcDGzQpBIpF8tB8=; b=nFUwOyqPUTgAJ0
	+k41CgWuWjgRHz9ZxxjIj60Wfb8kP9g89Q8NMzSG/+lLp/10SrT/dLKzg9GNa6MK5weruzdHGupwi
	96NEnx0jPw9Boj1cJRH+/v4yPcHKPu4nTF6zKZ+J3rv8ZGFiZxrz0Vf1DYnSmx7C+O69/uqwl5lc9
	wfA31c3xl1YRU+PGzrhRxOJUK4SREn+SiBnGFW6t7qb2yJ7sgNn6hB/uLi2ciAScQAktZz23irf+P
	xkaDaNuHNHZk1bi9B2NdTsNwZIZWPweUqD5Na1QQoal9BsoOcjs4ci/yLF6ecN0/NEnS3/V37QsCc
	NAb+l9B2ix95vTGcdrTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9YJR-0003xw-Qh; Thu, 28 Mar 2019 16:55:33 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h9YJP-0003xc-NY; Thu, 28 Mar 2019 16:55:31 +0000
Date: Thu, 28 Mar 2019 09:55:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Message-ID: <20190328165531.GA10231@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <d60a62cfbbf63382a47e3c2226c5dd6148f8b814.1553647082.git.gary@garyguo.net>
 <20190327072557.GE3210@infradead.org>
 <3bef1053-34b5-08f5-6a90-f9270445129e@garyguo.net>
 <20190328161757.GB27879@infradead.org>
 <ad35a3db-cfe2-f37f-b520-fc67091e8e9e@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad35a3db-cfe2-f37f-b520-fc67091e8e9e@garyguo.net>
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

On Thu, Mar 28, 2019 at 04:39:53PM +0000, Gary Guo wrote:
> > I'd rather keep it simple for now.  For ASID support I suspect you'll
> > only need it to get the asid from the mm_struct pointer to by the
> > vma, right?  I'd rather pass the asid directly in that case.
> > 
> 
> Yes, just takes it from mm_struct. But the key point is to keep it 
> similar to the local_flush_tlb_page.

And I'd much rather not pass unused argument that also require
duplicating the inline assembly code.

> > And I'd still like an answer for my sectond question above - what
> > were the good values for say the sifive u54 and qemu in your tests?
> > 
> QEMU currently treats all SFENCE.VMA as global. Technically the QEMU's 
> implementation can be modified to do page-level flush instead but the 
> performance will not differ, as the dominating factor is resetting jump 
> cache.
> 
> I don't have a SiFive board so I can't tell what's a good value for that.
> 
> On a hypothetical platform that I am working at (simulation only) we can 
> benefit even when setting it to 511 (max allowed, as if value >=512 we 
> don't know if a non-leaf entry is changed, in which case spec mandates a 
> full flush).
> 
> So this really depends on the platform.

Ok, so before moving on we really should figure out a good way for
the currently only support (well mostly supported) hardware platform
and figure out a way to pass that through DT.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
