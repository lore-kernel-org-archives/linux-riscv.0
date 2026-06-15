Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6BACD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3yEefdZ/X7WKML0OyGNm+w+ivCMkxyDamV8AMaDt0s=; b=v2mdtDL/CT1b88
	5XAGLnLKgPtYqKnik5W5f/2nxmW2DAxqqKINLkZW6I6eq4cd1sXCn+k+bnmVoxpRmw/5xVTQ86bBa
	uK7mlFvhsQQmqtl3W4cFGfA7jhpAd9/QhgWcfm0MjB9FlikUo3TWe8s6+EOAi6TEpVJWeq3Vlq36P
	UIRwUatD967GlhSTLZgVBJvOIgr227y68+O7QJF2yrTEmfKwFkm9DXxDC6y823vl6s5CIW7SICoE0
	3/TLkRg3cFnjU+7iTDlS4RFzAJmgDwm3ZkvE563PgOXjik/7K5yTQwk2r50UyMdJL84Xn29aj1GMk
	AGGN62PEnoMRClrJRhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ46v-0000000E188-0ZnS;
	Mon, 15 Jun 2026 10:00:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ46t-0000000E17P-1KPZ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 10:00:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso27562445e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517601; x=1782122401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/40NyX5fmI7vs0/LA5CZV+IOaV0U2Xfp7EO4Khsh9Vc=;
        b=d3KAO2n7Lh+vEsEEbb3V2hfx3UQ7CPqzuorh5LmoQCiGVlnLYvM01N0Hy9dXQTo24o
         ykYIS6tLcosQ7mCBSwEE4USRirjnKsGzFn1w29hX9vFzpahm2SekropBoyNDa7+NNJw2
         diexyVyMNpM4/DdhxCaQvwDE/z1TbxoYbeaB5+Jb+c+4pRTfsvD2HpFomqp/J49pDbjG
         vKISCWHMbIr82moS3Gy5UoBiZyNYSEtK/EQuu5kNq9S5gQnyctLkxm6yj+PmLwOmtxD6
         sgtF/QDyDsFb2QFoJyWMHu24eTAH5MF7BtnDnoT8tR9PbrZJtTKYObswPqQzV6B+UyOo
         0i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517601; x=1782122401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/40NyX5fmI7vs0/LA5CZV+IOaV0U2Xfp7EO4Khsh9Vc=;
        b=ZcTfmEyCoytqeO92XFd4dv76FuAoe0M4ZZuY51EsQ1CJhG+zlbg1Qo1eagy7R38axF
         DLpZ5y6Q2ZGPRtkk839OxkaDYDp5ImXJNqFatMUhK70luid57dkgOABRBGYzllfM8F1u
         UiNKHLGNAMrLtal6ElNEHWJg7hdc/AaVaE4esUJBLG+KzQzYoap8kjWB5+SRrmUpKkZv
         MizSR1cXV6El6GxT+wInjOL4Nh+MwXPCk3QBseqIEryW4i5KEfemuW6tYW5fdqzYTLgC
         CGupyaRpAOx1bNf1TCkzUEnpnOqzw+BdWc9rVmhCyRqwLypRiM1urFQ4PHdEo0EcXtJz
         hE9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9eRgio3ldl7De2v3flfFhHsL20IDuWE/Nq1Qwvq2Vt9NCnOJ2TQY1mPaZa1rp5rmDBCqT7xACRW+JpVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Gtr8jWR9/CfUB8VKb0+1wtpOF0bLJMSGB+tP7QSoGrnK1Bzd
	GLD1CFQK/Vxq75jBmwUOC15Kw7no3fm/exWWlO00O+/S+z+NXb1X7ZTx
X-Gm-Gg: Acq92OFY7KWuV4yLmL92mDMjNOYXt2/pVstq1ISn2qJ5YEfaIZKB4I96+GH84KfxlfX
	vbyYZcBh4x/+J//JB4rPnGnutJ1E8Sa+jsMdOUW+XbNm4wvU2XSZgEEAqSiIhoBCPgt3PPNTDrH
	2+1eqN4isgpn6dNvAAYG3SNL+rvisOL9XGKO6sQVFy/kTdlCklyMy6039g24BG5qQBFMC3IjuNB
	k7+4QykLQez6YbtYRnRq+FNYTw7cIl7aM6ZB+1WgJjpfBNt0U3DRllU9GCFqnhYFaev06tEJgLO
	EvZWL6ilFOJBVubJXWLSqv3nqNXmN200VPcSDvuIPUeUaXOsREfkoLJf6DFHo/EONzzE4W0rUd+
	smV3cyDh26WCN51UUd3UDkYr2EE3gRxXUC/rNKbT6MWOeJaHtw6KEAmegbDyhuisDRdapK16Rbr
	IYpXiQEKjbdAtm9rORXR5dQePWX0pknZtKhQh4BrBgVix9iCZjrMw7U3FwxYRCMWBG9u2R5pI=
X-Received: by 2002:a05:600c:6d8b:b0:492:1e36:bb03 with SMTP id 5b1f17b1804b1-4922011dfd7mr98130405e9.36.1781517600965;
        Mon, 15 Jun 2026 03:00:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm5526943f8f.6.2026.06.15.03.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:00:00 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:59:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Lu <luxu.kernel@bytedance.com>,
 cuiyunhui@bytedance.com, yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Message-ID: <20260615105959.136698e8@pumpkin>
In-Reply-To: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_030003_402913_0BE964D7 
X-CRM114-Status: GOOD (  31.64  )
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

On Mon, 15 Jun 2026 14:48:55 +0800
Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com> wrote:

> Some RISC-V IOMMU implementations cannot perform 64-bit MMIO accesses
> to the IOMMU register file. The RISC-V IOMMU architecture allows 64-bit
> registers to be accessed using 32-bit accesses, provided the accesses are
> properly aligned and do not span multiple registers.
> 
> Add a config option for such implementations and access 64-bit IOMMU
> registers as paired 32-bit MMIO operations when it is enabled. Serialize
> the paired accesses so the high and low halves cannot interleave with
> another CPU. Full 64-bit register programming writes the high half before
> the low half.
> 
> This option describes the register access width. It is not an RV32 kernel
> mode and does not describe a 32-bit IOMMU architecture.
> 
> Co-developed-by: Xu Lu <luxu.kernel@bytedance.com>
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
> This is needed for platforms whose RISC-V IOMMU register window does not
> support naturally aligned 64-bit MMIO accesses.
> 
>  drivers/iommu/riscv/Kconfig | 11 ++++++++
>  drivers/iommu/riscv/iommu.c |  4 +++
>  drivers/iommu/riscv/iommu.h | 55 +++++++++++++++++++++++++++++++++----
>  3 files changed, 64 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
> index b86e5ab94183..54d624b9b2ef 100644
> --- a/drivers/iommu/riscv/Kconfig
> +++ b/drivers/iommu/riscv/Kconfig
> @@ -22,3 +22,14 @@ config RISCV_IOMMU_PCI
>  	def_bool y if RISCV_IOMMU && PCI_MSI
>  	help
>  	  Support for the PCIe implementation of RISC-V IOMMU architecture.
> +
> +config RISCV_IOMMU_32BIT_ACCESS
> +	bool "Use 32-bit accesses for RISC-V IOMMU registers"
> +	depends on RISCV_IOMMU
> +	help
> +	  Say Y when the RISC-V IOMMU MMIO window cannot be accessed
> +	  using naturally aligned 64-bit loads and stores.
> +
> +	  When enabled, 64-bit IOMMU registers are accessed as paired
> +	  32-bit MMIO operations. This option does not describe an RV32
> +	  kernel or a 32-bit IOMMU architecture.
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index a31f50bbad35..7fa1721b5728 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -53,6 +53,10 @@ struct riscv_iommu_devres {
>  	void *addr;
>  };
>  
> +#ifdef CONFIG_RISCV_IOMMU_32BIT_ACCESS
> +DEFINE_RAW_SPINLOCK(riscv_iommu_32bit_access_lock);
> +#endif
> +
>  static void riscv_iommu_devres_pages_release(struct device *dev, void *res)
>  {
>  	struct riscv_iommu_devres *devres = res;
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 46df79dd5495..ba78ef1858c5 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -14,6 +14,9 @@
>  #include <linux/iommu.h>
>  #include <linux/types.h>
>  #include <linux/iopoll.h>
> +#ifdef CONFIG_RISCV_IOMMU_32BIT_ACCESS
> +#include <linux/spinlock.h>
> +#endif
>  
>  #include "iommu-bits.h"
>  
> @@ -69,21 +72,61 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
>  #define riscv_iommu_readl(iommu, addr) \
>  	readl_relaxed((iommu)->reg + (addr))
>  
> -#define riscv_iommu_readq(iommu, addr) \
> -	readq_relaxed((iommu)->reg + (addr))
> -
>  #define riscv_iommu_writel(iommu, addr, val) \
>  	writel_relaxed((val), (iommu)->reg + (addr))
>  
> +#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> +	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
> +			   delay_us, timeout_us)
> +
> +#ifndef CONFIG_RISCV_IOMMU_32BIT_ACCESS
> +#define riscv_iommu_readq(iommu, addr) \
> +	readq_relaxed((iommu)->reg + (addr))
> +
>  #define riscv_iommu_writeq(iommu, addr, val) \
>  	writeq_relaxed((val), (iommu)->reg + (addr))
>  
>  #define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
>  	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
>  			   delay_us, timeout_us)
> +#else /* CONFIG_RISCV_IOMMU_32BIT_ACCESS */
>  
> -#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> -	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
> -			   delay_us, timeout_us)
> +extern raw_spinlock_t riscv_iommu_32bit_access_lock;
> +
> +static inline u64 __riscv_iommu_readq_relaxed(void __iomem *addr)
> +{
> +	u32 lo, hi;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&riscv_iommu_32bit_access_lock, flags);
> +	do {
> +		hi = readl_relaxed(addr + sizeof(u32));
> +		lo = readl_relaxed(addr);
> +	} while (hi != readl_relaxed(addr + sizeof(u32)));
> +	raw_spin_unlock_irqrestore(&riscv_iommu_32bit_access_lock, flags);

Why the lock and the loop?
If you need the loop (for places where the hardware might be changing
both words?) then there is no need to read 'hi' twice when you loop.

But does it make any sense to be reading the value either while the hardware
is updating it (does that happen?) or concurrently with a write.


> +
> +	return ((u64)hi << 32) | (u64)lo;
> +}
> +
> +static inline void __riscv_iommu_writeq_relaxed(u64 value, void __iomem *addr)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&riscv_iommu_32bit_access_lock, flags);
> +	writel_relaxed((u32)(value >> 32), addr + sizeof(u32));
> +	writel_relaxed((u32)value, addr);
> +	raw_spin_unlock_irqrestore(&riscv_iommu_32bit_access_lock, flags);

What are you actually locking against?
I'm pretty sure it doesn't make any sense for two cpu to be writing to the
same entry at the same time.

Can't the writel_relaxed() be re-ordered, so you aren't guaranteeing they'll
be done high-low.
Same with the reads.

	David

> +}
> +
> +#define riscv_iommu_readq(iommu, addr) \
> +	__riscv_iommu_readq_relaxed((iommu)->reg + (addr))
> +
> +#define riscv_iommu_writeq(iommu, addr, val) \
> +	__riscv_iommu_writeq_relaxed((val), (iommu)->reg + (addr))
> +
> +#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> +	readx_poll_timeout(__riscv_iommu_readq_relaxed, (iommu)->reg + (addr), \
> +			   val, cond, delay_us, timeout_us)
> +#endif /* CONFIG_RISCV_IOMMU_32BIT_ACCESS */
>  
>  #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
