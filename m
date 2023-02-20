Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE424C636D6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Abqc9wj4YHpfGsdXMMar3I8rja3fSxtNf+4bi9sP/bU=; b=PnjVnd+fkLuY5X
	DiHhEoZZNyXGJPO1Ut4w/vV1Jte8e/8tcSYGDNwxoCdwX7GMaFeGlx/dHBLASBQoTJzBvAHsmZj9W
	SbtwIVvQpeqth1zk+erKAFWrRDETjDiyIF8P4cO8IY7KVXX1Qn4lRXQ2ZFn7AtaHWw6+VEK1r82FW
	5m9S84OZCZeiK90aIRQ4P/Ox+6dAnxk1oCDCWLAmAckFs6x6aQyyruNwYZTqEF0LBdL1CnKAhYCAm
	q3zh+d9rjGqN7BuVL1aZQN963Cz38DPiv81vlvESW9bXB7DuTSnAg15IY9JnV7Llqyo3zpC1dc/+k
	cguiGQ7Xz0a20T+rtA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUByS-005NnJ-OG; Mon, 20 Feb 2023 19:37:20 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUByP-005Nmd-Ok
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 19:37:19 +0000
Received: by mail-ed1-x52f.google.com with SMTP id f13so8152467edz.6
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 11:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJVBt3/YJNTn3qprChv795hjhggAd8khstdoNTzpzHo=;
        b=dWt6MGmkihA5uqeHIcvRZBSlYD5Phimw9u0TJRTYf+Vsm6BQlqG2p4thi2GbYMZomi
         R8iXdp3BLmQ0rb8nD9T59x6iGcVyryso0N1SpStf5DWXqQliGtvidSEnuiTFYiq9bwKS
         MAaFgfi8OQGydLx2sHbX4Ln71Ilp6DbN+Pt9WmROSLLL1NSSbwHO5iwQ9tyqleFyomMe
         uSVJDe95mN4r/7S4e64U8AENQR04YweERcwZSdrWNw5b4juhUBuZI0v4i50NwZXlK+NF
         9ehL8lEbPRhPAFhWyDuo/nbUZzjD8m3BAJ35ObBxCER68R5v8yTlOy4J/ShREhL8KWgG
         X+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJVBt3/YJNTn3qprChv795hjhggAd8khstdoNTzpzHo=;
        b=wLme4sEBbBlEq2oTRviauv2KAmf1fQBQKd9x8yCcxQLmnu/yf4GrEqY1MwRprj25CJ
         Hy9WaEeew5hAVLU3Z9BY+Xm231w5b+WHVfxCB+KTyLrjhxTWp4xiIcm6LnkYXsOJ1Ore
         HTTN8l5Y9S6lQ5SSVyikcYPlYzPwbsxcxGfOhRJtJgXEHw4LJ9f6tapWtt3OGcgZbmzE
         U52ejqFMIbY8arl2RvMt53pVw2GCXWizqQAf3yVMISrAHawjJZGbGdmhYxEo0JiDW8Vw
         /1Izg+oKclhJkCShy/P0V6b7skL1FCZ2TmOFhu2cI7LRrmFPvyQbIeOdPbKZ843YvEMX
         O3RA==
X-Gm-Message-State: AO0yUKVJ6hwZixjtooZf95gbmGJSVnwvBg2RZ+X7sODRpFs3QOL8nlB3
	6JiYVOaK4ajAK5Ypz6Z6UMjMcw==
X-Google-Smtp-Source: AK7set+BSMcumfMl+jddfOTjTB/vuhi+s06jPFTcqynULYCS0JmyqnhwX3tgdid0842xakTTzqT2zg==
X-Received: by 2002:a17:907:2cc7:b0:885:6d0f:4660 with SMTP id hg7-20020a1709072cc700b008856d0f4660mr15074547ejc.22.1676921835816;
        Mon, 20 Feb 2023 11:37:15 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i14-20020a50d74e000000b004acbde59e64sm1782600edj.8.2023.02.20.11.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:37:15 -0800 (PST)
Date: Mon, 20 Feb 2023 20:37:14 +0100
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
Subject: Re: [PATCH V2 14/21] irqchip/riscv-intc: Add ACPI support
Message-ID: <20230220193714.kuef6sfg7xmdyfty@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-15-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-15-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_113717_828456_673B2BB9 
X-CRM114-Status: GOOD (  24.59  )
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

On Thu, Feb 16, 2023 at 11:50:36PM +0530, Sunil V L wrote:
> Add support for initializing the RISC-V INTC driver on ACPI
> platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/irqchip/irq-riscv-intc.c | 78 +++++++++++++++++++++++++++-----
>  1 file changed, 66 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index f229e3e66387..97a8db0fbc6c 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #define pr_fmt(fmt) "riscv-intc: " fmt
> +#include <linux/acpi.h>
>  #include <linux/atomic.h>
>  #include <linux/bits.h>
>  #include <linux/cpu.h>
> @@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
>  	return intc_domain->fwnode;
>  }
>  
> +static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> +{
> +	int rc;
> +
> +	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> +					       &riscv_intc_domain_ops, NULL);
> +	if (!intc_domain) {
> +		pr_err("unable to add IRQ domain\n");
> +		return -ENXIO;
> +	}
> +
> +	rc = set_handle_irq(&riscv_intc_irq);
> +	if (rc) {
> +		pr_err("failed to set irq handler\n");
> +		return rc;
> +	}
> +
> +	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> +
> +	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> +
> +	return 0;
> +}
> +
>  static int __init riscv_intc_init(struct device_node *node,
>  				  struct device_node *parent)
>  {
> @@ -133,24 +158,53 @@ static int __init riscv_intc_init(struct device_node *node,
>  	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
>  		return 0;
>  
> -	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> -					    &riscv_intc_domain_ops, NULL);
> -	if (!intc_domain) {
> -		pr_err("unable to add IRQ domain\n");
> -		return -ENXIO;
> -	}
> -
> -	rc = set_handle_irq(&riscv_intc_irq);
> +	rc = riscv_intc_init_common(of_node_to_fwnode(node));
>  	if (rc) {
> -		pr_err("failed to set irq handler\n");
> +		pr_err("failed to initialize INTC\n");
>  		return rc;
>  	}
>  
> -	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> +	return 0;
> +}
>  
> -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> +IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> +
> +#ifdef CONFIG_ACPI
> +
> +static int __init
> +riscv_intc_acpi_init(union acpi_subtable_headers *header,
> +		     const unsigned long end)

Please keep the function and its return type on the same line. We can go
to 100 chars.

> +{
> +	int rc;
> +	struct fwnode_handle *fn;
> +	struct acpi_madt_rintc *rintc;
> +
> +	rintc = (struct acpi_madt_rintc *)header;
> +
> +	/*
> +	 * The ACPI MADT will have one INTC for each CPU (or HART)
> +	 * so riscv_intc_acpi_init() function will be called once
> +	 * for each INTC. We only do INTC initialization
> +	 * for the INTC belonging to the boot CPU (or boot HART).
> +	 */
> +	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
> +		return 0;
> +
> +	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
> +	if (!fn) {
> +		pr_err("unable to allocate INTC FW node\n");
> +		return -ENOMEM;
> +	}
> +
> +	rc = riscv_intc_init_common(fn);
> +	if (rc) {
> +		pr_err("failed to initialize INTC\n");
> +		return rc;
> +	}
>  
>  	return 0;
>  }
>  
> -IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> +IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
> +		     ACPI_MADT_RINTC_VERSION_V1, riscv_intc_acpi_init);
> +#endif
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
