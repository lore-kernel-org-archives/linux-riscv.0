Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA519C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i1pbEaMsnb0DtwNhdUHZZVziAmSnbyjBoj8/9y7xts=; b=jSa2siI6C4K792AL+xTtaw8IC5
	IvTN4v06NhGhnct7TB+NQqToH0zd576i9lbXwyQkslHW1zLePhC7uXWS6GeAhXCzUxZf6nD726K0W
	esGMqW2xjd+Bluc8Ovx3Q2fOzw8Tm73NyFT+5gNqgP8N662lM5/nL3FAfeePoMXG5VEuGeAVTDChD
	M4LtJkPmByCbsk/T+cGkj1s78ZCVxoEc8sJgy/kYvXpKh7zQ+H8ieiKF8tIII1JNu+fsXFb4V6CRy
	hkpFXOLtAu+we64hApsQR+PyHKR6wGBDN2Gwa3HfB4dF+Vog6KFLKwqDum+1ypu0YKwwZDLCdG8lY
	D5NaFlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwp2E-0000000Dd0g-265y;
	Tue, 16 Apr 2024 20:04:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwp2A-0000000Dczi-1fgs
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 20:04:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CE32339;
	Tue, 16 Apr 2024 13:04:26 -0700 (PDT)
Received: from [192.168.20.58] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 244383F738;
	Tue, 16 Apr 2024 13:03:53 -0700 (PDT)
Message-ID: <9f36bedd-1a68-43a9-826d-ce56caf01c52@arm.com>
Date: Tue, 16 Apr 2024 15:03:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] riscv: cacheinfo: initialize cacheinfo's level and
 type from ACPI PPTT
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, rafael@kernel.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com,
 jhugo@codeaurora.org, john.garry@huawei.com, Jonathan.Cameron@huawei.com,
 pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
 <20240416031438.7637-2-cuiyunhui@bytedance.com>
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20240416031438.7637-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_130402_597211_1545B4B6 
X-CRM114-Status: GOOD (  18.48  )
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


On 4/15/24 22:14, Yunhui Cui wrote:
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
>   arch/riscv/kernel/cacheinfo.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 30a6878287ad..dc5fb70362f1 100644
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
> @@ -78,6 +79,25 @@ int populate_cache_leaves(unsigned int cpu)
>   	struct device_node *prev = NULL;
>   	int levels = 1, level = 1;
>   
> +	if (!acpi_disabled) {
> +		int ret, idx, fw_levels, split_levels;
> +
> +		ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
> +		if (ret)
> +			return ret;
> +
> +		for (idx = 0; level <= this_cpu_ci->num_levels &&
> +		     idx < this_cpu_ci->num_leaves; idx++, level++) {

AFAIK the purpose of idx here it to assure that the number of cache 
leaves is not overflowing. But right below we are utilizing two of them 
at once, so this check isn't correct. OTOH, since its allocated as 
levels + split_levels I don't think its actually possible for this to 
cause a problem. Might be worthwhile to just hoist it before the loop 
and revalidate the total leaves about to be utilized.


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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
