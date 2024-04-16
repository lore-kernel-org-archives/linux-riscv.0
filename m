Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CD9C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0JUsGbu7ksDne6SaNs9B1A76QaNstSKKuvLor+ElBw=; b=KS5u4ybdo6N14BuXErHohD07UB
	u7tFRzkf5le+Zmt+Oq0kxcL6bjO0MYEEU+PgmD/ZbZxpILPqwPyXcZl+bUsVqlnW0cxMCwO9PYi05
	PqlUr2t5D8BKc9piZhgEvy3NC4qRcrAx7q+1H50LOhfRLYJJZIkQEQW2+4+ph93NReSsQY+1eLrnF
	kCgDxqsgXj3BmgO7aJk5h9yTDUQnFi5ErJZmGdXb9NDXjWZ8su65arOr8+hl0XKFpwnjxxXsDQt1l
	oFeKEX/3C0FcUMWe4A6YZWh0HCNc6iy0VLMXA2x0fJHdS6MSDZ6EuHJ9M/5/9AqmQbNbJ+0EI0xyQ
	WG1dLGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwooK-0000000DbRF-3UKJ;
	Tue, 16 Apr 2024 19:49:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwooI-0000000DbQM-0YG4
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 19:49:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0143F339;
	Tue, 16 Apr 2024 12:50:03 -0700 (PDT)
Received: from [192.168.20.58] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93F4F3F738;
	Tue, 16 Apr 2024 12:49:30 -0700 (PDT)
Message-ID: <f18251ff-979f-42bb-9db4-8f7256c4ca4a@arm.com>
Date: Tue, 16 Apr 2024 14:49:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] riscv: cacheinfo: remove the useless parameter
 (node) of ci_leaf_init()
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, rafael@kernel.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com,
 jhugo@codeaurora.org, john.garry@huawei.com, Jonathan.Cameron@huawei.com,
 pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20240416031438.7637-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_124942_248276_854A0667 
X-CRM114-Status: GOOD (  13.37  )
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

Other than a comment in 2/3 this all (patches 1-3) looks sane to me. So:

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>

Thanks,


On 4/15/24 22:14, Yunhui Cui wrote:
> The implementation of the ci_leaf_init() function body and the caller
> do not use the input parameter (struct device_node *node), so remove it.
> 
> Fixes: 6a24915145c9 ("Revert "riscv: Set more data to cacheinfo"")
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 09e9b88110d1..30a6878287ad 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -64,7 +64,6 @@ uintptr_t get_cache_geometry(u32 level, enum cache_type type)
>   }
>   
>   static void ci_leaf_init(struct cacheinfo *this_leaf,
> -			 struct device_node *node,
>   			 enum cache_type type, unsigned int level)
>   {
>   	this_leaf->level = level;
> @@ -80,11 +79,11 @@ int populate_cache_leaves(unsigned int cpu)
>   	int levels = 1, level = 1;
>   
>   	if (of_property_read_bool(np, "cache-size"))
> -		ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
> +		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
>   	if (of_property_read_bool(np, "i-cache-size"))
> -		ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
> +		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
>   	if (of_property_read_bool(np, "d-cache-size"))
> -		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
> +		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   
>   	prev = np;
>   	while ((np = of_find_next_cache_node(np))) {
> @@ -97,11 +96,11 @@ int populate_cache_leaves(unsigned int cpu)
>   		if (level <= levels)
>   			break;
>   		if (of_property_read_bool(np, "cache-size"))
> -			ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
> +			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
>   		if (of_property_read_bool(np, "i-cache-size"))
> -			ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
> +			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
>   		if (of_property_read_bool(np, "d-cache-size"))
> -			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
> +			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   		levels = level;
>   	}
>   	of_node_put(np);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
