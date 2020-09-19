Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52683C43464
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 02:54:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E568A208DB
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 02:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pQBdZDnK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="myTA5byn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E568A208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=F8DqOFHjfNot0H5dOpM1q//kG1nrejRvuQefltHqn2o=; b=pQBdZDnK1QdOotLCvWj6mRBJy
	gaw0LKXwzFwPYdRfi2xFGyyb72sYQDbCxtHQ4w0P8ZWWb44tahJMfHM8naQlanyN1yCUle43H5s/q
	EoVmvLTCed5ROPpGj8U7uSlXg6Uhp6ZnaTPCAWlHRdvC0lzWV1vBg9uWd1RhpBW6hfh5xlfvbieBO
	sRMofVYP9t3jhUhaqMTTpPx209dtdQJNgFIz8SWKgRBi3QE0tQumVuOGcH512X+P2/HCzRDM+WU1+
	F/ORM38WdGUZv4KufTAoeUk5ZPg9b6R6bQHPCLiS5lc+DhG6TkCW3Gnan1mYoXWMZNM5JaQ70GgoO
	Ccj8SQCkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJT13-0007we-Pt; Sat, 19 Sep 2020 02:54:21 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJT11-0007uy-SV
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 02:54:20 +0000
Received: by mail-pf1-x443.google.com with SMTP id l126so4656720pfd.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2020 19:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PUhIAGMtXxjdnMq77wkB8Mp1oyu2jZRSAe5W1hcgZLA=;
 b=myTA5byno0/nKsvioNH7xNo9NTKzo2VORA2ks2PrbbFH3QwHh5UfPQjFDx8UMuIZWL
 uXf4UH337VDrfepIa1xdxp6Cu5v9qaTOOwIggcElZ4GidFQErSmtc9fd6+ottmMZF91W
 yeffOpr8L+bocakyNCK4GLa5lwYmZ24Tafh3E9kchOMnEQoc61qIu/l8HdhYKmfC1tKu
 bAfVC6J3zhrdejCnyE9rvwhyV0iBENrb4viXFPlv+9AS6z7CZqXMtDtul1S6Kuc0jCB5
 TcuPEtVRDcpS1cgwaXdEt/5dWpa4myIdMCzbZt+IjOoYJsTYAsmhsVnzjaRAymPaR+Nk
 FWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PUhIAGMtXxjdnMq77wkB8Mp1oyu2jZRSAe5W1hcgZLA=;
 b=Bo6C4REYfIXlVYoIMGkk2xK7rwYZtHE+UO/+099AXkt7rMuDrN4Nns8cTsKTGTmJe9
 uA5JSEKtlmCuh9zKzH7bBDivNhPS126XOYV914kSLr4PNsl32+ogCd6jjXw4VAE3tMgl
 NWeaoeLyvdHg3KMIDyBuQOs+r9Yh//ftInmKN8LdQ7z3/JTXPwu9SKPJKZ7hgCKa/iEs
 QoRMc81UGADflgClLGOskqUkX9MQOtC6lCcjE6DqoPkDTiRjws1eFcJfDHiZFYpo+2wB
 8Kfe5ZV8bqzL9+2xutiXoJybZj7kZoDGc22IRDxH8PnpDh2USmc8tC0g46GrtTWMEedy
 eG1g==
X-Gm-Message-State: AOAM5313KE1x6hU5MwCBiXEwXQOUPvS4c0GPDFFKzLIYiAgC6FR98KBn
 flaKDN8+2ZNXgm+kaQYE8MN/jQpHztw3FsgV
X-Google-Smtp-Source: ABdhPJy+wJGQmrM6FjVec4MRWi4io/CsA3U03LERbfTbN9211o56kdOg0SMmpU5WWloSdsW51xwqnA==
X-Received: by 2002:a65:64cc:: with SMTP id t12mr30059981pgv.106.1600484055403; 
 Fri, 18 Sep 2020 19:54:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 17sm4677086pfi.55.2020.09.18.19.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 19:54:14 -0700 (PDT)
Date: Fri, 18 Sep 2020 19:54:14 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Sep 2020 19:54:07 PDT (-0700)
Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
In-Reply-To: <DM6PR04MB6201E20439CC8FB561981AE78D200@DM6PR04MB6201.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-02b0ff1d-50e3-4b73-94ef-0a7736caeca9@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_225419_931006_D81DA7E3 
X-CRM114-Status: GOOD (  33.47  )
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
Cc: Christoph Hellwig <hch@infradead.org>, anup@brainfault.org,
 linux-riscv@lists.infradead.org, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Sep 2020 19:11:46 PDT (-0700), Anup Patel wrote:
>
>
>> -----Original Message-----
>> From: Palmer Dabbelt <palmerdabbelt@google.com>
>> Sent: 14 September 2020 22:27
>> To: linux-riscv@lists.infradead.org
>> Cc: hch@infradead.org; Anup Patel <Anup.Patel@wdc.com>; Palmer Dabbelt
>> <palmerdabbelt@google.com>; kernel-team@android.com
>> Subject: [PATCH] RISC-V: Resurrect the MMIO timer implementation for M-
>> mode systems
>> 
>> The K210 doesn't implement rdtime in M-mode, and since that's where Linux
>> runs in the NOMMU systems that means we can't use rdtime.  The K210 is
>> the only system that anyone is currently running NOMMU or M-mode on, so
>> here we're just inlining the timer read directly.
>> 
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>> I don't actually have a K210 so I haven't tested this.  If nobody else has the
>> time to I'll put together a QEMU that doesn't support rdtime in M-mode, but
>> I've yet to mess around with the !MMU stuff so that might take a little while.
>> This certainly doesn't seem worse than what's there right now, though, as
>> rdtime isn't valid in M-mode on the K210 (our only M-mode platform).
>
> I think you missed my comments in the previous email thread.
>
> I would request to make this patch bit more CLINT independent.
>
> Please see inline below.
>
>> ---
>>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>>  3 files changed, 70 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/clint.h
>> 
>> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
>> new file mode 100644 index 000000000000..0789fd37b40a
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
>> + * This lives in the CLINT driver, but is accessed directly by timex.h
>> +to avoid
>> + * any overhead when accessing the MMIO timer.
>> + *
>> + * The ISA defines mtime as a 64-bit memory-mapped register that
>> +increments at
>> + * a constant frequency, but it doesn't define some other constraints
>> +we depend
>> + * on (most notably ordering constraints, but also some simpler stuff
>> +like the
>> + * memory layout).  Thus, this is called "clint_time_val" instead of
>> +something
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
>
> The entire asm/clint.h can be avoided by adding 
> "extern u64 __iomem *riscv_mmio_time_val;"
> here in n asm/timex.h
>
> Also, this will make it bit more CLINT independent.

Except that, as per the comments, it's not CLINT independent.

>> +#ifdef CONFIG_RISCV_M_MODE
>> +
>> +#include <asm/clint.h>
>> +
>> +#ifdef CONFIG_64BIT
>> +static inline cycles_t get_cycles(void) {
>> +	return readq_relaxed(clint_time_val);
>> +}
>> +#else /* !CONFIG_64BIT */
>> +static inline u32 get_cycles(void)
>> +{
>> +	return readl_relaxed(((u32 *)clint_time_val)); } #define get_cycles
>> +get_cycles
>> +
>> +static inline u32 get_cycles_hi(void)
>> +{
>> +	return readl_relaxed(((u32 *)clint_time_val) + 1); } #define
>> +get_cycles_hi get_cycles_hi #endif /* CONFIG_64BIT */
>
> Use riscv_mmio_time_val instead of clint_time_val above.
>
>> +
>> +#else /* CONFIG_RISCV_M_MODE */
>> +
>>  static inline cycles_t get_cycles(void)  {
>>  	return csr_read(CSR_TIME);
>> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)  }  #endif /*
>> CONFIG_64BIT */
>> 
>> +#endif /* !CONFIG_RISCV_M_MODE */
>> +
>>  #define ARCH_HAS_READ_CURRENT_TIMER
>>  static inline int read_current_timer(unsigned long *timer_val)  { diff --git
>> a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
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
>
> As-per, above suggestion drop this #include.
>
>> 
>>  #define CLINT_IPI_OFF		0
>>  #define CLINT_TIMER_CMP_OFF	0x4000
>> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;  static unsigned
>> long clint_timer_freq;  static unsigned int clint_timer_irq;
>> 
>> +#ifdef CONFIG_RISCV_M_MODE
>> +u64 __iomem *clint_time_val;
>> +#endif
>
> Define and export "u64 __iomem *riscv_mmio_time_val" in
> arch/riscv/kernel/time.c
>
> This way no "clint_time_val" definition required here as well
> and other MMIO timers can also set riscv_mmio_time_val.
>
>> +
>>  static void clint_send_ipi(const struct cpumask *target)  {
>>  	unsigned int cpu;
>> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct
>> device_node *np)
>>  	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>>  	clint_timer_freq = riscv_timebase;
>> 
>> +#ifdef CONFIG_RISCV_M_MODE
>> +	/*
>> +	 * Yes, that's an odd naming scheme.  time_val is public, but
>> hopefully
>> +	 * will die in favor of something cleaner.
>> +	 */
>> +	clint_time_val = clint_timer_val;
>> +#endif
>> +
>
> Just set " riscv_mmio_time_val = clint_timer_val" here.
>
>>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>> 
>>  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
>> --
>> 2.28.0.618.gf4bc123cb7-goog
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
