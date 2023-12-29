Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0884BC46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 00:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Dl3jccHL4h2fpIYnCVeVUzotlweN+hXYTIUaUbpUR+4=; b=0xLoTbM12ZJR975waaT/cW/tL9
	FheYwDAsZA0JE4pm3wZ/if5cGNmg4fzt+3SmNXtIj+KKs6qvalS4g12hGtyMpC7QlcR0TeCtl94hJ
	b67+YXtwwxWxALhPOsLb9ZPo+CynAe06VtTc70WRbzHIYyMosXbHcWSyXdinmYa5GHctKQa16h6Z/
	V8R9YyWaj9ft8rTULF3p1/zEiLMyN03BNNq7kX8Jx8k4U6P7ylmwFoZ7dRUkS6J0B24UltTEOLw4U
	r6yITJeSYzry0XINLr7We6CJ2ytyHTJv3XynsHtQZjmvPvQSxmv6L//3RiQi0j0c6Z9o5QlaJQ9Nv
	Advxvpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ0Xx-00HZlK-23;
	Fri, 29 Dec 2023 00:16:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ0Xs-00HZjS-1S
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 00:16:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d3e84fded7so32721115ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 16:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703808971; x=1704413771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCCWg3zCfFlDDxfkxeDJPjn4BouEaEsgkuf/xE9DZn0=;
        b=BE/G8H4DLCYUzd9WMerXDhFGnA3ZA1tEc7VUXHIxtv+uQVWwgosPhtd0KhqxJvQYgr
         IGtN8EpzSbgSNJxzIUtms/17+jRwZexJx47xXPFQ5kUS8rSqhyBv+y5nf4LHlji4tltM
         jdns5Zws5kxMv8bRhshHws7idxLzYudvQN3j+OaiotNBJQrtXE9pB6zOOm6y7bSa2sNT
         HmeGyc+ux2EaIrZKnKVLBmR7yKl4odgVBLSV2+bkhNQRDt1Bfdqheok1skkWs1q/BQ0T
         qxMtVCr4eEMQp419BYH9sep2cfSNcuzpVJH6kiXFubGNffQ/d4TNBVRvEFEkivTUfDnl
         ovzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703808971; x=1704413771;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCCWg3zCfFlDDxfkxeDJPjn4BouEaEsgkuf/xE9DZn0=;
        b=ksdsqLZIoZMQSTIFAQ/ZHALz9Fg+Dz4j7uRLo6RtnwDSd2F5wPuZlE7NmHCs5lEifY
         6LatXdFAbcLrWp+Tk9M61sSLtHaRqZ26Sjce4GpbnwG1itg844K4XYnXEukKtjJA0jwW
         cFb5zBqpx+/Y2Z4KaXyrFLu1AucqN9NqwiRAJ7Ejmewkx3P3cyRbzx3Ow8NQ4sgyz3TT
         nhGv+3UdPqPX9UoRFuD/qcFTYnTT+GYEwH8iuJfACnfYwiyzEq4vpFVf2Z3EC4h/wkjj
         h8eYSc34dwnRspLLIioMXS2NMVDvwYDYDMdyVghc95NtwvcyDIMNEwZxotr/B1HMxsJ/
         JAig==
X-Gm-Message-State: AOJu0Yzs4AgRxGf/Sk4BQvCsKnBlGE4OQgu5Prjc1EkJaAUVnfFm6Ae5
	JGTWAka7JPH69iMq4nB2U9N2BLmx++y9Pw==
X-Google-Smtp-Source: AGHT+IE6TOg1Zt1mvSgMf96HO7o2qmmvFcOdRJ6N4O6lR8m94TX1vHCfBbyS6w2+EV/hbSI1cmgXrg==
X-Received: by 2002:a17:902:d548:b0:1d4:4c00:1c3f with SMTP id z8-20020a170902d54800b001d44c001c3fmr4934861plf.83.1703808971116;
        Thu, 28 Dec 2023 16:16:11 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902aa8900b001c407fac227sm14508873plr.41.2023.12.28.16.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 16:16:09 -0800 (PST)
Date: Thu, 28 Dec 2023 16:16:09 -0800 (PST)
X-Google-Original-Date: Thu, 28 Dec 2023 16:15:56 PST (-0800)
Subject: Re: [PATCH v4 03/13] RISC-V: paravirt: Implement steal-time support
In-Reply-To: <20231220160012.40184-18-ajones@ventanamicro.com>
CC: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
  virtualization@lists.linux-foundation.org, anup@brainfault.org, atishp@atishpatra.org, pbonzini@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu,
  guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-d9c62544-f8d3-438f-819a-58ebc65a3242@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_161612_496639_B0E426DB 
X-CRM114-Status: GOOD (  31.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Dec 2023 08:00:16 PST (-0800), ajones@ventanamicro.com wrote:
> When the SBI STA extension exists we can use it to implement
> paravirt steal-time support. Fill in the empty pv-time functions
> with an SBI STA implementation and add the Kconfig knobs allowing
> it to be enabled.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig           | 19 +++++++++++
>  arch/riscv/kernel/paravirt.c | 63 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 79 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 95a2a06acc6a..b99fd8129edf 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -724,6 +724,25 @@ config COMPAT
>
>  	  If you want to execute 32-bit userspace applications, say Y.
>
> +config PARAVIRT
> +	bool "Enable paravirtualization code"
> +	depends on RISCV_SBI
> +	help
> +	  This changes the kernel so it can modify itself when it is run
> +	  under a hypervisor, potentially improving performance significantly
> +	  over full virtualization.
> +
> +config PARAVIRT_TIME_ACCOUNTING
> +	bool "Paravirtual steal time accounting"
> +	depends on PARAVIRT
> +	help
> +	  Select this option to enable fine granularity task steal time
> +	  accounting. Time spent executing other tasks in parallel with
> +	  the current vCPU is discounted from the vCPU power. To account for
> +	  that, there can be a small performance impact.
> +
> +	  If in doubt, say N here.
> +
>  config RELOCATABLE
>  	bool "Build a relocatable kernel"
>  	depends on MMU && 64BIT && !XIP_KERNEL
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> index 080c95d2a295..574733b2bbea 100644
> --- a/arch/riscv/kernel/paravirt.c
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -6,12 +6,21 @@
>  #define pr_fmt(fmt) "riscv-pv: " fmt
>
>  #include <linux/cpuhotplug.h>
> +#include <linux/compiler.h>
> +#include <linux/errno.h>
>  #include <linux/init.h>
>  #include <linux/jump_label.h>
> +#include <linux/kconfig.h>
> +#include <linux/kernel.h>
> +#include <linux/percpu-defs.h>
>  #include <linux/printk.h>
>  #include <linux/static_call.h>
>  #include <linux/types.h>
>
> +#include <asm/barrier.h>
> +#include <asm/page.h>
> +#include <asm/sbi.h>
> +
>  struct static_key paravirt_steal_enabled;
>  struct static_key paravirt_steal_rq_enabled;
>
> @@ -31,24 +40,72 @@ static int __init parse_no_stealacc(char *arg)
>
>  early_param("no-steal-acc", parse_no_stealacc);
>
> +DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
> +
>  static bool __init has_pv_steal_clock(void)
>  {
> +	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
> +	    sbi_probe_extension(SBI_EXT_STA) > 0) {
> +		pr_info("SBI STA extension detected\n");
> +		return true;
> +	}
> +
>  	return false;
>  }
>
> -static int pv_time_cpu_online(unsigned int cpu)
> +static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
> +					unsigned long flags)
>  {
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
> +			lo, hi, flags, 0, 0, 0);
> +	if (ret.error) {
> +		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
> +			pr_warn("Failed to disable steal-time shmem");
> +		else
> +			pr_warn("Failed to set steal-time shmem");
> +		return sbi_err_map_linux_errno(ret.error);
> +	}
> +
>  	return 0;
>  }
>
> +static int pv_time_cpu_online(unsigned int cpu)
> +{
> +	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
> +	phys_addr_t pa = __pa(st);
> +	unsigned long lo = (unsigned long)pa;
> +	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
> +
> +	return sbi_sta_steal_time_set_shmem(lo, hi, 0);
> +}
> +
>  static int pv_time_cpu_down_prepare(unsigned int cpu)
>  {
> -	return 0;
> +	return sbi_sta_steal_time_set_shmem(SBI_STA_SHMEM_DISABLE,
> +					    SBI_STA_SHMEM_DISABLE, 0);
>  }
>
>  static u64 pv_time_steal_clock(int cpu)
>  {
> -	return 0;
> +	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
> +	u32 sequence;
> +	u64 steal;
> +
> +	/*
> +	 * Check the sequence field before and after reading the steal
> +	 * field. Repeat the read if it is different or odd.
> +	 */
> +	do {
> +		sequence = READ_ONCE(st->sequence);
> +		virt_rmb();
> +		steal = READ_ONCE(st->steal);
> +		virt_rmb();
> +	} while ((le32_to_cpu(sequence) & 1) ||
> +		 sequence != READ_ONCE(st->sequence));
> +
> +	return le64_to_cpu(steal);
>  }
>
>  int __init pv_time_init(void)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
