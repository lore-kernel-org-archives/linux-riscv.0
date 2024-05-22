Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640B5C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqIienDfpwZfDQ4DlOBWzfcw8tlT5ZYNdHoxFvl3BNk=; b=fmQS535AXQSAzv
	pSFhswAS2gSImYp37BIiPM3IwVa1Rm7wUKsD/Jbi+6XZty8/n9gNqXMiR4yUdw7iIgk1mGWcqgwwf
	ScgziJN58aI9LHsGv7X02Si0OQSlD5lRyWpXPRzrAOfml56YOH9tk1juQ1/7ImDfPKGZiox+qtmGl
	nCzReilvIxDdBLjidrx5YBg1Uen5bNMB5vwVX2dMTeT8TVRjKkiFJQT2urJKCPNPKduzut662woeK
	BB1OVB3DiJ7TPDapmxMpU226aNm7xFruzWPiT+frmluF6MKXylaVhXnNJKT/hVibDUaPxbhpOiupM
	R8GaT0o/RDg0h3qDpTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ps7-00000003fYB-3aPq;
	Wed, 22 May 2024 17:35:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ps4-00000003fXD-2ge5
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 17:35:26 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6f4f2b1c997so1598673b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716399322; x=1717004122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtcwHXQhuywjWtHL8fvX3LFZZ/ytDiic4eCWATEojeU=;
        b=IcIyAVKgMAEbvdQcuvO+ZFHz7Xb3f7hOqPfibKyByjAMjp6qHG0Ue84hxUOaOsr3V6
         i4AWbl7/A3zjfw8/Dq8iL5OP9W4xJYnaU6VjyyxUBtBlne7dWiw8MxIlFJMlW7Eq4K05
         kxoTdTBl33wLf3QIe3UfTdkBKVO2TpzdECGsw9U29LYOSjn4g3BCTm4W1BLOWD3oiNZG
         5NXjW6SrgOfFR84U8YtGF2LhU53XNIey1+RXL6SOGKI/am+oyvsjcB5hSBqxBTync1n/
         87Rmkk/SLBikqA7s+gUKKOfLfkiBdIYTgMwVxwm7kjPIQHdwitzaNJEyw0EmixzDfjZe
         i3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399322; x=1717004122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtcwHXQhuywjWtHL8fvX3LFZZ/ytDiic4eCWATEojeU=;
        b=FwWREaG8FDTKZlk70k0OfVu9Rle0T257m4ZBvbTVQBvbBIU/BHL2wkxGh2x+ADszsV
         kXNbeZ6l2HAJrX6gPqhfYLqZAwHQulzwEo/K6owOkFvsaPFcKpyMlwJj/lHvaCeK/47H
         hRVKISnyruDyeW7n+kWHsZSZKJ93b6aWLDGZ0+W0FJZJnadRtxHAWCqwSg0Lx2bt26xo
         JUZ4ZR25HnrdCKJWMqCk4foeA4goBPu1149Vnv8IMac8QW7qsesteo/em+MNSR8kQVSP
         NnSpJJN1YdYc2YLHIH2nWrPGOHPKEQ3LRE2JxTVmb+V/ccw1J0j+tHgC3EhPq8/aNvbE
         nnIg==
X-Forwarded-Encrypted: i=1; AJvYcCVWygXB9SDJSdHy+APmISSjEVinWUnkuo0QKmeAn70MlcTE6CyJIXitAP8jvMUg9lbabBVtQb0rA6ep1cfkILCQRiEeS7X14SZ5CwkpWT9L
X-Gm-Message-State: AOJu0YxnnOMh8c7KPiQULG64UL1tHaIU7AeHuyfE5tkRucSaiD8e9/np
	dlEO0biRqudL+eD8XsEob4si7EM5nRoDb7TlJzY73r/j5ZZr/dj8s2+dtmtmzzc=
X-Google-Smtp-Source: AGHT+IFnVExZ9w4FLsmZMki4aPDFIr85cfle6enyYjYsVAi4+pfoOCqX9NTQeS826YOJ4cg7meMOkA==
X-Received: by 2002:a05:6a00:3cc7:b0:6f3:ecdc:220e with SMTP id d2e1a72fcca58-6f6d617a507mr3058370b3a.24.1716399321714;
        Wed, 22 May 2024 10:35:21 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a9d976sm22673408b3a.89.2024.05.22.10.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:35:21 -0700 (PDT)
Date: Wed, 22 May 2024 23:05:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: arnd@arndb.de, xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Baoquan He <bhe@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Evan Green <evan@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v3 5/6] ACPI: NUMA: change the ACPI_NUMA to a hidden
 option
Message-ID: <Zk4sxy4a5gy6ZfdJ@sunil-laptop>
References: <cover.1713778236.git.haibo1.xu@intel.com>
 <5c3a005a67096010cf3c465f8e3362651763fe3b.1713778236.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c3a005a67096010cf3c465f8e3362651763fe3b.1713778236.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_103524_718969_53065703 
X-CRM114-Status: GOOD (  18.42  )
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

On Wed, Apr 24, 2024 at 01:46:25PM +0800, Haibo Xu wrote:
> x86/arm64/loongarch would select ACPI_NUMA by default and riscv
> would do the same thing, so change it to a hidden option and the
> select statements except for the X86_64_ACPI_NUMA can also go away.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  arch/arm64/Kconfig        | 1 -
>  arch/loongarch/Kconfig    | 1 -
>  drivers/acpi/numa/Kconfig | 5 +----
>  3 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7b11c98b3e84..c6c667898da6 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1439,7 +1439,6 @@ config HOTPLUG_CPU
>  config NUMA
>  	bool "NUMA Memory Allocation and Scheduler Support"
>  	select GENERIC_ARCH_NUMA
> -	select ACPI_NUMA if ACPI
>  	select OF_NUMA
>  	select HAVE_SETUP_PER_CPU_AREA
>  	select NEED_PER_CPU_EMBED_FIRST_CHUNK
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index a5f300ec6f28..29d574a5c34c 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -465,7 +465,6 @@ config NR_CPUS
>  config NUMA
>  	bool "NUMA Support"
>  	select SMP
> -	select ACPI_NUMA if ACPI
>  	help
>  	  Say Y to compile the kernel with NUMA (Non-Uniform Memory Access)
>  	  support.  This option improves performance on systems with more
> diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
> index 849c2bd820b9..f33194d1e43f 100644
> --- a/drivers/acpi/numa/Kconfig
> +++ b/drivers/acpi/numa/Kconfig
> @@ -1,9 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config ACPI_NUMA
> -	bool "NUMA support"
> -	depends on NUMA
> -	depends on (X86 || ARM64 || LOONGARCH)
> -	default y if ARM64
> +	def_bool NUMA && !X86
>  
LGTM.

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
