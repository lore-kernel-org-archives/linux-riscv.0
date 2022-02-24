Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA37FC43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTccGubN53NiuHW0P+iP/RjAWXI19Vl7akaSssURhGE=; b=wi06PwIJNXs4Og
	GRUzY1Cf2SvXvwZRTDJ4mhWqQ9k/B+ub4RyJx9pf0yNW8PiV9/sqGTruJJ5HBNkitTR2YBmjm4nwu
	Tm6BRbbNwVux1sVmnZ9NKyr1hHjgHNzjMzvOqG52LxTC3bKP188GEKB9BMERxOGfUYno5khp7QRtP
	YLn7icgpoQkQDsd/I1HuuON0SPf8nTLqojNP+5ePrqTkd8AMBUng3lrqXF9Ue13q2VkBF/KlT4wO/
	6jggLxeI7v7a17Sr6Hjcs93MN7kHhkJ1SwtJiaag3i7hrqLq7ocDTg4MK0eBWDHEsvMYa/MbE71U8
	O2nljrDRr35hbPTYtLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNH9t-001bAm-5E; Thu, 24 Feb 2022 16:40:01 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNH9g-001b7Y-0Y; Thu, 24 Feb 2022 16:39:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8DAAC68AFE; Thu, 24 Feb 2022 17:39:43 +0100 (CET)
Date: Thu, 24 Feb 2022 17:39:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
Subject: Re: cleanup swiotlb initialization
Message-ID: <20220224163943.GA32088@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
 <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
 <20220224155854.GA30938@lst.de>
 <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_083948_208930_4D8F5E08 
X-CRM114-Status: GOOD (  13.07  )
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

On Thu, Feb 24, 2022 at 11:18:33AM -0500, Boris Ostrovsky wrote:
>
> On 2/24/22 10:58 AM, Christoph Hellwig wrote:
>> Thanks.
>>
>> This looks really strange as early_amd_iommu_init should not interact much
>> with the changes.  I'll see if I can find a AMD system to test on.
>
>
> Just to be clear: this crashes only as dom0. Boots fine as baremetal.

Ah.  I can gues what this might be.  On Xen the hypervisor controls the
IOMMU and we should never end up initializing it in Linux, right?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
