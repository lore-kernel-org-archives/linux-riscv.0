Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E894CC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSBfkKXXoMbc4DfcTEtuBxCDcYWIJhnlGl7BEvQWIR8=; b=WKGv1dGOidqAyZ
	ciVXrjcZDaKKjCMAePH2TMr/2Wx5Jcc9UNcf+K17/ILJ6sQcgH406qsFOAt+8g5uQeAVp5c9/UWdw
	b7loiNy/7pChfG8BG0jCVhpWH1TSc7BKuN6sFpcKtEm+8e6fO8byOLMZiMX1jL4bGrfFPbd6FN208
	WQhP9V75SfaD6I7C6ltJEnn97CRO/ujAmFaUawydri7tuLrEAM5wBLbHNpCx2O4GaGWUlWqxKon7a
	qDYeZcI3RvgNGLkCCcllR2v99G0nf9Uvn+kSrZ4+3PpBLYgmGk3xkB2ljBrR8c0yduoxWoIylUbrW
	RN+RnIuZNtJYUOM14I4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY7SL-006ivo-44; Fri, 03 Mar 2023 15:36:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY7SI-006iv9-Qo
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 15:36:24 +0000
Received: by mail-ed1-x534.google.com with SMTP id g3so12002079eda.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+a4iAObubgdupIx5A13t4eGPRZyH4LhREkXgghv4xxk=;
        b=Fv49W5DvFygeRCObHLWFGBApnfTmVTZKsuKv5skwkgqTlhwp7y0NVF9S9+JDySWkp5
         LKcsFR/2x/z/MPF/H4cJv9cHBcnx+1RGn/Ao8mwpc7eYF/j9xKct2/zvql1qvVZlfkTv
         vpK+Rft5JIrZ3SMip85z3PMYm4JcDepSx35m2Twsq/DaAQaHlJY56kK9N8sXYcsgrsSZ
         URjrUD/1LA3SHJIlry2EvscmT7O8rmO44+Up79eInIwRKGX8BE1Am1CQkh22MuFQhJrG
         evvkpHXwpZD+I8PNzhrTcs5U9UinFJfRkLM8tSq4YH6nOu/liOPYUzRDOC8A6hBJjW+v
         aarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a4iAObubgdupIx5A13t4eGPRZyH4LhREkXgghv4xxk=;
        b=xcAV7/Xc0JA0WbTcR9oUWq7hLWuV9DzTZ81UDV+UpSOxhxsctUbht17fw+1BvRgi4R
         stDv1ZDiEsp0y5mpOmGJoy5O9DUTC0HgXb4OSpeLhF2JmEb7sscA5swA/90RFO45AQSi
         Nd7y0N/4d5V70JXACBSdeeQdM5ky3RC7Kv2mhwiWJadwTPh7fMomrHSk0ew0tj4Ryqpq
         9+Iff4/NE4Q6T1btINElQ/XCPlaApp1Nr8ack3Ic8EyyRiBImWmthW+C9PuojKaUoVK/
         oZskUsHyQk55WNgQugsISPUeItMjaXA9WlzL3QUWoiGYm797sUbNN4OEPB5VGM6bFsux
         dVhQ==
X-Gm-Message-State: AO0yUKWTIPznM67CK115UHnENPiK7GRIOANyOs0VbqyJJ7LkRMSKBged
	FxTzVRihHLb5uIpUAuBAXcVIXw==
X-Google-Smtp-Source: AK7set9EtY0wspQMB4VPYlpSRdJQhEAZ1ryiI5eLWiuIMV0gy5sE2XY9CWySdjcNRf/alEQ/500zsA==
X-Received: by 2002:a17:907:7f13:b0:884:3174:119d with SMTP id qf19-20020a1709077f1300b008843174119dmr2431543ejc.14.1677857779172;
        Fri, 03 Mar 2023 07:36:19 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z92-20020a509e65000000b004bc11e5f8b9sm1270904ede.83.2023.03.03.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 07:36:18 -0800 (PST)
Date: Fri, 3 Mar 2023 16:36:17 +0100
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
Subject: Re: [PATCH V3 06/20] RISC-V: Add support to build the ACPI core
Message-ID: <20230303153617.ko4duynxjvixy3bf@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-7-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303133647.845095-7-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_073622_908769_C944D739 
X-CRM114-Status: GOOD (  20.35  )
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

On Fri, Mar 03, 2023 at 07:06:33PM +0530, Sunil V L wrote:
> Enable ACPI core for RISC-V after adding architecture-specific
> interfaces and header files required to build the ACPI core.
> 
> 1) Couple of header files are required unconditionally by the ACPI
> core. Add empty acenv.h and cpu.h header files.
> 
> 2) If CONFIG_PCI is enabled, a few PCI related interfaces need to
> be provided by the architecture. Define dummy interfaces for now
> so that build succeeds. Actual implementation will be added when
> PCI support is added for ACPI along with external interrupt
> controller support.
> 
> 3) A few globals and memory mapping related functions specific
> to the architecture need to be provided.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig             |  5 +++
>  arch/riscv/include/asm/acenv.h | 11 +++++
>  arch/riscv/include/asm/acpi.h  | 61 ++++++++++++++++++++++++++
>  arch/riscv/include/asm/cpu.h   |  8 ++++
>  arch/riscv/kernel/Makefile     |  2 +
>  arch/riscv/kernel/acpi.c       | 80 ++++++++++++++++++++++++++++++++++
>  6 files changed, 167 insertions(+)
>  create mode 100644 arch/riscv/include/asm/acenv.h
>  create mode 100644 arch/riscv/include/asm/acpi.h
>  create mode 100644 arch/riscv/include/asm/cpu.h
>  create mode 100644 arch/riscv/kernel/acpi.c
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 71754eb32ee6..f3108c7e19d8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,6 +12,8 @@ config 32BIT
>  
>  config RISCV
>  	def_bool y
> +	select ACPI_GENERIC_GSI if ACPI
> +	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> @@ -617,6 +619,7 @@ config EFI
>  	depends on OF && !XIP_KERNEL
>  	depends on MMU
>  	default y
> +	select ARCH_SUPPORTS_ACPI if 64BIT
>  	select EFI_GENERIC_STUB
>  	select EFI_PARAMS_FROM_FDT
>  	select EFI_RUNTIME_WRAPPERS
> @@ -720,3 +723,5 @@ source "drivers/cpufreq/Kconfig"
>  endmenu # "CPU Power Management"
>  
>  source "arch/riscv/kvm/Kconfig"
> +
> +source "drivers/acpi/Kconfig"

The above Kconfig hunks don't apply on the IPI improvement base. The
second hunk also looks weird with the select under the default.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
