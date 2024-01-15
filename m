Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60B9C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0M2C9XqTzFgml91TV7NrQALScMQajvxWTDW2A4Di5/w=; b=qkjs0QAv/X9GSM
	cLSy3h7qA4010CF5HKn3FtHD6OvVJIHRBWkf7mlN5fGZ56ld9YW9rBYMPBdfVA+bC4/Bu9tcgXtF8
	zosa9qdKFn3mn9N4A4okgrM0IGXEMjQAeGPfzywNHieAIZ37kSoWDACkZDdCouFZo4Vk967QeVIrF
	MSf1Uhl6PHHrhd6ixO8Vi5PTJJ19k859cpYe6YQUqcrFLS3RVm7ZaGNX8u66NuUygrBgqDxCzHBWB
	QJpPsGewQhA23crrnZ8HQTVMdEkP3BBfQkKXBWnlPrJlmfw9jJXRsAF8vzxq+Rf/iKcSfTIdIy1qn
	q5bfO4N8b06pho62Zk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPOq5-009OKT-02;
	Mon, 15 Jan 2024 15:25:25 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPOq1-009OI9-2T
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:25:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-557c188f313so13682189a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705332317; x=1705937117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3Au/gRaaczdqwoxq154l1Vb0TSRdBUZsRRgmxL/3EA=;
        b=GF+fdni7MfUmMyjhlHFkY1yozI5Ajb4NNy0foyxr6BB2loxANAGfSu+w/skoRFbDvP
         Pu8HX9kCtjEyL+ev094L5DoZuv7WZQqI+zK8JBvZU14VjMJPO3MIWTrgxzWb7Mau1OGp
         3eIaUnlxjGDFlx6vi8B3v0Qlvhyz2UTTWXxTsRV6psuu3NjpdtF82dmO2muUVqaB5f8I
         DZL0j/ISECtIxYLY+UoNs6T7e7KCPjgM9dYypGx5Tg5czV7sZYCkFMQZObCPB57eutFb
         e5yRlUWoO7iGEqTu5iWyTNxeHbADkeM+sZdGVJEOyWVH72WlISiHCrRrCqwgcaxD7M9D
         XXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705332317; x=1705937117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3Au/gRaaczdqwoxq154l1Vb0TSRdBUZsRRgmxL/3EA=;
        b=IbDVC/ZLwiWbOYuJ5C/z2Wrttd96o0kWuPcN7FqvZbQgXxEZJR+dFv1ZiG6x9lYrlM
         ndwwGZeQP4F7zjQWls47gNRnMFifqAAknPU3uyvm8QqWY7NQhiIOlPIKQYXglJZE4ga9
         mHdwBxO0S4hoo/E/qFrpH5Lnorb22Y/b2BNck+dmqKsDgi2RVbL5LyVkGCGOrNo9KWnH
         4jFqQWQEkVbnEUnkz1vKi17cShYezNncCX6yOSUciGVZqI/XsoRxYmbgnj+mgeMjE+eg
         ZznSDuBasSoB6KOZCc9HKIWTReOTwSQuzR1cusIIJRyJw+ZfPg040SCidlptTIDVtW6s
         aeSw==
X-Gm-Message-State: AOJu0YwmADciZ4nTdbGJFwzEn1RMvHvaT23xhlYDNguJUc6dg7YVz8gW
	6y89VgMs1CmQ+cAbT8oc+vfArO3zbUCtyQ==
X-Google-Smtp-Source: AGHT+IFVcJIOzgkm0o7Kllwec4Tc/GzqZS761LXVytipb32050OjQDT49hpCnD8tQxYIJBuIt52jzA==
X-Received: by 2002:a05:6402:1ca8:b0:558:b48a:b5f1 with SMTP id cz8-20020a0564021ca800b00558b48ab5f1mr6094220edb.7.1705332317286;
        Mon, 15 Jan 2024 07:25:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b23-20020a056402139700b0055920196ddesm2446466edv.54.2024.01.15.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:25:16 -0800 (PST)
Date: Mon, 15 Jan 2024 16:25:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 -next 2/3] ACPI: RISC-V: Add LPI driver
Message-ID: <20240115-94bdb396ea417ca1d834548d@orel>
References: <20240115101056.429471-1-sunilvl@ventanamicro.com>
 <20240115101056.429471-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115101056.429471-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_072521_803373_D186E45F 
X-CRM114-Status: GOOD (  24.07  )
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

On Mon, Jan 15, 2024 at 03:40:55PM +0530, Sunil V L wrote:
> Enable Low Power Idle (LPI) based cpuidle driver for RISC-V platforms.
> It depends on SBI HSM calls for idle state transitions.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/Makefile  |  3 +-
>  drivers/acpi/riscv/cpuidle.c | 81 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/acpi/riscv/cpuidle.c
> 
> diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
> index 8b3b126e0b94..7309d92dd477 100644
> --- a/drivers/acpi/riscv/Makefile
> +++ b/drivers/acpi/riscv/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-y 	+= rhct.o
> +obj-y					+= rhct.o
> +obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
> diff --git a/drivers/acpi/riscv/cpuidle.c b/drivers/acpi/riscv/cpuidle.c
> new file mode 100644
> index 000000000000..052ec3942902
> --- /dev/null
> +++ b/drivers/acpi/riscv/cpuidle.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024, Ventana Micro Systems Inc
> + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> + *
> + */
> +
> +#include <linux/acpi.h>
> +#include <acpi/processor.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/cpuidle.h>
> +#include <linux/suspend.h>
> +#include <asm/cpuidle.h>
> +#include <asm/sbi.h>
> +#include <asm/suspend.h>
> +
> +#define RISCV_FFH_LPI_TYPE_MASK	GENMASK_ULL(63, 60)
> +#define RISCV_FFH_LPI_RSVD_MASK	GENMASK_ULL(59, 32)
> +
> +#define RISCV_FFH_LPI_TYPE_SBI	BIT_ULL(60)
> +
> +static int acpi_cpu_init_idle(unsigned int cpu)
> +{
> +	int i;
> +	struct acpi_lpi_state *lpi;
> +	struct acpi_processor *pr = per_cpu(processors, cpu);
> +
> +	if (unlikely(!pr || !pr->flags.has_lpi))
> +		return -EINVAL;
> +
> +	if (!is_sbi_hsm_supported())
> +		return -ENODEV;
> +
> +	if (pr->power.count <= 1)
> +		return -ENODEV;
> +
> +	for (i = 1; i < pr->power.count; i++) {
> +		u32 state;
> +
> +		lpi = &pr->power.lpi_states[i];
> +
> +		/*
> +		 * Validate Entry Method as per FFH spec.
> +		 * bits[63:60] should be 0x1
> +		 * bits[59:32] should be 0x0
> +		 * bits[31:0] represent a SBI power_state
> +		 */
> +		if (((lpi->address & RISCV_FFH_LPI_TYPE_MASK) != RISCV_FFH_LPI_TYPE_SBI) ||
> +		    (lpi->address & RISCV_FFH_LPI_RSVD_MASK)) {
> +			pr_warn("Invalid LPI entry method %#llx\n", lpi->address);
> +			return -EINVAL;
> +		}
> +
> +		state = lpi->address;
> +		if (!sbi_suspend_state_is_valid(state)) {
> +			pr_warn("Invalid SBI power state %#x\n", state);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int acpi_processor_ffh_lpi_probe(unsigned int cpu)
> +{
> +	return acpi_cpu_init_idle(cpu);
> +}
> +
> +int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
> +{
> +	u32 state = lpi->address;
> +
> +	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> +		return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend,
> +						   lpi->index,
> +						   state);
> +	else
> +		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
> +							     lpi->index,
> +							     state);
> +}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
