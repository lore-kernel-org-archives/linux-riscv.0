Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBEEC43461
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 22:09:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B97208DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 22:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EF49GqUk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="lCvAw4eD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B97208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=MaT3hMJJPthUsNT7E3UDRN2YfTZRtJrcGDi824eySn8=; b=EF49GqUkkI+E2beQVytepAjWL
	91zkVHwjhWUmPUJ0YLgFDKBRcVOwIQgMJUk1U5tIVc32YzAtArPKsscl34wugB1ALF0kB4gZXEZ/0
	65hAUx9KP2Rv5Qd411ZarJK886wZPuoNcIgjqm6DJet2BkLuz1WItAnOXnlo7VXI82Q0J+EQZH7Dv
	05lVktPezhONq/rTO4YVMQAxoz2r/DDkNmHui13oHzRdOzcUHDCHJrv1uwqFZirNGowhciN5Vg2Ux
	8ybsn1Si9HWT2J/AtVErznRRetJya3a/u8s23Zv7lPdOz3+ydvqDCS3cUYoJRYZAKtM0aT9m7GBls
	1eAaHhQyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHweQ-0008SY-VX; Mon, 14 Sep 2020 22:08:43 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHweO-0008Ql-FO
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 22:08:41 +0000
Received: by mail-pl1-x641.google.com with SMTP id e4so224698pln.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 15:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ACcaZ7zDQbpB1KvqQAlAsDR8BmSbNCNG05Rdb2jou+A=;
 b=lCvAw4eDj179Tcmto2DAiULdnxNCHmni70ucCSNAkKQJeImpWuVV7trWDtTapcOL0y
 KTt02PXDk0Au6TvOlAuldSlt9I3qPkCJkfqZhXSZyeVyT15k6Ex1n82Vmau+v9SDB+uG
 9GI5GKvau/1++P8IY2KzG+Y4at908FcZ6wwYI/JQ+SpYwO3aUyqFnUwUgF4u3pr6qFYz
 jeEeDvmfoCTnlpH6hoH5jI/UOc32jb2DOZxJt4qZbzgujR3gc7Dlybaoh6Ib2H8r7drH
 oov5zRXnBEk/lj8ZWI7bw8MGX+rE+xKN1L4R5eoi8Ga3LKlK2P52ZiPCbrjVtyShIayj
 x5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ACcaZ7zDQbpB1KvqQAlAsDR8BmSbNCNG05Rdb2jou+A=;
 b=sWRtyYSnOWSWPm0lgsOjWvBekjEeXkgA22mMk1Y0LoLkcLgtNwAk09DkpEjPeXvZmn
 Xpos2l4SBFwt1SAv/+cVOiYeVBx6WYomM1jEYp22fl5RZUuC5jXAd5mfDbhsi8sxigBC
 eD/h0BsMPJ+H9QQFCwoV36QlMOrPx2ae34UG8zUKOXwZQyp/racGhjDeV0SxXS3r6Vzq
 qBT3zRCpRn7ZRXKjMfVhLqeTclx8aANPvwLiILZ+AehJYdqPe6qCVf3h7jkI1vc6nyAv
 8NZY9luBw+2twPFD8ceK+TSKramXV5nrCU02It4rm2ljWA5ilE6Pz1bY/EBd2Nz1rcHs
 1ZWg==
X-Gm-Message-State: AOAM530nqtkKPalyjECQn3rOFDk37xYZ0D/2LD6J4G7/nRUYJxHrOiXw
 9ustljuDLlvPFbFlEbFzZCRO82IbFJTyU5Az
X-Google-Smtp-Source: ABdhPJw1Q+4tj8NPap6ki/0ZVLo0cdZL3ydf1phEcI0gjrnyfRFwo0oiBuEUPiYZMvklRbg2odmQlw==
X-Received: by 2002:a17:90b:408b:: with SMTP id
 jb11mr1369784pjb.164.1600121316292; 
 Mon, 14 Sep 2020 15:08:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l9sm10244020pgg.29.2020.09.14.15.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:08:35 -0700 (PDT)
Date: Mon, 14 Sep 2020 15:08:35 -0700 (PDT)
X-Google-Original-Date: Mon, 14 Sep 2020 15:08:31 PDT (-0700)
Subject: Re: [PATCH] cpuidle: add riscv cpuidle driver
In-Reply-To: <1600048323-2964-1-git-send-email-liush@allwinnertech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liush@allwinnertech.com
Message-ID: <mhng-e743b908-36de-4226-832d-bc5acbbfd81b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_180840_625502_BAD5518E 
X-CRM114-Status: GOOD (  31.20  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, aou@eecs.berkeley.edu,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, liush@allwinnertech.com,
 Anup Patel <Anup.Patel@wdc.com>, rjw@rjwysocki.net, wangkefeng.wang@huawei.com,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, kernel@esmil.dk
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 13 Sep 2020 18:52:03 PDT (-0700), liush@allwinnertech.com wrote:
> This patch adds a cpuidle driver for systems based RISCV architecture.
> This patch supports state WFI. Other states will be supported in the
> future.
>
> Signed-off-by: liush <liush@allwinnertech.com>
> ---
>  arch/riscv/Kconfig               |  7 +++++
>  arch/riscv/include/asm/cpuidle.h |  7 +++++
>  arch/riscv/kernel/Makefile       |  1 +
>  arch/riscv/kernel/cpuidle.c      |  8 ++++++
>  drivers/cpuidle/Kconfig          |  5 ++++
>  drivers/cpuidle/Kconfig.riscv    | 11 ++++++++
>  drivers/cpuidle/Makefile         |  4 +++
>  drivers/cpuidle/cpuidle-riscv.c  | 55 ++++++++++++++++++++++++++++++++++++++++
>  8 files changed, 98 insertions(+)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>  create mode 100644 arch/riscv/kernel/cpuidle.c
>  create mode 100644 drivers/cpuidle/Kconfig.riscv
>  create mode 100644 drivers/cpuidle/cpuidle-riscv.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index df18372..c7ddb9d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -86,6 +86,7 @@ config RISCV
>  	select SPARSE_IRQ
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
> +	select CPU_IDLE
>
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT
> @@ -407,6 +408,12 @@ config BUILTIN_DTB
>  	depends on RISCV_M_MODE
>  	depends on OF
>
> +menu "CPU Power Management"
> +
> +source "drivers/cpuidle/Kconfig"
> +
> +endmenu
> +
>  menu "Power management options"
>
>  source "kernel/power/Kconfig"
> diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> new file mode 100644
> index 00000000..2599d2f
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpuidle.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __RISCV_CPUIDLE_H
> +#define __RISCV_CPUIDLE_H
> +
> +extern void cpu_do_idle(void);
> +
> +#endif
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index dc93710..396ba9c 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -29,6 +29,7 @@ obj-y	+= riscv_ksyms.o
>  obj-y	+= stacktrace.o
>  obj-y	+= cacheinfo.o
>  obj-y	+= patch.o
> +obj-y	+= cpuidle.o

Presumably we want this to be a Kconfig option, if only to avoid excess size on
the smaller systems?

>  obj-$(CONFIG_MMU) += vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
> diff --git a/arch/riscv/kernel/cpuidle.c b/arch/riscv/kernel/cpuidle.c
> new file mode 100644
> index 00000000..a3289e7
> --- /dev/null
> +++ b/arch/riscv/kernel/cpuidle.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <asm/cpuidle.h>
> +
> +void cpu_do_idle(void)
> +{
> +	__asm__ __volatile__ ("wfi");
> +

We have wait_for_interrupt() that does this already, but it's one line so it
doesn't really matter.  Either way, there's an extra newline here.

Additionally, we have arch_cpu_idle() which is calling cpu_do_idle() on other
platforms.  Presumably we should be doing something similar, under the
assumption that we will eventually have cpu_do_idle() hook into CPU idle
drivers here?

> +}
> diff --git a/drivers/cpuidle/Kconfig b/drivers/cpuidle/Kconfig
> index c0aeedd..f6be0fd 100644
> --- a/drivers/cpuidle/Kconfig
> +++ b/drivers/cpuidle/Kconfig
> @@ -62,6 +62,11 @@ depends on PPC
>  source "drivers/cpuidle/Kconfig.powerpc"
>  endmenu
>
> +menu "RISCV CPU Idle Drivers"
> +depends on RISCV
> +source "drivers/cpuidle/Kconfig.riscv"
> +endmenu
> +
>  config HALTPOLL_CPUIDLE
>  	tristate "Halt poll cpuidle driver"
>  	depends on X86 && KVM_GUEST
> diff --git a/drivers/cpuidle/Kconfig.riscv b/drivers/cpuidle/Kconfig.riscv
> new file mode 100644
> index 00000000..e86d36b
> --- /dev/null
> +++ b/drivers/cpuidle/Kconfig.riscv
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# RISCV CPU Idle drivers
> +#
> +config RISCV_CPUIDLE
> +        bool "Generic RISCV CPU idle Driver"
> +        select DT_IDLE_STATES
> +	select CPU_IDLE_MULTIPLE_DRIVERS

Looks like there's some space/tab issues here.  IIRC checkpatch will catch this
sort of thing.

> +        help
> +          Select this option to enable generic cpuidle driver for RISCV.
> +	  Now only support C0 State.
> diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
> index 26bbc5e..4c83c4e 100644
> --- a/drivers/cpuidle/Makefile
> +++ b/drivers/cpuidle/Makefile
> @@ -34,3 +34,7 @@ obj-$(CONFIG_MIPS_CPS_CPUIDLE)		+= cpuidle-cps.o
>  # POWERPC drivers
>  obj-$(CONFIG_PSERIES_CPUIDLE)		+= cpuidle-pseries.o
>  obj-$(CONFIG_POWERNV_CPUIDLE)		+= cpuidle-powernv.o
> +
> +###############################################################################
> +# RISCV drivers
> +obj-$(CONFIG_RISCV_CPUIDLE)		+= cpuidle-riscv.o
> diff --git a/drivers/cpuidle/cpuidle-riscv.c b/drivers/cpuidle/cpuidle-riscv.c
> new file mode 100644
> index 00000000..5dddcfa
> --- /dev/null
> +++ b/drivers/cpuidle/cpuidle-riscv.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V CPU idle driver.
> + *
> + * Copyright (C) 2020-2022 Allwinner Ltd
> + *
> + * Based on code - driver/cpuidle/cpuidle-at91.c
> + *
> + */
> +#include <linux/cpuidle.h>
> +#include <linux/cpumask.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <asm/cpuidle.h>
> +
> +#define MAX_IDLE_STATES	1
> +
> +/* TODO: Implement deeper idle states */
> +static int riscv_low_level_suspend_enter(int state)
> +{
> +	return 0;

As far as I can tell, this driver just doesn't do anything?  Assuming that's
the case, it's probably best to just drop everything but cpu_do_idle() until we
have something to exercise this.

> +}
> +
> +/* Actual code that puts the SoC in different idle states */
> +static int riscv_enter_idle(struct cpuidle_device *dev,
> +			struct cpuidle_driver *drv,
> +			       int index)
> +{
> +	return CPU_PM_CPU_IDLE_ENTER_PARAM(riscv_low_level_suspend_enter,
> +					   index, 0);
> +}
> +
> +static struct cpuidle_driver riscv_idle_driver = {
> +	.name			= "riscv_idle",
> +	.owner			= THIS_MODULE,
> +	.states[0]		= {
> +		.enter			= riscv_enter_idle,
> +		.exit_latency		= 1,
> +		.target_residency	= 1,
> +		.name			= "WFI",
> +		.desc			= "RISCV WFI",
> +	},
> +	.state_count = MAX_IDLE_STATES,
> +};
> +
> +static int __init riscv_cpuidle_init(void)
> +{
> +	return cpuidle_register(&riscv_idle_driver, NULL);
> +}
> +
> +device_initcall(riscv_cpuidle_init);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
