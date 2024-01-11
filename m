Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CD2C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3kLYE216G2vuLT2pRBZAvIvmlbGTU3tOMarrGwt6Aw=; b=U2QyUl9vsCzARM
	Z4NV9HqjvQM0yARew7LmzTK7znTM3acn/KheS9l3oEvjMLAHUiqHiL+jTDH/+CvsWA4yyNTR04z8X
	GuAVV2EAwVPu+XkqOdhWVkbRUl7l/Iwm/shc/9ywc121tQJISrPnan1P6uJY4t+M3tEFwKuq4zlEH
	uIngnJGUEiQenaXVwOFTw4ZNa40BhE/FfS/YOVi3CS6MAE8c+eiYS9tyAnDYKREH0Jd6isSEIFNi8
	QyW/Y8LblkW4ahaQEJ75NjHA3AYjcef4IALeaMMNfN+a/BXRd8814PED4U6ACX2waeIR6C+yMpdfS
	7HaTa3mhQgy+749wZShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrrM-00Gsqv-04;
	Thu, 11 Jan 2024 10:00:24 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrrH-00Gsnq-2c
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 10:00:22 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a26f73732c5so602756266b.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704967214; x=1705572014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SK6l91q7AEIn5ipGCEJlFPJF27Zw8+0MoPYYgQPY0a4=;
        b=f1QpPxCgke130eeSoB3v/WOczNheQiiSR/zkmJ/GoATVT3R0YQvz/kaD9BSZZY5iv/
         or8FmZXO619djlogUJ8JfuqBsZV+fym6OA9GrERnIUGy7WQULUBloI6dYGMQlf8vDQ9K
         aNVM3KBQC7nqAzk6VGg9UdghN0d1fdr2cnh9YPh/Qqe79EXzidGB48ypMRvnBkVFJMyv
         fGy7pb3ha0XxQQU0D4pNYxu4BaMbfCSlEMKgRWNLA8VnohS8v7hWFNr0Um7m5uDseC6h
         pu6NrtJVeUzTNGb+zbs+XZqDGeBUZgomnGfqhwLtpjC/lVlKjuy+tVIN4TbD86vS/kjI
         WS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704967214; x=1705572014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK6l91q7AEIn5ipGCEJlFPJF27Zw8+0MoPYYgQPY0a4=;
        b=f5Lg+xAS3A8S9kOdXfwXHlnbVS1ABdP4a/Ku3SooEB78vRzjZklWJrM5favRSw/DiM
         PUWHTrepeQ82ZD7s3dbiUGYv2bt3cC3GnW64Sl7AttxX4aMr/OZBfkFWLQuWV6Bsm8f8
         RoEHxNlZ9n+cj7+1SlaudDhr2TUnChI2ftQR8TDbS9YX+KekO21cxsw23ZcfDGkGVkZ8
         J0WSj20ugA6yPMzBiTT20c1ACJyhFDXwJRRNrz+yR7ib67WL6jzNsvW6eJzJMRqf8NlN
         S5cT5L01PsI+0ibe0MyPWe93iw1zo1f0oZpLCb7BRtQqtZknIOjRq7WMFI+AytuzcJnl
         15tw==
X-Gm-Message-State: AOJu0YwpiX2NbW2za/OuWK4qfuisPdJEb9OWT+8CdWbbIZm5eFPn46Lc
	H0QfaCtJeihZRdaIf0L7e5gr5bcMpm3PaQ==
X-Google-Smtp-Source: AGHT+IG9OykZ6CNPvrkHEc3LhlxSvCDJTd22uv+2HGjZ6t7gDVg53BD9mWU36h/4tpDnSh7smSjEVg==
X-Received: by 2002:a17:907:9281:b0:a27:f6aa:c7b0 with SMTP id bw1-20020a170907928100b00a27f6aac7b0mr576724ejc.11.1704967214471;
        Thu, 11 Jan 2024 02:00:14 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o8-20020a170906358800b00a2ace215a78sm368912ejb.114.2024.01.11.02.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:00:13 -0800 (PST)
Date: Thu, 11 Jan 2024 11:00:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH -next 1/2] ACPI: Enable ACPI_PROCESSOR for RISC-V
Message-ID: <20240111-bb411d2dd39eb859dd049fa0@orel>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
 <20240111093058.121838-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111093058.121838-2-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_020019_849321_7159EDD9 
X-CRM114-Status: GOOD (  20.52  )
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

On Thu, Jan 11, 2024 at 03:00:57PM +0530, Sunil V L wrote:
> The ACPI processor driver is not currently enabled for RISC-V.
> This is required to enable CPU related functionalities like
> LPI and CPPC. Hence, enable ACPI_PROCESSOR for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index f819e760ff19..9a920752171c 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -282,7 +282,7 @@ config ACPI_CPPC_LIB
>  
>  config ACPI_PROCESSOR
>  	tristate "Processor"
> -	depends on X86 || ARM64 || LOONGARCH
> +	depends on X86 || ARM64 || LOONGARCH || RISCV
>  	select ACPI_PROCESSOR_IDLE
>  	select ACPI_CPU_FREQ_PSS if X86 || LOONGARCH
>  	select THERMAL
> -- 
> 2.34.1
>

Hi Sunil,

Typically we'll want the Kconfig changes to come at the end of a series,
or squashed into the patch that adds support for it, otherwise there's
risk of build breakage during bisection. In this case, we're safe because
the two new functions (I looked ahead) have __weak versions when they're
not present.

Also, interestingly, it looks like this ancient line

 obj-$(CONFIG_ACPI_PROCESSOR)    += processor.o

in drivers/acpi/Makefile should be removed, since there's no
drivers/acpi/processor.c file. I guess the make process silently
filters object files which don't have corresponding source files?
Maybe we should write a Makefile analyzer to see what other lines
can be removed...

Anyway, for this patch, which I'd prefer to be swapped in order with
the other patch, or just squashed into the other patch,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
