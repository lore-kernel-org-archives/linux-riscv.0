Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9D2C3601A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 11:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSoU2wxv0dih0j2aDh9ZTKLAKHwIJzGHXIGHXR2LiMk=; b=d2sUWQq/ZE4Ci4
	iv1x1wUaX1Qi1BZqtnYBt1Z7yIsOrynehpgEF9igd/VzWhf9J47Pp+0De81phgYFeTDSdtbEZO1ZK
	8s1cAeR6z80v6fG7CIzzCKxX2mcao893JtHkYpDfk2NrG952lOuu7wQmKgBfyZcxqDR3OUBG2a78w
	n4Q5dQnlTKOYYWEGukn2rs3IYQPMXzKcy86/R60KQ1V8qJKh9Lelv8XkmWid49mdtLQWyIwDc4PMW
	cLVrT95Te68k8NqJy/B1AjH8St+eQd1lNMNGtur5hHCk3W7N2UfmGNMY0TjmNc+C9fkfmwnRFUHJf
	sz8X2m4fDPc4g975ljhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwHH-00000005u1I-2zBq;
	Wed, 02 Apr 2025 11:29:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwHE-00000005u0N-0Ude
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 11:29:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83758106F;
	Wed,  2 Apr 2025 04:29:02 -0700 (PDT)
Received: from [10.57.67.12] (unknown [10.57.67.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 417F23F694;
	Wed,  2 Apr 2025 04:28:57 -0700 (PDT)
Message-ID: <8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
Date: Wed, 2 Apr 2025 12:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32 bit I/O bus
 platform
To: Xu Lu <luxu.kernel@bytedance.com>, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, alex@ghiti.fr
Cc: lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250325144252.27403-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_042900_250963_0FF85844 
X-CRM114-Status: GOOD (  17.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2025-03-25 2:42 pm, Xu Lu wrote:
> Introduce a new configuration CONFIG_RISCV_IOMMU_32BIT to enable
> splitting 8-byte access into 4-byte transactions for hardware platform
> whose I/O bus limits access to 4-byte transfers.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>   drivers/iommu/riscv/Kconfig |  9 +++++++++
>   drivers/iommu/riscv/iommu.h | 28 +++++++++++++++++++++++-----
>   2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
> index c071816f59a6..b7c9ea22d969 100644
> --- a/drivers/iommu/riscv/Kconfig
> +++ b/drivers/iommu/riscv/Kconfig
> @@ -18,3 +18,12 @@ config RISCV_IOMMU_PCI
>   	def_bool y if RISCV_IOMMU && PCI_MSI
>   	help
>   	  Support for the PCIe implementation of RISC-V IOMMU architecture.
> +
> +config RISCV_IOMMU_32BIT
> +	bool "Support 4-Byte Accesses on RISC-V IOMMU Registers"
> +	depends on RISCV_IOMMU
> +	default n
> +	help
> +	  Support hardware platform whose I/O bus limits access to 4-byte
> +	  transfers. When enabled, all accesses to IOMMU registers will be
> +	  split into 4-byte accesses.
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 46df79dd5495..0e3552a8142d 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -14,6 +14,10 @@
>   #include <linux/iommu.h>
>   #include <linux/types.h>
>   #include <linux/iopoll.h>
> +#ifdef CONFIG_RISCV_IOMMU_32BIT
> +#include <linux/io-64-nonatomic-hi-lo.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#endif
>   
>   #include "iommu-bits.h"
>   
> @@ -69,21 +73,35 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
>   #define riscv_iommu_readl(iommu, addr) \
>   	readl_relaxed((iommu)->reg + (addr))
>   
> -#define riscv_iommu_readq(iommu, addr) \
> -	readq_relaxed((iommu)->reg + (addr))
> -
>   #define riscv_iommu_writel(iommu, addr, val) \
>   	writel_relaxed((val), (iommu)->reg + (addr))
>   
> +#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> +	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
> +			   delay_us, timeout_us)
> +
> +#ifndef CONFIG_RISCV_IOMMU_32BIT
> +#define riscv_iommu_readq(iommu, addr) \
> +	readq_relaxed((iommu)->reg + (addr))
> +
>   #define riscv_iommu_writeq(iommu, addr, val) \
>   	writeq_relaxed((val), (iommu)->reg + (addr))
>   
>   #define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
>   	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
>   			   delay_us, timeout_us)
> +#else /* CONFIG_RISCV_IOMMU_32BIT */
> +#define riscv_iommu_readq(iommu, addr) \
> +	hi_lo_readq_relaxed((iommu)->reg + (addr))
>   
> -#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> -	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
> +#define riscv_iommu_writeq(iommu, addr, val) \
> +	((addr == RISCV_IOMMU_REG_IOHPMCYCLES) ? \
> +	 lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
> +	 hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))

Echoing Jason's comment, what is this even trying to achieve? Nothing in 
the spec suggests that the cycle counter register is functionally 
different from the other PMU counter registers (other than its 
self-contained overflow bit).

It is not, in general, safe to do a split write to a running counter 
either way - low-high vs. high-low just moves the problem around, 
changing *which* combinations of values are problematic and capable of 
overflowing into each other between the writes. If the PMU driver can't 
write counters atomically, it will need to ensure that it only ever 
write them while stopped (at which point the order surely shouldn't 
matter). Conversely, though, reading from running counters is a bit more 
reasonable, but it needs more than just hi_lo_readq to guarantee it's 
not got a torn result.

Thanks,
Robin.

> +
> +#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> +	readx_poll_timeout(hi_lo_readq_relaxed, (iommu)->reg + (addr), val, cond, \
>   			   delay_us, timeout_us)
> +#endif /* CONFIG_RISCV_IOMMU_32BIT */
>   
>   #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
