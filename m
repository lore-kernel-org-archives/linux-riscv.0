Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B693C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 04:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiTTpeXEUTEN3NPkKEMP2bNRQM4YC9Q54NOSqMCWLbA=; b=bfURJwQhVlT5qH
	l0hN62GWZKvCPfVm+ZqHJkQVm2zt+rb2tfa78ul1kLDImqiDRv3Jpus8X86UtdMfQkbu6hXIlY/1G
	p4pcVTPwyd/rfzsfe0D9w/yY3upZY6WgFXiUCCy8EDZhM921CHgQK/ZmyTseeNnZtEuhgFwWlQ0Zh
	9bIr7MOQy9zG+xkH1bVLRKP4HIdg+R/o7aAq+sX6kwAWMDdcTGgpknSbJjZZ8sfcDHIx0h4ZPb8So
	h3GO8VjJNjyd7Ca10HG1V058t/yOEJEOlwUF4c2z5bLUzV4DH/Fa3M9Nqyw1tEwAU7mwkc7mNxJyp
	rBEXfJlWNdgdkRRWMF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4v6M-00000000H29-3X0R;
	Thu, 09 May 2024 04:09:50 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4v6J-00000000H1H-2wP2
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 04:09:49 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5b2180a5330so226272eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 21:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715227783; x=1715832583; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9sruuI+Av6fzoUWEPO1CK46vHbYhEGu93ccm0253NU=;
        b=kg+G1i/YEfu/6gysuTe1vDNMKkUGtZELTwb1S5sps5I8QSfKOqtRkmCf5YqnE6CZY2
         mCSnY81JYfI/DJzKpFW2mUyopIEsxrIH+pmznA31XAwFWa80LgfTGVCR4lD5GYQIAyFF
         xpOS7b3ET6Nkj1w7rwFag2Bdn07uPMsBakpjqB2KU053rk3RzadocUm6STKdiZGuAr+4
         ILqSTH8FktoNqKypX+WMQeDFPRBMgj+LRQviadffDRvVJxkOUNUAExn9tnEIm60dcJ8X
         Er1DFm4AAo4w/mr9HsVX4TZdo+G6a+GOC710G+hamqxg0vV3ZIPWMEVJCs9ukAw8vrid
         isjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715227783; x=1715832583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9sruuI+Av6fzoUWEPO1CK46vHbYhEGu93ccm0253NU=;
        b=wrs+cp8FxfXdvIUEgQ7ij89pXpxMIHnYUcOdt04FgGi0N6UsN05sTVSwJqJiUmfULW
         dyABOcMHelfxAz1eX2O6RbaQrcgWEjT24nfRHEib60dg5SyQA+FQbDGxo/i33C/X/gqw
         88pImTV59M7AGNMZIgQO+zgY353ji/tTahM0OOkbym3z3z19pIth9FG5iYoN6VRD1ucD
         EjgnKh12zfL5ql2n06HLt1mMgHOZ5LEicgOwnp7F8zt+lRnITApOp8P7vPcLiLw52DyP
         6+F3xtyfUm+9B1JoU6ZqCk2Axt7x9IhOOiwCZ+E51qTAPC+fbBnrAJza/r4+auqWNrLw
         rbNw==
X-Forwarded-Encrypted: i=1; AJvYcCXYSTwdTbZ+ZT9Tn8bujbVN3Y9DiwtCwnzk+pXa5LHKHuyFrEIbKh2jgu+Q4GvLAzKr7vWyvnWH24IOZaOIx/TPCKuUE47W5z//aaD5qT3e
X-Gm-Message-State: AOJu0YzvVapI9SmCBZz8RM3VDfOK7ysdvn7PBuZHSA/qHnsurJ5ZeKjp
	PrVi/DdGIBiivc6kGMBwzI5r6vB1KqJ+tF0BkYHxOniKj3i4AQMI5MNnyxldwi8=
X-Google-Smtp-Source: AGHT+IHnfdRkD37024/1NkpgcVLNuDSAm5SAjj46xEeBcOG4M0xTGOaXer2jGvjhTifAxtxNdttDAg==
X-Received: by 2002:a05:6358:c90:b0:18d:9d6a:e484 with SMTP id e5c5f4694b2df-192d290f02emr675633955d.6.1715227783188;
        Wed, 08 May 2024 21:09:43 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340b767b36sm343814a12.32.2024.05.08.21.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 21:09:42 -0700 (PDT)
Date: Thu, 9 May 2024 09:39:33 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com,
	john.garry@huawei.com, Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH v4 2/3] riscv: cacheinfo: initialize cacheinfo's level
 and type from ACPI PPTT
Message-ID: <ZjxMfQOqc8ML8nrD@sunil-laptop>
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418034330.84721-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_210947_893476_60D553CF 
X-CRM114-Status: GOOD (  22.22  )
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

On Thu, Apr 18, 2024 at 11:43:29AM +0800, Yunhui Cui wrote:
> Before cacheinfo can be built correctly, we need to initialize level
> and type. Since RSIC-V currently does not have a register group that

NIT: Typo RISC-V

> describes cache-related attributes like ARM64, we cannot obtain them
> directly, so now we obtain cache leaves from the ACPI PPTT table
> (acpi_get_cache_info()) and set the cache type through split_levels.
> 
> Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 30a6878287ad..e47a1e6bd3fe 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -6,6 +6,7 @@
>  #include <linux/cpu.h>
>  #include <linux/of.h>
>  #include <asm/cacheinfo.h>
> +#include <linux/acpi.h>
>  
Can this be added in the order? Like, include acpi.h prior to cpu.h?

>  static struct riscv_cacheinfo_ops *rv_cache_ops;
>  
> @@ -78,6 +79,27 @@ int populate_cache_leaves(unsigned int cpu)
>  	struct device_node *prev = NULL;
>  	int levels = 1, level = 1;
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
Other than above nits, it looks good to me. Thanks for the patch!

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
