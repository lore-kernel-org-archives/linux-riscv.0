Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA3C5478C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 05:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOUBYx5SxW2XNvdqmkliu7/rxyZrfr5WqM5iAoIm234=; b=1/8S1PRJTMO+15
	V+YMu+XGUapXk/z+G8I3bRDPNJOKwJmsPy0q0ZD8FSY4p8K+bNT+HnJlm4lZJS1JmlXhvMXrp8t6r
	jK+xrYvoUyfiK8GXIdAkUb+87xzzPA7Cetfza/C8YHZ5ZMODhKiMNGMrSGnA1tc3tK/r6GE/ZX4TY
	xU40mfyE7jQS+xAbEl+HtSVxXs2SyGJqnj+QN+SjcLKPlip34Tje9Jb3q0nsjvKBrQv1z0mSS5Sca
	pETb9+brwCIp62FegHPIsd4eCzENT4W459SKNF2LETjwXTtHKwDsGW3MIyL8/GNC15fIQFTjyQTRm
	0TAN8sm9PKGitAoN0kKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhNKE-0000000Bz3P-0wbr;
	Tue, 05 Mar 2024 05:26:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhNKB-0000000Bz2V-1RnG
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 05:26:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dc9222b337so52238795ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 21:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709616406; x=1710221206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMCvUOJfUJZd1FjH5xJXeLVB97fRCdKEGxvILGRlgeg=;
        b=E1tQyqAEswFSkQ5Jh7UUiG/cDAWr3gRQ03856grWoZnfJgeX+UlM5ysiSBx7dh7CES
         jLZvDSikRzvtS7MaoBz5RTCKEMA6bm8af6DUEGE5Vw6X7DsYLsVZolE3Fr+kGYmyQ9XX
         4OmLBlJt+FAfZpRlIqs/2acSeBsQpHdmQadf2/cDyAzRqDb/2bpsu2YIn+oGEum7j+8k
         jh50khNWgJeIiBJDgjpMGM8xFU0eRjjT893OnoQqbcWMLcAL7tJaPmw17AwkZfDM9SaR
         yJLc0qD9jfjFLzX87unWvRHjHAAmGHVuuRgxESXeQoWhrx5wfvRN4ZFMCdJ28jvx/cmC
         6RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709616406; x=1710221206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMCvUOJfUJZd1FjH5xJXeLVB97fRCdKEGxvILGRlgeg=;
        b=Ni1rU7Wdx0H2rOhiH3yDDCVOtv8v3t54WUat/DtrU76Hkm45+nvuaUoopVurToXbw6
         gEB4vM3OylZBSYemWWvSOyQkPuFWGD9NcKQ5f2JCqkN5y9U0msggNeJwEwuaz9bu26WU
         ebbOshcTnXMyP6BCIdpf79EinKvz0oajtmPFYd0ix6tR1lKkJ9cIQ8Z5FyeKt3cB5HjL
         Qf0rXXCKMo7FbbMQrCEY9ERd/s/vQ/6JV+z9dE1+yfDnRVUjUR9RexSMmkoRdbJy1phQ
         d/gR2Dh6VoTp4pmZNbnpQDjnyWAbNLqA11NJAci7oDb/HUyuPwD7WhZcexBAxByBfev/
         zX7A==
X-Forwarded-Encrypted: i=1; AJvYcCUOEi2tNFb+r+EH6nns3ro0FUmwfCmTO0Cot6Iv1vVmVSU4kQ96zpw22C6dKzcPGyh1An4Bm7UrqX7UJGjCCwjDS8M8dt/onk65EbPtsPTg
X-Gm-Message-State: AOJu0YwmkBNr2kO+gpua1zBE4BX+F3tzXcZ9wPhLE6B6g5bQmcdkvM7E
	rruHowql7jLOa2EYTzW2EiwGzqRiqs1HHL2WR/2ZH4lGGJwws/DIN9stLmnQr4s=
X-Google-Smtp-Source: AGHT+IGs95PUoXAEeVYkFgLUnlTCMmRM9UBfrxIhvh57F9nTPhSjmTGyccBIiPgnhfiEPKqxoObiIA==
X-Received: by 2002:a17:902:f552:b0:1dc:ce28:a47d with SMTP id h18-20020a170902f55200b001dcce28a47dmr929601plf.17.1709616406218;
        Mon, 04 Mar 2024 21:26:46 -0800 (PST)
Received: from sunil-laptop ([106.51.184.12])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902b78800b001dcc1597377sm9455663pls.230.2024.03.04.21.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 21:26:45 -0800 (PST)
Date: Tue, 5 Mar 2024 10:56:32 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 4/4] ACPI: RISCV: Enable ACPI based NUMA
Message-ID: <ZeatCIUZ/eJa1WHs@sunil-laptop>
References: <cover.1706603678.git.haibo1.xu@intel.com>
 <0be49d4d7d7e43933534aad6f72b35d3380519fd.1706603678.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0be49d4d7d7e43933534aad6f72b35d3380519fd.1706603678.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_212647_405133_7F07ABA3 
X-CRM114-Status: GOOD (  17.25  )
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

On Wed, Jan 31, 2024 at 10:32:01AM +0800, Haibo Xu wrote:
> Enable ACPI based NUMA for RISCV in Kconfig.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  arch/riscv/Kconfig        | 1 +
>  drivers/acpi/numa/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bffbd869a068..e586ab959f34 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -438,6 +438,7 @@ config NUMA
>  	select HAVE_SETUP_PER_CPU_AREA
>  	select NEED_PER_CPU_EMBED_FIRST_CHUNK
>  	select NEED_PER_CPU_PAGE_FIRST_CHUNK
> +	select ACPI_NUMA if ACPI
>  	select OF_NUMA
>  	select USE_PERCPU_NUMA_NODE_ID
>  	help
> diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
> index 849c2bd820b9..525297c44250 100644
> --- a/drivers/acpi/numa/Kconfig
> +++ b/drivers/acpi/numa/Kconfig
> @@ -2,7 +2,7 @@
>  config ACPI_NUMA
>  	bool "NUMA support"
>  	depends on NUMA
> -	depends on (X86 || ARM64 || LOONGARCH)
> +	depends on (X86 || ARM64 || LOONGARCH || RISCV)
Is it possible to remove this if IA64 is removed now? 

Thanks,
Sunil
>  	default y if ARM64
>  
>  config ACPI_HMAT
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
