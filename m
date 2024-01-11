Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E9FC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXOO1Ky2XP3p5yX3Ej50SCzuDvag7a8AL0IFoH+CbvM=; b=ZE20qfavMoE/ct
	VYW66MdfLvmiAWb7M6UN5VpdjC+lOX2bjwJBH80NNQTZRPR3SI5WHY4A04dUPsMgj5CB9Zrb2NUdX
	DGaKbMIt1/WoNIqBhnHJvxhQTgm32fgtbFY748Xux4TOEax/iMXdjOCaVLSEYHter7XnIkVSk7Evo
	SD1kWVlKgqmti5mbZdEmAumlbKeoVniQBNCWdl0LP4rZ9JFe/hsymqucKZ9+484iGZ0fWyVUk/LL4
	jKpz+W9BhAkuSVnUI+XpEZv6sdO4VrNNgpYkmwo7aQJlC7VPDsNNTcr8p2M2FVav/J2AJKpU6U+un
	zn8sLZeeSmErRh6LWCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsAF-00GxXF-2t;
	Thu, 11 Jan 2024 10:19:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsAD-00GxVM-0x
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 10:19:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a271a28aeb4so557916266b.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 02:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704968391; x=1705573191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JFpe6quqGni9rXpbkR8i3EOKdmU+rRM5UIvhZyNTIx4=;
        b=mzQmaF5QVHITdqMj7jUWcr+tGcUPYgGFHsLIVstJZegTMTWdwIrDsR9e4fUzv4bsn2
         884Z8HAM58SqHw5JGJudOm1pdKbN0AzKEuHOfIgB7D2x8iIXfw1JIx8OQP0DeObOe1GT
         dWMrTqIux3KmzAli2h71APbngEZokHkfm5aqbo7Ym2pXm5ovzY0vvSKO4TQdiu4+mGZ4
         bh/lpq29h3/+DdxBhtiHGL2e64rpXfOAj/5Waj4+9QVqWIutf6BFubZB6lG+cBk2ceYn
         s0w4LzaVnKqlOVRA9w4sfcvx5+4nSXemtFYvECtt1JI5mhk4f/iwninjoBGbrxZnMCam
         lhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704968391; x=1705573191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFpe6quqGni9rXpbkR8i3EOKdmU+rRM5UIvhZyNTIx4=;
        b=XH3Ep2T8RfFSWrK6B8lnyZZUqsVPS4dL8Pdf9AWAswJiCZnhRA7+w363XeSFMQ7x/T
         YgYg/AI2FqSMViuJGTn3ltVMqaV2Y/CEp2xVlsrxx1Kh8KCllGSURfXqkqJ/cZAXdf13
         gq0hftbv1xNpgx0dRmvoV4uzURmFELj8kiUc9A6uLqSkqXVTQ9RgbdNzpII5J7Ta/KXY
         nwWoEHntxaYRwCnJP9NvTeTxH6B9kZ64zraNfuexcrUJU5rddZlgRYCbShcrGOy4h6cm
         VUgp9U+ADKnUNTjEEiBInvFP0HEyL8hE91mopdGyR1A/SVvq3murZA1nt5QhCdMZ9V//
         /+0g==
X-Gm-Message-State: AOJu0YyD2COYoI7z0s4d4OKmymzwpDzIUci9YCr59FgR/4oH8OiEXnhn
	063UKkWKJWE//aEm26KjoOisTSkCZSE07g==
X-Google-Smtp-Source: AGHT+IFBiFizSgukfmU2Pf8DgRLe/lNPDSpgXIEvVijwWkTDP8QaOfuxfYm/bTSm93if/g/LI4WU0w==
X-Received: by 2002:a17:907:93d1:b0:a28:f817:6a7c with SMTP id cp17-20020a17090793d100b00a28f8176a7cmr377770ejc.3.1704968390975;
        Thu, 11 Jan 2024 02:19:50 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c13-20020a170906170d00b00a2c047c6847sm393036eje.113.2024.01.11.02.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:19:50 -0800 (PST)
Date: Thu, 11 Jan 2024 11:19:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH -next 2/2] cpuidle: RISC-V: Add ACPI LPI support
Message-ID: <20240111-d37d338a6b1aa71e944ebe05@orel>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
 <20240111093058.121838-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111093058.121838-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_021953_338712_7331EE10 
X-CRM114-Status: GOOD (  23.46  )
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

On Thu, Jan 11, 2024 at 03:00:58PM +0530, Sunil V L wrote:
> Add required callbacks to support Low Power Idle (LPI) on ACPI based
> RISC-V platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 78 +++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index e8094fc92491..cea67a54ab39 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -632,3 +632,81 @@ static int __init sbi_cpuidle_init(void)
>  	return 0;
>  }
>  device_initcall(sbi_cpuidle_init);
> +
> +#ifdef CONFIG_ACPI_PROCESSOR_IDLE
> +
> +#include <linux/acpi.h>
> +#include <acpi/processor.h>
> +
> +#define RISCV_FFH_LPI_TYPE_MASK		0x1000000000000000ULL
> +#define RISCV_FFH_LPI_RSVD_MASK		0x0FFFFFFF00000000ULL

GENMASK might look nicer and the type mask is 0xF000000000000000ULL,
where 0x1000000000000000ULL means that the type is an SBI identifier.
We need both defined

#define RISCV_FFH_LPI_TYPE_MASK              0xF000000000000000ULL
#define RISCV_FFH_LPI_TYPE_SBI               0x1000000000000000ULL

as I point out below.

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
> +	/*
> +	 * The SBI HSM suspend function is only available when:
> +	 * 1) SBI version is 0.3 or higher
> +	 * 2) SBI HSM extension is available
> +	 */
> +	if (sbi_spec_version < sbi_mk_version(0, 3) ||
> +	    !sbi_probe_extension(SBI_EXT_HSM)) {
> +		pr_warn("HSM suspend not available\n");

The comment and these lines match what's done in sbi_cpuidle_init().
How about a static helper function to avoid duplication?

> +		return -EINVAL;
> +	}
> +
> +	if (pr->power.count <= 1)
> +		return -ENODEV;
> +
> +	for (i = 1; i < pr->power.count; i++) {
> +		u32 state;
> +
> +		lpi = &pr->power.lpi_states[i];
> +
> +		/* Validate Entry Method as per FFH spec.
> +		 * bits[63:60] should be 0x1
> +		 * bits[59:32] should be 0x0
> +		 * bits[31:0] represent a SBI power_state
                                        ^ an

> +		 */

Comment block needs opening wing (/*)

> +		if (!(lpi->address & RISCV_FFH_LPI_TYPE_MASK) ||

This should be (lpi->address & RISCV_FFH_LPI_TYPE_MASK) != RISCV_FFH_LPI_TYPE_SBI

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
> +
> +#endif
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
