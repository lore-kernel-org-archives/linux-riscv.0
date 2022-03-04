Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51DBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P095ikzsbZeAK+UkA6ZaKtt43wfPvFAwc37ia5dfXOQ=; b=JlIyKdkH/hhXN7
	/G/o0/0cj0joJHDkqybEdbBNF1k3OVIDV0psdGPz36BwvYx4SQqZTfyTdr5Z/jeN2UXE2bBuyLXzH
	0Qgd9X1T2FK9TgqkcqI4YIyxwFNZ3tmt5705LqFYKDSRLRj9DSdIz411YCjyFA97BUWVnFgB4A/bt
	t+VuU4633Nph/JnFNI9kJ/EGh7vy3Mim7IC6hrWIszIMFP/qYIjcCns2tc3e+Fe54mdo8sjYlSuqO
	uodx7Y9ZGFDQFwt6lyyYfCRP8qQwN83aBuimvIv2dxd64u4DHW/N2CympTXyasGGueVcbPCEPeybx
	GFVCTKpBv0IxAfC1H9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQBxg-00BQPE-6h; Fri, 04 Mar 2022 17:43:28 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQBxS-00BQK1-HR; Fri, 04 Mar 2022 17:43:15 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 18C7068BEB; Fri,  4 Mar 2022 18:43:09 +0100 (CET)
Date: Fri, 4 Mar 2022 18:43:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 iommu@lists.linux-foundation.org, x86@kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
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
Message-ID: <20220304174308.GA13515@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
 <20220304172859.GA12860@lst.de>
 <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_094314_739330_43057695 
X-CRM114-Status: GOOD (  16.79  )
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

On Fri, Mar 04, 2022 at 12:36:17PM -0500, Boris Ostrovsky wrote:
>>> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.
>> That looks like the swiotlb buffer did not get initialized at all, but I
>> can't really explain why.
>>
>> Can you stick in a printk and see if xen_swiotlb_init_early gets called
>> at all?
>
>
>
> Actually, that's the only thing I did do so far and yes, it does get called.

So, specifically for "x86: remove the IOMMU table infrastructure" I
think we need the one-liner below so that swiotlb_exit doesn't get called
for the Xen case.  But that should have been fixed up by the next
patch already.

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 2ac0ef9c2fb76..1173aa282ab27 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -70,7 +70,7 @@ static void __init pci_xen_swiotlb_init(void)
 	if (!xen_initial_domain() && !x86_swiotlb_enable &&
 	    swiotlb_force != SWIOTLB_FORCE)
 		return;
-	x86_swiotlb_enable = false;
+	x86_swiotlb_enable = true;
 	xen_swiotlb = true;
 	xen_swiotlb_init_early();
 	dma_ops = &xen_swiotlb_dma_ops;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
