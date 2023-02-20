Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9860C636D6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 19:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Idag5gmUa0u6TaQUNmmpMWjj7Vuif8Wz1tDsJ6Igsvw=; b=kKajzGa9381ogE
	85FUSsEQfMFgYX68SWLu1jlSQ3bIVnyvTkIrM4jeHRaqIUs6Q04xl4OPZkJVXFKcpF0RTa5qjqQEp
	EBolfE/YTbICjZabLc8PJLZSA9ZRmTOmkJPxJyqbZOq1fONfBnSaCzXH4V3o0gisroIsiGQ+i/mfk
	3Xc0+C53sVHLvy4MY6ngNJz21PUB4EPKD2EYXjk6vXGyEzkMeUhw85oXXL/z7a7ypistcL4d4sg7H
	icHP9Je7rdPZQuRfFSLsi8K05pBKb12vPrI8I0ZWjxHVSXuOeiEg3FWdKMaP+D/5nVDsYeqO0g4Nj
	jzkCMqQxIZni+VUcDbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUC8N-005PRX-Fh; Mon, 20 Feb 2023 19:47:35 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUC8L-005PPy-6R
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 19:47:34 +0000
Received: by mail-ed1-x533.google.com with SMTP id h16so8954557edz.10
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 11:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yUq4FLB/m803F8fK5gZnIqcPnrhr2EPp/zQNvrCSCU=;
        b=Nlw2qqdiuA+f6FDd37PV1+VWypIXmelCRTvF41kn2/XQJVs/PUbZeL1cChlgHIL6tA
         YEqLLvfPvioOkiry08GiJPu+nhAHiFRZDW5UTHJcvttvvlUokneNZnR8HMKYc9AKkDCP
         EYMqikEdcIwdBySNMkJLuxT5xtuP/4PYwyOPb9oXgeF1trSqPB95edwgQVDuIXujf7N3
         230nnVnBABlLfdyrt7wEz1qYOaX9thIsPOFRrspnuQ4k/FT/smsCwTIOc7RXfGShK6bZ
         kWLfGcKvVoDTQAIsA1z59gDh/EWLkKyNfyLLZdyoSHe/VfBmlIr8hMWgnQKxDPX7AXeW
         /u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yUq4FLB/m803F8fK5gZnIqcPnrhr2EPp/zQNvrCSCU=;
        b=XH/FXx5/I/tz8MJzBPZgcH3nVQRLx4yV9WjJwnhhnNz2vxt421cVeXVMId0iDUYiXM
         g4dF1DGDIozV+msj5u7lG8RLHxFdhkWWHB/WLEa4ha5+a4osj3+KPGwhKlxUmNtZgMS8
         ZfSOVLJx05z3XuXtAZWSZSBamXIHY54R+vpxM+s2PpnvzHFFJZ4pRCi+IJEILT6jvGTY
         MM6DcDLly7LR0Y4EWRZQpK5DNo9gvZmGzPa6eTpVE82MLifNEzP/zwSfePyfNIBf/oj7
         faF65RKQeLv2dpIFN5EG5eWx/Wkagrs1j3aZWgGjOCTKmYfSCpwvjhdQYCwGQHB6Iva+
         70aQ==
X-Gm-Message-State: AO0yUKWtjoda13wSFGcCkoqFVB84aKeGVQ0nhRdwYHSFDh7q/FErG5kH
	tGPeKFKDoATgwY6MJGEBCg7bhQ==
X-Google-Smtp-Source: AK7set8RywwJjUsXHxcla4nZoFxtGhrqCjIKnFCmuP2n+AzhTmEkkrnNyLjn4u75+PR+ezJZq/UB3w==
X-Received: by 2002:a17:906:9bec:b0:8b2:fa6d:45e6 with SMTP id de44-20020a1709069bec00b008b2fa6d45e6mr11552300ejc.2.1676922447830;
        Mon, 20 Feb 2023 11:47:27 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z12-20020a1709064e0c00b008c405ebc32esm3249911eju.28.2023.02.20.11.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:47:27 -0800 (PST)
Date: Mon, 20 Feb 2023 20:47:26 +0100
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
Subject: Re: [PATCH V2 15/21] clocksource/timer-riscv: Refactor
 riscv_timer_init_dt()
Message-ID: <20230220194726.meppdac4y7qdjsoj@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-16-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-16-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_114733_263693_E259D829 
X-CRM114-Status: GOOD (  22.02  )
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

On Thu, Feb 16, 2023 at 11:50:37PM +0530, Sunil V L wrote:
> Refactor the timer init function such that few things can be
> shared by both DT and ACPI based platforms.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/clocksource/timer-riscv.c | 82 +++++++++++++++----------------
>  1 file changed, 40 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 1b4b36df5484..2ae8e300d303 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -119,61 +119,28 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int __init riscv_timer_init_dt(struct device_node *n)
> +static int __init riscv_timer_init_common(void)
>  {
> -	int cpuid, error;
> -	unsigned long hartid;
> -	struct device_node *child;
> -	struct irq_domain *domain;
> +	int error;
> +	struct irq_domain *domain = NULL;

domain is always assigned below, so we don't need to set it NULL here.

> +	struct fwnode_handle *intc_fwnode = riscv_get_intc_hwnode();
>  
> -	error = riscv_of_processor_hartid(n, &hartid);
> -	if (error < 0) {
> -		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
> -			n, hartid);
> -		return error;
> -	}
> -
> -	cpuid = riscv_hartid_to_cpuid(hartid);
> -	if (cpuid < 0) {
> -		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
> -		return cpuid;
> -	}
> -
> -	if (cpuid != smp_processor_id())
> -		return 0;
> -
> -	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> -	if (child) {
> -		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
> -					"riscv,timer-cannot-wake-cpu");
> -		of_node_put(child);
> -	}
> -
> -	domain = NULL;
> -	child = of_get_compatible_child(n, "riscv,cpu-intc");
> -	if (!child) {
> -		pr_err("Failed to find INTC node [%pOF]\n", n);
> -		return -ENODEV;
> -	}
> -	domain = irq_find_host(child);
> -	of_node_put(child);
> +	domain = irq_find_matching_fwnode(intc_fwnode, DOMAIN_BUS_ANY);
>  	if (!domain) {
> -		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
> +		pr_err("Failed to find irq_domain for INTC node [%pfwP]\n",
> +		       intc_fwnode);
>  		return -ENODEV;
>  	}
>  
>  	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
>  	if (!riscv_clock_event_irq) {
> -		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
> +		pr_err("Failed to map timer interrupt for node [%pfwP]\n", intc_fwnode);
>  		return -ENODEV;
>  	}
>  
> -	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
> -	       __func__, cpuid, hartid);
>  	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>  	if (error) {
> -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> -		       error, cpuid);
> +		pr_err("RISCV timer registration failed [%d]\n", error);
>  		return error;
>  	}
>  
> @@ -202,4 +169,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  	return error;
>  }
>  
> +static int __init riscv_timer_init_dt(struct device_node *n)
> +{
> +	int cpuid, error;
> +	unsigned long hartid;
> +	struct device_node *child;
> +
> +	error = riscv_of_processor_hartid(n, &hartid);
> +	if (error < 0) {
> +		pr_warn("Invalid hartid for node [%pOF] error = [%lu]\n",
> +			n, hartid);
> +		return error;
> +	}
> +
> +	cpuid = riscv_hartid_to_cpuid(hartid);
> +	if (cpuid < 0) {
> +		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
> +		return cpuid;
> +	}
> +
> +	if (cpuid != smp_processor_id())
> +		return 0;
> +
> +	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> +	if (child) {
> +		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
> +					"riscv,timer-cannot-wake-cpu");
> +		of_node_put(child);
> +	}

need blank line here

> +	return riscv_timer_init_common();
> +}
> +
>  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
