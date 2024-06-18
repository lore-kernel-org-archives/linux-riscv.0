Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B44C27C79
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 01:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toT0z3nt1k9n4IXOMr9UmLlvIERAubo8VU+Uhl8rGS0=; b=L9LMvVPF0Nq2Xn
	AsbZIpYDVMUhhOwCcg7/N69StJ9TSunbgp7amxINX4csoKbVQFhwj1sX8z0i2mVzZCcC0erL3zBlM
	D30kAf2gtqcV5zIud2K8+DIG/S++zThTQrQf123GoEkI8d2EV5W2k6f3iRVS4tfhe2/U/hZj08D/T
	2QD+lFM5MIaFckUGYsKKwLPrXa4gQL/BQ/mfoGRjhSNaByMl1ZIkvOBzroAz24QGUOgObFyciR/8D
	M3Om8SHCSeeatoNoeRCcKI4TkmLwFPAFxEF8gaWb92AKiRxa6I4Qlxi2dVS8wwA5LUUXXwzdG6EtO
	rOfV3J1OfZNdAG1xvCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJNst-0000000DDcD-3Fts;
	Tue, 18 Jun 2024 01:43:44 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJNso-0000000DDaO-0pLi
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 01:43:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-6e4dbca52f0so3626440a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 18:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718675017; x=1719279817; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJsmDLriJ3CnnxvPJSNJeQGB2fupn9wGUrBsqY3zVMs=;
        b=FgqOPLPARlIL6qUwosujRMH0m0MvGjMmnqc3U2ljsxZ3EZ4aBqgf3X79It48K0D3IS
         G07ego8EhQdomqxephkiMwMqIzXssQPGX+olzB66akEC6YiWIQb2NVX4KziWKvj/XU5R
         IFLW52w8jhsKllMStHx1VBSEIpPIvQVIUzj5tXe2eoCh/zro8f9HcFAzyLJKRkraXLbl
         ASAm3u911vi+rzfpX+MS71x56dzmSTbgqUOmDKzZUTJHLePj0VyE7vj1C9kj9AbxmtHN
         eZgU23Qnj3wHhH03zuIDzWJwZH7f80S3Y3Uwo+TBDFGp+MoObHjquGWKHRIYdtpsqC4Y
         R6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718675017; x=1719279817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJsmDLriJ3CnnxvPJSNJeQGB2fupn9wGUrBsqY3zVMs=;
        b=c7EsvWmFa20KOwJzYFqvTJ1cNa+loueOJ3pgqCgIUsYw4S3lbtNLYUzLwEVvTetpw4
         Vg/djx5Hlf+vk6LAXe9/Zm0TdOBM8ywOlhB6VgxvevYXXxnUx2j5u9Pe5BHpYOy47VV7
         TbTgvfQqglfPAhDnRvfcLr6T9/6BXQkFyD0rp8HyQ/ESt3xXxc2WsuqPXtoN27IKwgp5
         sYBdgNPNp7I2I0n1WfmvyEtDI0+Ri0ZJ6+tyCROyH3d2VQO4xoCA03zU9+XNrjzS1nCq
         sXZrnUZh2UO5/X6SqAFF3oot4euD6Xofh0sHQ/JHWNCZtVGxjNucbY8U+4sKaSH2ayDc
         SP4w==
X-Gm-Message-State: AOJu0Yxrwkl536KnSmXvB/S7QnArhrT/RmmX+NxosnraTE1BYSmqbFNF
	Lfb4dGiNq5NQArCaeMJ9nPsRWLcJy/ahoHMX4brdST3QzqKfxwD1zG89TgRgY7g=
X-Google-Smtp-Source: AGHT+IFAI6ShzWZSL0OZ/1ugXLq3GJOds/g7tDGWICOzdwHrgVx/P3PhLNL79a5Sa4Z+EKpgmnZz5Q==
X-Received: by 2002:a17:902:e546:b0:1f6:eefb:8bd3 with SMTP id d9443c01a7336-1f862a09a21mr139734735ad.66.1718675017237;
        Mon, 17 Jun 2024 18:43:37 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:3b3e:f51e:252a:6811])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f1e81fsm85759835ad.251.2024.06.17.18.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 18:43:36 -0700 (PDT)
Date: Mon, 17 Jun 2024 18:43:32 -0700
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
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] RISC-V: Detect unaligned vector accesses
 supported.
Message-ID: <ZnDmRK0ZtKzmWN5S@ghost>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613191616.2101821-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_184340_727121_6DF78425 
X-CRM114-Status: GOOD (  40.44  )
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

On Thu, Jun 13, 2024 at 03:16:13PM -0400, Jesse Taube wrote:
> Run a unaligned vector access to test if the system supports
> vector unaligned access. Add the result to a new key in hwprobe.
> This is useful for usermode to know if vector misaligned accesses are
> supported and if they are faster or slower than equivalent byte accesses.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>  - Add Kconfig options
>  - Add insn_is_vector
>  - Add handle_vector_misaligned_load
>  - Fix build
>  - Seperate vector from scalar misaligned access
>  - This patch was almost completely rewritten
> ---
>  arch/riscv/Kconfig                         |  41 +++++++
>  arch/riscv/include/asm/cpufeature.h        |   7 +-
>  arch/riscv/include/asm/entry-common.h      |  11 --
>  arch/riscv/include/asm/hwprobe.h           |   2 +-
>  arch/riscv/include/asm/vector.h            |   1 +
>  arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
>  arch/riscv/kernel/Makefile                 |   4 +-
>  arch/riscv/kernel/sys_hwprobe.c            |  41 +++++++
>  arch/riscv/kernel/traps_misaligned.c       | 119 ++++++++++++++++++++-
>  arch/riscv/kernel/unaligned_access_speed.c |   9 +-
>  arch/riscv/kernel/vector.c                 |   2 +-
>  11 files changed, 221 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b94176e25be1..f12df0ca6c18 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -723,6 +723,12 @@ config RISCV_MISALIGNED
>  	help
>  	  Embed support for emulating misaligned loads and stores.
>  
> +config RISCV_VECTOR_MISALIGNED
> +	bool
> +	depends on RISCV_ISA_V
> +	help
> +	  Enable detecting support for vector misaligned loads and stores.
> +
>  choice
>  	prompt "Unaligned Accesses Support"
>  	default RISCV_PROBE_UNALIGNED_ACCESS
> @@ -774,6 +780,41 @@ config RISCV_EFFICIENT_UNALIGNED_ACCESS
>  
>  endchoice
>  
> +choice
> +	prompt "Vector unaligned Accesses Support"
> +	depends on RISCV_ISA_V
> +	default RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> +	help
> +	  This determines the level of support for vector unaligned accesses. This
> +	  information is used by the kernel to perform optimizations. It is also
> +	  exposed to user space via the hwprobe syscall. The hardware will be
> +	  probed at boot by default.
> +
> +config RISCV_DETECT_VECTOR_UNALIGNED_ACCESS

This is not used anywhere, what is the reason for including it?

> +	bool "Detect support for vector unaligned accesses"
> +	select RISCV_VECTOR_MISALIGNED
> +	help
> +	  During boot, the kernel will detect if the system supports vector
> +	  unaligned accesses.
> +
> +config RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> +	bool "Probe speed of vector unaligned accesses"
> +	select RISCV_VECTOR_MISALIGNED
> +	help
> +	  During boot, the kernel will run a series of tests to determine the
> +	  speed of vector unaligned accesses if they are supported. This probing
> +	  will dynamically determine the speed of vector unaligned accesses on
> +	  the underlying system if they are supported.
> +
> +config CONFIG_RISCV_UNALIGNED_ACCESS_UNSUPPORTED

This should not be prefixed with CONFIG and does not include VECTOR in
the name. I assume you meant to put
"RISCV_VEC_UNALIGNED_ACCESS_UNSUPPORTED" here?

This was also intentionally left out on the scalar side [1]. The
implication here is that having this config will cause people to compile
kernels without unaligned access support which really shouldn't be
something we are explicitly supporting.

If somebody does want to support hardware that does not handle vector
unaligned accesses, the solution should be to add emulation support to
the kernel.

Link: https://lore.kernel.org/all/Zd4y5llkvTfKHf6b@ghost/ [1]

- Charlie

> +	bool "Assume the system does not support vector unaligned memory accesses"
> +	help
> +	  Assume that the system does not support vector unaligned memory accesses.
> +	  The kernel and userspace programs may run them successfully on systems
> +	  that do support vector unaligned memory accesses.
> +
> +endchoice
> +
>  endmenu # "Platform type"
>  
>  menu "Kernel features"
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 347805446151..d0ea5921ab20 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -33,8 +33,8 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
>  
>  void riscv_user_isa_enable(void);
>  
> -#if defined(CONFIG_RISCV_MISALIGNED)
>  bool check_unaligned_access_emulated_all_cpus(void);
> +#if defined(CONFIG_RISCV_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
>  DECLARE_PER_CPU(long, misaligned_access_speed);
> @@ -45,6 +45,11 @@ static inline bool unaligned_ctl_available(void)
>  }
>  #endif
>  
> +bool check_vector_unaligned_access_emulated_all_cpus(void);
> +#if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
> +DECLARE_PER_CPU(long, vector_misaligned_access);
> +#endif
> +
>  #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
>  DECLARE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
>  
> diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
> index 2293e535f865..7b32d2b08bb6 100644
> --- a/arch/riscv/include/asm/entry-common.h
> +++ b/arch/riscv/include/asm/entry-common.h
> @@ -25,18 +25,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>  void handle_page_fault(struct pt_regs *regs);
>  void handle_break(struct pt_regs *regs);
>  
> -#ifdef CONFIG_RISCV_MISALIGNED
>  int handle_misaligned_load(struct pt_regs *regs);
>  int handle_misaligned_store(struct pt_regs *regs);
> -#else
> -static inline int handle_misaligned_load(struct pt_regs *regs)
> -{
> -	return -1;
> -}
> -static inline int handle_misaligned_store(struct pt_regs *regs)
> -{
> -	return -1;
> -}
> -#endif
>  
>  #endif /* _ASM_RISCV_ENTRY_COMMON_H */
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 150a9877b0af..ef01c182af2b 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 7
> +#define RISCV_HWPROBE_MAX_KEY 8
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index be7d309cca8a..99b0f91db9ee 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -21,6 +21,7 @@
>  
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
> +bool insn_is_vector(u32 insn_buf);
>  bool riscv_v_first_use_handler(struct pt_regs *regs);
>  void kernel_vector_begin(void);
>  void kernel_vector_end(void);
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 023b7771d1b7..2fee870e41bb 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -75,6 +75,11 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  #define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
> +#define RISCV_HWPROBE_KEY_VEC_MISALIGNED_PERF	8
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN		0

I appreciate you leaving the key for EMULATED open!

> +#define		RISCV_HWPROBE_VEC_MISALIGNED_SLOW		2
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_FAST		3
> +#define		RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED	4
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 5b243d46f4b1..62ac19c029f1 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -62,8 +62,8 @@ obj-y	+= probes/
>  obj-y	+= tests/
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>  
> -obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
> -obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
> +obj-y	+= traps_misaligned.o
> +obj-y	+= unaligned_access_speed.o
>  obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
>  
>  obj-$(CONFIG_FPU)		+= fpu.o
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index e910e2971984..c40df314058b 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -194,6 +194,43 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  }
>  #endif
>  
> +#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
> +static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
> +{
> +	int cpu;
> +	u64 perf = -1ULL;
> +
> +	if (IS_ENABLED(CONFIG_RISCV_UNALIGNED_ACCESS_UNSUPPORTED))
> +		return RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
> +
> +	/* Return if supported or not even if speed wasn't probed */
> +	for_each_cpu(cpu, cpus) {
> +		int this_perf = per_cpu(vector_misaligned_access, cpu);
> +
> +		if (perf == -1ULL)
> +			perf = this_perf;
> +
> +		if (perf != this_perf) {
> +			perf = RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
> +			break;
> +		}
> +	}
> +
> +	if (perf == -1ULL)
> +		return RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
> +
> +	return perf;
> +}
> +#else
> +static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_UNALIGNED_ACCESS_UNSUPPORTED))
> +		return RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
> +
> +	return RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
> +}
> +#endif
> +
>  static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  			     const struct cpumask *cpus)
>  {
> @@ -222,6 +259,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		pair->value = hwprobe_misaligned(cpus);
>  		break;
>  
> +	case RISCV_HWPROBE_KEY_VEC_MISALIGNED_PERF:
> +		pair->value = hwprobe_vec_misaligned(cpus);
> +		break;
> +
>  	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
>  		pair->value = 0;
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 8fadbe00dd62..6f0264a8c9de 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -16,6 +16,7 @@
>  #include <asm/entry-common.h>
>  #include <asm/hwprobe.h>
>  #include <asm/cpufeature.h>
> +#include <asm/vector.h>
>  
>  #define INSN_MATCH_LB			0x3
>  #define INSN_MASK_LB			0x707f
> @@ -322,12 +323,37 @@ union reg_data {
>  	u64 data_u64;
>  };
>  
> -static bool unaligned_ctl __read_mostly;
> -
>  /* sysctl hooks */
>  int unaligned_enabled __read_mostly = 1;	/* Enabled by default */
>  
> -int handle_misaligned_load(struct pt_regs *regs)
> +#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
> +static int handle_vector_misaligned_load(struct pt_regs *regs)
> +{
> +	unsigned long epc = regs->epc;
> +	unsigned long insn;
> +
> +	if (get_insn(regs, epc, &insn))
> +		return -1;
> +
> +	/* Only return 0 when in check_vector_unaligned_access_emulated */
> +	if (*this_cpu_ptr(&vector_misaligned_access) == RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN) {
> +		*this_cpu_ptr(&vector_misaligned_access) = RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
> +		regs->epc = epc + INSN_LEN(insn);
> +		return 0;
> +	}
> +
> +	/* If vector instruction we don't emulate it yet */
> +	regs->epc = epc;
> +	return -1;
> +}
> +#else
> +static int handle_vector_misaligned_load(struct pt_regs *regs)
> +{
> +	return -1;
> +}
> +#endif
> +
> +static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  {
>  	union reg_data val;
>  	unsigned long epc = regs->epc;
> @@ -435,7 +461,7 @@ int handle_misaligned_load(struct pt_regs *regs)
>  	return 0;
>  }
>  
> -int handle_misaligned_store(struct pt_regs *regs)
> +static int handle_scalar_misaligned_store(struct pt_regs *regs)
>  {
>  	union reg_data val;
>  	unsigned long epc = regs->epc;
> @@ -526,6 +552,85 @@ int handle_misaligned_store(struct pt_regs *regs)
>  	return 0;
>  }
>  
> +int handle_misaligned_load(struct pt_regs *regs)
> +{
> +	unsigned long epc = regs->epc;
> +	unsigned long insn;
> +
> +	if (IS_ENABLED(CONFIG_RISCV_VECTOR_MISALIGNED)) {
> +		if (get_insn(regs, epc, &insn))
> +			return -1;
> +
> +		if (insn_is_vector(insn))
> +			return handle_vector_misaligned_load(regs);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_RISCV_MISALIGNED))
> +		return handle_scalar_misaligned_load(regs);
> +
> +	return -1;
> +}
> +
> +int handle_misaligned_store(struct pt_regs *regs)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_MISALIGNED))
> +		return handle_scalar_misaligned_store(regs);
> +
> +	return -1;
> +}
> +
> +#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
> +static void check_vector_unaligned_access_emulated(struct work_struct *unused)
> +{
> +	long *mas_ptr = this_cpu_ptr(&vector_misaligned_access);
> +	unsigned long tmp_var;
> +
> +	*mas_ptr = RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN;
> +
> +	local_irq_enable();
> +	kernel_vector_begin();
> +	__asm__ __volatile__ (
> +		".balign 4\n\t"
> +		".option push\n\t"
> +		".option arch, +zve32x\n\t"
> +		"       vsetivli zero, 1, e16, m1, ta, ma\n\t"	// Vectors of 16b
> +		"       vle16.v v0, (%[ptr])\n\t"		// Load bytes
> +		".option pop\n\t"
> +		: : [ptr] "r" ((u8 *)&tmp_var + 1) : "v0");
> +	kernel_vector_end();
> +}
> +
> +bool check_vector_unaligned_access_emulated_all_cpus(void)
> +{
> +	int cpu;
> +	bool ret = true;
> +
> +	if (!has_vector()) {
> +		for_each_online_cpu(cpu)
> +			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
> +		return false;
> +	}
> +
> +	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
> +
> +	for_each_online_cpu(cpu)
> +		if (per_cpu(vector_misaligned_access, cpu)
> +		    != RISCV_HWPROBE_VEC_MISALIGNED_SLOW)
> +			return false;
> +
> +	return ret;
> +}
> +#else
> +bool check_vector_unaligned_access_emulated_all_cpus(void)
> +{
> +	return false;
> +}
> +#endif
> +
> +#ifdef CONFIG_RISCV_MISALIGNED
> +
> +static bool unaligned_ctl __read_mostly;
> +
>  static void check_unaligned_access_emulated(struct work_struct *unused)
>  {
>  	int cpu = smp_processor_id();
> @@ -563,3 +668,9 @@ bool unaligned_ctl_available(void)
>  {
>  	return unaligned_ctl;
>  }
> +#else
> +bool check_unaligned_access_emulated_all_cpus(void)
> +{
> +	return false;
> +}
> +#endif
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 70c1588fc353..c6106bd4a25a 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -19,7 +19,8 @@
>  #define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
>  #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
>  
> -DEFINE_PER_CPU(long, misaligned_access_speed);
> +DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
>  
>  #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>  static cpumask_t fast_misaligned_access;
> @@ -268,12 +269,18 @@ static int check_unaligned_access_all_cpus(void)
>  
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
>  		for_each_online_cpu(cpu) {
> +#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
> +			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_VEC_MISALIGNED_FAST;
> +#endif
> +#ifdef CONFIG_RISCV_MISALIGNED
>  			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
> +#endif
>  		}
>  		return 0;

Since this function returns 0 in both cases, can you wrap the rest of
the function with an else and remove this early return?

- Charlie

>  	}
>  
>  	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
> +	check_vector_unaligned_access_emulated_all_cpus();
>  
>  #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>  	if (!all_cpus_emulated)
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 682b3feee451..821818886fab 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -66,7 +66,7 @@ void __init riscv_v_setup_ctx_cache(void)
>  #endif
>  }
>  
> -static bool insn_is_vector(u32 insn_buf)
> +bool insn_is_vector(u32 insn_buf)
>  {
>  	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
>  	u32 width, csr;
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
