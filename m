Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3840C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aDq9dwlQVTcfsoXpC6VYDIlW8EZUP6Ixy/mwYUArMw=; b=r/SNSrSApXI4aG
	xDSwlNH7FGe6zSZ5I8YtofSYQKE479n2hKYyKnxDkvLsbP66TQ1YkR9S8qVpwgQ6du0Sl2wPSz4Kw
	q4SiePGzMKKfGDCXRRwV0VVUtALaPPTVEL7ZoKSAQgx+9EG4W0E0lw5Yy7nYAPUKxn+MsPyl6/rId
	zkI8lQmz2j3UyAexI1EbSyweqnvkXRksgXSQNT1euJJrkhsxnacjX95OnEp0p3eeEtGGCLQIGYADs
	f07ZQJ1Ve5bdAkPI+MmBxdMW/+2AT0Iy6vzmxcrjZtu0kysV8WfkVSTA1xMDuKysTrQBfUk+HdahU
	cp9TsZ0CX+2uxlrCVSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIHY-00Gwyr-0H;
	Tue, 23 Jan 2024 15:01:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIHV-00GwxY-1r;
	Tue, 23 Jan 2024 15:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PepByJiWQ5z0YJAy3zsX5i+pG7M9t28NlsHRNrHyzFg=; b=OZ4uDMvo60iZ4l06WQT6UPpOyK
	1Mzz1amI2B4lmc7SzQBo9/H5nZHwSc+ahhYWItLeLfbqvNQjOpLZ379CUtpyrKiJpaFB3y3qceoFn
	2/09mBIgxlyPrDWwBI1N1vIcVhBAJ+ccP2Eft8qdX7sawkIRu0Y4eD33nl5AX1fWh4yZRXAHa0diJ
	xtf9jKwnR9O51wT9yPKs25kKmm0Ym9Nc1WnmkYd5euK/RIRwr1nWxHB5018vQ5PnPMYfUbcXkcguy
	WziupYXg/e8D0xyqPtbSRcqVXqNtY1gEyT+tocZwXdwgad56hM1QmUaMd0kzNvFae844ES7sQELU7
	yz18rMEQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSIHS-00000003Un2-0lR2;
	Tue, 23 Jan 2024 15:01:38 +0000
Date: Tue, 23 Jan 2024 15:01:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Message-ID: <Za_U0kYHGFkJdSss@casper.infradead.org>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
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

On Tue, Jan 23, 2024 at 10:34:21AM +0000, Ryan Roberts wrote:
> > +#define PFN_PTE_SHIFT		PAGE_SHIFT
> 
> I think this is buggy. And so is the arm64 implementation of set_ptes(). It
> works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
> kept contigously, so if you happen to be setting a mapping for which the
> physical memory block straddles bit 48, this won't work.

I'd like to see the folio allocation that can straddle bit 48 ...

agreed, it's not workable _in general_, but specifically for a memory
allocation from a power-of-two allocator, you'd have to do a 49-bit
allocation (half a petabyte) to care.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
