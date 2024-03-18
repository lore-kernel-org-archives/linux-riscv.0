Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE5C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecCDRB7QNROwrMAZwyMnHsSagtz4r+VccZjyFiqwfH0=; b=E3NbrQei50eAgx
	bUCe6Y0rtLKGsQJ3XfDXqtYhrHC/zYdv6UGV5zEhYd+Jcdi6bChjOK0RXJdpakSbB1mTbKOtSNeve
	w5SoOprleRPIMhx6C2BY3QSJWqHJyzKZQMjLAj25IX3bE2WRcNkV8TeDkgsKbs4BSusx7jLZVgYoS
	LzurdPH3EVOpHPwXCBNzst9op6xE0Ckq4enxfVisyShp1/GjFFhyWyEKgOGz0nKLn0DR+E4FqMg6D
	t/xY9dj3Qv4chIUBWFM9CqiKbPp+jXRVbokpQyXd05kCVwXFqj7mmCiUUWUqVWDZGNeSUMGF0D8ed
	gJyOkKNsDvnSR1+sTtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8aA-00000007mmf-2lZ7;
	Mon, 18 Mar 2024 08:42:58 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8a6-00000007mlk-3oEg
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 08:42:56 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5a4789684abso1856900eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710751372; x=1711356172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhgy0BV44U6MUS0edSkG0zSRuqtl0wS2Ryu/bpwa4dY=;
        b=ecI1tqm0CDUxLB2kg7APMV735F6muDhkKMNGCKVAhtToZikZz5b8HvGRpBe6qkIJQM
         HvEiYedN+ESZchIMzc5i96+/FpPGQX/1qovoIB2WxkI9Qn3UIGFUCkCbDXtxOMyzINOX
         lWHZKZ65pRNzruf6ibLRhKQS41ekhjkPRynElhyLfbCutgkR3CKXi95oRk88owuwkb+z
         rGKdBP5Ds1q+4ytzSukPGkhQ1Bd8dZIMEMYoogMot4vpnqnthzUFWGyKJZQK5MtYmArg
         RUtUlHxafO++Ma0YAhHNX0P4Ftv01bVDFt1OYZqYqiWudwmlryNVKQhUBE0NUbPgUUMc
         T6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751372; x=1711356172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhgy0BV44U6MUS0edSkG0zSRuqtl0wS2Ryu/bpwa4dY=;
        b=Sxfla0H+JQu9TajrWfGZmQHKLBgcG8hwM0mwH2QLQee8rvkmpmgGFa02bEPhEgFAdm
         X4NXU0g1ZKIGrQ6p8PfuSxyef/HE0UT6eZscYID792Wmv32jZkt2qA/J9byJJP2f+JNR
         0PabppNQu8PXJXII1md/1S20mmk2r/cd2omx9xCv2hEhrVPUUgcCSjOTUE7CXfg4BqVI
         Ehg37hP23cT3wI6VeWTtSa1DmrBz5T5ZP3brqmarJBs0fu1fVC3lKYzDF2X8Ls8QiAPg
         M2TRhcLz5qZe4yYZy6ftuWjDUyYJpgbk6EqHBIhQ7q3NdjzgvpN0bzGqcIpQGwLBMfvB
         qA5w==
X-Forwarded-Encrypted: i=1; AJvYcCUUfEhhWogTSrsh9VECHGxBXPuSD+8uaJFSL7ZMTNa5wn2JJzDRQU8MXLVWXpaDaMw16Oy2dhpAsbunCvGoRTeC3bY2EDHv3U99RDtTLBrM
X-Gm-Message-State: AOJu0Yx9q8fIO+oPXNTdUnTlzCksvbYedetqnBMAn6Vl4/JctNhFG8v6
	YF79qI2xu6rUCFyMX+EEIA5P1s+eu3RGu2iItRdKIYt38afKpfLFFVKnCKmhl3M=
X-Google-Smtp-Source: AGHT+IFlSDxV8XzLOTRRVV3EN50EyisCs0aw6Fd1xv9UX9glizAj5J9bSHq2YCmhdXfVceAmMS4uMw==
X-Received: by 2002:a05:6820:a0a:b0:5a4:b8df:43fb with SMTP id ch10-20020a0568200a0a00b005a4b8df43fbmr1427769oob.4.1710751371782;
        Mon, 18 Mar 2024 01:42:51 -0700 (PDT)
Received: from sunil-laptop ([106.51.185.90])
        by smtp.gmail.com with ESMTPSA id bw18-20020a056820021200b005a1401bd081sm1849250oob.10.2024.03.18.01.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 01:42:51 -0700 (PDT)
Date: Mon, 18 Mar 2024 14:12:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Drew Fustini <drew@pdp7.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 -next 2/3] ACPI: RISC-V: Add LPI driver
Message-ID: <Zff+ga6khpPOWSVz@sunil-laptop>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
 <20240118062930.245937-3-sunilvl@ventanamicro.com>
 <ZffSG6LKCjkX+/vO@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZffSG6LKCjkX+/vO@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_014254_974700_099ED309 
X-CRM114-Status: GOOD (  23.05  )
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

On Sun, Mar 17, 2024 at 10:33:15PM -0700, Drew Fustini wrote:
> On Thu, Jan 18, 2024 at 11:59:29AM +0530, Sunil V L wrote:
> > Enable Low Power Idle (LPI) based cpuidle driver for RISC-V platforms.
> > It depends on SBI HSM calls for idle state transitions.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  drivers/acpi/riscv/Makefile  |  3 +-
> >  drivers/acpi/riscv/cpuidle.c | 81 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 83 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/acpi/riscv/cpuidle.c
> > 
> > diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
> > index 8b3b126e0b94..7309d92dd477 100644
> > --- a/drivers/acpi/riscv/Makefile
> > +++ b/drivers/acpi/riscv/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -obj-y 	+= rhct.o
> > +obj-y					+= rhct.o
> > +obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
> > diff --git a/drivers/acpi/riscv/cpuidle.c b/drivers/acpi/riscv/cpuidle.c
> > new file mode 100644
> > index 000000000000..624f9bbdb58c
> > --- /dev/null
> > +++ b/drivers/acpi/riscv/cpuidle.c
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2024, Ventana Micro Systems Inc
> > + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> > + *
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <acpi/processor.h>
> > +#include <linux/cpu_pm.h>
> > +#include <linux/cpuidle.h>
> > +#include <linux/suspend.h>
> > +#include <asm/cpuidle.h>
> > +#include <asm/sbi.h>
> > +#include <asm/suspend.h>
> > +
> > +#define RISCV_FFH_LPI_TYPE_MASK	GENMASK_ULL(63, 60)
> > +#define RISCV_FFH_LPI_RSVD_MASK	GENMASK_ULL(59, 32)
> > +
> > +#define RISCV_FFH_LPI_TYPE_SBI	BIT_ULL(60)
> > +
> > +static int acpi_cpu_init_idle(unsigned int cpu)
> > +{
> > +	int i;
> > +	struct acpi_lpi_state *lpi;
> > +	struct acpi_processor *pr = per_cpu(processors, cpu);
> > +
> > +	if (unlikely(!pr || !pr->flags.has_lpi))
> > +		return -EINVAL;
> > +
> > +	if (!riscv_sbi_hsm_is_supported())
> > +		return -ENODEV;
> > +
> > +	if (pr->power.count <= 1)
> > +		return -ENODEV;
> > +
> > +	for (i = 1; i < pr->power.count; i++) {
> > +		u32 state;
> > +
> > +		lpi = &pr->power.lpi_states[i];
> > +
> > +		/*
> > +		 * Validate Entry Method as per FFH spec.
> > +		 * bits[63:60] should be 0x1
> > +		 * bits[59:32] should be 0x0
> > +		 * bits[31:0] represent a SBI power_state
> > +		 */
> > +		if (((lpi->address & RISCV_FFH_LPI_TYPE_MASK) != RISCV_FFH_LPI_TYPE_SBI) ||
> > +		    (lpi->address & RISCV_FFH_LPI_RSVD_MASK)) {
> > +			pr_warn("Invalid LPI entry method %#llx\n", lpi->address);
> > +			return -EINVAL;
> > +		}
> > +
> > +		state = lpi->address;
> 
> It seems that acpi_lpi_state.address is u64, so shouldn't state be u64
> instead of u32?
> 
SBI suspend state is only 32 bits represented by lower 32 bits of
lpi->address.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
