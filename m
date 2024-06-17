Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45ADC27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3FXn+TRMjhEYOJ12COq9Oeq7ahFQoGkMZoQQp0dEPM=; b=X4jPXhMOUg8Snj
	LRwe4sRIG9WASb9c2BpSRew1fOdO3coZKXT0ta8TF2CNVMeGxMtULLQxLh8x2F9wEPLbg15DLBSvY
	xz8qxf0tjCkx+XEtrJY8mdvuDPYtKbzj4MAlPaPTGC5wz0ZtPy8EBUnWZuJyfzFqILGXJqTvAzipL
	I5rc/9Ei4PdvjR6etJeYiH3+Z0k9Y5oaWAWxmAiOeJCGa5xnbcb7/ty/gDMBtUhCQgJHKU1MbHK2Y
	aTlWzJEvXhm5j1W9bazAs9hwEWVGTzI9e3xYn1pAULm1WSQ14O8EoWEBdn+Cl2VQ1cQoRgKWvQ5Rl
	MLLNzidz79tt0uNDQGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFO0-0000000BliR-0CwO;
	Mon, 17 Jun 2024 16:39:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFNx-0000000Blg7-0Tgn
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 16:39:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f6e183f084so33115715ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718642350; x=1719247150; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/guJgjMmvm88TQojFr9PM2+SHiuZ3V2yf0/zXe6OnQ=;
        b=TV1ZlkJzjinAGGbw88zyS/SxatsoBSy7tYKlEdGkODILTcX4qR6e2Eu5jHZN9yuzPZ
         2SAswfQJuietD4s0HY8fCt5llfPfzCTcuE2rB+eVnnjkHA4cAwZB31tfVmYlI44u21Ld
         KpzDs0NHOQ4KhS3rwPaxsQ5NX/HPgspJxcfo3Aj6KfK5NlcB/FJNxtobB/a6NynDTkt9
         w6P+ePSd3OHjfSgB37sWqFGXZ4ezOwLt6PT7/x3aF3YuHeEUJstrAFJJtOB+7hcNLxuc
         0WdCtPCO1o4sosyksPyRkMW9jDOyhiGy4+oqLjRsiMKgdIX8jRrZJ9DKaFgg4otqZOP/
         jMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642350; x=1719247150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/guJgjMmvm88TQojFr9PM2+SHiuZ3V2yf0/zXe6OnQ=;
        b=xIoV78b86Q52lalMQP5DPlAinKX8RyYqYd7OvgT5FnFgQVan07upTQDbgZS8BdSmtO
         O9j7cuP3Q8id9vz+/13DwESjLkgbEPfuoiEwLwJpeyGRVsKkL5i5gzoNa62Ydf6/0o2E
         bErb+FDZtGeXdYaLmqhUxRBr0zHwe8+W75NZ5myTO95J/z7S/Z/nzki2QPbXkZmE/jGo
         AcWyfqBU21M41ulZC5cIQCpZ7D3owKd+aAzz/9e17EnPMsMhu26ZbD/YbQhibhO38sBL
         ONVZJ77mEpyE2uhxza/PvOYMF5m0NUP07mD5xpRnVVyazyfFjGx40NjTDGOkGjNZ+2Fy
         E7uw==
X-Gm-Message-State: AOJu0Yx6jC1PARMT+bRT+2Ab9H77+ys073zg4eY9cIQSgJsOdYA+ZBYJ
	TMXh1+hyVfEUn8+1/1oTqsTkZBlprjnNEC/g3dSN5iyWSxoUTsVmXgpkKsvMfpY=
X-Google-Smtp-Source: AGHT+IE/KXI6dC7j1ecdUm6U3mF2ysiSWgat7LZpc7Br7jyvU+fDNB5/6AsDsaQk2VPhUlI1n2PIHA==
X-Received: by 2002:a17:903:2348:b0:1f8:67e4:3977 with SMTP id d9443c01a7336-1f867e453b5mr94483165ad.34.1718642349808;
        Mon, 17 Jun 2024 09:39:09 -0700 (PDT)
Received: from ghost ([2600:8802:5706:712f:3cfa:a56a:77aa:2aff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee8067sm81294675ad.178.2024.06.17.09.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:39:09 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:39:05 -0700
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
Message-ID: <ZnBmqYoxIU6E/d+p@ghost>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613191616.2101821-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_093913_193798_7B0816FF 
X-CRM114-Status: GOOD (  37.22  )
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

These files only need to be compiled if either CONFIG_RISCV_MISALIGNED
or CONFIG_RISCV_VECTOR_MISALIGNED is selected. Can you refactor this
code to replace CONFIG_RISCV_MISALIGNED with
CONFIG_RISCV_SCALAR_MISALIGNED and then have
CONFIG_RISCV_SCALAR_MISALIGNED and CONFIG_RISCV_VECTOR_MISALIGNED select
CONFIG_RISCV_MISALIGNED in the Kconfig?

- Charlie

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
