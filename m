Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EFDC43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 03:06:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ACF320897
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 03:06:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PzTNn5ZX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WCelbdwP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ACF320897
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mUWiWCbdjztlw/LR5bT5yVA3pqttbRzH3M5SIkLicr0=; b=PzTNn5ZX/5tIv0upsIsseHvBd
	NIq8JTd9QiZycv1MX2Y8pJsWpqm1Sv5bpW61B/ZPVrChmvQv1SSMpE8Z6iO556DQ3NPZZMMfeV3Ik
	gXjEIFW/z6EUTmWRwNxWOUfy2+pHdT6SivSSNY6ZSAvr60Hbqt23/1gVMVUnC5UnhSOM9xdG2h92j
	yDaPSm3U1w2TdEXM1qCJdaToz5hDKWAuP8G6XKip9NED8znQQ2FylHyCc/dEftM4j1Ma3rLLgD6d4
	JARgJh3o/HfPTzSwK/x2s8wCaRXVE7orZjYLZjp54LUIl3YwJHwyqVdTBhbdcbjHrHdyFqpuohY21
	3miW5r3Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI1II-0003VB-8j; Tue, 15 Sep 2020 03:06:10 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI1IF-0003U5-FV
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 03:06:08 +0000
Received: by mail-pj1-x1043.google.com with SMTP id gf14so991860pjb.5
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 20:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=e7cA/+Me8h9VPyFEqgVCl2Rlfw9ktIDWLyxXuBVXNTA=;
 b=WCelbdwPFLTCIlcAnT87RYn7bVEFYF9MhAGtSRxjKOf+PWzp5YbNJdLY8fj0YZAvCj
 BjHf46jMea9cztbvqKqMo4q03dSvEwkFGNVBMyvfSdEWt2kn6W5wTsGtAQnH5HuT3jjX
 +etLUjePS7R4DJddfryACNpmGjyqf0no34mk31UnqZnM4C/LW3NKk6Gc60eIHuzDCzvk
 Te/Nuf6FaAIg0msopkIknBTDG+/+j95kBOnRgDk/DncSYQIl2PLvtG5UbSFWgRuF/bHw
 KQqBttGgtVIk8v5UOmySylnOU1pHUWEsAjy9vk0akUZqSwYi9a2awLS1KA/pBdCPnKb7
 QZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=e7cA/+Me8h9VPyFEqgVCl2Rlfw9ktIDWLyxXuBVXNTA=;
 b=YdcUXGogcu/9kM0SvYfCDBJ/rcjxBoLxwDTKmhNSNjSfQSSwQJ48T7+60lPwkRizwg
 zDG9a76c5DborKHtfBRMhi/YZWxPVIaSsEu+l20CwV1VtQSSFOoygc/nXc+06VelZ92I
 oE2Ka9ov7SCEMP3ewFRT+VTT6P7xazVlB0lVe6WjfPNU4HU1wZ9e0WsXS5HJwAqJeBlu
 4B5zI5NuvyzJyR7XObqsvnfUd/7E5yOvr/pDf8ajxgUkPnvYPvJSpCM0paYCRuHt3KEj
 tSKfUB2HA8wIK30E/5Ci68JafsRfDShdToViAcqoRgBtWlPoBbcvtzNnPJIVP94lovoO
 Qe1Q==
X-Gm-Message-State: AOAM531mIGwVj/t4KQFV2rB4V30fdsTRGd+iaTO7vS4+mqd3VbOHtilM
 yynaeyhEnlw4WwvrPQzVEzmrKfL4axWSF6Ti
X-Google-Smtp-Source: ABdhPJxvZJX8eB4jHqkzoqYGV6XN3s6Oh46AJBpfIFUiYUgvudILKKfzL0Dc0eOonROIP6Cmd8NDQw==
X-Received: by 2002:a17:902:8ecc:b029:d1:7cd1:8d5b with SMTP id
 x12-20020a1709028eccb02900d17cd18d5bmr17342700plo.42.1600139164836; 
 Mon, 14 Sep 2020 20:06:04 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q11sm9578957pgj.92.2020.09.14.20.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:06:04 -0700 (PDT)
Date: Mon, 14 Sep 2020 20:06:04 -0700 (PDT)
X-Google-Original-Date: Mon, 14 Sep 2020 20:06:02 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
In-Reply-To: <CALkjhPqmJPxsayVkUbN1Z++1LEpPB88TWm7iux34JXeWJ7bFpw@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: mab@mab-labs.com
Message-ID: <mhng-1bd6b01c-b850-42e7-89e2-689fa1ffee72@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_230607_540778_543DF820 
X-CRM114-Status: GOOD (  28.83  )
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Anup Patel <Anup.Patel@wdc.com>, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Sep 2020 10:22:01 PDT (-0700), mab@mab-labs.com wrote:
> I can test this for you. Can you provide a high level description on
> what you'd like tested (it's not obvious to me what impact your patch
> will have)?

Just booting on the K210 should be sufficient.  I doubt you even need
userspace, as you should get an illegal instruction pretty quickly without
this.

>
> Thanks
>
>
> On Mon, Sep 14, 2020 at 1:16 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> The K210 doesn't implement rdtime in M-mode, and since that's where Linux runs
>> in the NOMMU systems that means we can't use rdtime.  The K210 is the only
>> system that anyone is currently running NOMMU or M-mode on, so here we're just
>> inlining the timer read directly.
>>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>> I don't actually have a K210 so I haven't tested this.  If nobody else has the
>> time to I'll put together a QEMU that doesn't support rdtime in M-mode, but
>> I've yet to mess around with the !MMU stuff so that might take a little while.
>> This certainly doesn't seem worse than what's there right now, though, as
>> rdtime isn't valid in M-mode on the K210 (our only M-mode platform).
>> ---
>>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>>  3 files changed, 70 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/clint.h
>>
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
>> +       return readq_relaxed(clint_time_val);
>> +}
>> +#else /* !CONFIG_64BIT */
>> +static inline u32 get_cycles(void)
>> +{
>> +       return readl_relaxed(((u32 *)clint_time_val));
>> +}
>> +#define get_cycles get_cycles
>> +
>> +static inline u32 get_cycles_hi(void)
>> +{
>> +       return readl_relaxed(((u32 *)clint_time_val) + 1);
>> +}
>> +#define get_cycles_hi get_cycles_hi
>> +#endif /* CONFIG_64BIT */
>> +
>> +#else /* CONFIG_RISCV_M_MODE */
>> +
>>  static inline cycles_t get_cycles(void)
>>  {
>>         return csr_read(CSR_TIME);
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
>>  #define CLINT_IPI_OFF          0
>>  #define CLINT_TIMER_CMP_OFF    0x4000
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
>>         unsigned int cpu;
>> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
>>         clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>>         clint_timer_freq = riscv_timebase;
>>
>> +#ifdef CONFIG_RISCV_M_MODE
>> +       /*
>> +        * Yes, that's an odd naming scheme.  time_val is public, but hopefully
>> +        * will die in favor of something cleaner.
>> +        */
>> +       clint_time_val = clint_timer_val;
>> +#endif
>> +
>>         pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>>
>>         rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
>> --
>> 2.28.0.618.gf4bc123cb7-goog
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
