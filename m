Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D0CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXJMr2QoQwx9dnn+xUcZVDMUmPMGFgI0+ZJnYfrdou4=; b=CSASyvQVya39+y
	dwhvqHFryqcnSjo3hr12OBRbTK/q1/7QlIA8s3XN7OrTuIY4zEdziY6u8tIQX2ky4nXUQbiTfIyhM
	SOLrB/AxY+UnH6BmGvtGFhyPZfDmePvwqNsGBLEFafDyRE0JAqRL/r1nJjGrTn6k/tmVNRYMZlrxJ
	UTksaaM3684LabZw0dDTLgURiRjehx7Q+n603ok4mEvv6RRL/BGaSH5NSeSbEtaSk8qDWH5sXHKQH
	G1QX3V6vPB312nV4OOFFqEfcyhzuyQ0YHVT5cPosV8SxxuX0pBGseg9V/ML7We3bTqgj0dbsgg67m
	YRhr352UA7aytfHWiong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPK8l-001p4t-Bb; Wed, 02 Mar 2022 08:15:19 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPK8Z-001p1z-NJ; Wed, 02 Mar 2022 08:15:09 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 527A368BEB; Wed,  2 Mar 2022 09:15:01 +0100 (CET)
Date: Wed, 2 Mar 2022 09:15:00 +0100
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
Message-ID: <20220302081500.GB23075@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_001507_914555_150B01C2 
X-CRM114-Status: GOOD (  21.84  )
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

On Tue, Mar 01, 2022 at 06:55:47PM -0800, Stefano Stabellini wrote:
> Unrelated to this specific patch series: now that I think about it, if
> io_tlb_default_mem.nslabs is already allocated by the time xen_mm_init
> is called, wouldn't we potentially have an issue with the GFP flags used
> for the earlier allocation (e.g. GFP_DMA32 not used)? Maybe something
> for another day.

swiotlb_init allocates low memory from meblock, which is roughly
equivalent to GFP_DMA allocations, so we'll be fine.

> > @@ -143,10 +141,15 @@ static int __init xen_mm_init(void)
> >  	if (!xen_swiotlb_detect())
> >  		return 0;
> >  
> > -	rc = xen_swiotlb_init();
> >  	/* we can work with the default swiotlb */
> > -	if (rc < 0 && rc != -EEXIST)
> > -		return rc;
> > +	if (!io_tlb_default_mem.nslabs) {
> > +		if (!xen_initial_domain())
> > +			return -EINVAL;
> 
> I don't think we need this xen_initial_domain() check. It is all
> already sorted out by the xen_swiotlb_detect() check above.

Is it?

static inline int xen_swiotlb_detect(void)
{
	if (!xen_domain())
		return 0;
	if (xen_feature(XENFEAT_direct_mapped))
		return 1;
	/* legacy case */
	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
		return 1;
	return 0;
}

I think I'd keep it as-is for now, as my planned next step would be to
fold xen-swiotlb into swiotlb entirely.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
