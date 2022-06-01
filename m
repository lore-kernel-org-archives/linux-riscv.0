Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390D9CCA473
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kbfh3lNBP+LowV3lFMDB5QteGS+bcdzznv7gV81jlyE=; b=sRynpgNPHHfPow
	zh0uwDHEdgtPk7WW2Kc2l6XxdXqs9BgPQEs0qCOkUGAboE1p6Q5V7x0NIm7I1DQSKAkmmjjR9oKii
	7QP5WZPBpgcCAR+LI4uTr4JBa+NIY8S+AwrLCFX/uK8gXDfCHtFCkllmD07GknjmUODkeysscrGz0
	O14UELjteFvWNc4qVh0613gMxHoNspeDI2fv8HYlKkG09bAttwDyt3pCj4QLD3jdenwpoipVaK2Hb
	nQLHLczdNI1gZ1qJ2o4Gdvd/COvfI2tVTwGRNoEjIgGmB0ockXuFKAGCapzOA4c/yTSCwkLKpzzIy
	czhvE7pUbXlv+rE1lD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwSbb-00HPQu-K6; Wed, 01 Jun 2022 17:58:03 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwSbQ-00HPKK-9u; Wed, 01 Jun 2022 17:57:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id D34A568C4E; Wed,  1 Jun 2022 19:57:44 +0200 (CEST)
Date: Wed, 1 Jun 2022 19:57:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
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
Message-ID: <20220601175743.GA28082@lst.de>
References: <20220404050559.132378-1-hch@lst.de> <20220404050559.132378-10-hch@lst.de> <YpehC7BwBlnuxplF@dev-arch.thelio-3990X> <20220601173441.GB27582@lst.de> <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_105752_536048_061F2A00 
X-CRM114-Status: GOOD (  17.00  )
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

On Wed, Jun 01, 2022 at 10:46:54AM -0700, Nathan Chancellor wrote:
> On Wed, Jun 01, 2022 at 07:34:41PM +0200, Christoph Hellwig wrote:
> > Can you send me the full dmesg and the content of
> > /sys/kernel/debug/swiotlb/io_tlb_nslabs for a good and a bad boot?
> 
> Sure thing, they are attached! If there is anything else I can provide
> or test, I am more than happy to do so.

Nothing interesting.  But the performance numbers almost look like
swiotlb=force got ignored before (even if I can't explain why).
Do you get a similar performance with the new kernel without
swiotlb=force as the old one with that argument by any chance?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
