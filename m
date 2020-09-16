Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C23FC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 15:24:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EAB2078D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 15:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y6wrSYfd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EAB2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:MIME-Version:Subject:
	Message-ID:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L/Q9yYIYxR0KEdMYjIhGenTAW1OoAi8RhQ+1ZqdGhIE=; b=y6wrSYfdzRxg6d6Crywe6KXEj
	Rn7+h7HJs+uhQ0CcBtHitql++3y17VC5Jz4SLWqTpqjCUvTuo1hKxqEUodJ5vy1+SykqBnSNviKYp
	XOEfISsiubp+SR93GpAE8IpM2UAYWvms2SsCXvzsvD21/m3Dry8zqqtHvzfdkWvSP572WJTohl4tR
	alORCs2S220ejhfy6GPtKAniATZBPJlBQZ8svMkTcHYyIlZjJ19qabkYM7naHlq5LqIBPEMl6+z6h
	FJr5Xxh7Gy1TGZugUwi30kmjxy4wRzT/Q21V9waIFqZDvQt3Lqv19ta7UlAty4CY2+b1U4qTFXONS
	jaiIrQsRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvlk-0004Hg-Ia; Thu, 17 Sep 2020 15:24:20 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIMEc-00040p-A0
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 01:27:48 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07386801|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0709241-0.000172201-0.928904;
 FP=11851636359211976435|3|2|12|0|-1|-1|-1; HT=e02c03307;
 MF=liush@allwinnertech.com; NM=1; PH=DW; RN=14; RT=14; SR=0;
 TI=W4_5948689_DEFAULT_0AC264F1_1600219605038_o7001c9512; 
Received: from WS-web
 (liush@allwinnertech.com[W4_5948689_DEFAULT_0AC264F1_1600219605038_o7001c9512])
 by ay29a011140100200.et135 at Wed, 16 Sep 2020 09:27:40 +0800
Date: Wed, 16 Sep 2020 09:27:40 +0800
From: "liush" <liush@allwinnertech.com>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
Message-ID: <e7eec7e8-083f-4802-962f-99adc89b28ac.liush@allwinnertech.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIXSBjcHVpZGxlOiBhZGQgcmlzY3YgY3B1aWRsZSBkcml2ZXI=?=
X-Mailer: [Alimail-Mailagent][W4_5948689][DEFAULT][Chrome]
MIME-Version: 1.0
References: <1600048323-2964-1-git-send-email-liush@allwinnertech.com>,
 <mhng-e743b908-36de-4226-832d-bc5acbbfd81b@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-e743b908-36de-4226-832d-bc5acbbfd81b@palmerdabbelt-glaptop1>
x-aliyun-mail-creator: W4_5948689_DEFAULT_MzYTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2zc
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_212746_624990_AF820B8A 
X-CRM114-Status: GOOD (  31.47  )
X-Mailman-Approved-At: Thu, 17 Sep 2020 11:24:17 -0400
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
Reply-To: liush <liush@allwinnertech.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, aou <aou@eecs.berkeley.edu>,
 "daniel.lezcano" <daniel.lezcano@linaro.org>,
 linux-pm <linux-pm@vger.kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 rjw <rjw@rjwysocki.net>, "wangkefeng.wang" <wangkefeng.wang@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 "zong.li" <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel <kernel@esmil.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

> > This patch adds a cpuidle driver for systems based RISCV architecture.
> > This patch supports state WFI. Other states will be supported in the
> > future.
> >
> > Signed-off-by: liush <liush@allwinnertech.com>
> > ---
> >  arch/riscv/Kconfig               |  7 +++++
> >  arch/riscv/include/asm/cpuidle.h |  7 +++++
> >  arch/riscv/kernel/Makefile       |  1 +
> >  arch/riscv/kernel/cpuidle.c      |  8 ++++++
> >  drivers/cpuidle/Kconfig          |  5 ++++
> >  drivers/cpuidle/Kconfig.riscv    | 11 ++++++++
> >  drivers/cpuidle/Makefile         |  4 +++
> >  drivers/cpuidle/cpuidle-riscv.c  | 55 ++++++++++++++++++++++++++++++++++++++++
> >  8 files changed, 98 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/cpuidle.h
> >  create mode 100644 arch/riscv/kernel/cpuidle.c
> >  create mode 100644 drivers/cpuidle/Kconfig.riscv
> >  create mode 100644 drivers/cpuidle/cpuidle-riscv.c
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index df18372..c7ddb9d 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -86,6 +86,7 @@ config RISCV
> >   select SPARSE_IRQ
> >   select SYSCTL_EXCEPTION_TRACE
> >   select THREAD_INFO_IN_TASK
> > + select CPU_IDLE
> >
> >  config ARCH_MMAP_RND_BITS_MIN
> >   default 18 if 64BIT
> > @@ -407,6 +408,12 @@ config BUILTIN_DTB
> >   depends on RISCV_M_MODE
> >   depends on OF
> >
> > +menu "CPU Power Management"
> > +
> > +source "drivers/cpuidle/Kconfig"
> > +
> > +endmenu
> > +
> >  menu "Power management options"
> >
> >  source "kernel/power/Kconfig"
> > diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> > new file mode 100644
> > index 00000000..2599d2f
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/cpuidle.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __RISCV_CPUIDLE_H
> > +#define __RISCV_CPUIDLE_H
> > +
> +extern void cpu_do_idle(void);
> > +
> > +#endif
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index dc93710..396ba9c 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -29,6 +29,7 @@ obj-y += riscv_ksyms.o
> >  obj-y += stacktrace.o
> >  obj-y += cacheinfo.o
> >  obj-y += patch.o
> > +obj-y += cpuidle.o

> Presumably we want this to be a Kconfig option, if only to avoid excess size on
> the smaller systems?

Thank you for your suggestions.
I am considering following Anup's suggestion - delete cpuidle.c and implement 
cpu_do_idle in cpuidle.h.

> >  obj-$(CONFIG_MMU) += vdso.o vdso/
> >
> >  obj-$(CONFIG_RISCV_M_MODE) += traps_misaligned.o
> > diff --git a/arch/riscv/kernel/cpuidle.c b/arch/riscv/kernel/cpuidle.c
> > new file mode 100644
> > index 00000000..a3289e7
> > --- /dev/null
> > +++ b/arch/riscv/kernel/cpuidle.c
> > @@ -0,0 +1,8 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <asm/cpuidle.h>
> > +
> > +void cpu_do_idle(void)
> > +{
> > + __asm__ __volatile__ ("wfi");
> > +

> We have wait_for_interrupt() that does this already, but it's one line so it
> doesn't really matter.  Either way, there's an extra newline here.

Thanks, i'll modify it

> Additionally, we have arch_cpu_idle() which is calling cpu_do_idle() on other
> platforms.  Presumably we should be doing something similar, under the
> assumption that we will eventually have cpu_do_idle() hook into CPU idle
> drivers here?

Based on your comments, I run a test and found that arch_cpu_idle could be executed 
normally without enabling the idle driver.Part of the code of the experiment:
 
+static inline void cpu_do_idle(void)
+{
+       mb();
+       wait_for_interrupt();
+}
 
 void arch_cpu_idle(void)
 {
-       wait_for_interrupt();
+       cpu_do_idle();
        local_irq_enable();
 } 
 
> > +}
> > diff --git a/drivers/cpuidle/Kconfig b/drivers/cpuidle/Kconfig
> > index c0aeedd..f6be0fd 100644
> > --- a/drivers/cpuidle/Kconfig
> > +++ b/drivers/cpuidle/Kconfig
> > @@ -62,6 +62,11 @@ depends on PPC
> >  source "drivers/cpuidle/Kconfig.powerpc"
> >  endmenu
> >
> > +menu "RISCV CPU Idle Drivers"
> > +depends on RISCV
> > +source "drivers/cpuidle/Kconfig.riscv"
> > +endmenu
> > +
> >  config HALTPOLL_CPUIDLE
> >   tristate "Halt poll cpuidle driver"
> >   depends on X86 && KVM_GUEST
> > diff --git a/drivers/cpuidle/Kconfig.riscv b/drivers/cpuidle/Kconfig.riscv
> > new file mode 100644
> > index 00000000..e86d36b
> > --- /dev/null
> > +++ b/drivers/cpuidle/Kconfig.riscv
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# RISCV CPU Idle drivers
> > +#
> > +config RISCV_CPUIDLE
> > +        bool "Generic RISCV CPU idle Driver"
> > +        select DT_IDLE_STATES
> > + select CPU_IDLE_MULTIPLE_DRIVERS

> Looks like there's some space/tab issues here.  IIRC checkpatch will catch this
> sort of thing.

yes, i'll modify it

> > +        help
> > +          Select this option to enable generic cpuidle driver for RISCV.
> > +   Now only support C0 State.
> > diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
> > index 26bbc5e..4c83c4e 100644
> > --- a/drivers/cpuidle/Makefile
> > +++ b/drivers/cpuidle/Makefile
> > @@ -34,3 +34,7 @@ obj-$(CONFIG_MIPS_CPS_CPUIDLE)  += cpuidle-cps.o
> >  # POWERPC drivers
> >  obj-$(CONFIG_PSERIES_CPUIDLE)  += cpuidle-pseries.o
> >  obj-$(CONFIG_POWERNV_CPUIDLE)  += cpuidle-powernv.o
> > +
> > +###############################################################################
> > +# RISCV drivers
> > +obj-$(CONFIG_RISCV_CPUIDLE)  += cpuidle-riscv.o
> > diff --git a/drivers/cpuidle/cpuidle-riscv.c b/drivers/cpuidle/cpuidle-riscv.c
> > new file mode 100644
> > index 00000000..5dddcfa
> > --- /dev/null
> > +++ b/drivers/cpuidle/cpuidle-riscv.c
> > @@ -0,0 +1,55 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RISC-V CPU idle driver.
> > + *
> > + * Copyright (C) 2020-2022 Allwinner Ltd
> > + *
> > + * Based on code - driver/cpuidle/cpuidle-at91.c
> > + *
> > + */
> > +#include <linux/cpuidle.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/cpu_pm.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +#include <linux/platform_device.h>
> > +#include <asm/cpuidle.h>
> > +
> > +#define MAX_IDLE_STATES 1
> > +
> > +/* TODO: Implement deeper idle states */
> > +static int riscv_low_level_suspend_enter(int state)
> > +{
> > + return 0;

> As far as I can tell, this driver just doesn't do anything?  Assuming that's
> the case, it's probably best to just drop everything but cpu_do_idle() until we
> have something to exercise this.

Although, the driver in this case is not necessary, it is essential when work 
in the macro CPU_PM_CPU_IDLE_ENTER_PARAM.And it could also be used for supporting 
other deeper states in the future. So I think it would be better to keep 
riscv_low_level_suspend_enter but change it to __weak function.

> > +}
> > +
> > +/* Actual code that puts the SoC in different idle states */
> > +static int riscv_enter_idle(struct cpuidle_device *dev,
> > +   struct cpuidle_driver *drv,
> > +          int index)
> > +{
> > + return CPU_PM_CPU_IDLE_ENTER_PARAM(riscv_low_level_suspend_enter,
> > +        index, 0);
> > +}
> > +
> > +static struct cpuidle_driver riscv_idle_driver = {
> > + .name   = "riscv_idle",
> > + .owner   = THIS_MODULE,
> > + .states[0]  = {
> > +  .enter   = riscv_enter_idle,
> > +  .exit_latency  = 1,
> > +  .target_residency = 1,
> > +  .name   = "WFI",
> > +  .desc   = "RISCV WFI",
> > + },
> > + .state_count = MAX_IDLE_STATES,
> > +};
> > +
> > +static int __init riscv_cpuidle_init(void)
> > +{
> > + return cpuidle_register(&riscv_idle_driver, NULL);
> > +}
> > +
> > +device_initcall(riscv_cpuidle_init);

Regards,
liush
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
