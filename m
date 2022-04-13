Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70D2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 06:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gN35Mt9gKV5wPJmlihTDIrSGMpfAxJuWnwLftT8vqK0=; b=YLW6jYsAcGYx6O
	RS/lMWewIoHK5E4huYPNWWFbV1H2QOTeRWmC8SKV9LIrlZ93uX6j/xUCM7nIizLFplOCbkpbGZWwK
	s8xJXJjSxp/Jf1yOWnpOkMjhQMLv5UCyc/7rQyC2JIhHKng0yPrMfGMG5BAcIoy6yuVTq4ZuUax/x
	qta7hY8IyK7ZclbZRWUjlyA2kw6TwNq0+zZIkm3r2NZdWDrrnpq6cMheeE7hUDynNdmFCbPDsRfj4
	Yk6ZPZNH810uSkAlzIVGh2EtPNeDnvMYIoaXfd6QKNTHKwc2NpzkFMEpihuTsrnpBRCgKNwa9f3G1
	D3swlbY0AhaWr4AfpEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWVz-00H9az-4z; Wed, 13 Apr 2022 06:30:07 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWMu-00H6D3-NH; Wed, 13 Apr 2022 06:20:46 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5281E68B05; Wed, 13 Apr 2022 08:20:37 +0200 (CEST)
Date: Wed, 13 Apr 2022 08:20:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
Subject: Re: cleanup swiotlb initialization v8
Message-ID: <20220413062037.GA450@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_232044_964964_256DB37F 
X-CRM114-Status: GOOD (  14.97  )
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

On Mon, Apr 04, 2022 at 07:05:44AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series tries to clean up the swiotlb initialization, including
> that of swiotlb-xen.  To get there is also removes the x86 iommu table
> infrastructure that massively obsfucates the initialization path.
> 
> Git tree:
> 
>     git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup

I've updated the git tree above with the commit message nitpicks and
received reviews.  I plan to pull the patches into the dma-mapping
tree after -rc3 is released, so if any involved maintainer is not happy
with the result, please speak up now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
