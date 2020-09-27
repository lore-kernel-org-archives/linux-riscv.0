Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD18EC4346E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:39:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3566D239EE
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j56OihUf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qF54auph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3566D239EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=M2voi2CBcZoCbJAU3n1Yjc6ztpxeFbiPFldfbifp+aw=; b=j56OihUf4Vz1xAyXNn/1u/MwZ
	VbAP7RG7Nc5YvCFNzvORASH4Ylk3jemUvWVcRl5Sb0Wo41RoWVy+Ms/onE4Zg0HSeDxQVemj3Om8o
	W2SJRJN2o3myDkXzgHiBnD1xXJuIFEJgyuLlUkDmcPzXvYM0revgYGgCO3/twqbVouOy6U8CQn0W7
	LtQx9VX44dspR1kYrXE5v5pNn/To7CO1RjyWgN1m+ItvUsdZvzwLCKkCk6aWJcg1rztrsHtjghX9g
	wgOUK0yrUu4rWoZz1sBKu3qojBpmGNVmbv6h2JG2girOhXTXROlUMZ0VmElSvhb+U1T3LRmJKtFZO
	NNLEhWrzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMPOy-0000dC-73; Sun, 27 Sep 2020 05:39:12 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMPOu-0000cc-W7
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 05:39:10 +0000
Received: by mail-pj1-x1044.google.com with SMTP id u3so1704305pjr.3
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 22:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LMQphMQQC1ZS52mjolpGUg46gp7rKFN7yP9FdquBqU8=;
 b=qF54auphWnDSQ59t6x3KMjN/NTjWZiu9aibdYBcrSrxOTSOeKKI8+vfUXW3da8z88X
 A8+WX7+hoVVW5tTyBI6YRHvRy0lwayMnRJBjKmZWhwJ0ObxvTiRcCPZXfscUjvEHM76F
 HGpaQr295HcLlymMDy8AeJ6YX1OV7xwxTMaT6TOUP35cJzOAWXpkcQzjFZVC9iJwafiP
 bWgNhv+aX6CmsRwL2PWwsrnU273bDfh2vY+rlCJ6GryQ2l+LtfPELQu2ps4kcvEdj3Ps
 tw+4ly2IT4i7HJfgmnBWRzwI2g4qu2ZjWRMkyoFoKNksopFx1NgTjDDn7HAdddu1aTGU
 7row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LMQphMQQC1ZS52mjolpGUg46gp7rKFN7yP9FdquBqU8=;
 b=qE6945VLNWAkZYHZtZ1A3c+ti2MGm1ZZHzbmuiDVoDUhsQtOBvqNGADefVNZoz2Q34
 F4ez/s5Uw7Vxb/iKvf6PuG6gPjZMX7sF1S3PiLEcvYygzE+0sJLvdK7nvJpOvd/N1zP7
 GlcjvD3/iAeZIgd52bb1J2xxOMMJYJ0BI6ep12oXP6HEc6Z9EkfjrGeNz/h82kWRj4m2
 WJzel2T3SY3UaWryRXhTq1iO1483R9p1Z6hF+Omj3GWNG2BXujLGVmWT0vl/Q5/Qmc6T
 oghswScSr72jXNpy31LBdqp+Vv4U3LCTsaNAlCQgk6wUwTOneBGyHHc2ySeDiOSjjS2E
 GdHw==
X-Gm-Message-State: AOAM5339/0BJflP79lHbN4AhMkxmadj4q0iUC/D2uRgty7U7hacgGPNW
 4D7AQ265Bwr/4OF6HBfSWcjnoQ==
X-Google-Smtp-Source: ABdhPJwDFMeN1C5G3h8RDbBH/LKHNMwpi62d4kKmJsP/wuS/kyLNJaJPPG8gp0MvVLGQJg3zfGfDGQ==
X-Received: by 2002:a17:90b:3c1:: with SMTP id
 go1mr4384822pjb.192.1601185146863; 
 Sat, 26 Sep 2020 22:39:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 84sm7045469pfw.14.2020.09.26.22.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 22:39:06 -0700 (PDT)
Date: Sat, 26 Sep 2020 22:39:06 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Sep 2020 22:39:04 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Check clint_time_val before use
In-Reply-To: <CAAhSdy1EeeNcyHbk-MN+auKX+mZmvF=W=S-UPuRhrqVBjch4ow@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: anup@brainfault.org
Message-ID: <mhng-4f4adf29-bb3f-4ea9-a7b9-8f69ef3071f4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_013909_480507_95A5C740 
X-CRM114-Status: GOOD (  30.04  )
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
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2020 22:38:17 PDT (-0700), anup@brainfault.org wrote:
> On Sun, Sep 27, 2020 at 5:50 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> On Sat, 26 Sep 2020 03:31:29 PDT (-0700), Damien Le Moal wrote:
>> > On Sat, 2020-09-26 at 15:51 +0530, Anup Patel wrote:
>> >> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
>> >> because the get_cycles() and friends are called very early from
>> >> rand_initialize() before CLINT driver is probed. To fix this, we
>> >> should check clint_time_val before use in get_cycles() and friends.
>>
>> I don't think this is the right way to solve that problem, as we're essentially
>> just lying about the timer rather than informing the system we can't get
>> timer-based entropy right now.  MIPS is explicit about this, I don't see any
>> reason why we shouldn't be as well.
>>
>> Does this fix the boot issue (see below for the NULL)?  There's some other
>> random-related arch functions so this might not be quite the right way to do
>> it.
>>
>> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
>> index 7f659dda0032..7e39b0068932 100644
>> --- a/arch/riscv/include/asm/timex.h
>> +++ b/arch/riscv/include/asm/timex.h
>> @@ -33,6 +33,18 @@ static inline u32 get_cycles_hi(void)
>>  #define get_cycles_hi get_cycles_hi
>>  #endif /* CONFIG_64BIT */
>>
>> +/*
>> + * Much like MIPS, we may not have a viable counter to use at an early point in
>> + * the boot process.  Unfortunately we don't have a fallback, so instead we
>> + * just return 0.
>> + */
>> +static inline unsigned long random_get_entropy(void)
>> +{
>> +       if (unlikely(clint_time_val == NULL))
>> +               return 0;
>> +       return get_cycles();
>> +}
>> +
>>  #else /* CONFIG_RISCV_M_MODE */
>>
>>  static inline cycles_t get_cycles(void)
>>
>> >> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
>> >> for M-mode systems")
>> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> >> ---
>> >> Changes since v1:
>> >>  - Explicitly initialize clint_time_val to NULL in CLINT driver to
>> >>    avoid hang on Kendryte K210
>> >> ---
>> >>  arch/riscv/include/asm/timex.h    | 12 +++++++++---
>> >>  drivers/clocksource/timer-clint.c |  2 +-
>> >>  2 files changed, 10 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
>> >> index 7f659dda0032..6e7b04874755 100644
>> >> --- a/arch/riscv/include/asm/timex.h
>> >> +++ b/arch/riscv/include/asm/timex.h
>> >> @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;
>> >>  #ifdef CONFIG_64BIT
>> >>  static inline cycles_t get_cycles(void)
>> >>  {
>> >> -    return readq_relaxed(clint_time_val);
>> >> +    if (clint_time_val)
>> >> +            return readq_relaxed(clint_time_val);
>> >> +    return 0;
>> >>  }
>> >>  #else /* !CONFIG_64BIT */
>> >>  static inline u32 get_cycles(void)
>> >>  {
>> >> -    return readl_relaxed(((u32 *)clint_time_val));
>> >> +    if (clint_time_val)
>> >> +            return readl_relaxed(((u32 *)clint_time_val));
>> >> +    return 0;
>> >>  }
>> >>  #define get_cycles get_cycles
>> >>
>> >>  static inline u32 get_cycles_hi(void)
>> >>  {
>> >> -    return readl_relaxed(((u32 *)clint_time_val) + 1);
>> >> +    if (clint_time_val)
>> >> +            return readl_relaxed(((u32 *)clint_time_val) + 1);
>> >> +    return 0;
>> >>  }
>> >>  #define get_cycles_hi get_cycles_hi
>> >>  #endif /* CONFIG_64BIT */
>> >> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
>> >> index d17367dee02c..8dbec85979fd 100644
>> >> --- a/drivers/clocksource/timer-clint.c
>> >> +++ b/drivers/clocksource/timer-clint.c
>> >> @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
>> >>  static unsigned int clint_timer_irq;
>> >>
>> >>  #ifdef CONFIG_RISCV_M_MODE
>> >> -u64 __iomem *clint_time_val;
>> >> +u64 __iomem *clint_time_val = NULL;
>>
>> This one I definately don't get.  According the internet, the C standard says
>>
>>     If an object that has static storage duration is not initialized
>>     explicitly, it is initialized implicitly as if every member that has
>>     arithmetic type were assigned 0 and every member that has pointer type were
>>     assigned a null pointer constant.
>>
>> so unless I'm missing something there shouldn't be any difference between these
>> two lines.  When I just apply this I get exactly the same "objdump -dt" before
>> and after.  I do see some difference in assembly, but only when I don't pass
>> "-fno-common" and that ends up being passed during my Linux builds.
>
> Even checkpatch complains about explicit NULL assignment to global variables.
>
> I will send v3 with a different approach to fix this so hopefully with
> v3 we will
> not require explicit NULL assignment.

Awesome, thanks!

>
> Regards,
> Anup
>
>>
>> >>  #endif
>> >>
>> >>  static void clint_send_ipi(const struct cpumask *target)
>> >
>> > For Kendryte:
>> >
>> > Tested-by: Damien Le Moal <damien.lemoal@wdc.com>
>> >
>> > --
>> > Damien Le Moal
>> > Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
