Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21562C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDeyaam79z/dVZQ6wwrCLRO2uDwbR8ugmctQVyG+z9s=; b=o7xmTMJHFfZT1A
	LILDwn5I9WqqrC2vFat4HQ8WzNUG68YQiVqPwnsYft3eVrQDRn4DdSj48etZBvAtnyR3inQkIHXYk
	tJw3lQsb8qmC3EOxKUhXi86CyrHnUyjcgw1O+Dz11RxfHROy0i8U/tL7gH91WVOqeF3rzjPQf2JAf
	wwP7bFHjM/ng56YFSdK7aYZrBetcSCWH+9A+rV45HwErcuHfAGd9LpS/zowVLQMpj+MDs+T0UtCIm
	NUXk2ypO6P+r59xRUbN2JV3erut22A5nAskm6QOuiyvU8npl9+G5NcoStBlfAIv7z3hgXtvuwu2L0
	+Xs1pn3wCPEN0A+BwBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwSpK-00HUJh-GT; Wed, 01 Jun 2022 18:12:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwSp9-00HUH7-Hj; Wed, 01 Jun 2022 18:12:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9BED2CE1D21;
	Wed,  1 Jun 2022 18:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA63C385A5;
	Wed,  1 Jun 2022 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654107120;
	bh=XyRtnaG4f6v1X+0b1Icwpx1CnomvwrWKo4GYEBNHb+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBs/HAWx4uM3HDoEzXU7+T8V9lyNwNqn4zd6Uh/AJGNo4QD8EzwUXHg8SF5aQu/eR
	 anmAddXVYpYTPQXJYiVXSgAM6oeXwkinLakcGmSyuAZtpT4Gg5dXcDILW5BYrqp6yC
	 vfOgfDXfoYgyw9l9+lVWSvldxx5jHryrGn/d5UzcJCJjQVQvAnn5PGnRbongr5jgLY
	 JziHqqThI4bmA2WwIpuZHilJdJjc4uSPMPWYG0WUdO4ZhUny70sDURv0RtrDDn5Tm8
	 XZjMRYHCt4Yp4VSnSP3UbNmDy1oSOc8nqKRVMKzHpT2VEuCPCTYpdk41t0XRp7VTN5
	 o4MHC+cQamxCw==
Date: Wed, 1 Jun 2022 11:11:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org, x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 09/15] swiotlb: make the swiotlb_init interface more
 useful
Message-ID: <Yper7agk7XfCCQNa@dev-arch.thelio-3990X>
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-10-hch@lst.de>
 <YpehC7BwBlnuxplF@dev-arch.thelio-3990X>
 <20220601173441.GB27582@lst.de>
 <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
 <20220601175743.GA28082@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601175743.GA28082@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_111203_812714_E6E5AB79 
X-CRM114-Status: GOOD (  22.53  )
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

On Wed, Jun 01, 2022 at 07:57:43PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 01, 2022 at 10:46:54AM -0700, Nathan Chancellor wrote:
> > On Wed, Jun 01, 2022 at 07:34:41PM +0200, Christoph Hellwig wrote:
> > > Can you send me the full dmesg and the content of
> > > /sys/kernel/debug/swiotlb/io_tlb_nslabs for a good and a bad boot?
> > 
> > Sure thing, they are attached! If there is anything else I can provide
> > or test, I am more than happy to do so.
> 
> Nothing interesting.  But the performance numbers almost look like
> swiotlb=force got ignored before (even if I can't explain why).

I was able to get my performance back with this diff but I don't know if
this is a hack or a proper fix in the context of the series.

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index dfa1de89dc94..0bfb2fe3d8c5 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -276,7 +276,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		      __func__, alloc_size, PAGE_SIZE);
 
 	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
-	mem->force_bounce = flags & SWIOTLB_FORCE;
+	mem->force_bounce = swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
 
 	if (flags & SWIOTLB_VERBOSE)
 		swiotlb_print_info();

> Do you get a similar performance with the new kernel without
> swiotlb=force as the old one with that argument by any chance?

I'll see if I can test that, as I am not sure I have control over those
cmdline arguments.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
