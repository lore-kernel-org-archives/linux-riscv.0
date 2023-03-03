Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72CAC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhPn4IHCbS4DVxE91hYH4dQAfU1namBPlKpKWZZxspw=; b=1KgArIH7vTHuuP
	S5aLQTevknfx/DdvGblmOKQpTflDDfuUEQ4QcLC2wcYhVx3ab+wbZgURHwh90f6ZdwGVEJLtlavHM
	92BofoSgkmuYFM6CU8hAH+hgjgXrwOrD2GSUTUsI7emmg7OLPYrXRnnQTQwZRRqbLEJfUTQTn1+M4
	UmwgC2ABcMv5GQJbPkIBQ+mczApFmI0BdUlA8l2ocrSn9EnEhD2vmBtJBZlGPYF3OwhI8KGA/POfN
	+ALSQGvG4w+sxTZHxbEnpDV2FIlPOIrLGsSahYHo049AVF9/OmivT2BJrWuRGeqc5IoqJx5lBO1rM
	MyZ/7kKsUZHFVIP56t1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY6rs-006ezd-Bb; Fri, 03 Mar 2023 14:58:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY6rp-006eyh-2j
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 14:58:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a25so11665447edb.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 06:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmxUOkBdjSGKx6uxMbgOTNlH+FMAT+rPeMxFUSXuT+8=;
        b=nRY/zefoyq61orF3bLInswWjd5Pa5mWbq/6LTZ8QyyJkYWsVOJPtpVmc/liy2y9Ouk
         YmRW8zbsXUyOS1k/IE9XVToSzSc8AlpxYVQaVHjBECwcE/6Dpc+SPh3rVORZVWKpCs8Q
         BPIbOyWtcJH4fftUVTXF+t5UDB7Oij/M8lTFxyxUzBHcMSujpqKvOh6o4Kf6wfv009+V
         XvN1LP7bu9Q+RN/SrCVGMFPb9mhrWGrM3toKcAICGgMCPeuIlb5uXDYJYiM+UyB2ftYM
         Ci4x58BExvzMxculUTNthl75drE1ddnelLjU6yIziUk/NATl4q6XaPwjjLB6c5C5zIit
         6Itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmxUOkBdjSGKx6uxMbgOTNlH+FMAT+rPeMxFUSXuT+8=;
        b=BhEgkNJiP5gLZKpfHh+k3qL33lzJ/G7x5WXZA9i5mU6BHfKLW6swOFb9nOS5uhw17L
         W9Iwt6jprwXMr9S2tPxy9RBMBAWvdv/+pK3OMfSs9e1LHPyJMa3KBkUm2J2grDPoRCMQ
         TDwb+dcDrrlMdluT8deF2AsD/M7l7H2WezOvff5MvcGm6Nq3Rl2nFiKoR6BMs8IG0Aiq
         joKZp9NK51lwLjXCQD67t7mJ7UVPA5ZyDwb+Z3Ye0oDaVVI+qPK3GO+Hg0NWoozASG0M
         m/fnDat5fZUB+Au4+RUicfS8tPSnMN6p05AgB1qcX3umJuS6dlnC/Cx93mmcchlaxYVK
         MRVQ==
X-Gm-Message-State: AO0yUKVwgds+u3N0YgFojpM/pEkcDK4CD6HUfAm2W4YV/tLDU1RZI4Ie
	l4uvvsWVDAOW/FjQ721/DZu4xw==
X-Google-Smtp-Source: AK7set+k2+XbMi6jzaNLWQgQ8mW+LymZKLxYqe98qIeJsqKhuU1m5u+oeRUzHlffalIDj4CywZ/zUw==
X-Received: by 2002:a05:6402:64c:b0:4a2:4a89:2331 with SMTP id u12-20020a056402064c00b004a24a892331mr1950653edx.29.1677855517128;
        Fri, 03 Mar 2023 06:58:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z13-20020a50eb4d000000b004c0b58f088esm1232273edp.10.2023.03.03.06.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:58:36 -0800 (PST)
Date: Fri, 3 Mar 2023 15:58:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 04/20] ACPI: tables: Print RINTC information when MADT
 is parsed
Message-ID: <20230303145835.hpep2zxyknimfyd7@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303133647.845095-5-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_065841_161496_2B0714E6 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, Mar 03, 2023 at 07:06:31PM +0530, Sunil V L wrote:
> When MADT is parsed, print RINTC information as below:
> 
> ACPI: RISC-V INTC (acpi_uid[0x0000] hart_id[0x0] enabled)
> ACPI: RISC-V INTC (acpi_uid[0x0001] hart_id[0x1] enabled)
> ...
> ACPI: RISC-V INTC (acpi_uid[0x000f] hart_id[0xf] enabled)
> 
> This debug information will be very helpful during bring up.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/acpi/tables.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
> index 7b4680da57d7..8ab0a82b4da4 100644
> --- a/drivers/acpi/tables.c
> +++ b/drivers/acpi/tables.c
> @@ -220,6 +220,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
>  		}
>  		break;
>  
> +	case ACPI_MADT_TYPE_RINTC:
> +		{
> +			struct acpi_madt_rintc *p = (struct acpi_madt_rintc *)header;
> +
> +			pr_debug("RISC-V INTC (acpi_uid[0x%04x] hart_id[0x%llx] %s)\n",
> +				 p->uid, p->hart_id,
> +				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
> +		}
> +		break;
> +
>  	default:
>  		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
>  			header->type);
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
