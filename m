Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2C9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 22:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13F9F60EB4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 22:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13F9F60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIVcIYoUdomxauEvqdtLIL2keOtjfLfvygBRcEi5bbU=; b=eyjiTxFTSvGrN2
	E9uI7Z3JKXxMCgXcpEkZOb9jIMnFhoxv5Vrk2xWGX9yq/Celxb8XreLYMXle5sT8U9J0cuqGBJkXv
	oreeLqbXXN7rPlAQe4CQlCGS1YdNS4t+2udbF1hrWzdYv2MC8DHr9o5BJMDPloqsgt7laEoxEf5HU
	a3N7SB7V/Wtr0ntxdeIZk/bqWIt5VwC1qjslEa60JnHIEmKoS7+R402TwKc6oh/vrXRHdxtUFXz7a
	oqRq3DOpnlJbvVltd0AEoKWcFHu0ztx+u9lYbhr49Rq880ZeKwIzBGC4eLnweS9lLkXHQIlgpSU9u
	t8/MCgdadiNONYUnnWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma3Pf-00Aq8Y-Fr; Mon, 11 Oct 2021 22:04:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma3Pc-00Aq7Z-Li; Mon, 11 Oct 2021 22:04:50 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ma3PM-00016Q-QT; Tue, 12 Oct 2021 00:04:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v8 1/8] RISC-V: Enable CPU_IDLE drivers
Date: Tue, 12 Oct 2021 00:04:31 +0200
Message-ID: <30695639.mNO2d7px6N@diego>
In-Reply-To: <20211011081820.1135261-2-anup.patel@wdc.com>
References: <20211011081820.1135261-1-anup.patel@wdc.com>
 <20211011081820.1135261-2-anup.patel@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_150448_751946_75035C81 
X-CRM114-Status: GOOD (  25.56  )
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

Hi Anup,

Am Montag, 11. Oktober 2021, 10:18:13 CEST schrieb Anup Patel:
> We force select CPU_PM and provide asm/cpuidle.h so that we can
> use CPU IDLE drivers for Linux RISC-V kernel.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/Kconfig                |  7 +++++++
>  arch/riscv/configs/defconfig      |  1 +
>  arch/riscv/configs/rv32_defconfig |  1 +
>  arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
>  arch/riscv/kernel/process.c       |  3 ++-
>  5 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8de2afb460f7..d02f1f5a2431 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -46,6 +46,7 @@ config RISCV
>  	select CLONE_BACKWARDS
>  	select CLINT_TIMER if !MMU
>  	select COMMON_CLK
> +	select CPU_PM if CPU_IDLE
>  	select EDAC_SUPPORT
>  	select GENERIC_ARCH_TOPOLOGY if SMP
>  	select GENERIC_ATOMIC64 if !64BIT
> @@ -564,5 +565,11 @@ source "kernel/power/Kconfig"
>  
>  endmenu
>  
> +menu "CPU Power Management"
> +
> +source "drivers/cpuidle/Kconfig"
> +
> +endmenu
> +
>  source "arch/riscv/kvm/Kconfig"
>  source "drivers/firmware/Kconfig"
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index be21f54e9b91..39b4c32e7997 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=y
>  CONFIG_JUMP_LABEL=y

This doesn't apply.

In the history of your tree that you referenced in the cover-letter
I found "RISC-V: Enable KVM for RV64 and RV32"
with that nice "DO NOT UPSTREAM !!!!!" message in caps in it ;-)

This of course makes this not apply on the main riscv tree.

So you might want to base your series on top of a clean "for-next"
branch of Palmer's tree instead of collecting other stuff below it.

Same for rv32_defconfig below.


Heiko


> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index ad01f50c98f1..fed827c82a9e 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=y
>  CONFIG_JUMP_LABEL=y
> diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> new file mode 100644
> index 000000000000..71fdc607d4bc
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpuidle.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2021 Allwinner Ltd
> + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef _ASM_RISCV_CPUIDLE_H
> +#define _ASM_RISCV_CPUIDLE_H
> +
> +#include <asm/barrier.h>
> +#include <asm/processor.h>
> +
> +static inline void cpu_do_idle(void)
> +{
> +	/*
> +	 * Add mb() here to ensure that all
> +	 * IO/MEM accesses are completed prior
> +	 * to entering WFI.
> +	 */
> +	mb();
> +	wait_for_interrupt();
> +}
> +
> +#endif
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..504b496787aa 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -23,6 +23,7 @@
>  #include <asm/string.h>
>  #include <asm/switch_to.h>
>  #include <asm/thread_info.h>
> +#include <asm/cpuidle.h>
>  
>  register unsigned long gp_in_global __asm__("gp");
>  
> @@ -37,7 +38,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
>  
>  void arch_cpu_idle(void)
>  {
> -	wait_for_interrupt();
> +	cpu_do_idle();
>  	raw_local_irq_enable();
>  }
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
