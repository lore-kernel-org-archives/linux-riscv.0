Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16985C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76oloZJegVYZmy5galg9rVasKMk8ELrNZbd0qAEzR0s=; b=jf39RKe5TkzuXI
	ZXFK1NpegnE+ll0JHHEftQbPR+GVy9ZY/f3LF0GTXMksv7R7DkmwwGwEujvHrAwh3qsoXdrJcTUQY
	S7Bz1xkxv1aVjEKhCHLjCUJ8XxhwjJX8UMfal5FB5XRKGVrM9VD4yu9bwov6/AT3soghjoJ+Ce6C0
	N7Af8cQkdrW+mnQOtmDm6xlPx+saEfWepmkT9cR/QntIfWLDIZDUqkQSV3FZVlDBG4xft1f3FyZCR
	3FoNgwn3ObXEyu25B+1MT3BLEcAUPgCIOaNGEuKDaMsku5KU8ZcvnZtd2K09r4qoU75HgjRSLqbE8
	B3bdMTD3pBBwYKVFSvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55OP-00000001pe4-2LPv;
	Thu, 09 May 2024 15:09:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55ON-00000001pcu-1eWK
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 15:09:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34D59106F;
	Thu,  9 May 2024 08:09:29 -0700 (PDT)
Received: from [172.27.42.162] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979AB3F641;
	Thu,  9 May 2024 08:09:02 -0700 (PDT)
Message-ID: <571d0194-dd3e-4a68-8879-d6b66276afe5@arm.com>
Date: Thu, 9 May 2024 10:09:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] riscv: cacheinfo: initialize cacheinfo's level and
 type from ACPI PPTT
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, rafael@kernel.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, sunilvl@ventanamicro.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com,
 james.morse@arm.com, jhugo@codeaurora.org, john.garry@huawei.com,
 Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, sudeep.holla@arm.com,
 tiantao6@huawei.com
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20240509073300.4968-1-cuiyunhui@bytedance.com>
 <20240509073300.4968-2-cuiyunhui@bytedance.com>
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20240509073300.4968-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_080907_534153_C137D916 
X-CRM114-Status: GOOD (  17.14  )
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

Hi,

On 5/9/24 02:32, Yunhui Cui wrote:
> Before cacheinfo can be built correctly, we need to initialize level
> and type. Since RISC-V currently does not have a register group that
> describes cache-related attributes like ARM64, we cannot obtain them
> directly, so now we obtain cache leaves from the ACPI PPTT table
> (acpi_get_cache_info()) and set the cache type through split_levels.
> 
> Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 30a6878287ad..d6c108c50cba 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -3,6 +3,7 @@
>    * Copyright (C) 2017 SiFive
>    */
>   
> +#include <linux/acpi.h>
>   #include <linux/cpu.h>
>   #include <linux/of.h>
>   #include <asm/cacheinfo.h>
> @@ -78,6 +79,27 @@ int populate_cache_leaves(unsigned int cpu)
>   	struct device_node *prev = NULL;
>   	int levels = 1, level = 1;
>   
> +	if (!acpi_disabled) {
> +		int ret, fw_levels, split_levels;
> +
> +		ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
> +		if (ret)
> +			return ret;
> +
> +		BUG_ON((split_levels > fw_levels) ||
> +		       (split_levels + fw_levels > this_cpu_ci->num_leaves));
> +
> +		for (; level <= this_cpu_ci->num_levels; level++) {
> +			if (level <= split_levels) {
> +				ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> +				ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> +			} else {
> +				ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> +			}
> +		}
> +		return 0;
> +	}
> +
>   	if (of_property_read_bool(np, "cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
>   	if (of_property_read_bool(np, "i-cache-size"))


Yes, still looks good.

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>

Thanks,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
