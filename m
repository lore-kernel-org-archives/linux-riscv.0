Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0081C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZenyU3qd1v1z6ZFMlpX06tsTLeBjkWT5+1vnspmLoAg=; b=EV978bz9GKwZut
	QXQFG2WlF6uIwX+uSzZkwR7DOZW5eRradpBUS82E0s6m4qljTQZ8D8PhDTRXBwfd+clxX2qCurSuc
	H/ZtNBpLSAhtERuLw1e0doGiUr//aST9DwCgaBKGX0Wa+etTHN1PdCtD0r27JFqmMPjjC4ITrDHn3
	q1TtOTeanjoYj3okvjX33l6RJQemPErDXcoDSOitMqaHqFxhzMAe97cjDyk0V8S0RE+RdnVtOFBYn
	a/9MSATx3sEHHYthaYnYhPnY+5Geda/UMrhR1hOE5+9AmdTtsW/n5/+gZLxZmVtOGIOUb3mb1lDLm
	j7NfDdZJi52wX9rg4kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFNj-005T5p-0t;
	Wed, 02 Aug 2023 17:11:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFNf-005T57-2o
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 17:11:29 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso90586e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690996285; x=1691601085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=34DA9pMD4wBr+3unRCRsGzYfKr+oDTUZCNzA3gcsoxs=;
        b=LRUrWxuBaIRsURDjLJM4SRP8xKsxtj7NFVGfHMMjZlmHpy/DXrj6Dk1TKVlUhXJ+0n
         HUoeDfvKYFX2eTiR7Qlmld1cZPgJwLyrZtfwGz+5LHOY+TF2Nu+ONvnjMZDY5P/X0Btb
         3FnM9Fg24Htkyxy1d6fxhVJpB7YtOw8he3duwebDXBvrYgIpKfMKBxrCtnN/UZr/UW9j
         6MihSTH1F99/EWJFhvsVj0R3mzUcs52+IiNPcBlPsCFTkmo4j5QmcYmB8a+4XN1PTlyj
         pcC35eU0DxlQhZnc/LdhyczrYknrerJFWygJK2Vpbh5UBchsUMlwvQtLFM2DW+ogIKVc
         bgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690996285; x=1691601085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DA9pMD4wBr+3unRCRsGzYfKr+oDTUZCNzA3gcsoxs=;
        b=S209BuQhAmRVC9kHWTYcsWlRrVKBun/cWPh+oIme1qvP5wkwpJyI2VZu4+3x7fOWFa
         pSpyCJyJngpAoegu266yiuXifBOWxZiclZLuetBVlFgxSIh2KkHSbOE+q8SyTPC+ryK8
         ekGuO8xnpx1iHJrSF0U+WbpnilC3WqtFT3EVx3O5PJhFZIJUpQAtrJdjGFOzMUTWpUFe
         n+CqFbC3M4074K+TKjIJQxAhelt14tBCHXZIgJuOVVYx4z38ud+tblvx3++UUCisZ5an
         7j+TG1Tg3Sj/UCnBnnq04X+bVnrSS1rlGJsnXXpe3Zc8p7LihAq5I4fhz8FSHr18Z16A
         zXIQ==
X-Gm-Message-State: ABy/qLb/p21DiP/yK1MzIFNvjWkxdj501ydmLKpgRYjlg3SCsTQFIyRY
	pwrvmAo8ry3IFWJspyI5nxFt4A==
X-Google-Smtp-Source: APBJJlGI44p7qA5sPeEuLWaWIN0vPKpkAyJPhnm6zEsb/fEBmKfWARUlL1Pf67z+zh5XUS3xoQVt/Q==
X-Received: by 2002:a2e:9f52:0:b0:2b6:d7d1:95c0 with SMTP id v18-20020a2e9f52000000b002b6d7d195c0mr5400787ljk.11.1690996285320;
        Wed, 02 Aug 2023 10:11:25 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id y9-20020a170906470900b0099bc8db97bcsm9323600ejq.131.2023.08.02.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:11:24 -0700 (PDT)
Date: Wed, 2 Aug 2023 20:09:18 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 01/15] RISC-V: Add riscv_get_intc_hartid() function
Message-ID: <20230802-b0c478839e55890385d98f31@orel>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
 <20230802150018.327079-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802150018.327079-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_101127_911273_EF928731 
X-CRM114-Status: GOOD (  33.81  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 02, 2023 at 08:30:04PM +0530, Anup Patel wrote:
> We add a common riscv_get_intc_hartid() which help device drivers to
> get hartid of the HART associated with a INTC (i.e. local interrupt
> controller) fwnode. This new function is more generic compared to
> the existing riscv_of_parent_hartid() function hence we also replace
> use of riscv_of_parent_hartid() with riscv_get_intc_hartid().
> 
> Also, while we are here let us update riscv_of_parent_hartid() to
> always return the hartid irrespective whether the CPU/HART DT node
> is disabled or not.

This change should probably be a separate patch with its own
justification in its commit message.

> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/processor.h |  4 +++-
>  arch/riscv/kernel/cpu.c            | 26 ++++++++++++++++++++------
>  drivers/irqchip/irq-riscv-intc.c   |  2 +-
>  drivers/irqchip/irq-sifive-plic.c  |  3 ++-
>  4 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index c950a8d9edef..662da1e112dd 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -79,7 +79,9 @@ static inline void wait_for_interrupt(void)
>  struct device_node;
>  int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
>  int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
> -int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
> +
> +struct fwnode_handle;
> +int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid);

Do we want a function that is named in a way that appears to be
intc-specific in processor.h?

>  
>  extern void riscv_fill_hwcap(void);
>  extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index a2fc952318e9..c3eaa8a55bbe 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -81,21 +81,35 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>   * To achieve this, we walk up the DT tree until we find an active
>   * RISC-V core (HART) node and extract the cpuid from it.
>   */
> -int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
> +static int riscv_of_parent_hartid(struct device_node *node,
> +				  unsigned long *hartid)
>  {
> -	int rc;
> -
>  	for (; node; node = node->parent) {
>  		if (of_device_is_compatible(node, "riscv")) {
> -			rc = riscv_of_processor_hartid(node, hartid);
> -			if (!rc)
> -				return 0;
> +			*hartid = (unsigned long)of_get_cpu_hwid(node, 0);

Shouldn't we still do something like

   if (*hartid == ~0UL) {
       pr_warn_once("Found CPU without hart ID\n");
       return -ENODEV;
   }

> +			return 0;
>  		}
>  	}
>  
>  	return -1;
>  }
>  
> +/* Find hart ID of the INTC fwnode. */
> +int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid)
> +{
> +	int rc;
> +	u64 temp;
> +
> +	if (!is_of_node(node)) {
> +		rc = fwnode_property_read_u64_array(node, "hartid", &temp, 1);

This fwnode property read call seems premature, since we don't have any
way to know that "hartid" will be a property of the intc since it's not a
property documented in the DT binding. (I know Sunil has a series in
progress which will introduce "hartid" for ACPI, but, even then, it seems
like we need some documentation to point at that says '"hartid" is the
name to use'.

> +		if (!rc)
> +			*hartid = temp;
> +	} else
> +		rc = riscv_of_parent_hartid(to_of_node(node), hartid);
> +
> +	return rc;
> +}
> +
>  DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  
>  unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 4adeee1bc391..65f4a2afb381 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -143,7 +143,7 @@ static int __init riscv_intc_init(struct device_node *node,
>  	int rc;
>  	unsigned long hartid;
>  
> -	rc = riscv_of_parent_hartid(node, &hartid);
> +	rc = riscv_get_intc_hartid(of_fwnode_handle(node), &hartid);
>  	if (rc < 0) {
>  		pr_warn("unable to find hart id for %pOF\n", node);
>  		return 0;
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index e1484905b7bd..56b0544b1f27 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -477,7 +477,8 @@ static int __init __plic_init(struct device_node *node,
>  			continue;
>  		}
>  
> -		error = riscv_of_parent_hartid(parent.np, &hartid);
> +		error = riscv_get_intc_hartid(of_fwnode_handle(parent.np),
> +					      &hartid);
>  		if (error < 0) {
>  			pr_warn("failed to parse hart ID for context %d.\n", i);
>  			continue;
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
