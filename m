Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6396C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBYaTqnUDGF0Rf1HZUbHEdAOR5vy704FXYXk7qmXBBk=; b=TahWlGTZsnHg5H
	i3NyoQdwXVaVP7wuUEx3mIpRZVQUaTNjbUtbk54k2M4h6BPuC4E5Sjad5IwFEighJaTGE94x6Rluq
	6O8Df6V39hkGSXxzEDJ2MB4K8nGfuiJtLxYqomVBSYQmjLEIrdWeEvTS8sGAW+7TiJ5Ij0FINW3P4
	W/q0BtxXse9AGWzT6OJFhKezlawB99EO/wtN2SbyygzKnTqRWxPfTArKBOblH2CfviRH8Dc8wZm+/
	oFSTYHJ8TC2BU7250wJKRszFWKXk59jG+JvdtdoGcAM1gedeE+f19KCfu3cLaG7de/GRi6y6v0kHF
	WvwT7BdAFFaYbrSVHSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCBv-005Q01-A9; Mon, 20 Feb 2023 19:51:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCBs-005Pyh-U0
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 19:51:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id cq23so8522421edb.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 11:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JiNBdogVb/ctJRbRDskVYVFlh5rTlqKKL5FmI6kPZ8w=;
        b=cuiQ8z5ITbd3IB7rit7AwPXG0vORAkRAG63Zp9/IcLR8dKofsaq8zcD1HztVYPB4NF
         Dvlwh1lC0n26Z8wGxQvGI/WAzN3PSKOyy9JYHe44YeuhapZVNnvVV0l/nKOPIyK8MSku
         EFxR5PpAVadFmkAcAAnD5xhlggWWqDHmLuNXoii5IL1o+Strz6vQg5kQgNhru0pQ6wot
         0nuMV/gP7WFxothHDTqQZ/mRELysY8kig5lSEvIS25JCI5dh3YYzmXOlB8MoV+KBqeLZ
         qx/JV9oF0YRh/ZUBaqHZ96dx4Od0X/o18nmdeI4g5LKpOHf+oNvOY7wqMH+aZcJadJ5r
         SdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiNBdogVb/ctJRbRDskVYVFlh5rTlqKKL5FmI6kPZ8w=;
        b=8A8tzTFD85jqvQ8dH2U5a+MHoh1CPEmrCg6I5M+FT5B0Eszupak8SsHem5Mgd7MTNv
         HFOFlaSkHmE+jHIFu+8jvJWDxiu7oFNkuHnPUu256v7r8FEM38Wca9WOQuRAvcE0kZK9
         Y9Gvk/4mlxdVzWeQo8s167BVRmE7HcwklRfcRLNEr/buytPCBNxU8jimjFNObO+crogt
         AxM3zVgMKRAx2sLN9KSNDwoopkswes3uJsmsw+m6myr2VuW4uN3OEEdnvziPUN+xQIFX
         ZUF1SqJwsyGboffytndbNb5bNRPWEOHI6YbrYeaW/pcpnn2gL3SmF0DTXe8G2wuag50e
         yHsA==
X-Gm-Message-State: AO0yUKXyCHdiV5L/jXb8nnLUGQBTZqp6xYNa1I+LuGRTHyqDcOrKpEZM
	NoZTErPyE2kj0Syq9JFbst8upw==
X-Google-Smtp-Source: AK7set9V4qNdEX1rBCkKVXTOHRcZ49m2r691BtX2HHFvehjI813L7cOfgHotp9O0ya6YpqHH/ZRG4Q==
X-Received: by 2002:a17:907:764c:b0:88e:e498:109b with SMTP id kj12-20020a170907764c00b0088ee498109bmr10663251ejc.5.1676922669248;
        Mon, 20 Feb 2023 11:51:09 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id um8-20020a170907cb0800b008cca31606a8sm2356990ejc.51.2023.02.20.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:51:08 -0800 (PST)
Date: Mon, 20 Feb 2023 20:51:07 +0100
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
Subject: Re: [PATCH V2 16/21] clocksource/timer-riscv: Add ACPI support
Message-ID: <20230220195107.ixdfumgvfnobjlnt@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-17-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-17-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_115112_985118_3BFEBBFE 
X-CRM114-Status: GOOD (  16.47  )
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

On Thu, Feb 16, 2023 at 11:50:38PM +0530, Sunil V L wrote:
> Initialize the timer driver based on RHCT table on ACPI based
> platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/clocksource/timer-riscv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 2ae8e300d303..5fb0eac52bdd 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -10,6 +10,7 @@
>  
>  #define pr_fmt(fmt) "riscv-timer: " fmt
>  
> +#include <linux/acpi.h>
>  #include <linux/clocksource.h>
>  #include <linux/clockchips.h>
>  #include <linux/cpu.h>
> @@ -201,3 +202,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  }
>  
>  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> +
> +#ifdef CONFIG_ACPI
> +static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
> +{
> +	return riscv_timer_init_common();
> +}
> +
> +TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
> +
> +#endif
> -- 
> 2.34.1
>

This could probably be squashed into the last patch, but anyway

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
