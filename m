Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E860C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/b85Paa959D/UGqxzj2dy+yhO6uH3mzDDKM0vML0hE=; b=g/RCOovxUQAz4TeLoNgaY9C9kS
	NOXlOicDjn21DDueRK4H7H7WdSePRGbVyjDnHgkKFyxLDbMXn3Qya3wGC0BGOz02kfznGPqY/ocVW
	/fZ2h0Ofbe5GMXWmBBaSvKD1Fsw1T8LGBkd2TY/CSFxA6ft4N/aVEvA7QpL9nl6yo8h1Df6CznD0D
	olsqxlF6Lxr0pzIgj8XoxA+VqSQ4E6ZL70ejAXqW22hhqthBGO60lBjPzt7TkCNIDVPjPqxGUwQZF
	7aaZXNs87sWHRJVDiRVysDv3kl3SNqB/cmO1yDkxhked+ETV7LPSuCUQuo2t/fO/QMsytvS54Iwx/
	0G5ujniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfok4-00000004q5o-1N9A;
	Wed, 05 Feb 2025 23:23:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfok2-00000004q5P-0zyV
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 23:23:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0CB1063;
	Wed,  5 Feb 2025 15:23:54 -0800 (PST)
Received: from [192.168.20.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D51523F58B;
	Wed,  5 Feb 2025 15:23:28 -0800 (PST)
Message-ID: <86bee3f3-acf3-4b3e-ad9c-e7d021355214@arm.com>
Date: Wed, 5 Feb 2025 17:23:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for
 non-boolean properties
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_152334_328869_5BEB4A30 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: Steffen Persvold <spersvold@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Yunhui Cui <cuiyunhui@bytedance.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, =?UTF-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/5/25 8:39 AM, Emil Renner Berthing wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated and since
> 
> commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
> 
> a warning is displayed when used incorrectly. Fix it by switching to
> of_property_present() as recommended in the same commit.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 2d40736fc37c..26b085dbdd07 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
>   	if (!np)
>   		return -ENOENT;
>   
> -	if (of_property_read_bool(np, "cache-size"))
> +	if (of_property_present(np, "cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -	if (of_property_read_bool(np, "i-cache-size"))
> +	if (of_property_present(np, "i-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -	if (of_property_read_bool(np, "d-cache-size"))
> +	if (of_property_present(np, "d-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   
>   	prev = np;
> @@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
>   			break;
>   		if (level <= levels)
>   			break;
> -		if (of_property_read_bool(np, "cache-size"))
> +		if (of_property_present(np, "cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -		if (of_property_read_bool(np, "i-cache-size"))
> +		if (of_property_present(np, "i-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -		if (of_property_read_bool(np, "d-cache-size"))
> +		if (of_property_present(np, "d-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   		levels = level;
>   	}

This looks sane to me:


Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
