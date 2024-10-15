Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E45D20680
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVQS11qGFT6iD2Sfc7A1ogfAHUVmnRkHV+Wb2fVRy2k=; b=yHXHf3ckQMlYJl
	MzuPDewdNZXseaJZxDEeuBg8TdcYy0Qpp8ACcFlEZRSk6uFy3LUt5Xe906MyKipFeamo4KZTKRjM1
	pQKa+9jXYAQ3gGAIdLLXmmXLkasJV8XHs1l0UfmjTau/axjGyLGo+8nB4g6PK2SpEd7YNUp9L4Lo0
	IrO+1qJG1Fqghl1HqqSl+vdGXlXst4eB+Qf0Zu686jJVvAAL/oCaY5Hc4D1k4YT5NE0K41KZhTnOY
	A0o+F2HegdXIB/1YP1+fqWZAqaymcW5viv4t9r9Idyjp8IX1iqD6pJu5goTa40px2DpxB8uorwoYL
	QpGkxyXmp1+SLX+fpg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0qGB-00000009pKb-3EXO;
	Tue, 15 Oct 2024 22:43:23 +0000
Received: from mail-yw1-x1144.google.com ([2607:f8b0:4864:20::1144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0qG8-00000009pIa-1HlP
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 22:43:22 +0000
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-6e31413a196so48803677b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 15:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729032198; x=1729636998; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLa3yK6bQQGOZkFDiv3mQXcVUn0bBI+yeZ+z+r3TlBQ=;
        b=C1fCvyQd3RFRAZhPuubrxfyipiJk3Bz9727mZHLyZ7kmKJ2vN1LLnIhOn2tlEv10X8
         HTwBH4A2F6FQMJkV58p8xLAG6qO8oYOTfZTvH47bcY3Bgv66ad4NYgJwxFIGE2B8j9BX
         IsAstOETAfCvpuZL+CfZTj034wcOD9ZNzjdgSoHPasdarksXadzmk0XdaknqL6+TiTFo
         6FcdTUHWr/7iOO7mDWtGfnLi44zi9vufayTrZbBXVz270UpONK7uL2z2GJvqKUvZuopn
         uybfjEJ51uzRSQdz1cb+PUehyFAM9gaO+pRJnKkDXloud6C9i7SAmGmz6h1s3mMahYI4
         h26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729032198; x=1729636998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLa3yK6bQQGOZkFDiv3mQXcVUn0bBI+yeZ+z+r3TlBQ=;
        b=UJomzmFfdGpGdWkrm74ciM7U3thr1+FAGwtlIEOhrxIjXeTBVqldLkZDHDdkJLDnQo
         fGbQx2AwQfYa6EUQTIWule2R447VdxQ3sQqGKbndQj+iIxl6SkCj/WvJ7bA7IvyQT3sb
         Ctg+wsPvspJLuMVqtRlgQO5FIR0ds00vhAZZApM7x892CEBo6WTRIX7ijdArlo9DU32B
         lA3SJQPl8lUU+PGVlJR82pNz3mRYNLM4cCv+ReXAHLsZB2sJCH3NAYyfDrGO2OTlRG8x
         Xzw+aQlrfjSX0ykHP76KqvhEDRb+aAD4QKdy7sdB4wd4xY7EXpkd+WTUFNHCF61CQsmm
         jAtw==
X-Forwarded-Encrypted: i=1; AJvYcCV+D+4HihQePdlHEht+DwCyonZIf8mvlJx61if+S9NTGIyPeDTzgAEm3OIz6oPAUl7geTZ+sjHfuqnrWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxufuJd5eVKDPLZfyxbIorvlqOD7A5CvPV7DlJzSoEo0mXLS9Wl
	ANjlIEWPyHmLZ6Au+olwfDQ0/ui+w6GeJYr+O6CgHB7wKYNFTECwXAootfIk8pY=
X-Google-Smtp-Source: AGHT+IGUiF3SK+LvZfYqhzb2T0k6C8cDKYi6l1lavCj5lHAZLRuEB5sHRrKdnbOYjSLrvhVonK2yzw==
X-Received: by 2002:a05:6902:250c:b0:e28:6b10:51b5 with SMTP id 3f1490d57ef6-e2931b62769mr9926138276.32.1729032198487;
        Tue, 15 Oct 2024 15:43:18 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e296cbfaf03sm390123276.7.2024.10.15.15.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:43:17 -0700 (PDT)
Message-ID: <35d288d3-56dd-4018-8b98-78311c29a25d@sifive.com>
Date: Tue, 15 Oct 2024 17:43:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Yangyu Chen <cyy@cyyself.name>, Jinyu Tang <tangjinyu@tinylab.org>,
 Hal Feng <hal.feng@starfivetech.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20241009224410.53188-1-inochiama@gmail.com>
 <20241009224410.53188-3-inochiama@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20241009224410.53188-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_154320_432093_7A4E76EF 
X-CRM114-Status: GOOD (  33.72  )
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

Hi Inochi,

On 2024-10-09 5:44 PM, Inochi Amaoto wrote:
> Add a driver for the T-HEAD C900 ACLINT SSWI device, which is an
> enhanced implementation of the RISC-V ACLINT SSWI specification.
> This device allows the system to send ipi via fast device interface.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/irqchip/Kconfig                      |  10 ++
>  drivers/irqchip/Makefile                     |   1 +
>  drivers/irqchip/irq-thead-c900-aclint-sswi.c | 166 +++++++++++++++++++
>  include/linux/cpuhotplug.h                   |   1 +
>  4 files changed, 178 insertions(+)
>  create mode 100644 drivers/irqchip/irq-thead-c900-aclint-sswi.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 341cd9ca5a05..32671385cbb7 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -611,6 +611,16 @@ config STARFIVE_JH8100_INTC
>  
>  	  If you don't know what to do here, say Y.
>  
> +config THEAD_C900_ACLINT_SSWI
> +	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
> +	depends on RISCV
> +	select IRQ_DOMAIN_HIERARCHY
> +	help
> +	  This enables support for T-HEAD specific ACLINT SSWI device
> +	  support.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config EXYNOS_IRQ_COMBINER
>  	bool "Samsung Exynos IRQ combiner support" if COMPILE_TEST
>  	depends on (ARCH_EXYNOS && ARM) || COMPILE_TEST
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index e3679ec2b9f7..583418261253 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
>  obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
>  obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
>  obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
> +obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
>  obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
>  obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
>  obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
> diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> new file mode 100644
> index 000000000000..b96d3b81dc14
> --- /dev/null
> +++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
> +#include <linux/cpu.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/pci.h>
> +#include <linux/spinlock.h>
> +#include <linux/smp.h>
> +#include <linux/string_choices.h>
> +
> +#define ACLINT_xSWI_REGISTER_SIZE	4
> +
> +static int sswi_ipi_virq __ro_after_init;
> +static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
> +
> +static void thead_aclint_sswi_ipi_send(unsigned int cpu)
> +{
> +	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
> +}
> +
> +static void thead_aclint_sswi_ipi_clear(void)
> +{
> +	writel_relaxed(0x0, this_cpu_read(sswi_cpu_regs));

This isn't quite compliant with the ACLINT spec[1], which states: "Writing 0 to
the least significant bit of a SETSSIP register has no effect". In a RISC-V
ACLINT, only the CSR write is required to clear the interrupt.

This implementation does match the behavior of the T-HEAD CLINT extensions which
are also present in C906/C910[2][3][4].

This raises the question: in the older CPUs, using this functionality requires
setting the mxstatus.CLINTEE bit from M-mode. Is this still the case for the
C920 CPU in SG2044? If so, the driver should check sxstatus.CLINTEE when probing.

It would also be ideal if we could support the other SoCs that use this same IP
block, but with the other CLINT binding.

Regards,
Samuel

[1]: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
[2]:
https://occ-intl-prod.oss-ap-southeast-1.aliyuncs.com/resource/XuanTie-OpenC906-UserManual.pdf
[3]:
https://github.com/XUANTIE-RV/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/clint/rtl/clint_func.v#L285
[4]:
https://github.com/XUANTIE-RV/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/cp0/rtl/aq_cp0_trap_csr.v#L1240

> +}
> +
> +static void thead_aclint_sswi_ipi_handle(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +
> +	chained_irq_enter(chip, desc);
> +
> +	csr_clear(CSR_IP, IE_SIE);
> +	thead_aclint_sswi_ipi_clear();
> +
> +	ipi_mux_process();
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static int thead_aclint_sswi_starting_cpu(unsigned int cpu)
> +{
> +	enable_percpu_irq(sswi_ipi_virq, irq_get_trigger_type(sswi_ipi_virq));
> +
> +	return 0;
> +}
> +
> +static int thead_aclint_sswi_dying_cpu(unsigned int cpu)
> +{
> +	thead_aclint_sswi_ipi_clear();
> +
> +	disable_percpu_irq(sswi_ipi_virq);
> +
> +	return 0;
> +}
> +
> +static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
> +					void __iomem *reg)
> +{
> +	struct of_phandle_args parent;
> +	unsigned long hartid;
> +	u32 contexts, i;
> +	int rc, cpu;
> +
> +	contexts = of_irq_count(to_of_node(fwnode));
> +	if (!(contexts)) {
> +		pr_err("%pfwP: no ACLINT SSWI context available\n", fwnode);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < contexts; i++) {
> +		rc = of_irq_parse_one(to_of_node(fwnode), i, &parent);
> +		if (rc)
> +			return rc;
> +
> +		rc = riscv_of_parent_hartid(parent.np, &hartid);
> +		if (rc)
> +			return rc;
> +
> +		if (parent.args[0] != RV_IRQ_SOFT)
> +			return -ENOTSUPP;
> +
> +		cpu = riscv_hartid_to_cpuid(hartid);
> +
> +		per_cpu(sswi_cpu_regs, cpu) = reg + i * ACLINT_xSWI_REGISTER_SIZE;
> +	}
> +
> +	pr_info("%pfwP: register %u CPU%s\n", fwnode, contexts, str_plural(contexts));
> +
> +	return 0;
> +}
> +
> +static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
> +{
> +	struct irq_domain *domain;
> +	void __iomem *reg;
> +	int virq, rc;
> +
> +	if (!is_of_node(fwnode))
> +		return -EINVAL;
> +
> +	reg = of_iomap(to_of_node(fwnode), 0);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	/* Parse SSWI setting */
> +	rc = aclint_sswi_parse_irq(fwnode, reg);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* If mulitple SSWI devices are present, do not register irq again */
> +	if (sswi_ipi_virq)
> +		return 0;
> +
> +	/* Find riscv intc domain and create IPI irq mapping */
> +	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
> +	if (!domain) {
> +		pr_err("%pfwP: Failed to find INTC domain\n", fwnode);
> +		return -ENOENT;
> +	}
> +
> +	sswi_ipi_virq = irq_create_mapping(domain, RV_IRQ_SOFT);
> +	if (!sswi_ipi_virq) {
> +		pr_err("unable to create ACLINT SSWI IRQ mapping\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Register SSWI irq and handler */
> +	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
> +	if (virq <= 0) {
> +		pr_err("unable to create muxed IPIs\n");
> +		irq_dispose_mapping(sswi_ipi_virq);
> +		return virq < 0 ? virq : -ENOMEM;
> +	}
> +
> +	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
> +
> +	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
> +			  "irqchip/thead-aclint-sswi:starting",
> +			  thead_aclint_sswi_starting_cpu,
> +			  thead_aclint_sswi_dying_cpu);
> +
> +	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
> +
> +	/* Announce that SSWI is providing IPIs */
> +	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
> +
> +	return 0;
> +}
> +
> +static int __init aclint_sswi_early_probe(struct device_node *node,
> +					  struct device_node *parent)
> +{
> +	return aclint_sswi_probe(&node->fwnode);
> +}
> +IRQCHIP_DECLARE(thead_aclint_sswi, "thead,c900-aclint-sswi", aclint_sswi_early_probe);
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 2361ed4d2b15..799052249c7b 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -147,6 +147,7 @@ enum cpuhp_state {
>  	CPUHP_AP_IRQ_EIOINTC_STARTING,
>  	CPUHP_AP_IRQ_AVECINTC_STARTING,
>  	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
> +	CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
>  	CPUHP_AP_IRQ_RISCV_IMSIC_STARTING,
>  	CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING,
>  	CPUHP_AP_ARM_MVEBU_COHERENCY,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
