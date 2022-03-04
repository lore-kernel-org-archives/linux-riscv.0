Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BCAC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nYB1MS72T81frUidxQ8fUkmoe65xcHcWG6b4kdBmmc=; b=UBaHYfuda1NmND
	WEHupetKnFFnem1gkgAyH6kFavSYCQlXxOysd1mxX1aSPQJ1JZDJaNP1W4petd6O01NoEJlup6C70
	PFURxULf/Yz1rzPvKNnJT1tNfjim1mNT9QgtdSEjdjBDrX3WRsRLwLpsJJ3A32IdLndTt1d7Uz+X3
	fdtNxXRDun4YZI7Dgir4NBeVWtyOzzkJQIw2kHlo9fTVJQnCYJ0f4d7J60DmEs3OfMjaKO1i51I7c
	rae9vfrUqvymXTp6UepKm26i/JDBIFS8MoP/mpP6pBpmZLJkKrPlDxUBjShFI805K6UTNFQvkQ+qR
	4wIEVVJ0LENImVm15WVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQBkj-00BLra-SR; Fri, 04 Mar 2022 17:30:05 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQBjl-00BLK6-BS; Fri, 04 Mar 2022 17:29:06 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id C0EE168AFE; Fri,  4 Mar 2022 18:28:59 +0100 (CET)
Date: Fri, 4 Mar 2022 18:28:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
Message-ID: <20220304172859.GA12860@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_092905_576700_0D93CBDA 
X-CRM114-Status: GOOD (  13.91  )
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

On Wed, Mar 02, 2022 at 08:15:03AM -0500, Boris Ostrovsky wrote:
> Not for me, I fail to boot with
>
> [   52.202000] bnxt_en 0000:31:00.0: swiotlb buffer is full (sz: 256 bytes), total 0 (slots), used 0 (slots)
>
> (this is iscsi root so I need the NIC).
>
>
> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.

That looks like the swiotlb buffer did not get initialized at all, but I
can't really explain why.

Can you stick in a printk and see if xen_swiotlb_init_early gets called
at all?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
