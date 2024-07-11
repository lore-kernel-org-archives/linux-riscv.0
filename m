Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6433CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 22:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8jT491rL122xY2M86MjWlUb3h6Xpm6FyKTKm5cQAxM=; b=n7QfjX4jv7Bu2n
	B9uLBr/w9ypN2Dz3mQSf6jtgXTCtCLcUVaQIhcAsqee6NI4CfCKyqFNqgUmqGb897sIqHvNlv1LL4
	dejq8hLh5MilSV94svoVuehdx9EysC7ZP73wjukFellgpV12kieERpFsT+keh4wE3+Egg5HmEk4+S
	VqiQ7mcGJ98xaIVgNRbHlXSax4oiE7OhaNC7SV4QxzljBS1QJBOLe2tdFZD7it02sHe3iwya/H2KI
	MjUqAWWiFn8HMU2hnjhGrrLWMMb6DtQvt0X8PNa1vKh53agH8azxdCjRwSovXDOxCayolU+NnRooV
	JzOis1EE1ex15vK/+9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2Rd-0000000FhPr-2mBQ;
	Thu, 11 Jul 2024 22:39:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2Ra-0000000FhP5-3z31
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 22:39:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fa55dbf2e7so9884335ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 15:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720737558; x=1721342358; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8GxgjPLShiSewN+a/1ZZw6RNJuPMBowXLb8tj+mVPPI=;
        b=w3CHuFAQnr8WaW1BHDvX/moW2oQNdfzhWeVFQS4zUOqLsFrMHCMgYyN57A3miU9W+Y
         ahdM5THdoMJswPCbblv0a+L+gBBbfPtAN3xLiK8MzsOAYAWE+HrLifGY7RWgFUb1r03q
         i6ksD52j1Dgy7Gbmi+JXxkCzoC8s49Do0CIUbnH/tSDit5UbBIeIPFnOVDlkpDWg4USu
         WYDhRzMKQ2nLtzhAN4sZ4+3g1CJxd2ilf6i0kfV6m+HvTa+56tATWc15jB5Q/XJlTD6/
         g4woD0vpwIEmMOQgwt2nJ8qx8r9+lBoEHKN8zxHzurGCCYFlz0Wth9KQCbhV64HUL8CN
         gVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720737558; x=1721342358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GxgjPLShiSewN+a/1ZZw6RNJuPMBowXLb8tj+mVPPI=;
        b=e0mTj/AESCGtLakEkgSPeIY6BW1H4MWGF7rIxiMGOE0cjONosXPoBK31OkVpfd4VK9
         DlaohPUFBROl3Bbo+uOvrOg0HSY5uDHzXxPOu3g0cAR8t3tPTCVhxkYUZLj0PPylMeJJ
         rg9g+rZSpWDaydXCNnKIhXsZrLp7MKdrNMPb8BRP4T5xwdS9ybDy08KW1YPXg8qvZN/c
         //wECEODpDNIsM0tmeoH8BEWvpqyUgEsZucV9mzDysFZzesXr7yuAxzXEvX7Dkd3cXAz
         S3OkCPn+PYbs1ip9LjQlE1NE+Z9qVM0Jtbsswq/k6V57cAATZLECGhp5LueUwX/kS4Pd
         mIyg==
X-Gm-Message-State: AOJu0Yx6TCvWH7s7nlnExFn4ZM8RA2sLLSh4mYWKz2HoK9yRaUPcl4QO
	EKWAgLT/6TbBNk6WFNCQ8h7zpxkRAxC/6dYiXb34nOmAgd21RZEtY7w5oOlEDzk=
X-Google-Smtp-Source: AGHT+IGkcS1UnmFUiDfnYfYf9oTjjiw9v89JiL0uz2DalF+LCxXc2R7fkoXd9no1eEDuFpDvvIk9aA==
X-Received: by 2002:a17:902:e54c:b0:1fb:5c3d:b8c3 with SMTP id d9443c01a7336-1fbb6cdab3amr85148975ad.4.1720737557983;
        Thu, 11 Jul 2024 15:39:17 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac778dsm55465595ad.228.2024.07.11.15.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:39:17 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:39:15 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 4/7] RISC-V: Replace RISCV_MISALIGNED with
 RISCV_SCALAR_MISALIGNED
Message-ID: <ZpBfE3odf9Re85kU@ghost>
References: <20240711215846.834365-1-jesse@rivosinc.com>
 <20240711215846.834365-5-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711215846.834365-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_153919_012973_CB49A4FB 
X-CRM114-Status: GOOD (  21.75  )
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

On Thu, Jul 11, 2024 at 05:58:43PM -0400, Jesse Taube wrote:
> Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED to allow
> for the addition of RISCV_VECTOR_MISALIGNED in a later patch.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> V2 -> V3:
>  - New patch
> V3 -> V4:
>  - No changes
> ---
>  arch/riscv/Kconfig                    | 6 +++---
>  arch/riscv/include/asm/cpufeature.h   | 2 +-
>  arch/riscv/include/asm/entry-common.h | 2 +-
>  arch/riscv/kernel/Makefile            | 4 ++--
>  arch/riscv/kernel/fpu.S               | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b94176e25be1..34d24242e37a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -717,7 +717,7 @@ config THREAD_SIZE_ORDER
>  	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
>  	  affects irq stack size, which is equal to thread stack size.
>  
> -config RISCV_MISALIGNED
> +config RISCV_SCALAR_MISALIGNED
>  	bool
>  	select SYSCTL_ARCH_UNALIGN_ALLOW
>  	help
> @@ -734,7 +734,7 @@ choice
>  
>  config RISCV_PROBE_UNALIGNED_ACCESS
>  	bool "Probe for hardware unaligned access support"
> -	select RISCV_MISALIGNED
> +	select RISCV_SCALAR_MISALIGNED
>  	help
>  	  During boot, the kernel will run a series of tests to determine the
>  	  speed of unaligned accesses. This probing will dynamically determine
> @@ -745,7 +745,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
>  
>  config RISCV_EMULATED_UNALIGNED_ACCESS
>  	bool "Emulate unaligned access where system support is missing"
> -	select RISCV_MISALIGNED
> +	select RISCV_SCALAR_MISALIGNED
>  	help
>  	  If unaligned memory accesses trap into the kernel as they are not
>  	  supported by the system, the kernel will emulate the unaligned
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 347805446151..0ed7d99c14dd 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -33,8 +33,8 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
>  
>  void riscv_user_isa_enable(void);
>  
> -#if defined(CONFIG_RISCV_MISALIGNED)
>  bool check_unaligned_access_emulated_all_cpus(void);
> +#if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
>  DECLARE_PER_CPU(long, misaligned_access_speed);
> diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
> index 2293e535f865..0a4e3544c877 100644
> --- a/arch/riscv/include/asm/entry-common.h
> +++ b/arch/riscv/include/asm/entry-common.h
> @@ -25,7 +25,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>  void handle_page_fault(struct pt_regs *regs);
>  void handle_break(struct pt_regs *regs);
>  
> -#ifdef CONFIG_RISCV_MISALIGNED
> +#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  int handle_misaligned_load(struct pt_regs *regs);
>  int handle_misaligned_store(struct pt_regs *regs);
>  #else
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 5b243d46f4b1..8d4e7d40e42f 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -62,8 +62,8 @@ obj-y	+= probes/
>  obj-y	+= tests/
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>  
> -obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
> -obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
> +obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= traps_misaligned.o
> +obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= unaligned_access_speed.o
>  obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
>  
>  obj-$(CONFIG_FPU)		+= fpu.o
> diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
> index 327cf527dd7e..f74f6b60e347 100644
> --- a/arch/riscv/kernel/fpu.S
> +++ b/arch/riscv/kernel/fpu.S
> @@ -170,7 +170,7 @@ SYM_FUNC_END(__fstate_restore)
>  	__access_func(f31)
>  
>  
> -#ifdef CONFIG_RISCV_MISALIGNED
> +#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  
>  /*
>   * Disable compressed instructions set to keep a constant offset between FP
> @@ -224,4 +224,4 @@ SYM_FUNC_START(get_f64_reg)
>  	fp_access_epilogue
>  SYM_FUNC_END(get_f64_reg)
>  
> -#endif /* CONFIG_RISCV_MISALIGNED */
> +#endif /* CONFIG_RISCV_SCALAR_MISALIGNED */
> -- 
> 2.45.2
> 

Thank you for making this change!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
