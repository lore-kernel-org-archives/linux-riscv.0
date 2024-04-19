Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0125AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSr+Pc0iyMi4xBf7bfzfEhBTuBIG584lYyw4qVnAs38=; b=eDpqyMZm2vz/UOzy0PhPlsPo6L
	gWdR6KZtHU31hhZnO/V3z/8cb5eybsc2AQFkzl4EbypewISw+jDuCgeuklcmKsZTxzgS5UDCDbplO
	rIYtrQCZ3xgN6ytHT4MUSaB9M4oT0HVbJDP2JslbEPA0IV2S/66mDKX8LlhuKv9MLRieipFQsMcQk
	wUxY9OEIEQ71RdDPYNlK1jdBFMzTkBVn88T49UNSe+5S4KWOCgfovD/B3m1dJ83V9cwq3CzqZxhGA
	dXBp+e/Y+oH7ehkaQ30U6otLxN/FKaevzX/1fbc5+sAVtf4RtAQwEpCNWEQhDoC3b3EGAUlpYcFWS
	ZQtQlTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqAa-00000006A9r-2E0f;
	Fri, 19 Apr 2024 15:28:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqAX-00000006A8G-0A3t
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 15:28:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4FEF2F;
	Fri, 19 Apr 2024 08:29:17 -0700 (PDT)
Received: from [192.168.20.58] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6820C3F64C;
	Fri, 19 Apr 2024 08:28:46 -0700 (PDT)
Message-ID: <d143cd11-26ea-42e3-8f32-700a34b3705e@arm.com>
Date: Fri, 19 Apr 2024 10:28:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] riscv: cacheinfo: initialize cacheinfo's level and
 type from ACPI PPTT
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, rafael@kernel.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com,
 jhugo@codeaurora.org, john.garry@huawei.com, Jonathan.Cameron@huawei.com,
 pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com>
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20240418034330.84721-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_082853_156035_BF220283 
X-CRM114-Status: GOOD (  16.80  )
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

On 4/17/24 22:43, Yunhui Cui wrote:
> Before cacheinfo can be built correctly, we need to initialize level
> and type. Since RSIC-V currently does not have a register group that
> describes cache-related attributes like ARM64, we cannot obtain them
> directly, so now we obtain cache leaves from the ACPI PPTT table
> (acpi_get_cache_info()) and set the cache type through split_levels.
> 
> Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 30a6878287ad..e47a1e6bd3fe 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -6,6 +6,7 @@
>   #include <linux/cpu.h>
>   #include <linux/of.h>
>   #include <asm/cacheinfo.h>
> +#include <linux/acpi.h>
>   
>   static struct riscv_cacheinfo_ops *rv_cache_ops;
>   
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

Yes, looks good.

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>



Thanks,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
