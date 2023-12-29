Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22559C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vrEgAc6wxOEn4REZ8G2olsT11nSmD/n81R0UDl7c8Ok=; b=EwuRuOPxsJi+EQyMJgWy4Gb/RV
	pYROoeMTmqSwlWvi7m9SeBGmcdi2sR+4h5X2FVr1/SuZJJ3Ze9Askg5Qz/jmA+ONaZAI1Wd8KhejU
	Xoi0g2RmC5JeRQ25kzp+KdC7pOdEERf2ffZ3iwebZERM/wXPmlps4Ze/a/UGjbAC7VxZM969AUakC
	mn5Nmyk4GBaULRHzD4GS2f1g7KgtLeAO3z3gBKki4+eL5kxWsZmRwnP/vzE1Dr8LWeq8fzpBcs0Ke
	qB2KRASiHXsH+kuhqtEJjsio0p0Scjc5DnicFINbWzVIl2RZe18/Ugie/LF8lkSfIADqWN1/IGS5l
	c7rCz9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ0Xr-00HZjR-2F;
	Fri, 29 Dec 2023 00:16:11 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ0Xo-00HZiB-1B
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 00:16:10 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c21e185df5so4897361a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 16:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703808966; x=1704413766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaiBamP1ZrgGVOA1x9thdMvEUyAh0k54wDBeqiex9tQ=;
        b=pi63Zvfmlj5w3wPMIBFft6tLdBeviQlmI7zDTpaBTSuRWhTyu5bBenHtKqhEdOPIsJ
         r4zi9qf9phWukb+ibftgVhVAnVVhCbyFy7FbLy931hzqkFpSDjMRyUgFREVWk0Q4zIfG
         OnlpKw6JeLFQj5NUp7zqtCs+5x00227tTs206gfFLLfa8zTDhIncYZ5LrO+TG82y7KXP
         5eZ6FCiWrQmHHM44LYtDcjGC1/+g6QvwP96z5XfFZvGPlv3gg+W+vXfBuVR1EMTQmxtH
         EI6SLv7GIz5t/OgPw2r8QKiHApvLyz9HRAwc8+Qwn5KInek3gCqfV0f4Oc/6OQO4dtbV
         FNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703808966; x=1704413766;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaiBamP1ZrgGVOA1x9thdMvEUyAh0k54wDBeqiex9tQ=;
        b=swIder2bZgtar5RLlgETfP5a8kKekwkq6MnlbfG3Sq7ZlRi51bKTdUViGdupApiLDf
         g1Z3Yui3UbkuLIS0qFokp0SGggE/x3yMRa110ffhQtIb4onzh0SuNQpL6Hni+HvSXPrv
         ZSoyg45SVMFpTh1HtkpgfmDhFuBaZTLu00DAZDyJ5ALRk2o5ZADYliJT5aUPzFkPgdfM
         OzrxLHO1eZCyU8LuIdKLbK1RO8vxneJzSR1KEShFvKXuyhqid6j8gcjRUsCMGLFyViI9
         YSP71zOjg57I9OqG1Qp1h/zx1psIMQHGCQpV6bJYn8mNU910rj3BRbB0NkCur6BImN4p
         UBPA==
X-Gm-Message-State: AOJu0YyZ6W21G8t2cO8uoBliyik90nIvMhFAbqSuFkW9mO4MuqM3h2HB
	IFNVoaUsLxpsrR5eXo80Q+edyHxu3DoCQA==
X-Google-Smtp-Source: AGHT+IGrTD0Zn7Buyuyy772W+6XimqueZcV/zBY8TrLV4vlEhpDWdr/f0anYg4OhyHZcJ1Kwr9C+Cg==
X-Received: by 2002:a05:6a21:819f:b0:196:14d4:cfe8 with SMTP id pd31-20020a056a21819f00b0019614d4cfe8mr4003643pzb.26.1703808966135;
        Thu, 28 Dec 2023 16:16:06 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a00230a00b006da1d9f4adcsm1935153pfh.127.2023.12.28.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 16:16:04 -0800 (PST)
Date: Thu, 28 Dec 2023 16:16:04 -0800 (PST)
X-Google-Original-Date: Thu, 28 Dec 2023 16:15:29 PST (-0800)
Subject: Re: [PATCH v4 01/13] RISC-V: paravirt: Add skeleton for pv-time support
In-Reply-To: <20231220160012.40184-16-ajones@ventanamicro.com>
CC: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
  virtualization@lists.linux-foundation.org, anup@brainfault.org, atishp@atishpatra.org, pbonzini@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu,
  guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-e6ad083f-423f-48c7-842f-bc2477c5a843@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_161608_662985_52E8AC3A 
X-CRM114-Status: GOOD (  26.57  )
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

On Wed, 20 Dec 2023 08:00:14 PST (-0800), ajones@ventanamicro.com wrote:
> Add the files and functions needed to support paravirt time on
> RISC-V. Also include the common code needed for the first
> application of pv-time, which is steal-time. In the next
> patches we'll complete the functions to fully enable steal-time
> support.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +-
>  arch/riscv/include/asm/paravirt.h             | 28 +++++++
>  arch/riscv/include/asm/paravirt_api_clock.h   |  1 +
>  arch/riscv/kernel/Makefile                    |  1 +
>  arch/riscv/kernel/paravirt.c                  | 77 +++++++++++++++++++
>  arch/riscv/kernel/time.c                      |  3 +
>  6 files changed, 113 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/include/asm/paravirt.h
>  create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
>  create mode 100644 arch/riscv/kernel/paravirt.c
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 65731b060e3f..a0d9259e4857 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3985,9 +3985,9 @@
>  			vulnerability. System may allow data leaks with this
>  			option.
>
> -	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES] Disable paravirtualized
> -			steal time accounting. steal time is computed, but
> -			won't influence scheduler behaviour
> +	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES,RISCV] Disable
> +			paravirtualized steal time accounting. steal time is
> +			computed, but won't influence scheduler behaviour
>
>  	nosync		[HW,M68K] Disables sync negotiation for all devices.
>
> diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
> new file mode 100644
> index 000000000000..c0abde70fc2c
> --- /dev/null
> +++ b/arch/riscv/include/asm/paravirt.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_PARAVIRT_H
> +#define _ASM_RISCV_PARAVIRT_H
> +
> +#ifdef CONFIG_PARAVIRT
> +#include <linux/static_call_types.h>
> +
> +struct static_key;
> +extern struct static_key paravirt_steal_enabled;
> +extern struct static_key paravirt_steal_rq_enabled;
> +
> +u64 dummy_steal_clock(int cpu);
> +
> +DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> +
> +static inline u64 paravirt_steal_clock(int cpu)
> +{
> +	return static_call(pv_steal_clock)(cpu);
> +}
> +
> +int __init pv_time_init(void);
> +
> +#else
> +
> +#define pv_time_init() do {} while (0)
> +
> +#endif /* CONFIG_PARAVIRT */
> +#endif /* _ASM_RISCV_PARAVIRT_H */
> diff --git a/arch/riscv/include/asm/paravirt_api_clock.h b/arch/riscv/include/asm/paravirt_api_clock.h
> new file mode 100644
> index 000000000000..65ac7cee0dad
> --- /dev/null
> +++ b/arch/riscv/include/asm/paravirt_api_clock.h
> @@ -0,0 +1 @@
> +#include <asm/paravirt.h>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fee22a3d1b53..807c2bde1f83 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_SMP)		+= sbi-ipi.o
>  obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>  endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
> +obj-$(CONFIG_PARAVIRT)		+= paravirt.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
>  obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
>  obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> new file mode 100644
> index 000000000000..080c95d2a295
> --- /dev/null
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + */
> +
> +#define pr_fmt(fmt) "riscv-pv: " fmt
> +
> +#include <linux/cpuhotplug.h>
> +#include <linux/init.h>
> +#include <linux/jump_label.h>
> +#include <linux/printk.h>
> +#include <linux/static_call.h>
> +#include <linux/types.h>
> +
> +struct static_key paravirt_steal_enabled;
> +struct static_key paravirt_steal_rq_enabled;
> +
> +static u64 native_steal_clock(int cpu)
> +{
> +	return 0;
> +}
> +
> +DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
> +
> +static bool steal_acc = true;
> +static int __init parse_no_stealacc(char *arg)
> +{
> +	steal_acc = false;
> +	return 0;
> +}
> +
> +early_param("no-steal-acc", parse_no_stealacc);
> +
> +static bool __init has_pv_steal_clock(void)
> +{
> +	return false;
> +}
> +
> +static int pv_time_cpu_online(unsigned int cpu)
> +{
> +	return 0;
> +}
> +
> +static int pv_time_cpu_down_prepare(unsigned int cpu)
> +{
> +	return 0;
> +}
> +
> +static u64 pv_time_steal_clock(int cpu)
> +{
> +	return 0;
> +}
> +
> +int __init pv_time_init(void)
> +{
> +	int ret;
> +
> +	if (!has_pv_steal_clock())
> +		return 0;
> +
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				"riscv/pv_time:online",
> +				pv_time_cpu_online,
> +				pv_time_cpu_down_prepare);
> +	if (ret < 0)
> +		return ret;
> +
> +	static_call_update(pv_steal_clock, pv_time_steal_clock);
> +
> +	static_key_slow_inc(&paravirt_steal_enabled);
> +	if (steal_acc)
> +		static_key_slow_inc(&paravirt_steal_rq_enabled);
> +
> +	pr_info("Computing paravirt steal-time\n");
> +
> +	return 0;
> +}
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 23641e82a9df..ba3477197789 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -12,6 +12,7 @@
>  #include <asm/sbi.h>
>  #include <asm/processor.h>
>  #include <asm/timex.h>
> +#include <asm/paravirt.h>
>
>  unsigned long riscv_timebase __ro_after_init;
>  EXPORT_SYMBOL_GPL(riscv_timebase);
> @@ -45,4 +46,6 @@ void __init time_init(void)
>  	timer_probe();
>
>  	tick_setup_hrtimer_broadcast();
> +
> +	pv_time_init();
>  }

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
