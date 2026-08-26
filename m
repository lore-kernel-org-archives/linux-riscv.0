Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED3EC61DC2
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Message-Id:Cc:In-Reply-To:
	Mime-Version:Date:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSEoJLXuZD7LoTtNYesENskvRYNL1ndjmaRW6DFKV6c=; b=DQkh/nLGSdCqdv
	aWEJmiSprLf/Lfup6lVNCSaVwdfXn9CYhJOanam+GJoprqdYEteyHvNe8IwmfCI2QgTSYk61BfElP
	36DdkmsZvbid4/UFkKnCLBIL9fgwPqTj9mFKBv0Mw6AesPlkSJfrNhtSobrp76Tgg18mHnQHBVtqE
	wdRfBxX6limstQkODEYY6iBfKx/e/5cFgMARxw1HGn/r9L12jEJf8yANFPQ0nEbwJD9kZNKW8tL9J
	TztSo51/MpwUE3LR+f25TvDMAcToDsF9BHb5n4v8yAd4rs9/GZPV8e+ID59dwlruSHu3GwSSwx5p4
	wl5S2NsPKeQQcn/G+F8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz90y-000000026Gi-0pdo;
	Wed, 26 Aug 2026 08:29:44 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz90w-000000026GO-0E54
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 08:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1787732977; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=HzdH8nsqTysaIedViXV7Z9XxXF8cCq89j3KqpBDmv5o=;
 b=i/FoCy0UAYSWhTFfxs4N+tQYdKiEKIY7Q02+ElGjQpppoKorysZHuM/wZzTKvDGJlTwsQD
 gpcvWi9G03LE0c3fmAJ26EigOLdmXwIaJCjSwYxg9vnqM1KybIwSk0a7N4AL4nwS7LABIG
 HmCrh3zSADnjQIGMfetSrdcuub5/d99/6JJ34wMGeFksypuJ00j2mr3CvAcKPjuG/1fitV
 N55d4CjhOYxNg1FlfDsYCAwnk/KfGfbHXDDmZtJxyxHufXJUjWs/U1Pu6bOegDXe24Zlbs
 ITW32ET/zVsrRW+j6LWlveRC/+n0tnxiYhLbSyg6+tVtwOaHjZHhmCvFzRlkEg==
To: "Zong Li" <zong.li@sifive.com>
References: <20260824022034.3916570-1-zong.li@sifive.com> <20260824022034.3916570-3-zong.li@sifive.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26a8ea3ef+cb7676+lists.infradead.org+yang.yicong@picoheart.com>
Date: Wed, 26 Aug 2026 16:29:30 +0800
Mime-Version: 1.0
Content-Language: en-US
In-Reply-To: <20260824022034.3916570-3-zong.li@sifive.com>
Cc: <tomasz.jeznach@linux.dev>, <joro@8bytes.org>, <will@kernel.org>, 
	<robin.murphy@arm.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <mark.rutland@arm.com>, 
	<andrew.jones@oss.qualcomm.com>, <guoren@kernel.org>, 
	<david.laight.linux@gmail.com>, <zhangzhanpeng.jasper@bytedance.com>, 
	<iommu@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, "Chen Pei" <cp0613@linux.alibaba.com>, 
	"Fangyu Yu" <fangyu.yu@linux.alibaba.com>, 
	"Samuel Holland" <samuel.holland@sifive.com>
Message-Id: <612d401c-2543-44aa-8b16-9f571432a788@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH v6 2/2] iommu/riscv: create a auxiliary device for HPM
Received: from [100.86.213.231] ([120.234.91.234]) by smtp.feishu.cn with ESMTPS; Wed, 26 Aug 2026 16:29:33 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012942_167570_5CD9E299 
X-CRM114-Status: GOOD (  17.89  )
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

On 8/24/26 10:20 AM, Zong Li wrote:
> Create an auxiliary device for HPM when the IOMMU supports a
> hardware performance monitor.
> 
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Suggested-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>

Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>

> ---
>  drivers/iommu/riscv/Kconfig |  1 +
>  drivers/iommu/riscv/iommu.c | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
> index b86e5ab94183..8025bf0fb67f 100644
> --- a/drivers/iommu/riscv/Kconfig
> +++ b/drivers/iommu/riscv/Kconfig
> @@ -10,6 +10,7 @@ config RISCV_IOMMU
>  	select GENERIC_PT
>  	select IOMMU_PT
>  	select IOMMU_PT_RISCV64
> +	select AUXILIARY_BUS
>  	help
>  	  Support for implementations of the RISC-V IOMMU architecture that
>  	  complements the RISC-V MMU capabilities, providing similar address
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index cec3ddd7ab10..7f619971bb70 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/acpi_rimt.h>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/compiler.h>
>  #include <linux/crash_dump.h>
>  #include <linux/init.h>
> @@ -48,6 +49,9 @@
>  static DEFINE_IDA(riscv_iommu_pscids);
>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>  
> +/* IOMMU PMU auxiliary device id allocation namespace. */
> +static DEFINE_IDA(riscv_iommu_pmu_ida);
> +
>  /* Device resource-managed allocations */
>  struct riscv_iommu_devres {
>  	void *addr;
> @@ -565,6 +569,36 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +/*
> + * IOMMU Hardware performance monitor
> + */
> +static void riscv_iommu_pmu_id_free(void *data)
> +{
> +	ida_free(&riscv_iommu_pmu_ida, (unsigned long)data);
> +}
> +
> +static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
> +{
> +	struct auxiliary_device *auxdev;
> +	int id, ret;
> +
> +	id = ida_alloc(&riscv_iommu_pmu_ida, GFP_KERNEL);
> +	if (id < 0)
> +		return id;
> +
> +	ret = devm_add_action_or_reset(iommu->dev, riscv_iommu_pmu_id_free,
> +				       (void *)(unsigned long)id);
> +	if (ret)
> +		return ret;
> +
> +	auxdev = __devm_auxiliary_device_create(iommu->dev, "riscv-iommu",
> +						"pmu", iommu, id);
> +	if (!auxdev)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  /* Lookup and initialize device context info structure. */
>  static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
>  						 unsigned int devid)
> @@ -1613,6 +1647,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>  		goto err_remove_sysfs;
>  	}
>  
> +	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
> +		riscv_iommu_hpm_enable(iommu);
> +
>  	return 0;
>  
>  err_remove_sysfs:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
