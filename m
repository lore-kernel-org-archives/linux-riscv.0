Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAB6C64EC7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zXpH0lWQQseloWI1myTqmD0LytiNiUgsvY4GACE7qQ=; b=LdtCuduRBv4zat
	D3b20mYfZkosDszP42PscPB8fyAXENdnt23etPdWD80QnN/1xFsSvpISWgQw4MUuOrIujAzAZ3GPI
	6fx/zLLgM0lE3YgjMS68+jWU8N+3JPwBBg9+iD4JfXc288vSopoHmt4SgeiYFg0LJPlFjATM1cMfv
	ibmdcBPqvSXadTk8O5g0ENMvHwSWc7PGqDefF3tJsllJkMO3W98pTeS/LdLHBW3H9hSX/WJlXcKeI
	GRQLSYTh11CMJzf1kRWvwrLOXHfd4JZqqkpfftwO4CKd8MigFl4HZ8jDyAMZTBbH5VGMgZSiwLYqJ
	Re+KZO3jbLE/l5oCgbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCIg-005RAv-7v; Mon, 20 Feb 2023 19:58:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCId-005RAF-Hh
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 19:58:12 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cy6so3382576edb.5
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 11:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrugdTKLSDJwHyjHjZ36D6OjjlvSRka7EpHAWIsGDzo=;
        b=QaGObWgZc1ovML+WcKgHPHYayMiw6l/d2CRjtcpbEfbU3WzgAUnE4PghRbQkWPZhCM
         zwvEurQW6YHEL0FCkn1CpJ/jj07Q7eCNa2YSgg2pNjmh1pUnHpCvuSLK4yNijpFaMbai
         S9ywBG5R312pa2XZa5Adqa3J6Xiy7bPUob7HuIpdMWP3ypMtipsbdPlKgAZt8tD7ptC/
         sXTBjXSLuLZ4r1SgkbOEfaerw/Q2YoI9/b1B+pF2ossbynGyGeeUQZ2qmW7Dyte/MIot
         GB3kDCmOuDoVE9cgd1xswfqkNi+BohvzTeeyvrM503kxOUlhoyn6eCkJClNVWs5fFc2A
         /klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrugdTKLSDJwHyjHjZ36D6OjjlvSRka7EpHAWIsGDzo=;
        b=RdIM4gfeyPlcTAPrSsXim0ARAU6YpH9jV5pewxClqhgjPcQDrOA6rDqKENFABLm41e
         uxTfhXCMs8bxc1Q/Z35w3IQbZ5fYxTaMRxWXjz6f6maquXTuYLt2Wt/fNNWGK98Um5LY
         C9+lvznEhGn6zOeW6xquIxEfvY3LITv7qi1y/nLtSLOUG7oOeGQL617iNhq3NO1lqg8J
         MOgOvvMTCgioKlQPJayqmZo+z4KaaEC2KaiUYtyZ8bGAlBCpte+lbMueeQvB6lsrI6kx
         g+/sPzzi37VS5cBB0QNzm3rkKH+J6uefo9/EpeGbJLZumwNqKTo7EI9BojlNUl4Xfuqx
         /6Lw==
X-Gm-Message-State: AO0yUKUh173/vL4pp62knMkwty0fdyVvALOstZQKBLWc9/BNbFVxfTPB
	qCR/HAwYaZlQsu2Nu7e9I9aGHA==
X-Google-Smtp-Source: AK7set//9YBqcSpXyQvjERLB7zb/V6CJ6RVjsiEoNC5DrECGp5WFq8Wo5HkcHQI2vOoive6rCOJFHQ==
X-Received: by 2002:a17:907:3e87:b0:8af:4969:1bb4 with SMTP id hs7-20020a1709073e8700b008af49691bb4mr13130826ejc.53.1676923090092;
        Mon, 20 Feb 2023 11:58:10 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w19-20020a170906b19300b008ddf3476c75sm131906ejy.92.2023.02.20.11.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:58:09 -0800 (PST)
Date: Mon, 20 Feb 2023 20:58:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 17/21] RISC-V: time.c: Add ACPI support for time_init()
Message-ID: <20230220195808.reyuclvefujucpsq@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-18-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-18-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_115811_606466_E709492E 
X-CRM114-Status: GOOD (  20.76  )
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

On Thu, Feb 16, 2023 at 11:50:39PM +0530, Sunil V L wrote:
> On ACPI based platforms, timer related information is
> available in RHCT. Add ACPI based probe support to the
> timer initialization.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/kernel/time.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 1cf21db4fcc7..e49b897fc657 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/of_clk.h>
>  #include <linux/clockchips.h>
>  #include <linux/clocksource.h>
> @@ -18,17 +19,29 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
>  void __init time_init(void)
>  {
>  	struct device_node *cpu;
> +	struct acpi_table_rhct *rhct;
> +	acpi_status status;
>  	u32 prop;
>  
> -	cpu = of_find_node_by_path("/cpus");
> -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> -	of_node_put(cpu);
> -	riscv_timebase = prop;
> +	if (acpi_disabled) {
> +		cpu = of_find_node_by_path("/cpus");
> +		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> +			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
> +		of_node_put(cpu);
> +		riscv_timebase = prop;
> +	} else {
> +		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
> +		if (ACPI_FAILURE(status))
> +			panic("RISC-V ACPI system with no RHCT table\n");
> +		riscv_timebase = rhct->time_base_freq;
> +		acpi_put_table((struct acpi_table_header *)rhct);
> +	}
>  
>  	lpj_fine = riscv_timebase / HZ;
>  
> -	of_clk_init(NULL);
> +	if (acpi_disabled)
> +		of_clk_init(NULL);

I think we should be able to move of_clk_init() up into the acpi_disabled
arm rather than add another if here.

> +
>  	timer_probe();
>  
>  	tick_setup_hrtimer_broadcast();
> -- 
> 2.34.1
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
