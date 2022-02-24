Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91A3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BUSgnvlDUDcjImZTNQG9GC1MeXEYyhmQ7K/o+c8vuWw=; b=hHozBYgIik6Lrm8sZk1QxbUmpb
	mIvALQoy9lt9YUbR3BQpmpZ/YeK/kiroERgsaRGxXa0Fh9pYRclvuvKicJ8u/5Kj1anHLMazBfNh5
	Ypc58t4Z+2eO6fUO+w8KylmG7fs/CJx/EtsZaPV5gjZy0GP38p63DKiw9AFi7fYl3V9tI7J1ugKON
	S+a/B00FEreC+Ww0/y1kpuD/Hh9OAEyV/cRYEAxcSEBApblbizzDCDVURVh11OFJXslhXKZ51LUa1
	tIiuCxN5zyj8EFDyuOlPx9e8a8opwH7lcQl5egznMcFQINHqZtpr4zdMIIDbivYmbTATjDXG/tIf0
	l99Dij3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBDS-000HvL-OA; Thu, 24 Feb 2022 10:19:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBDE-000Hps-Bj; Thu, 24 Feb 2022 10:19:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44D891476;
 Thu, 24 Feb 2022 02:19:03 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAE743F70D;
 Thu, 24 Feb 2022 02:18:56 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
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
 <20220222153514.593231-8-hch@lst.de>
Message-ID: <ff355270-b389-0f7a-e384-7c8a9ed9c615@arm.com>
Date: Thu, 24 Feb 2022 15:48:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-8-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_021904_500075_6ABAFE3A 
X-CRM114-Status: GOOD (  13.82  )
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
> The IOMMU table tries to separate the different IOMMUs into different
> backends, but actually requires various cross calls.
> 
> Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
> in pci-dma.c and then just call into the IOMMU drivers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/ia64/include/asm/iommu_table.h    |   7 --
>  arch/x86/include/asm/dma-mapping.h     |   1 -
>  arch/x86/include/asm/gart.h            |   5 +-
>  arch/x86/include/asm/iommu.h           |   6 ++
>  arch/x86/include/asm/iommu_table.h     | 102 ----------------------
>  arch/x86/include/asm/swiotlb.h         |  30 -------
>  arch/x86/include/asm/xen/swiotlb-xen.h |   2 -
>  arch/x86/kernel/Makefile               |   2 -
>  arch/x86/kernel/amd_gart_64.c          |   5 +-
>  arch/x86/kernel/aperture_64.c          |  14 ++--
>  arch/x86/kernel/pci-dma.c              | 112 ++++++++++++++++++++-----
>  arch/x86/kernel/pci-iommu_table.c      |  77 -----------------
>  arch/x86/kernel/pci-swiotlb.c          |  77 -----------------
>  arch/x86/kernel/tboot.c                |   1 -
>  arch/x86/kernel/vmlinux.lds.S          |  12 ---
>  arch/x86/xen/Makefile                  |   2 -
>  arch/x86/xen/pci-swiotlb-xen.c         |  96 ---------------------
>  drivers/iommu/amd/init.c               |   6 --
>  drivers/iommu/amd/iommu.c              |   5 +-
>  drivers/iommu/intel/dmar.c             |   6 +-
>  include/linux/dmar.h                   |   6 +-
>  21 files changed, 115 insertions(+), 459 deletions(-)
>  delete mode 100644 arch/ia64/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/swiotlb.h
>  delete mode 100644 arch/x86/kernel/pci-iommu_table.c
>  delete mode 100644 arch/x86/kernel/pci-swiotlb.c
>  delete mode 100644 arch/x86/xen/pci-swiotlb-xen.c

checkpatch.pl has some warnings here.

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
deleted file mode 100644

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#496: FILE: arch/x86/kernel/pci-dma.c:171:
+               printk(KERN_INFO "PCI-DMA: "

WARNING: quoted string split across lines
#497: FILE: arch/x86/kernel/pci-dma.c:172:
+               printk(KERN_INFO "PCI-DMA: "
+                      "Using software bounce buffering for IO (SWIOTLB)\n");

ERROR: trailing whitespace
#881: FILE: drivers/iommu/amd/iommu.c:1837:
+^Iif (iommu_default_passthrough() || sme_me_mask) $

total: 1 errors, 3 warnings, 389 lines checked

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
