Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9E0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jxq5G5dum0ozHqbey1QQzLeNZlqjEsyYLEwoVZ2QPU0=; b=KPgW3hE8idupfD
	KpzkvVu0OyX5O+2bKaeg0VcdswApe5nV7qOGRqGkBxEcgFozbQn/prszu4pNdLap8bO/3qgW9J0Jy
	Stn5uD9eGu0M5R5/nUDcBfwb/h7rf69LX2cjfS/iTPhhmtbXuLAPveNEJFthR6yeGE6jc73pu3yMt
	gescN9XPyWNc3TdRTbfGrb79CJN9XLQQuRUlsc2MRoLf1VQOudJcb53IzyDrtWVPsOBlx1kpZltws
	mblSTnTSFtf0QRu12hOl9SPi9lbN1JS6xQ6wZMRwVnz90Ohdf7WBx6QInmSmu0E9HpMOlelkerr+7
	Zg8qHyDAiKNOtVTsaT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAzw-00B7gG-IN; Fri, 04 Mar 2022 16:41:44 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAt2-00B51Z-E0; Fri, 04 Mar 2022 16:34:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E2BFF68AFE; Fri,  4 Mar 2022 17:34:30 +0100 (CET)
Date: Fri, 4 Mar 2022 17:34:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304163430.GA12317@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <20220302081500.GB23075@lst.de>
 <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
 <20220303105931.GA15137@lst.de>
 <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_083436_692503_09FE0112 
X-CRM114-Status: GOOD (  17.76  )
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

On Thu, Mar 03, 2022 at 02:49:29PM -0800, Stefano Stabellini wrote:
> On Thu, 3 Mar 2022, Christoph Hellwig wrote:
> > On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> > > Thinking more about it we actually need to drop the xen_initial_domain()
> > > check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> > > DomU 1:1 mapped).
> > 
> > Hmm, but that would be the case even before this series, right?
> 
> Before this series we only have the xen_swiotlb_detect() check in
> xen_mm_init, we don't have a second xen_initial_domain() check.
> 
> The issue is that this series is adding one more xen_initial_domain()
> check in xen_mm_init.

In current mainline xen_mm_init calls xen_swiotlb_init unconditionally.
But xen_swiotlb_init then calls xen_swiotlb_fixup after allocating
the memory, which in turn calls xen_create_contiguous_region.
xen_create_contiguous_region fails with -EINVAL for the
!xen_initial_domain() and thus caues xen_swiotlb_fixup and
xen_swiotlb_init to unwind and return -EINVAL.

So as far as I can tell there is no change in behavior, but maybe I'm
missing something subtle?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
