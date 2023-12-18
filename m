Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEF7C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQh6My6d+YyYbmwvogDWk76S+mpAVbn8i5Ilyd07GGY=; b=S1PpDzxxSOZQ/a
	iCfHIw0lDCUOvff+vbfr4Zo7Kj81NVXaxfTpH6zPd3wIlMGp/ewDE597bPsE1hJ2QsfvUz4HgYBSn
	bT/K6rrDqWXXZuKoETf5F8Px5vd6u0/uQs+6e1Qe64CxlMrvQtQQj8gOxAgaqLtNO3TAWiWKyl4Vj
	C+/Iu/0edQjDcfyeAl3mUaF/HvtxW66BaZ47LrEH2+JUEV3Ea4PKemVcRTfI1587V2NynON7feU/l
	v5aZ5M2T2HoEsbDHJqcQtOwKAYfKXGDr/fMmY5LnosXmqjeGGofmZNCCWuXSwNYlt84VhMACJ8TYU
	3iMx6EeuVAKvGS0IrgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGIh-00BPN8-1L;
	Mon, 18 Dec 2023 16:17:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGId-00BPLb-07;
	Mon, 18 Dec 2023 16:17:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5532b45c286so2038261a12.0;
        Mon, 18 Dec 2023 08:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702916215; x=1703521015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bezxA4w3BofKoayOrhRD9PM6sHufVYtq2w+UEfMweo=;
        b=il9WdIsWUcwI5EKLaJuhzkchILxNuOTzL4IsdhJA0/is2nBRX9104Hl9TSkpyKuXQM
         1gFuqSr558yfs4tNdpaXaasNNRnRNZT6S+Lm6v5LZSTQsdlPFIbr2vmyMHeq3HYsX4lO
         zWLWbFVp9IlzMmu3uUfgvhQ3gEMkSlNo9W1qQX7GQOgv4HpjNZLUK9gnF5Xr0QYxelql
         ZWvw21IjtV2wy7ujkMpI2R2YTRUw1sMCvDNJPpPjXe12kQfM2BaheCd1XdAmsUO0/A0t
         Vv+psUZ9XU5kZIFhnCTJ+xlZTl/JkXV3465NGZ/oGT98Ee7JcVF/Ui3IaejsrTRkR3o8
         +vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916215; x=1703521015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bezxA4w3BofKoayOrhRD9PM6sHufVYtq2w+UEfMweo=;
        b=pwhvgKvZlnZ93X+lkGtKWShi5dynELcD2JU4gIFkfk+7jR14WokeOtC0ex9XHgLQzy
         T9dUleCi7tC0GnaujrnyS7NmkWQSknEnq/Qcp7IFZFxPRlinx/1CMMGv30XAb+JClWBX
         jmkdbq6QB/Am73OppgUEiNtsmhn9JlWzNJOrypqgSP/XpRGCXh0viKaCGAyI01zdvvcC
         mg2nttEE/gyC9FOxJFTJxu0PRylkVGhyYjGQg5wNi4HZklM1lvL+GL9nq/yE/dZPYIhR
         KUkpjSGjYmHRcuVMBr4Xjd2Kzbicmrd+VkbM2cG+D8qcEs1LfEfVeGi3YVRhpQznkEqk
         uSyg==
X-Gm-Message-State: AOJu0Ywe5zAlsc7ml/OP+cAgACCH/HyRe3rx+xtErF1/D3ljIZ0Jk420
	FVCKQDKWq6n9Yr+4O9y0obA=
X-Google-Smtp-Source: AGHT+IGGXZM869rCvborKIS6+AaZ6Fg2Fee5h0yXK5Lip2vogxh1X3uCF4McDxJ8OOYxEvnqggmR6w==
X-Received: by 2002:a17:906:516:b0:a23:4e3a:a643 with SMTP id j22-20020a170906051600b00a234e3aa643mr528083eja.168.1702916214829;
        Mon, 18 Dec 2023 08:16:54 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id fj8-20020a1709069c8800b00a1d5c342674sm14186209ejc.27.2023.12.18.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:16:54 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: Re: [PATCH v2 5/5] cpufreq: Make sun50i h6 cpufreq Kconfig option arch
 generic
Date: Mon, 18 Dec 2023 17:16:52 +0100
Message-ID: <5737049.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20231218110543.64044-6-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218110543.64044-6-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_081659_076558_76AB72DD 
X-CRM114-Status: GOOD (  19.29  )
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

Dne ponedeljek, 18. december 2023 ob 12:05:43 CET je Brandon Cheo Fusi napisal(a):
> Move the Allwinner SUN50I cpufreq driver from Kconfig.arm to the
> main Kconfig file so it supports other architectures, like RISC-V
> in our case, and drop the 'ARM_' prefix.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/Kconfig     | 12 ++++++++++++
>  drivers/cpufreq/Kconfig.arm | 12 ------------
>  drivers/cpufreq/Makefile    |  2 +-
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> index 35efb53d5..50aa66cfc 100644
> --- a/drivers/cpufreq/Kconfig
> +++ b/drivers/cpufreq/Kconfig
> @@ -301,5 +301,17 @@ config QORIQ_CPUFREQ
>  	  This adds the CPUFreq driver support for Freescale QorIQ SoCs
>  	  which are capable of changing the CPU's frequency dynamically.
>  
> +config ALLWINNER_SUN50I_CPUFREQ_NVMEM
> +	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
> +	depends on ARCH_SUNXI
> +	depends on NVMEM_SUNXI_SID
> +	select PM_OPP
> +	help
> +	  This adds the nvmem based CPUFreq driver for Allwinner
> +	  h6/D1 SoCs.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sun50i-cpufreq-nvmem.
> +
>  endif
>  endmenu
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index f91160689..98b8e6eef 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -29,18 +29,6 @@ config ACPI_CPPC_CPUFREQ_FIE
>  
>  	  If in doubt, say N.
>  
> -config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
> -	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
> -	depends on ARCH_SUNXI
> -	depends on NVMEM_SUNXI_SID
> -	select PM_OPP
> -	help
> -	  This adds the nvmem based CPUFreq driver for Allwinner
> -	  h6 SoC.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called sun50i-cpufreq-nvmem.
> -
>  config ARM_APPLE_SOC_CPUFREQ
>  	tristate "Apple Silicon SoC CPUFreq support"
>  	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index 8d141c71b..110b676d2 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -78,7 +78,7 @@ obj-$(CONFIG_ARM_SCMI_CPUFREQ)		+= scmi-cpufreq.o
>  obj-$(CONFIG_ARM_SCPI_CPUFREQ)		+= scpi-cpufreq.o
>  obj-$(CONFIG_ARM_SPEAR_CPUFREQ)		+= spear-cpufreq.o
>  obj-$(CONFIG_ARM_STI_CPUFREQ)		+= sti-cpufreq.o
> -obj-$(CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
> +obj-$(CONFIG_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o

This should be moved, so it's sorted alphabetically.

Best regards,
Jernej

>  obj-$(CONFIG_ARM_TEGRA20_CPUFREQ)	+= tegra20-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)	+= tegra124-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)	+= tegra186-cpufreq.o
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
