Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39007C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+RqqPPCjbyfIIxQbHCKmXjUdxSZojnnljoZ3oGu3XU=; b=sSVgPD1n8Bmhj8
	eB8ZaPB0ZSv3nUQE5Ij3rktSvOpUFINFRlAzwdmlllRXlq6TK8MeCFQBjHSDplEwuPlNtnZW/yThn
	pq3AAZ523PDblLhjSDHaltozCxD8uH6JF8FDnHZrSNVFEhNyJqN3xAA3T70tKNCGqeS6zKY2b+Ae0
	JovOudSifUhB6Et5uAh+tUZZNw8HjG2KNuX2xwC8xt/nkfPxx1sick03p5V+uEhQMsOxH6666QOlI
	REKZjCWlw1ZFagTyzsrVNyJkc5ER9LCffrX0mUkdsJmmIfVFtc3M/YT4oQZgrYfIenj1/W6ip7c7K
	GvzlNa1xu0vbyYMhuh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJkR-00000000Uia-2s9Y;
	Fri, 12 Apr 2024 16:27:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJkO-00000000Ugv-0u2Z
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 16:27:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9A92339;
	Fri, 12 Apr 2024 09:27:55 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 746CC3F64C;
	Fri, 12 Apr 2024 09:27:25 -0700 (PDT)
Date: Fri, 12 Apr 2024 17:27:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>, rafael@kernel.org,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [External] Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo
 entirely with PPTT
Message-ID: <Zhlg67dbl_S1GD0u@bogus>
References: <20240407123829.36474-1-cuiyunhui@bytedance.com>
 <abd135fa-c432-4e37-9792-07a0e17e93d5@arm.com>
 <CAEEQ3w=+C2J0ZS227-1P-B+pe_NRp_3i4c4CxGssiKqbpXx_qw@mail.gmail.com>
 <2cde00c8-7878-45c0-8621-fca4e70c75e7@arm.com>
 <ZhlcYRolZwm7UwJu@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhlcYRolZwm7UwJu@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_092728_351759_0DC35B8B 
X-CRM114-Status: GOOD (  12.54  )
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

On Fri, Apr 12, 2024 at 05:08:01PM +0100, Sudeep Holla wrote:
> diff --git i/arch/riscv/kernel/cacheinfo.c w/arch/riscv/kernel/cacheinfo.c
> index 09e9b88110d1..92ab73ed5234 100644
> --- i/arch/riscv/kernel/cacheinfo.c
> +++ w/arch/riscv/kernel/cacheinfo.c
> @@ -79,6 +79,27 @@ int populate_cache_leaves(unsigned int cpu)
>         struct device_node *prev = NULL;
>         int levels = 1, level = 1;
> 
> +       if (!acpi_disabled) {
> +               int ret, fw_levels, split_levels;
> +
> +               ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
> +               if (ret)
> +                       return ret;
> +
> +               /* must be set, so we can drop num_leaves assignment below */
> +               this_cpu_ci->num_leaves = fw_levels + split_levels;
> +
> +               for (idx = 0; level <= this_cpu_ci->num_levels &&
> +                    idx < this_cpu_ci->num_leaves; idx++, level++) {
> +                       if (level <= split_levels) {
> +                               ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> +                               ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> +                       } else {
> +                               ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> +                       }
> +               }

Ofcourse we need to add here,
		return 0;

> +       }
> +
>         if (of_property_read_bool(np, "cache-size"))
>                 ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
>         if (of_property_read_bool(np, "i-cache-size"))
> 

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
