Return-Path: <SRS0=dJHb=C5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0622FC43465
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 03:34:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B6F21531
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 03:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sI0wKKfI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QkAwvVcG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57B6F21531
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=sFfdNLqPeSm+rLJYg+QYSfXfsxCP0ZfdYBcRoYlx/ZY=; b=sI0wKKfImTIcrkMXy/250iiJA
	fAa+8A3CVePLaKyRiwWilAuf1BOb2m8Ct/4XmQlYn9uYLV2mhspiFA9iVTpUJ7VhFuJkf5x5btkSC
	nbCEsTe9aSlbmOlhnZfspmBDB2mILCCdzaCpkd6roonoaYEFloiZJ/shI9ogrDKPYudNrwQGv01IL
	j8e24eYleDpkAS7J/qUJbI73IW8/gCoyW5CtUD4CwBsBb1rdEYNV+P6jrnsr335ab/wRgbUE335C5
	rXJfDGm4NOK4EGLY+sClysa2lxGw22yfb6xEyZJFoGNPe5/Zn3yTCgUBoGSmLNuMTTAcYtJBGFQQe
	jsNVPquLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJq77-0000q8-7e; Sun, 20 Sep 2020 03:34:09 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJq74-0000pm-HQ
 for linux-riscv@lists.infradead.org; Sun, 20 Sep 2020 03:34:07 +0000
Received: by mail-pg1-x543.google.com with SMTP id f2so5981296pgd.3
 for <linux-riscv@lists.infradead.org>; Sat, 19 Sep 2020 20:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ThA12Mzg2bxKa/2nwtC1Yh9D9T+6x1TUkDhgK6OkaVY=;
 b=QkAwvVcGH1MwZHEvFMmuYBOL0Zcp4WSuTShegWX3a65lImakPIuvPCxUQmIVb2jHD2
 BWulUBMsBcKh1wsMAdTlWSBHTLN+j9vuWXV7hYt6N2i/pqizW8GUsf/KNYJLttVHhJxZ
 AP6suRXhBXRY0T3qSTky6BJEZJaiEbrlmoO21X5wli3EMhgvuHmZijTnue3A2IYtyGXe
 E7f+rlZ6cMXwLTUXwZlfV5wNg6bbE2A0hrp2QQuaHC5wzBq/9K+SAaqdNrpKMc3o3nJ7
 WpYSwO1zPWfByvrL1KuK6nbJFEdt3KpDoehz4nTkcdx1qVurxt4of+g5NUT2qBd+rvCi
 C3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ThA12Mzg2bxKa/2nwtC1Yh9D9T+6x1TUkDhgK6OkaVY=;
 b=Yna65ZRK1Bm68FcJPJQHkKjyhlTgQqrzZANm6PqjgCA++1ImIF+4hfC1xJPMS3EI1v
 X39myRGuheSjomHO/IdGZ5K+5b/r03D/sPNhKT502ZhsnkHjLhZSdPYDBrmb87126o2T
 eJvvqUxE1OGglUUn3gxczZ3PjZWidtf7+R5AXMNBP3w7UVNYyW+kYkTWqsYNafk8qC2o
 JLDntZ2w9uZ6BokiiShcAZKwVdBPH0Gyc1EP2QQDtZJXEn1HYezm3Gh7pJMv5zGn9Wsp
 UJ75GTU/SczhRiyWFdLz6XOlDI5P+zcfAh3lwxTp8YgN/ADGEMt3GJMfZQv27Diq3foW
 u8CQ==
X-Gm-Message-State: AOAM530vwAWUeMu1sCvt0qD2NiI/XWKK+WpYF+rR3UBVPHTsHPxKmvQL
 6koSJOxRGj7nNNtlHAx1kd3bCsmenqJuY1li
X-Google-Smtp-Source: ABdhPJwqD2IiED9xBtiIKOHzstKslYIrVpDbGxGwASS1yEYKTsJGSWhoPmtyRmki9lmEivroYN5Y9g==
X-Received: by 2002:a05:6a00:1356:b029:13e:d13d:a084 with SMTP id
 k22-20020a056a001356b029013ed13da084mr37900156pfu.27.1600572842166; 
 Sat, 19 Sep 2020 20:34:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j20sm7974343pfh.146.2020.09.19.20.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 20:34:01 -0700 (PDT)
Date: Sat, 19 Sep 2020 20:34:01 -0700 (PDT)
X-Google-Original-Date: Sat, 19 Sep 2020 20:34:00 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
In-Reply-To: <0b1c4df9426810bf3288729193e6045f8b328ea6.camel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-d1ecd93f-b5d0-4208-876d-356edc5d2df9@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_233406_606359_FA555A82 
X-CRM114-Status: GOOD (  26.20  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 19 Sep 2020 20:31:32 PDT (-0700), Damien Le Moal wrote:
> On Sat, 2020-09-19 at 13:21 -0700, Palmer Dabbelt wrote:
>> The K210 doesn't implement rdtime in M-mode, and since that's where Linux runs
>> in the NOMMU systems that means we can't use rdtime.  The K210 is the only
>> system that anyone is currently running NOMMU or M-mode on, so here we're just
>> inlining the timer read directly.
>> 
>> This also adds the CLINT driver as an !MMU dependency, as it's currently the
>> only timer driver availiable for these systems and without it we get a build
>> failure for some configurations.
>> 
>> Tested-by: Damien Le Moal <damien.lemoal@wdc.com>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> There is no changelog... What changed from V1 ? Do I need to test again ?

It's just the driver dependency, so allnoconfig and such build.  Testing again
shouldn't be necessary, but I guess it never hurts.

> 
>> ---
>>  arch/riscv/Kconfig                |  1 +
>>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>>  4 files changed, 71 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/clint.h
>> 
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index df18372861d8..7766e1289468 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -32,6 +32,7 @@ config RISCV
>>  	select ARCH_WANT_FRAME_POINTERS
>>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>>  	select CLONE_BACKWARDS
>> +	select CLINT_TIMER if !MMU
>>  	select COMMON_CLK
>>  	select EDAC_SUPPORT
>>  	select GENERIC_ARCH_TOPOLOGY if SMP
>> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
>> new file mode 100644
>> index 000000000000..0789fd37b40a
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/clint.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2020 Google, Inc
>> + */
>> +
>> +#ifndef _ASM_RISCV_CLINT_H
>> +#define _ASM_RISCV_CLINT_H
>> +
>> +#include <linux/types.h>
>> +#include <asm/mmio.h>
>> +
>> +#ifdef CONFIG_RISCV_M_MODE
>> +/*
>> + * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
>> + * any overhead when accessing the MMIO timer.
>> + *
>> + * The ISA defines mtime as a 64-bit memory-mapped register that increments at
>> + * a constant frequency, but it doesn't define some other constraints we depend
>> + * on (most notably ordering constraints, but also some simpler stuff like the
>> + * memory layout).  Thus, this is called "clint_time_val" instead of something
>> + * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
>> + */
>> +extern u64 __iomem *clint_time_val;
>> +#endif
>> +
>> +#endif
>> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
>> index a3fb85d505d4..7f659dda0032 100644
>> --- a/arch/riscv/include/asm/timex.h
>> +++ b/arch/riscv/include/asm/timex.h
>> @@ -10,6 +10,31 @@
>>  
>>  typedef unsigned long cycles_t;
>>  
>> +#ifdef CONFIG_RISCV_M_MODE
>> +
>> +#include <asm/clint.h>
>> +
>> +#ifdef CONFIG_64BIT
>> +static inline cycles_t get_cycles(void)
>> +{
>> +	return readq_relaxed(clint_time_val);
>> +}
>> +#else /* !CONFIG_64BIT */
>> +static inline u32 get_cycles(void)
>> +{
>> +	return readl_relaxed(((u32 *)clint_time_val));
>> +}
>> +#define get_cycles get_cycles
>> +
>> +static inline u32 get_cycles_hi(void)
>> +{
>> +	return readl_relaxed(((u32 *)clint_time_val) + 1);
>> +}
>> +#define get_cycles_hi get_cycles_hi
>> +#endif /* CONFIG_64BIT */
>> +
>> +#else /* CONFIG_RISCV_M_MODE */
>> +
>>  static inline cycles_t get_cycles(void)
>>  {
>>  	return csr_read(CSR_TIME);
>> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)
>>  }
>>  #endif /* CONFIG_64BIT */
>>  
>> +#endif /* !CONFIG_RISCV_M_MODE */
>> +
>>  #define ARCH_HAS_READ_CURRENT_TIMER
>>  static inline int read_current_timer(unsigned long *timer_val)
>>  {
>> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
>> index 8eeafa82c03d..d17367dee02c 100644
>> --- a/drivers/clocksource/timer-clint.c
>> +++ b/drivers/clocksource/timer-clint.c
>> @@ -19,6 +19,11 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/of_irq.h>
>>  #include <linux/smp.h>
>> +#include <linux/timex.h>
>> +
>> +#ifndef CONFIG_RISCV_M_MODE
>> +#include <asm/clint.h>
>> +#endif
>>  
>>  #define CLINT_IPI_OFF		0
>>  #define CLINT_TIMER_CMP_OFF	0x4000
>> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;
>>  static unsigned long clint_timer_freq;
>>  static unsigned int clint_timer_irq;
>>  
>> +#ifdef CONFIG_RISCV_M_MODE
>> +u64 __iomem *clint_time_val;
>> +#endif
>> +
>>  static void clint_send_ipi(const struct cpumask *target)
>>  {
>>  	unsigned int cpu;
>> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
>>  	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>>  	clint_timer_freq = riscv_timebase;
>>  
>> +#ifdef CONFIG_RISCV_M_MODE
>> +	/*
>> +	 * Yes, that's an odd naming scheme.  time_val is public, but hopefully
>> +	 * will die in favor of something cleaner.
>> +	 */
>> +	clint_time_val = clint_timer_val;
>> +#endif
>> +
>>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>>  
>>  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
> 
> -- 
> Damien Le Moal
> Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
