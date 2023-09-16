Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC870CD37B5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIFUwXu2IDYx8TtbE68scumGlyvJigE2fAh1Fq5fsNc=; b=XMJMkjFhxVLob/
	kLfcsrqUrQOgr2kAkAw+LIlbn75+1bzgafwmrk6emAaxGIuGNKFxD0ztmd+y6HMG7+lOhpT1RYj9g
	+3B3JaMKatrPzU9o92b7HcCzOzmsgJEUGtzBYcTzkrQVfbRRRts5mA7J9k2u3ZiPG8nxhywvpMCR0
	OoajA5+ZxRLw85ueB27/zUMCZAlZ6q49D2h7KSFRKlryMnJipauf/iAziG/Ycw97PEcl4xNlc8xYq
	EbUBr959quUT6EYoQVrrXy2qoeTLgRiFxyWjcHTx9Jw4QGSFFnwy8MdDKdxlcJsGb+U5XzkLX2Iec
	nNfDuR2c5QAmSF53z9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhP42-00C3OM-0K;
	Sat, 16 Sep 2023 06:45:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhP3z-00C3NW-0h
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 06:45:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso2721144f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694846752; x=1695451552; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MIDeAWdahUMHOh7TW9BYceBIpM4QDz+5Y/okXYT71D4=;
        b=Bcm5WMZF0CHyIaGsYKOiHaaCHfBPjRgLwagoup1bYFLD++d43vfbhokzevxXYbI12O
         hv047rrIN5sw8sAnOzBW7+Hr5fjD6+SafNQcFYEjvVwf8bcWxhaMyjN/tT2+8LGsmlzM
         axv+qD/SxodNRPVlJRBzTVbS8P4FBrtOnVnBh0NhVZCM6XKszDlMkUYlM7Ef8hlFf2As
         riU9nYhkU8Mbj9TA+3qPWbv90ixKZ2IZ1SxW6kXkaRonOyBIEOzHTOTmCC0jx6Ee10Ku
         0sy6oFUgoGisu1Birvz9JgMPzDqLqFUf2mwegcmGV13Tdyi8cP1O4bRNGl4nltxhWuzQ
         nrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694846752; x=1695451552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIDeAWdahUMHOh7TW9BYceBIpM4QDz+5Y/okXYT71D4=;
        b=i2VY5mA6ADcUTKw2/EqrnV36PDBTUroc0+3er38gBWn4KHjC0dZ0h1nvqhzrXP7xYF
         Te209m/J9QdKSlqWn/tQtVsP+h5fpkXBKCahrl6MG4I8JrWSxDlK2Bh6flD5lzryj6OV
         HuhTHxtklcZmyUlN87wVrvIyNGak0F/fjuxvyEtaZbeDGXndFceEHNHM0GGtOpbRdZlG
         NPiND9f10MvLBAtoO26pdbZOVlpndFyghhmBHJc8IbLeDbaG3rj4s2ZLmBRFdTaNb00b
         BTKhjoAKyCoLBALqEPV+JGkL5OPGzldLae6OElq8Hlsz48h17Pti7xhCd8DXZ9P2AUUd
         UrEw==
X-Gm-Message-State: AOJu0Yw6ICTmnK4dDgnYL/nJnxZDsYtYFFaDAenwBdcNj/tAZiZV9WW2
	hIwLqHK/tFBLDCHsCX6ioEslXw==
X-Google-Smtp-Source: AGHT+IF9Pu6RAzmT+sR/UCnGMu/RRFT0lIKVr5isE7jkDP2hkunpqOL7QDrFb6yjnQSOzvEIEuEdkg==
X-Received: by 2002:a5d:5965:0:b0:313:f61c:42ab with SMTP id e37-20020a5d5965000000b00313f61c42abmr3019654wri.56.1694846752519;
        Fri, 15 Sep 2023 23:45:52 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h4-20020a056000000400b00317909f9985sm6277045wrx.113.2023.09.15.23.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 23:45:51 -0700 (PDT)
Date: Sat, 16 Sep 2023 08:45:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Probe misaligned access speed in parallel
Message-ID: <20230916-ab31c90dd56c99d36d5fce6c@orel>
References: <20230915184904.1976183-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915184904.1976183-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_234555_261680_034CD842 
X-CRM114-Status: GOOD (  32.66  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 15, 2023 at 11:49:03AM -0700, Evan Green wrote:
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

Yay! I had just recently tested suspend/resume and wanted to report the
probe as an issue, but I hadn't gotten around to it. This patch resolves
the issue, so

Test-by: Andrew Jones <ajones@ventanamicro.com>

> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> 
> ---
> 
> Jisheng, I didn't add your Tested-by tag since the patch evolved from
> the one you tested. Hopefully this one brings you the same result.
> 
> ---
>  arch/riscv/include/asm/cpufeature.h |  3 ++-
>  arch/riscv/kernel/cpufeature.c      | 28 +++++++++++++++++++++++-----
>  arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
>  3 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index d0345bd659c9..19e7817eba10 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -30,6 +30,7 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
>  
> -void check_unaligned_access(int cpu);
> +extern bool misaligned_speed_measured;

Do we need this new state or could we just always check the boot cpu's
state to get the same information?

 per_cpu(misaligned_access_speed, 0) != RISCV_HWPROBE_MISALIGNED_UNKNOWN

> +int check_unaligned_access(void *unused);
>  
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1cfbba65d11a..8eb36e1dfb95 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -42,6 +42,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
>  /* Performance information */
>  DEFINE_PER_CPU(long, misaligned_access_speed);
>  
> +/* Boot-time in-parallel unaligned access measurement has occurred. */
> +bool misaligned_speed_measured;
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -556,8 +559,9 @@ unsigned long riscv_get_elf_hwcap(void)
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
> @@ -571,7 +575,7 @@ void check_unaligned_access(int cpu)
>  	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
>  	if (!page) {
>  		pr_warn("Can't alloc pages to measure memcpy performance");
> -		return;
> +		return 0;
>  	}
>  
>  	/* Make an unaligned destination buffer. */
> @@ -643,15 +647,29 @@ void check_unaligned_access(int cpu)
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
> +
> +	/* Boot-time measurements are complete. */
> +	misaligned_speed_measured = true;
>  	return 0;
>  }
>  
> -arch_initcall(check_unaligned_access_boot_cpu);
> +arch_initcall(check_unaligned_access_all_cpus);
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 1b8da4e40a4d..39322ae20a75 100644
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
> +	if (misaligned_speed_measured &&
> +	    (per_cpu(misaligned_access_speed, curr_cpuid) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)) {
> +		check_unaligned_access(NULL);
> +	}
>  
>  	if (has_vector()) {
>  		if (riscv_v_setup_vsize())
> -- 
> 2.34.1
>

Besides my reluctance to add another global variable, this looks good to
me.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
