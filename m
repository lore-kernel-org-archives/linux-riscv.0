Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB4CC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 15:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8AB52137B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 15:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xBbb+LQ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8AB52137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:MIME-Version:Subject:
	Message-ID:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6wnbnvZDT+JahQRev6+HePsgNJt5qYKmlDH2CKD7kiQ=; b=xBbb+LQ3svQIWczp311jk4Rhl
	dMnr/FljhcYg9O768zcB3OYHui0SSKL/G7jtWglmXxTuIjyMSX+pMb2/ul1Bhrsp0fwQdYjGpC6e8
	f+13TDxHOiYrsM47+6OqxLZCKgj5mTo/tsePCvSbwZ5MjbrYM6XfqtFMQJ9ogcnIQLdaIc4RkRaM6
	zg4KR682t3h8zFz5tsCNIIeZMxWxJoxrfmvDlgc8+BU3ySqZiJ9qgexxh+P0qeJAYkMudx8Ywz+kf
	qWXZuhxtzMtmhIu72CTCAnbq96JvFyYgGK2Ah3tcHl6lcdHoq9vDUfg4XGkZNdL6Ie9yRk6U1DwP/
	IuaGHSc+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvli-0004Gl-FB; Thu, 17 Sep 2020 15:24:18 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHo3b-0002Ci-9f
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 12:58:14 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08253667|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.012044-0.00337727-0.984579;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03308; MF=liush@allwinnertech.com; NM=1; PH=DW;
 RN=14; RT=14; SR=0; TI=W4_5948689_DEFAULT_0A93261A_1600088218642_o7001c1057e; 
Received: from WS-web
 (liush@allwinnertech.com[W4_5948689_DEFAULT_0A93261A_1600088218642_o7001c1057e])
 by ay29a011140100189.et135 at Mon, 14 Sep 2020 20:58:02 +0800
Date: Mon, 14 Sep 2020 20:58:02 +0800
From: "=?UTF-8?B?5YiY6YK15Y2OQlRE?=" <liush@allwinnertech.com>
To: "paul.walmsley" <paul.walmsley@sifive.com>, "palmer" <palmer@dabbelt.com>,
 "aou" <aou@eecs.berkeley.edu>, "rjw" <rjw@rjwysocki.net>,
 "anup.patel" <anup.patel@wdc.com>, "atish.patra" <atish.patra@wdc.com>,
 "damien.lemoal" <damien.lemoal@wdc.com>,
 "wangkefeng.wang" <wangkefeng.wang@huawei.com>, "kernel" <kernel@esmil.dk>,
 "zong.li" <zong.li@sifive.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>
Message-ID: <58abe153-689d-460c-a119-91270cd110cf.liush@allwinnertech.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIXSBjcHVpZGxlOiBhZGQgcmlzY3YgY3B1aWRsZSBkcml2ZXI=?=
X-Mailer: [Alimail-Mailagent][W4_5948689][DEFAULT][Chrome]
MIME-Version: 1.0
References: <1600048323-2964-1-git-send-email-liush@allwinnertech.com>,
 <80bc85f5-fba3-5f08-4d73-372b5f495833@linaro.org>
In-Reply-To: <80bc85f5-fba3-5f08-4d73-372b5f495833@linaro.org>
x-aliyun-mail-creator: W4_5948689_DEFAULT_MzYTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2zc
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_085810_770242_673189D4 
X-CRM114-Status: GOOD (  15.26  )
X-Mailman-Approved-At: Thu, 17 Sep 2020 11:24:16 -0400
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
Reply-To: =?UTF-8?B?5YiY6YK15Y2OQlRE?= <liush@allwinnertech.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-pm <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Daniel,
> > This patch adds a cpuidle driver for systems based RISCV architecture.
> > This patch supports state WFI. Other states will be supported in the
> > future.
> > 
> > Signed-off-by: liush <liush@allwinnertech.com>
> > ---
> 
> [ ... ]
> 
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
> 
> extra line
> 
> > +}

> As for the next deeper states should end up with the cpu_do_idle
> function, isn't there an extra operation with the wfi() like flushing
> the l1 cache?

Data cache consistency is mainly ensured by hardware in riscv, and there is no 
implementation of flushing data cache in kernel. Before wfi(),add an memory 
barrier operation - mb(). Is this feasible? 

  //arch/riscv/include/asm/barrier.h

  17 #define RISCV_FENCE(p, s) \
  18         __asm__ __volatile__ ("fence " #p "," #s : : : "memory")
  19 
  20 /* These barriers need to enforce ordering on both devices or memory. */                                                                                                            
  21 #define mb()            RISCV_FENCE(iorw,iorw) 


After modification, the codes is as follows.

81 @@ -0,0 +1,8 @@
82 +// SPDX-License-Identifier: GPL-2.0
83 +#include <asm/cpuidle.h>
84 +
85 +void cpu_do_idle(void)
86 +{
87 +       mb();
88 +       __asm__ __volatile__ ("wfi");
89 +
90 +}

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
> > +        help
> > +          Select this option to enable generic cpuidle driver for RISCV.
> > +   Now only support C0 State.
> 
> Identation

I'll fix it. Thank you!
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
