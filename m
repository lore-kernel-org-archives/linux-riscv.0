Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7771C27C55
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 23:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SE9/sBU5TUjT3HM7rjULuKespOjulxkJ+KDgXkZ9Fzg=; b=F2zs3GJ6uwa+rO
	buQxaYfBzQ+OOUjVKoRipuKNbxXsp12ZIpJD2agIYOuOLDi0MeGlPFB/1WelxE972fPCHu4PT/N3w
	hztalOrJ5XDHoYS+oBq3ckUE6pNwNGhHeM7bwQo3aFRIWj9uA4MZRA1wZ9CNGuwngfIS8w4nVQILt
	oUSG700Dsuj6P3odPzm7s8tDh9/+CpYLpyWIy++b7crLKqMZqzq9sNNWjy90toVZ+Vm2KzT6fiaP3
	0KgUu0DY4ncUYDvurLE+RUAq1ajzhXI+sq/FJVaTo6PNyJe2Yjhm/00/LQQnZ02oFG0sdCBc3VQBh
	fK4I7GK8IlMJGoWkOlRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFMIz-0000000BeZB-34jh;
	Thu, 06 Jun 2024 23:14:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFMIw-0000000BeYL-3q7N
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 23:14:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70255d5ddc7so1313527b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 16:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717715638; x=1718320438; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFORmSYxBFghq+sxU2O43udLz9imyeDUrV9JdpKSDhY=;
        b=Hn9/sfwji3oMfmSh0LkWSik6jVGRac9Nnn0fv8BGN4L0DgkhSZGT7bhrh7uxLLAZVY
         P2Hj7iDzoUgq3sJo696jlRkOTy3BIlQkLbGEOEdMT4jYeDsOB5adqrARa8p8lTs1kw3+
         zSKdTpXXoSutpbibQLNHO8J7JONPNxo2GL0MzEP5zELqrLLUjd1apQjQdQSdE1rLkQNL
         R7Z5yHl5rCVohzQve2A4Cms/OCQR35Ldbuk38mftGE7IJlqnTbSev7rAOVgTKzFZ4HhV
         9jogEbh1aCOJ/ujmmlLsu3qSdTJQzudUNeaVu6Fdf4wvl58W0GR92idSECCdtHsBpN5h
         fEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717715638; x=1718320438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFORmSYxBFghq+sxU2O43udLz9imyeDUrV9JdpKSDhY=;
        b=QaeWrnQ+PQtJy5o1rlPHg4OKIS++BuQVkT/ONhkQFwBrAwyGf7R7dFNk2S8dQw4haa
         j29pcjYsaS3FsrY5oaN5v0GPVerxn2Ty1H4OXyhuAYElj5JqIqjOnTxXdjhDHMeLPFSy
         QFJ9eYpEbDxPS1XlOLPjdj0sDJvi8MQ21j9MHQLGArPKbNB/U5fwhaeVps8xPrY7KuOX
         moo7gH1WcdZscXh2akA3F5haS4vrA8mky8WcwuXEtdBZA5aP7v5hzu5ZgU4SQyIHGu/W
         HNADD4YmHYA286I/mHF2NPWh1oe+k1JCrbwSrK+xgj2/R0K/XMZBrTCiMbm71toy2e/W
         +AOA==
X-Gm-Message-State: AOJu0YxgCvv/MryblSe99GEJIhHCN2OyZgYLlvI/SMMQUIqsJkCklgRz
	KcYiSndgo5SCpxijImbM8rLH7TYJD5C3M4567XFrgSxx442TSuoARrbgT3Oc9GE=
X-Google-Smtp-Source: AGHT+IFDH+66F4mlC+oUl4nfayFVD+4cGREjkxu6VGNSHGT86pjVghsHzAgq2Aj1qKbnXa/hFLZ2Wg==
X-Received: by 2002:a05:6a00:1496:b0:703:fe48:8857 with SMTP id d2e1a72fcca58-7040c74d81dmr947920b3a.32.1717715637581;
        Thu, 06 Jun 2024 16:13:57 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd4d95ebsm1624077b3a.145.2024.06.06.16.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 16:13:57 -0700 (PDT)
Date: Thu, 6 Jun 2024 16:13:54 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] RISC-V: Report vector unaligned accesse speed hwprobe
Message-ID: <ZmJCsgCWoR7WoAdP@ghost>
References: <20240606183215.416829-1-jesse@rivosinc.com>
 <20240606183215.416829-3-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606183215.416829-3-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_161358_991876_94EE65E3 
X-CRM114-Status: GOOD (  35.64  )
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

On Thu, Jun 06, 2024 at 02:32:15PM -0400, Jesse Taube wrote:
> Detect if vector misaligned accesses are faster or slower than
> equivalent vector byte accesses. This is useful for usermode to know
> whether vector byte accesses or vector misaligned accesses have a better
> bandwidth for operations like memcpy.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/kernel/Makefile                 |   3 +
>  arch/riscv/kernel/copy-unaligned.h         |   5 +
>  arch/riscv/kernel/unaligned_access_speed.c | 127 ++++++++++++++++++++-
>  arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++++
>  4 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 81d94a8ee10f..61cec0688559 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -65,6 +65,9 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
>  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
>  obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
>  obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
> +ifeq ($(CONFIG_RISCV_ISA_V), y)
> +obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= vec-copy-unaligned.o
> +endif
>  
>  obj-$(CONFIG_FPU)		+= fpu.o
>  obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
> diff --git a/arch/riscv/kernel/copy-unaligned.h b/arch/riscv/kernel/copy-unaligned.h
> index e3d70d35b708..88be070085cb 100644
> --- a/arch/riscv/kernel/copy-unaligned.h
> +++ b/arch/riscv/kernel/copy-unaligned.h
> @@ -10,4 +10,9 @@
>  void __riscv_copy_words_unaligned(void *dst, const void *src, size_t size);
>  void __riscv_copy_bytes_unaligned(void *dst, const void *src, size_t size);
>  
> +#ifdef CONFIG_RISCV_ISA_V
> +void __riscv_copy_vec_words_unaligned(void *dst, const void *src, size_t size);
> +void __riscv_copy_vec_bytes_unaligned(void *dst, const void *src, size_t size);
> +#endif
> +
>  #endif /* __RISCV_KERNEL_COPY_UNALIGNED_H */
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 92a84239beaa..4e6f753b659a 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -8,9 +8,11 @@
>  #include <linux/jump_label.h>
>  #include <linux/mm.h>
>  #include <linux/smp.h>
> +#include <linux/kthread.h>
>  #include <linux/types.h>
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
> +#include <asm/vector.h>
>  
>  #include "copy-unaligned.h"
>  
> @@ -128,6 +130,107 @@ static void check_unaligned_access_nonboot_cpu(void *param)
>  		check_unaligned_access(pages[cpu]);
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_V
> +static void check_vector_unaligned_access(struct work_struct *unused)
> +{
> +	int cpu = smp_processor_id();
> +	u64 start_cycles, end_cycles;
> +	u64 word_cycles;
> +	u64 byte_cycles;
> +	int ratio;
> +	unsigned long start_jiffies, now;
> +	struct page *page;
> +	void *dst;
> +	void *src;
> +	long speed = RISCV_HWPROBE_VEC_MISALIGNED_SLOW;
> +
> +	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_VEC_MISALIGNED_SUPPORTED)
> +		return;
> +
> +	page = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
> +	if (!page) {
> +		pr_warn("Allocation failure, not measuring vector misaligned performance\n");
> +		return;
> +	}
> +
> +	/* Make an unaligned destination buffer. */
> +	dst = (void *)((unsigned long)page_address(page) | 0x1);
> +	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
> +	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
> +	src += 2;
> +	word_cycles = -1ULL;
> +
> +	/* Do a warmup. */
> +	local_irq_enable();
> +	kernel_vector_begin();
> +	__riscv_copy_vec_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
> +
> +	start_jiffies = jiffies;
> +	while ((now = jiffies) == start_jiffies)
> +		cpu_relax();
> +
> +	/*
> +	 * For a fixed amount of time, repeatedly try the function, and take
> +	 * the best time in cycles as the measurement.
> +	 */
> +	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
> +		start_cycles = get_cycles64();
> +		/* Ensure the CSR read can't reorder WRT to the copy. */
> +		mb();
> +		__riscv_copy_vec_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
> +		/* Ensure the copy ends before the end time is snapped. */
> +		mb();
> +		end_cycles = get_cycles64();
> +		if ((end_cycles - start_cycles) < word_cycles)
> +			word_cycles = end_cycles - start_cycles;
> +	}
> +
> +	byte_cycles = -1ULL;
> +	__riscv_copy_vec_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
> +	start_jiffies = jiffies;
> +	while ((now = jiffies) == start_jiffies)
> +		cpu_relax();
> +
> +	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
> +		start_cycles = get_cycles64();
> +		mb();
> +		__riscv_copy_vec_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
> +		mb();
> +		end_cycles = get_cycles64();
> +		if ((end_cycles - start_cycles) < byte_cycles)
> +			byte_cycles = end_cycles - start_cycles;
> +	}
> +
> +	kernel_vector_end();
> +
> +	/* Don't divide by zero. */
> +	if (!word_cycles || !byte_cycles) {
> +		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned vector access speed\n",
> +			cpu);
> +
> +		return;
> +	}
> +
> +	if (word_cycles < byte_cycles)
> +		speed = RISCV_HWPROBE_VEC_MISALIGNED_FAST;
> +
> +	ratio = div_u64((byte_cycles * 100), word_cycles);
> +	pr_info("cpu%d: Ratio of vector byte access time to vector unaligned word access is %d.%02d, unaligned accesses are %s\n",
> +		cpu,
> +		ratio / 100,
> +		ratio % 100,
> +		(speed ==  RISCV_HWPROBE_VEC_MISALIGNED_FAST) ? "fast" : "slow");
> +
> +	per_cpu(vector_misaligned_access, cpu) = speed;
> +}
> +
> +static int riscv_online_cpu_vec(unsigned int cpu)
> +{
> +	check_vector_unaligned_access(NULL);
> +	return 0;
> +}
> +#endif
> +
>  DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
>  
>  static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
> @@ -261,11 +364,33 @@ static int check_unaligned_access_speed_all_cpus(void)
>  	return 0;
>  }
>  
> +/* Measure unaligned access speed on all CPUs present at boot in parallel. */
> +static int vec_check_unaligned_access_speed_all_cpus(void *unused)
> +{
> +	schedule_on_each_cpu(check_vector_unaligned_access);
> +
> +	/*
> +	 * Setup hotplug callbacks for any new CPUs that come online or go
> +	 * offline.
> +	 */
> +	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> +				  riscv_online_cpu_vec, NULL);
> +
> +	return 0;
> +}
> +
>  static int check_unaligned_access_all_cpus(void)
>  {
>  	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
>  
> -	check_vector_unaligned_access_all_cpus();
> +#ifdef CONFIG_RISCV_ISA_V
> +	bool all_cpus_vec_supported = check_vector_unaligned_access_all_cpus();
> +
> +	if (all_cpus_vec_supported) {
> +		kthread_run(vec_check_unaligned_access_speed_all_cpus,

I think it might be better if this is combined with
check_unaligned_access_speed_all_cpus() by leveraging the function
check_unaligned_access_nonboot_cpu(). The idea behind that is that right
now we have both the vector unaligned accesses and the scalar unaligned
access tests being kicked off onto each cpu separately which requires 2
IPIs per hart, but if we run them back to back on a given hart the IPI
only needs to happen once per hart. Having the methods of checking
vector unaligned access and scalar unaligned access be standardized
would be nice as well.

The scalar misaligned access also keeps one cpu back to keep consistency
in timing so I would imagine that would be important to do here as well.

- Charlie

> +			    NULL, "thebestthread");
> +	}
> +#endif
>  
>  	if (!all_cpus_emulated)
>  		return check_unaligned_access_speed_all_cpus();
> diff --git a/arch/riscv/kernel/vec-copy-unaligned.S b/arch/riscv/kernel/vec-copy-unaligned.S
> new file mode 100644
> index 000000000000..11522ec8f0a8
> --- /dev/null
> +++ b/arch/riscv/kernel/vec-copy-unaligned.S
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2024 Rivos Inc. */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <linux/args.h>
> +
> +	.text
> +
> +#define WORD_EEW 64
> +
> +#define WORD_SEW CONCATENATE(e, WORD_EEW)
> +#define VEC_L CONCATENATE(vle, WORD_EEW).v
> +#define VEC_S CONCATENATE(vle, WORD_EEW).v
> +
> +/* void __riscv_copy_vec_words_unaligned(void *, const void *, size_t) */
> +/* Performs a memcpy without aligning buffers, using word loads and stores. */
> +/* Note: The size is truncated to a multiple of WORD_EEW */
> +SYM_FUNC_START(__riscv_copy_vec_words_unaligned)
> +	andi  a4, a2, ~(WORD_EEW-1)
> +	beqz  a4, 2f
> +	add   a3, a1, a4
> +	.option push
> +	.option arch, +v
> +1:
> +	vsetivli t0, 8, WORD_SEW, m8, ta, ma
> +	VEC_L v0, (a1)
> +	VEC_S v0, (a0)
> +	addi  a0, a0, WORD_EEW
> +	addi  a1, a1, WORD_EEW
> +	bltu  a1, a3, 1b
> +
> +2:
> +	.option pop
> +	ret
> +SYM_FUNC_END(__riscv_copy_vec_words_unaligned)
> +
> +/* void __riscv_copy_vec_bytes_unaligned(void *, const void *, size_t) */
> +/* Performs a memcpy without aligning buffers, using only byte accesses. */
> +/* Note: The size is truncated to a multiple of 8 */
> +SYM_FUNC_START(__riscv_copy_vec_bytes_unaligned)
> +	andi a4, a2, ~(8-1)
> +	beqz a4, 2f
> +	add  a3, a1, a4
> +	.option push
> +	.option arch, +v
> +1:
> +	vsetivli t0, 8, e8, m8, ta, ma
> +	vle8.v v0, (a1)
> +	vse8.v v0, (a0)
> +	addi a0, a0, 8
> +	addi a1, a1, 8
> +	bltu a1, a3, 1b
> +
> +2:
> +	.option pop
> +	ret
> +SYM_FUNC_END(__riscv_copy_vec_bytes_unaligned)
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
