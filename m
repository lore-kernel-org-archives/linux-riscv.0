Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43939C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Emb8JWztdvcOi3a3IgfndFX8qUly+2Bm1nVxz7AJjNM=; b=cxkiTqWcg5skL/
	/tyOoG1VOgf+PQCfJ2WVLfNmco2JVFLttZ2YIruxIy70JU+qGuzo2MHBArI8Hdkq7+Bnk3aYauLLw
	R5T3xEwdZxyx6TzTXoHXB/G4/i2dGTV9qLu/ioK1VymJqgi7hBRI16xIJTwwoqpQbmTc4AL9vaB3d
	/l4bGHlzoCiPB8eA869In+O9y9abjK+46AcyKhxr9aQahKA9wEdWgCSYHqc17DE2cegmFmkTaBZ47
	xwKFBETbeHAGj8yKpr/UGTn+UoKt/XmEVRyKUxcuwb5A7dmnCGjwzHduTPN8ZZsMRhErT5x+t/GiI
	N2s62N348170sYdfNkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm5cu-00000007Lqw-11sF;
	Mon, 18 Mar 2024 05:33:36 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm5cq-00000007LnO-2Zbo
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 05:33:34 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6e6969855c8so196996a34.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Mar 2024 22:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1710739999; x=1711344799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWRZ40BNt+9+ua5/5bnw5+zj2uIfGjzQzzruwRXNga4=;
        b=QNeGbP1IQQiiPGlVcZib9sHs0EWAJ8nonn4YykK5h0qhDTofh2L2tf5VAOSC8tjjPQ
         5Q9fSxV7QqHgz4cviKbISSj6NnsSC1FCjhE5UAubnQd7BB7Wh6k/+F6dKQ0I4JNKLr0m
         I6bcn/nnRIxfIfZw/bhh0Kll3kU72sNC2hPY7MexF/BuRrWL1uJrQjmVBQtGxaDecgD+
         ZTW83vV3qp7QlmcEPWi5dagZeKreEYn2SBQnDv93fIIFk1N7OCNmh8BAWkzAxPpDHJHa
         fkDC5wSQ55p/+JPmLsrrd8tskAOnBJMmdO7GkuBU2N3CoCUr9I2He5Ar8WiR6D19QcrK
         tTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710739999; x=1711344799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWRZ40BNt+9+ua5/5bnw5+zj2uIfGjzQzzruwRXNga4=;
        b=mHZt882t/EeBA3dN3fbgnAwCNb+ZPoqHz47fI1w2y4p1+syFKPLakNYQgeAFxLr4Th
         dtSwXxpOEIqplU2dnMakOPQUYKE3Bg8Z5HIEk4A0gPECSxlfBEKr3JeF4vG+oPag9WUq
         xznevjMIjpA0d9LY+UkBcXtpCUCd1Z7RxTfmqs04TW6Q+AbTDmJ7pJhdE1mVMS4tY0ie
         jxQHqqaXQFrINy3U5OSgRE/zdiLw+IR39pZCogIu7lylICg2Iwyw3Z8dBBuElKHnzcfx
         vJlJcQpuSWEIqut69u65DTGxFqWb3dU+LqXn1P8LIOiFWEAF4uCCRFirRQcuKPzs5eK4
         jdkA==
X-Forwarded-Encrypted: i=1; AJvYcCX4vsp/mVGAjYHeuDCTmksgaOrvbiRJCcud0wlcFQtSj7elLTFPqgATImyrajPRywjABkuyzUiUCerQHV07GPE+6VPjIuXPIg13DW66rTmB
X-Gm-Message-State: AOJu0YwecNfITQprL8vqpoAWat1kpQCTKbKb3F1Rg9UBBDOivogLcYse
	uJw/52+9gBQq+8jASkog2uMymZn5C1unkk9z1d7aJaOJbSMtEfOa2T0SosAig6g=
X-Google-Smtp-Source: AGHT+IHW74pCefBxgXC9bUaOUNulduaCuiC/cQ7K1s9b2+CZQGbJO8gEmKtgPX/AZbXdvuVHFdeWYw==
X-Received: by 2002:a05:6870:c1d0:b0:21f:dfb9:c150 with SMTP id i16-20020a056870c1d000b0021fdfb9c150mr12627865oad.54.1710739998924;
        Sun, 17 Mar 2024 22:33:18 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:a790:6fd1:40df:32a3:69cf])
        by smtp.gmail.com with ESMTPSA id a26-20020a62e21a000000b006e6ae26625asm6967593pfi.68.2024.03.17.22.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 22:33:18 -0700 (PDT)
Date: Sun, 17 Mar 2024 22:33:15 -0700
From: Drew Fustini <drew@pdp7.com>
To: Sunil V L <sunilvl@ventanamicro.com>
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
Message-ID: <ZffSG6LKCjkX+/vO@x1>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
 <20240118062930.245937-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118062930.245937-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_223332_761860_87459EC8 
X-CRM114-Status: GOOD (  20.86  )
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

On Thu, Jan 18, 2024 at 11:59:29AM +0530, Sunil V L wrote:
> Enable Low Power Idle (LPI) based cpuidle driver for RISC-V platforms.
> It depends on SBI HSM calls for idle state transitions.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
> index 000000000000..624f9bbdb58c
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
> +	if (!riscv_sbi_hsm_is_supported())
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

It seems that acpi_lpi_state.address is u64, so shouldn't state be u64
instead of u32?

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
