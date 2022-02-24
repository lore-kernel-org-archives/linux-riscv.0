Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF90C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L+Xh61+NKELoU2syLyPkJnQQoHIis91JEckmmbYU7Ss=; b=13TvIOp9x0h0if6v3h2RUJsHJ5
	wM86zizC1bnbN6dBbSFLeYLWVfyT5vJtf0lPObHVUX/GuvcL96ISXdB7c8gyTIIi9fTNTMuRSfIqP
	ChHNZ1Em50mTdcaOZ5nrD6fe1TrYCj6If5UTzRBOb9RtoMigZBbO8zOBLsfzNkMhZSPd0lg4J6SId
	9kLAxNaQDLq7E2EyZtssW4WIH2bw6CjLaqK/6flhde1dnBN8bUyQfo8zAzKVjfFmX6IR8N2mtMY6u
	EM0QJrLgYyLww302bbG6kWoaNuNgMlBheXz0rK28a+ViMI9RS9TNhrZo4iJtVMcfmndqJ8tnWrnEX
	KZVjm0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBBZ-000HKN-Mq; Thu, 24 Feb 2022 10:17:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBBH-000HE6-Ao; Thu, 24 Feb 2022 10:17:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E30E4ED1;
 Thu, 24 Feb 2022 02:17:01 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E609A3F70D;
 Thu, 24 Feb 2022 02:16:54 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 10/11] swiotlb: merge swiotlb-xen initialization into
 swiotlb
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
References: <20220222153514.593231-1-hch@lst.de>
 <20220222153514.593231-11-hch@lst.de>
Message-ID: <e5564871-694e-58ea-a355-5d0c3ce5d025@arm.com>
Date: Thu, 24 Feb 2022 15:46:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-11-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_021703_454672_FC4C0C66 
X-CRM114-Status: GOOD (  12.50  )
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

On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> Allow to pass a remap argument to the swiotlb initialization functions
> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
> from xen_swiotlb_fixup, so we don't even need that quirk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/xen/mm.c               |  23 +++---
>  arch/x86/include/asm/xen/page.h |   5 --
>  arch/x86/kernel/pci-dma.c       |  27 ++++---
>  arch/x86/pci/sta2x11-fixup.c    |   2 +-
>  drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
>  include/linux/swiotlb.h         |   7 +-
>  include/xen/arm/page.h          |   1 -
>  include/xen/swiotlb-xen.h       |   8 +-
>  kernel/dma/swiotlb.c            | 120 +++++++++++++++---------------
>  9 files changed, 102 insertions(+), 219 deletions(-)

checkpatch.pl has some warnings here.

ERROR: trailing whitespace
#151: FILE: arch/x86/kernel/pci-dma.c:217:
+ $

WARNING: please, no spaces at the start of a line
#151: FILE: arch/x86/kernel/pci-dma.c:217:
+ $

total: 1 errors, 1 warnings, 470 lines checked

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
