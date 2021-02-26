Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF33C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 13:16:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B303C6186A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 13:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B303C6186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Hz289VHw1i9bDSihiCPOr1WODo3k5y8fjjVPo+Xrh4=; b=Ag0xmbL/0kV4XXBvpZHy4eH6t
	oxKwQLJmg+CWGE7PufXsfoflYGmWcUFoGYpHOeIMxMb/3mX7WjIaZwhs8sx005ucNv2r9G3dfJFuH
	CaQ4tMXBfH7sSZqzYCihj2xhNB5jsNvPwiMPmEWwJ5oUja4YpIVnAS+xu7qePglrajBWt5WCqmmZr
	1xadsUKWvCWwrasnbka0kwEowzMzYhgOF+wHgGQ2fJJRBmR0JF1SULjrJR0FGoAwq53NlKD/JrkZ4
	7wc0PuodnFwP76NylS0WW4uidlTafVWPHpbT1F7RjR15Kn53jzjAC4EY82yIex7iJar+yMn3POcZL
	2sFs47vkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFcyx-0000up-LT; Fri, 26 Feb 2021 13:16:35 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFcyq-0000tD-Jv; Fri, 26 Feb 2021 13:16:32 +0000
X-Originating-IP: 81.185.174.212
Received: from [192.168.43.237] (212.174.185.81.rev.sfr.net [81.185.174.212])
 (Authenticated sender: alex@ghiti.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DA1281BF203;
 Fri, 26 Feb 2021 13:16:15 +0000 (UTC)
Subject: Re: [RFC PATCH 1/8] RISC-V: Enable CPU_IDLE drivers
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
References: <20210221093758.210981-1-anup.patel@wdc.com>
 <20210221093758.210981-2-anup.patel@wdc.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <3a6e2af7-934d-078f-4e19-d4241809e7fb@ghiti.fr>
Date: Fri, 26 Feb 2021 08:16:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210221093758.210981-2-anup.patel@wdc.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_081628_854865_388545B3 
X-CRM114-Status: GOOD (  25.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, linux-riscv@lists.infradead.org,
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

Le 2/21/21 =E0 4:37 AM, Anup Patel a =E9crit=A0:
> We force select CPU_PM and provide asm/cpuidle.h so that we can
> use CPU IDLE drivers for Linux RISC-V kernel.
> =

> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>   arch/riscv/Kconfig                |  7 +++++++
>   arch/riscv/configs/defconfig      |  7 +++----
>   arch/riscv/configs/rv32_defconfig |  4 ++--
>   arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
>   arch/riscv/kernel/process.c       |  3 ++-
>   5 files changed, 38 insertions(+), 7 deletions(-)
>   create mode 100644 arch/riscv/include/asm/cpuidle.h
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index fe6862b06ead..4901200b6b6c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -37,6 +37,7 @@ config RISCV
>   	select CLONE_BACKWARDS
>   	select CLINT_TIMER if !MMU
>   	select COMMON_CLK
> +	select CPU_PM if CPU_IDLE
>   	select EDAC_SUPPORT
>   	select GENERIC_ARCH_TOPOLOGY if SMP
>   	select GENERIC_ATOMIC64 if !64BIT
> @@ -430,4 +431,10 @@ source "kernel/power/Kconfig"
>   =

>   endmenu
>   =

> +menu "CPU Power Management"
> +
> +source "drivers/cpuidle/Kconfig"
> +
> +endmenu
> +
>   source "drivers/firmware/Kconfig"
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 6c0625aa96c7..dc4927c0e44b 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -13,11 +13,13 @@ CONFIG_USER_NS=3Dy
>   CONFIG_CHECKPOINT_RESTORE=3Dy
>   CONFIG_BLK_DEV_INITRD=3Dy
>   CONFIG_EXPERT=3Dy
> +# CONFIG_SYSFS_SYSCALL is not set
>   CONFIG_BPF_SYSCALL=3Dy
>   CONFIG_SOC_SIFIVE=3Dy
>   CONFIG_SOC_VIRT=3Dy
>   CONFIG_SMP=3Dy
>   CONFIG_HOTPLUG_CPU=3Dy
> +CONFIG_CPU_IDLE=3Dy
>   CONFIG_JUMP_LABEL=3Dy
>   CONFIG_MODULES=3Dy
>   CONFIG_MODULE_UNLOAD=3Dy
> @@ -65,10 +67,9 @@ CONFIG_HW_RANDOM=3Dy
>   CONFIG_HW_RANDOM_VIRTIO=3Dy
>   CONFIG_SPI=3Dy
>   CONFIG_SPI_SIFIVE=3Dy
> +# CONFIG_PTP_1588_CLOCK is not set
>   CONFIG_GPIOLIB=3Dy
>   CONFIG_GPIO_SIFIVE=3Dy
> -# CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_POWER_RESET=3Dy

Why do you remove this config ?

>   CONFIG_DRM=3Dy
>   CONFIG_DRM_RADEON=3Dy
>   CONFIG_DRM_VIRTIO_GPU=3Dy
> @@ -132,5 +133,3 @@ CONFIG_DEBUG_BLOCK_EXT_DEVT=3Dy
>   # CONFIG_FTRACE is not set
>   # CONFIG_RUNTIME_TESTING_MENU is not set
>   CONFIG_MEMTEST=3Dy
> -# CONFIG_SYSFS_SYSCALL is not set
> -CONFIG_EFI=3Dy

And this is one too ? If those removals are intentional, maybe you can =

add something about that in the commit description ?

> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_=
defconfig
> index 8dd02b842fef..332e43a4a2c3 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -13,12 +13,14 @@ CONFIG_USER_NS=3Dy
>   CONFIG_CHECKPOINT_RESTORE=3Dy
>   CONFIG_BLK_DEV_INITRD=3Dy
>   CONFIG_EXPERT=3Dy
> +# CONFIG_SYSFS_SYSCALL is not set
>   CONFIG_BPF_SYSCALL=3Dy
>   CONFIG_SOC_SIFIVE=3Dy
>   CONFIG_SOC_VIRT=3Dy
>   CONFIG_ARCH_RV32I=3Dy
>   CONFIG_SMP=3Dy
>   CONFIG_HOTPLUG_CPU=3Dy
> +CONFIG_CPU_IDLE=3Dy
>   CONFIG_JUMP_LABEL=3Dy
>   CONFIG_MODULES=3Dy
>   CONFIG_MODULE_UNLOAD=3Dy
> @@ -67,7 +69,6 @@ CONFIG_HW_RANDOM_VIRTIO=3Dy
>   CONFIG_SPI=3Dy
>   CONFIG_SPI_SIFIVE=3Dy
>   # CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_POWER_RESET=3Dy
>   CONFIG_DRM=3Dy
>   CONFIG_DRM_RADEON=3Dy
>   CONFIG_DRM_VIRTIO_GPU=3Dy
> @@ -131,4 +132,3 @@ CONFIG_DEBUG_BLOCK_EXT_DEVT=3Dy
>   # CONFIG_FTRACE is not set
>   # CONFIG_RUNTIME_TESTING_MENU is not set
>   CONFIG_MEMTEST=3Dy
> -# CONFIG_SYSFS_SYSCALL is not set
> diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cp=
uidle.h
> new file mode 100644
> index 000000000000..1042d790e446
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
> +	 * IO/MEM access are completed prior

accessES ?

> +	 * to enter WFI.
> +	 */
> +	mb();
> +	wait_for_interrupt();
> +}
> +
> +#endif
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index dd5f985b1f40..b5b51fd26624 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -21,6 +21,7 @@
>   #include <asm/string.h>
>   #include <asm/switch_to.h>
>   #include <asm/thread_info.h>
> +#include <asm/cpuidle.h>
>   =

>   register unsigned long gp_in_global __asm__("gp");
>   =

> @@ -35,7 +36,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
>   =

>   void arch_cpu_idle(void)
>   {
> -	wait_for_interrupt();
> +	cpu_do_idle();
>   	raw_local_irq_enable();
>   }
>   =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
