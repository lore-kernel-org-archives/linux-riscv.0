Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5690C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 06:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XASgtAgdHqsGc0anKVrqO+vQdUMHiIrbUhSs5KqxsHU=; b=2udiSx+0btXqnp
	9LZ0e1q8cq1MY4FKXznTLo5X7pMtMwKDOjBpzrs4AhpM3nkngCjGoAv5ryziCrcszXkl0P3K41R5a
	6SJeEHyzDl/Xdmysu+M7a0zltbNrdB0ZaRMavMJl5CIbwC6c7K9cj2UyBwGezp7puM88owdkfCs3p
	xLx2ZVnd8LO1n6LKAMPvBrU7bel9RaOT5AgWJcbvWYtMK3O+YJcvexFEUa3/HRc9cdsketeqDkTvi
	gXS+242KhCbhd+4EvJplG6vIXmrB6eGz5a2uQvxViL4EXWAscIUpYmU8GMwWz/SBURwgqSwvlkLgK
	4oAwQVaHjvhOTRuCyohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne9uF-00BqbJ-Ey; Tue, 12 Apr 2022 06:21:39 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne9u4-00BqYA-0Q; Tue, 12 Apr 2022 06:21:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id CD9FC68AA6; Tue, 12 Apr 2022 08:21:20 +0200 (CEST)
Date: Tue, 12 Apr 2022 08:21:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 10/15] swiotlb: add a SWIOTLB_ANY flag to lift the low
 memory restriction
Message-ID: <20220412062120.GA7796@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-11-hch@lst.de> <Yk4vfAd0J5u+wUsq@char.us.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yk4vfAd0J5u+wUsq@char.us.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_232128_235380_9F0BBCD8 
X-CRM114-Status: GOOD (  16.90  )
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

On Wed, Apr 06, 2022 at 08:25:32PM -0400, Konrad Rzeszutek Wilk wrote:
> > diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
> > index c5228f4969eb2..3b4045d508ec8 100644
> > --- a/arch/powerpc/platforms/pseries/svm.c
> > +++ b/arch/powerpc/platforms/pseries/svm.c
> > @@ -28,7 +28,7 @@ static int __init init_svm(void)
> >  	 * need to use the SWIOTLB buffer for DMA even if dma_capable() says
> >  	 * otherwise.
> >  	 */
> > -	swiotlb_force = SWIOTLB_FORCE;
> > +	ppc_swiotlb_flags |= SWIOTLB_ANY | SWIOTLB_FORCE;
> 
> This is the only place you set the ppc_swiotlb_flags.. so I wonder why
> the '|=' instead of just '=' ?

Preparing for setting others and not clobbering the value.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
