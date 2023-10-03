Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC0E8FDB0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 19:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhMgA5hjKEM1DBjokK9PfhXqZr9CaB0hnwkycUiyEnU=; b=IlB+oMSv05hYXh
	yC1vrFyFidqsmOKvCAI/bPpaO3/jUFvfUUvlKUweqPXpOSVqcu5AIfbei8dTSZBxvXszR10q46c0m
	7Sas5yPhdZ325CTmnUExfWdbkNg0l4DI4Pd9M/RGd6LyduZjOM+PX+7kqyZJRUHTTWVBazqyI7ZXL
	rFlzlX8gR8y2rgXGuU8O/pTg8Dl5V1VxtzU3O9k9iQoORJKqmTxAGw4lPVyVgVugWLiHdahsWRTxJ
	atvl7VhTi68QfY/a4YlHSrpQztq8zWg04wdxkB0RC1Fjzlgx0S5U4n558XMKiwljkCzH5rEuL/yzr
	tCUtrEmWeqIEfcpojgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnlPI-00FCwU-1t;
	Tue, 03 Oct 2023 19:50:12 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnlPD-00FCvo-3D
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 19:50:11 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7741b18a06aso98277585a.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696362604; x=1696967404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9OkhUo6mnx7uMIpcoe9v3PNzerEgkLVZ1kjAanFY00=;
        b=DGYP5Vv+UIht7RZ+rdgKo7JhWPPaho2f3ivNPfKAPJfWCeeOp7W+QeAiYxkZvvNSMV
         WG59QdLe3NZH2sOyPEJR2QBgXrSM5H0KW4LlfP7MAQlXqHo64EYmJJ+C5PjN7UI095hA
         Kj+zIY5KJvEEeVlbOhW7KS9lxU/tr31gVgP217CgH8ysxrVq4WFPvfNOr3i/Oza6OG9G
         qfJ1fMJRGXnrqX48TIUytOhcEuCI14xM3nsPp9MxEofKta7ymbEqJ6Rj3xA2mJKXW7PO
         sxU8pvBd3lBD/la3G23ajK5cLg3My4S3dKP8rUUzthktGT9eeI6eNNpvXX9+RvXY4V0+
         TUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696362604; x=1696967404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9OkhUo6mnx7uMIpcoe9v3PNzerEgkLVZ1kjAanFY00=;
        b=MNGIVGCViOA9FtsP59iGj3BvKI5lfQ8139ji/Ew4ezqvhZ2d5axvUxNcz7aN20hObg
         +S0APTP5y4kxv/vMtQN7jhuQGwOb6f8qBuU3WAdV4SZQHGOaOzmOCQZoH3TvnFllfPE4
         8DwSSYC8GiE0Clz+wdXwHofU7iEU5ZZ66Q04Mjn+sRpmrRTo+Ro/1kIipTHTZTlrhB3B
         FTwmp/1KlPZJRSQ0lva08JjZpi76OFupcRa0H1hU7r9W1oR8KIVnujus72c6GfvzUepF
         nv+8fkAQrN8mFx3mSh0Nn7/UQ3MqjnhhbPBxjNO4aHUT59MdcJUsxQyZgfjQz20ou3fc
         JCjw==
X-Gm-Message-State: AOJu0Yz1aVkbnePEJE4LQ1+YUFqvq+zb8N/STw84PtLpZdMcOec3Jn8K
	+EuII93LYYy2CtYeqvEdJXpi6w==
X-Google-Smtp-Source: AGHT+IHKlAb603cnYVhyI7LkeQ3EvgkO8pVwRUeUeHR6q3Zma2WC1Hx+7BvLiQhDqysFF1Yi+ovDCg==
X-Received: by 2002:a05:620a:17a3:b0:765:aac3:7667 with SMTP id ay35-20020a05620a17a300b00765aac37667mr618062qkb.0.1696362604333;
        Tue, 03 Oct 2023 12:50:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:6022:6438:e898:6c27? ([2600:1700:2000:b002:6022:6438:e898:6c27])
        by smtp.gmail.com with ESMTPSA id r25-20020a05620a03d900b007756fe0bb17sm717260qkm.19.2023.10.03.12.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 12:50:03 -0700 (PDT)
Message-ID: <f4ab7464-3dfb-4d10-8bed-76e7084abd3e@sifive.com>
Date: Tue, 3 Oct 2023 14:50:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next 3/4] RISC-V: cacheflush: Initialize CBO variables
 on ACPI systems
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>,
 Len Brown <lenb@kernel.org>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-4-sunilvl@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230927170015.295232-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_125008_107444_2A999D7D 
X-CRM114-Status: GOOD (  20.84  )
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

On 2023-09-27 12:00 PM, Sunil V L wrote:
> Using new interface to get the CBO block size information in RHCT,
> initialize the variables on ACPI platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/mm/cacheflush.c | 37 +++++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f1387272a551..8e59644e473c 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,7 +3,9 @@
>   * Copyright (C) 2017 SiFive
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/of.h>
> +#include <asm/acpi.h>
>  #include <asm/cacheflush.h>
>  
>  #ifdef CONFIG_SMP
> @@ -124,15 +126,38 @@ void __init riscv_init_cbo_blocksizes(void)
>  	unsigned long cbom_hartid, cboz_hartid;
>  	u32 cbom_block_size = 0, cboz_block_size = 0;
>  	struct device_node *node;
> +	struct acpi_table_header *rhct;
> +	acpi_status status;
> +	unsigned int cpu;
> +
> +	if (!acpi_disabled) {
> +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> +		if (ACPI_FAILURE(status))
> +			return;
> +	}
>  
> -	for_each_of_cpu_node(node) {
> -		/* set block-size for cbom and/or cboz extension if available */
> -		cbo_get_block_size(node, "riscv,cbom-block-size",
> -				   &cbom_block_size, &cbom_hartid);
> -		cbo_get_block_size(node, "riscv,cboz-block-size",
> -				   &cboz_block_size, &cboz_hartid);
> +	for_each_possible_cpu(cpu) {
> +		if (acpi_disabled) {
> +			node = of_cpu_device_node_get(cpu);
> +			if (!node) {
> +				pr_warn("Unable to find cpu node\n");
> +				continue;
> +			}
> +
> +			/* set block-size for cbom and/or cboz extension if available */
> +			cbo_get_block_size(node, "riscv,cbom-block-size",
> +					   &cbom_block_size, &cbom_hartid);
> +			cbo_get_block_size(node, "riscv,cboz-block-size",
> +					   &cboz_block_size, &cboz_hartid);

This leaks a reference to the device node.

> +		} else {
> +			acpi_get_cbo_block_size(rhct, cpu, &cbom_block_size,
> +						&cboz_block_size, NULL);

This function loops through the whole RHCT already. Why do we need to call it
for each CPU? Can't we just call it once, and have it do the same consistency
checks as cbo_get_block_size()?

In that case, the DT path could keep the for_each_of_cpu_node() loop.

Regards,
Samuel

> +		}
>  	}
>  
> +	if (!acpi_disabled && rhct)
> +		acpi_put_table((struct acpi_table_header *)rhct);
> +
>  	if (cbom_block_size)
>  		riscv_cbom_block_size = cbom_block_size;
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
