Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4368FC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlInoNoewCM12A0DlOCLtPYXDGL73u5K6F5GuEhZ3hQ=; b=iD7qV51TCXtlOD
	IUm1uPRUis+ClISCR6EcUKZWep7W5FBYq2QNxlM8XmuIdBFxSHvzPeLhlT8vonZmbNrgIgg4QPKMc
	ldjzrtuJYZfREg1XCEDuAhQEpnKxuKTonzCvEVF7P3f+7R5laILn69flhQNFfERL+7hRXl2ynMp7P
	+RRUIXvCHf9xgiAHDvypzBwPcpDPnjcmAYb2dwKi2trBHmkuacP/Tlzi7q3YSu/KhKtPZBcatvN6a
	Ltefo+Jd6x0Cv1EKFHWHO/UhbwH660ruFZW3BYWyM3RPoOcAgHv1m1fbzYrF5ipsgLzNLN1Jhqmbw
	2r8KQY+gqTrYwELQ7M0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8k7-004qOe-NZ; Mon, 20 Feb 2023 16:10:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8k4-004qNl-U6
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 16:10:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id cq23so6345465edb.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8bkra1bclUQEMnLygi/D5rdgvW1P/Dj1p2TQWCn86qk=;
        b=AcgypjlCdest8+7YJscE8GB6VRXm+WHGohhqWuSB6enI/kmspiuOQpc/fkoSFFqhHu
         z17SjKRjP23SsRwSwQWcoSa2aaEujfaJR3DXIVPA+N9troLPChPc1XAQ3uY5CDUiCh9E
         vsQM+m6qnX4PhAJhlFJU6qXzZUxAi2dXbfMIzrGgNRVAUza3i3dEc3z/4iYTdbFW3FhP
         4tZrPz9cc9DNflzEpFXDsmgwvzosv+PJFd7dnKPn+HSn61Gj054+WuwdEdivo1X0PL6M
         KH61T3VeLjqCbBG4aGet6zUr7P73vd/CoGb9IHArx3l4iA62rNqxmn6dIfHBdCwYNltf
         LwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bkra1bclUQEMnLygi/D5rdgvW1P/Dj1p2TQWCn86qk=;
        b=sq4qY7PQjbVCpFP40ZIXaq9eiC88uOZSaxQwX5D1NgMqfwQPfh+RSHZjAOJJj+Yjii
         nYfaIK0j5L7e8qimeceSI7qczvlQJHHkzvi+9g0xDncZ4GUaoCWX45HPzPM90EBQhUXO
         OVmmaDh+cpveWQR7bKgPGK9XFG0jeFQ7M8rVN6FjjwqiWIV5Ad4nI5EANLcfivn/bVLe
         ViJlX2Qh+2CdU3wtT4oXQOpAShUi0G9Cydo1XHR0MWaGt2I8YA5lFXQs98QaQVUJLPgm
         FnISAVbwKwNtfHi4uoEKw5onbmSYbqcgQu6BLuvtepUGKWxtsfB1joDoG34wtTlFjzO1
         UaTg==
X-Gm-Message-State: AO0yUKX3KoDLgkMrtcb0D4kE/Q1unY7SJpJZC6Avp2mpeEtNwK/Qa9He
	HgPl7xTx/hTaDTJUINMNavqG/A==
X-Google-Smtp-Source: AK7set9DAM+Yv85Xv+o3eR5u0fQmR/veAV7cMbx0l9lSvAscXu2LqHC0oRT1HfopFUaJA8UuOqBBQw==
X-Received: by 2002:a17:906:374d:b0:886:ec6e:4c1 with SMTP id e13-20020a170906374d00b00886ec6e04c1mr9715076ejc.59.1676909412221;
        Mon, 20 Feb 2023 08:10:12 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hz13-20020a1709072ced00b008b30e2a450csm4648847ejc.144.2023.02.20.08.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 08:10:11 -0800 (PST)
Date: Mon, 20 Feb 2023 17:10:11 +0100
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
Subject: Re: [PATCH V2 07/21] ACPI: processor_core: RISC-V: Enable mapping
 processor to the hartid
Message-ID: <20230220161011.d3ad4dhuv5ocsa7s@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-8-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-8-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_081016_995070_0FA416A3 
X-CRM114-Status: GOOD (  25.47  )
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

On Thu, Feb 16, 2023 at 11:50:29PM +0530, Sunil V L wrote:
> processor_core needs arch-specific functions to map the ACPI ID
> to the physical ID. In RISC-V platforms, hartid is the physical id
> and RINTC structure in MADT provides this mapping. Add arch-specific
> function to get this mapping from RINTC.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h |  3 +++
>  drivers/acpi/processor_core.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 7f9dce3c39d0..4a3622b38159 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -15,6 +15,9 @@
>  /* Basic configuration for ACPI */
>  #ifdef CONFIG_ACPI
>  
> +typedef u64 phys_cpuid_t;
> +#define PHYS_CPUID_INVALID INVALID_HARTID
> +
>  /* ACPI table mapping after acpi_permanent_mmap is set */
>  void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
>  #define acpi_os_ioremap acpi_os_ioremap
> diff --git a/drivers/acpi/processor_core.c b/drivers/acpi/processor_core.c
> index 2ac48cda5b20..d6606a9f2da6 100644
> --- a/drivers/acpi/processor_core.c
> +++ b/drivers/acpi/processor_core.c
> @@ -106,6 +106,32 @@ static int map_gicc_mpidr(struct acpi_subtable_header *entry,
>  	return -EINVAL;
>  }
>  
> +/*
> + * Retrieve the RISC-V hartid for the processor
> + */
> +static int map_rintc_hartid(struct acpi_subtable_header *entry,
> +			    int device_declaration, u32 acpi_id,
> +			    phys_cpuid_t *hartid)
> +{
> +	struct acpi_madt_rintc *rintc =
> +	    container_of(entry, struct acpi_madt_rintc, header);
> +
> +	if (!(rintc->flags & ACPI_MADT_ENABLED))
> +		return -ENODEV;
> +
> +	/* device_declaration means Device object in DSDT, in the
> +	 * RISC-V, logical processors are required to
> +	 * have a Processor Device object in the DSDT, so we should
> +	 * check device_declaration here
> +	 */
> +	if (device_declaration && rintc->uid == acpi_id) {
> +		*hartid = rintc->hart_id;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
>  				   int type, u32 acpi_id)
>  {
> @@ -136,6 +162,9 @@ static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
>  		} else if (header->type == ACPI_MADT_TYPE_GENERIC_INTERRUPT) {
>  			if (!map_gicc_mpidr(header, type, acpi_id, &phys_id))
>  				break;
> +		} else if (header->type == ACPI_MADT_TYPE_RINTC) {
> +			if (!map_rintc_hartid(header, type, acpi_id, &phys_id))
> +				break;
>  		}
>  		entry += header->length;
>  	}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
