Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944AC636D6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBYLESr+DGf+WxMimd3J4wmlSavC6VbsAxc1H4PW8GM=; b=eAOifQgwiuOPDc
	NgFzVD+d6LV9fp4jL1ISr46vKUXWB+ywjDxEcNKwNkJX244dcZeFiquzTuqUZ2ggwoJvmclgIfAEN
	MB+8uAwrd/xehZI6jZoPPV7ZKQxO7VzBvP364YL55+3BAKIX3YFBypmHiNju74ByKF13w2LxMlnZx
	VZKdBUIbT7SFwIFNixDq47S7V8yyRlAFvAY2tN7qogDtI8XaPaUNh7yx6Xlw9R0tMd4xus0aHtfyD
	iPMOHY+8KFTaVmRiTwY4z1KPCC35kDllrf7I0h5kYPKs/BiAoMeBKpqDvrYqGO99pOWf5UtJm6mv+
	wxHERLEV+RpH/nvBUHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCZz-005Uau-BD; Mon, 20 Feb 2023 20:16:07 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCZt-005UZ0-Vc
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 20:16:06 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cq23so8722195edb.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=64v0b9wMigK7c/r93Ya8QO/swfrpWXwK/PsuhD+FDn4=;
        b=NVZM89GiYAZYzEwCI4nIfa8QbXd+DNnr2PG59kkv6v1nsMejn/bDCCYjMo6XF3RGfg
         IcrczEMXSrTvOKYP6gT2/3Xpw5/uGaTn9y5nKuurvkykWxI6fCm3oThETyeoSky95Wtx
         ODu4fO/CavtyXmTanOeIAo5M4Cf0kJl5jwFNIet2iY84+bXmz+YoA0egvxWS970f0buA
         FI/X370SWTcZEf9xB1QwlbrgbPSXpVedDsg5drq71CgkgjED2ocJ/ODruLGOuJswl0W/
         uuv05daLFhjZS2lx2/LkaoMYAnbYtiVmcHN+DrQnm7mrSHx/C9ITHMCVFG3w2Pl1xebX
         rqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64v0b9wMigK7c/r93Ya8QO/swfrpWXwK/PsuhD+FDn4=;
        b=iZ7CC4ZrX/v8loKxMCmllY7iju+2y9CDk1MU4YyJIeMZTmLn6mRSTi7YROf8nwwhfa
         fOCmND4cfaoE7R5QsVIBA2QtqK5YKqgsabIQyNa6K2Sd+XVFax0CuI9uo1Q9AexI7koE
         WBTUElewLlR36SDlWmyP9rnDnIcQbTVFQEcCyXUzVze2cXdxB6Kuf1WfhZ4PQINIkRzk
         U1KsASmKCRGhpHwMNuZ1O4Hnt8YG80qgmVV9LkTIz4UkKt2mesmhIsDJ1eVKMyBWCiKZ
         lQtqZc2ytpexgwhCqBoCQrrvZ6/wQNN6HaoQquTYZ2Tdm6XZQIfSr5m67GV4xPh72Tlz
         o/XQ==
X-Gm-Message-State: AO0yUKWFqVPPJfrnLASdXGsob1FQqVdTQeOBL/37CyyU2BlW+MBKUUhw
	rRGUaLt3lMNyv4Uo6W7xmYirxA==
X-Google-Smtp-Source: AK7set8EYvyS0KUGBYqhaUXbJMzPLDxhdTgj3Aa5X3d/dKS8NQ3loGJmrI55BK77rB9i9PNp/3+5vw==
X-Received: by 2002:a17:906:3e43:b0:88a:2e57:9813 with SMTP id t3-20020a1709063e4300b0088a2e579813mr10027851eji.33.1676924157519;
        Mon, 20 Feb 2023 12:15:57 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gj18-20020a170906e11200b008d47cd2edfbsm1608023ejb.60.2023.02.20.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 12:15:57 -0800 (PST)
Date: Mon, 20 Feb 2023 21:15:56 +0100
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
Subject: Re: [PATCH V2 21/21] Documentation/kernel-parameters.txt: Add RISC-V
 for ACPI parameter
Message-ID: <20230220201556.i3dihi3oj2lwckno@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-22-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-22-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_121605_380660_2743A95E 
X-CRM114-Status: GOOD (  18.09  )
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

On Thu, Feb 16, 2023 at 11:50:43PM +0530, Sunil V L wrote:
> With ACPI support added for RISC-V, this kernel parameter is also
> supported on RISC-V. Hence, update the documentation.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6cfa6e3996cf..b3a5a5844daa 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1,17 +1,17 @@
> -	acpi=		[HW,ACPI,X86,ARM64]
> +	acpi=		[HW,ACPI,X86,ARM64,RISC-V]
>  			Advanced Configuration and Power Interface
>  			Format: { force | on | off | strict | noirq | rsdt |
>  				  copy_dsdt }
>  			force -- enable ACPI if default was off
> -			on -- enable ACPI but allow fallback to DT [arm64]
> +			on -- enable ACPI but allow fallback to DT [arm64,riscv]
>  			off -- disable ACPI if default was on
>  			noirq -- do not use ACPI for IRQ routing
>  			strict -- Be less tolerant of platforms that are not
>  				strictly ACPI specification compliant.
>  			rsdt -- prefer RSDT over (default) XSDT
>  			copy_dsdt -- copy DSDT to memory
> -			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
> -			are available
> +			For ARM64 and RISC-V, ONLY "acpi=off", "acpi=on" or
> +			"acpi=force" are available
>  
>  			See also Documentation/power/runtime_pm.rst, pci=noacpi
>  
> -- 
> 2.34.1
>

I'd squash this into patch 18, "RISC-V: Add ACPI initialization in
setup_arch()"

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
