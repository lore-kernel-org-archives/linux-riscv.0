Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205BC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/M9GZCp9Kp7wQOdf8k/9VksuyvjDRET8fz8ea09I4Wo=; b=phwDlnpUhrSEVk
	XHJyXw8px7m6KgIo1LKoB9FOvoPfZudanxF0hu0kW5PAnM9jMPACvjnM10lAIOu5+VhjDWot0U2gS
	MUc1oe8aaaFWExSR57oqr1PLoxmQbgcMvNHgQPG8uJ8yHdAviEAKID9ww9meJTBpC56n4ltA6zhQC
	VP4Hb/KC/7ZIOIkcrhGJlECFwfZ5Iv39uD6itvRiMAEbOT7vB36Ap4wwzC9/hUWye5s68LG5gfJzY
	s3uYoijRcdPsmUyxGVRVNcdCZct8K1iAhHi1xlgc9jNjerIJFTRqqiaqY0BCOK0ITrP322fsT3yFj
	cKjKUzcGvl4F/C5CvBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHxR-00000007arg-0Mk2;
	Mon, 15 Apr 2024 08:44:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHxN-00000007ar3-3Qrp
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 08:44:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100642F;
	Mon, 15 Apr 2024 01:45:19 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4C523F64C;
	Mon, 15 Apr 2024 01:44:48 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:44:46 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com,
	john.garry@huawei.com, Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH v2 2/3] riscv: cacheinfo: initialize cacheinfo's level
 and type from ACPI PPTT
Message-ID: <Zhzo_gWFiURs_geD@bogus>
References: <20240414025826.64025-1-cuiyunhui@bytedance.com>
 <20240414025826.64025-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240414025826.64025-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_014454_047615_3DB15995 
X-CRM114-Status: GOOD (  23.09  )
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

On Sun, Apr 14, 2024 at 10:58:25AM +0800, Yunhui Cui wrote:
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
>  arch/riscv/kernel/cacheinfo.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 30a6878287ad..ece92aa404e3 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -6,6 +6,7 @@
>  #include <linux/cpu.h>
>  #include <linux/of.h>
>  #include <asm/cacheinfo.h>
> +#include <linux/acpi.h>
>  
>  static struct riscv_cacheinfo_ops *rv_cache_ops;
>  
> @@ -78,6 +79,28 @@ int populate_cache_leaves(unsigned int cpu)
>  	struct device_node *prev = NULL;
>  	int levels = 1, level = 1;
>  
> +	if (!acpi_disabled) {
> +		int ret, idx, fw_levels, split_levels;
> +
> +		ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
> +		if (ret)
> +			return ret;
> +
> +		/* must be set, so we can drop num_leaves assignment below */

I intentionally added this above comment to check and drop the below statement
if it is already set. Please check if the value is already set when we call
into this function(which I think is the case).

> +		this_cpu_ci->num_leaves = fw_levels + split_levels;
> +
> +		for (idx = 0; level <= this_cpu_ci->num_levels &&
> +		     idx < this_cpu_ci->num_leaves; idx++, level++) {
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
>  	if (of_property_read_bool(np, "cache-size"))
>  		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
>  	if (of_property_read_bool(np, "i-cache-size"))
> -- 
> 2.20.1
> 

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
