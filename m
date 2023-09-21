Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7481FCD493F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 02:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjETWDUf4OV2eLDbJqH3rOq1ofRqIEFHoMyNg5CiRgg=; b=LQI8oVBQY5QcYt
	BaU8BB7wHZqeMSkK5KtTVXGzdIdE+AyRgjbiX2ZbC3LwxFfkrv0Ju7lAO5vlF+/rnLy2bmYRNapJK
	fMwyyAWkcqoFvZYK/zY7ojzNbo9sqj/8VSnG4fjeCBsE8SFwVjtncEzfXyIBFZBwYVQWONMjG0P5t
	/gj41e5ofRrSbEGRLKp6Xu22sacSD+fHJKB0QRIQrWmk/3m6MzttONsyKdcGqkEmgQo0xbg14aE8D
	6BdeiAJ5tbzJFRfJZ5pT7gWrJ7a30QZLRO+LaZMARlm1BNmeFtk1aLTN1ALQSkCi/foZjorkRQ6z7
	ULtGJirXeczIdZSj4VlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9pF-004pqH-26;
	Thu, 21 Sep 2023 02:53:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9pC-004pp9-0y
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 02:53:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BAEC861D2E;
	Thu, 21 Sep 2023 02:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56205C433C8;
	Thu, 21 Sep 2023 02:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695264830;
	bh=Z53nW9NVEINsQF+Xv7N0qzXqlSzeqJRa8MVP4nSofGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTvxXYqAItHUYWFISaVxZbUK4E3YhnPd5PN08xCpdmlAxDjlXGlHaE1y9koEeo6HA
	 4gV39JouEQE/oHk0YMrYOqTE1J9AVXgj76cmxQzhOVqxoGcLTPzXK/U/eNhRyrbTNa
	 hEAwvcwPg+L1pYT30rJz6TmMGPuG/umBdNOITQiXNjP1aoj1KvNQ05UrR9pzGkJhh/
	 9w5r2By56LK2fpQDev0238VcBSDiyHd4hdOqE9tpj+bnuJKe0flyV9aqtJQINFyRIN
	 pOL3Ggev2A9gWy/frwmwFJzVcDiiDuunD4vlLvRZdFw/egKzKFkTKNUoeVpi6GYV+Z
	 SzN+5pJpMkJJw==
Date: Thu, 21 Sep 2023 10:41:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
Message-ID: <ZQutYtStGGVxI36X@xhacker>
References: <20230920193801.3035093-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920193801.3035093-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_195354_426630_68E99676 
X-CRM114-Status: GOOD (  28.48  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 20, 2023 at 12:38:01PM -0700, Evan Green wrote:
> Probing for misaligned access speed takes about 0.06 seconds. On a
> system with 64 cores, doing this in smp_callin() means it's done
> serially, extending boot time by 3.8 seconds. That's a lot of boot time.
> 
> Instead of measuring each CPU serially, let's do the measurements on
> all CPUs in parallel. If we disable preemption on all CPUs, the
> jiffies stop ticking, so we can do this in stages of 1) everybody
> except core 0, then 2) core 0.
> 
> The measurement call in smp_callin() stays around, but is now
> conditionalized to only run if a new CPU shows up after the round of
> in-parallel measurements has run. The goal is to have the measurement
> call not run during boot or suspend/resume, but only on a hotplug
> addition.
> 
> Reported-by: Jisheng Zhang <jszhang@kernel.org>
> Closes: https://lore.kernel.org/all/mhng-9359993d-6872-4134-83ce-c97debe1cf9a@palmer-ri-x1c9/T/#mae9b8f40016f9df428829d33360144dc5026bcbf
> Fixes: 584ea6564bca ("RISC-V: Probe for unaligned access speed")
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Tested-by: Andrew Jones <ajones@ventanamicro.com>

Tested-by: Jisheng Zhang <jszhang@kernel.org>

> 
> ---
> 
> Changes in v2:
>  - Removed new global, used system_state == SYSTEM_RUNNING instead
>    (Jisheng)
>  - Added tags
> 
>  arch/riscv/include/asm/cpufeature.h |  2 +-
>  arch/riscv/kernel/cpufeature.c      | 22 +++++++++++++++++-----
>  arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
>  3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index d0345bd659c9..b139796392d0 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -30,6 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
>  
> -void check_unaligned_access(int cpu);
> +int check_unaligned_access(void *unused);
>  
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1cfbba65d11a..40bb854fcb96 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -556,8 +556,9 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
>  
> -void check_unaligned_access(int cpu)
> +int check_unaligned_access(void *unused)
>  {
> +	int cpu = smp_processor_id();
>  	u64 start_cycles, end_cycles;
>  	u64 word_cycles;
>  	u64 byte_cycles;
> @@ -571,7 +572,7 @@ void check_unaligned_access(int cpu)
>  	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
>  	if (!page) {
>  		pr_warn("Can't alloc pages to measure memcpy performance");
> -		return;
> +		return 0;
>  	}
>  
>  	/* Make an unaligned destination buffer. */
> @@ -643,15 +644,26 @@ void check_unaligned_access(int cpu)
>  
>  out:
>  	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
> +	return 0;
> +}
> +
> +static void check_unaligned_access_nonboot_cpu(void *param)
> +{
> +	if (smp_processor_id() != 0)
> +		check_unaligned_access(param);
>  }
>  
> -static int check_unaligned_access_boot_cpu(void)
> +static int check_unaligned_access_all_cpus(void)
>  {
> -	check_unaligned_access(0);
> +	/* Check everybody except 0, who stays behind to tend jiffies. */
> +	on_each_cpu(check_unaligned_access_nonboot_cpu, NULL, 1);
> +
> +	/* Check core 0. */
> +	smp_call_on_cpu(0, check_unaligned_access, NULL, true);
>  	return 0;
>  }
>  
> -arch_initcall(check_unaligned_access_boot_cpu);
> +arch_initcall(check_unaligned_access_all_cpus);
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 1b8da4e40a4d..a014955b8699 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -27,6 +27,7 @@
>  #include <linux/sched/mm.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/cpufeature.h>
> +#include <asm/hwprobe.h>
>  #include <asm/irq.h>
>  #include <asm/mmu_context.h>
>  #include <asm/numa.h>
> @@ -246,7 +247,15 @@ asmlinkage __visible void smp_callin(void)
>  
>  	numa_add_cpu(curr_cpuid);
>  	set_cpu_online(curr_cpuid, 1);
> -	check_unaligned_access(curr_cpuid);
> +
> +	/*
> +	 * Boot-time misaligned access speed measurements are done in parallel
> +	 * in an initcall. Only measure here for hotplug.
> +	 */
> +	if ((system_state == SYSTEM_RUNNING) &&
> +	    (per_cpu(misaligned_access_speed, curr_cpuid) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)) {
> +		check_unaligned_access(NULL);
> +	}
>  
>  	if (has_vector()) {
>  		if (riscv_v_setup_vsize())
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
