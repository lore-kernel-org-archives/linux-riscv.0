Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80000C4346E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:38:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA982239EE
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAmjXOo2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="iPFgK2kD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA982239EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+W2/qLtrXu1Y6/fG0p3w1B5up5reB7ZwgNpwTw70NIM=; b=MAmjXOo2FWcfIw4XyoAZ2Iy2H
	ZHjP1tAj4qQdlg2MFK0GgDeJNDjD1ksiz9fG4c7L5dTECmIQ30VQ/aMH0TJp+wFQ9J4AzrBc6rTNU
	mXJwNbwLuG3HbaszRl1opoQYhh6QRK1taZJc2JHKq+MYEAZ2U9vWuZNieRMRx7+mWGtwOCE/88zo1
	/xY41N6BxNQ3Pf53aV8dvIzTiVVsCBapGHjlfvE4RALknvlwi9wx9sMidVVd3fbwVd+mzXAW0zNrN
	zgo5k6QIh0EwjtP3zW9L9Eu2zDk8rJZbdX9jqv6NjR+imRvkPwL4ME6QyDsBOoWClYNtbhLf8SZ5e
	tsrf4wtSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMPNn-0000Xd-0w; Sun, 27 Sep 2020 05:37:59 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMPNk-0000XG-SS
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 05:37:57 +0000
Received: by mail-pj1-x1044.google.com with SMTP id u3so1703492pjr.3
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 22:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6vQ7uwNEeNjn5nyRTVkXYl319JRvBv7r0RTNPxYsLpk=;
 b=iPFgK2kD3/yis/Pwn1tUpOH+16ZnAkgwAT/Jz3e/qZnEnJlCedVu2XaiaDlXESfbWN
 AGN/Lzju647hK1UnAE2iUsS2qlduZYSv9syXu1VnpyJvJSSwAYQdFvHzeyOMHXdxJLSZ
 Wcu8cC7cpCkG19ahE0YROfWwPkZujPpeF67kyi1hmKJYPODsb6h9t7kG3tCXAXQ7VLo2
 bNxdumt/86VL5mC+Fu2cOe7FjWyUNCYRiC5Fe7+DBLvIQ5wV/HE/QCi3yRWrtnD3AwwT
 tYfb6xVhRVqy46knrz6+yehDQVubZY7/vjsucYYdIf2dWqAP5pKADp+2OM31gsbYNOwY
 0rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6vQ7uwNEeNjn5nyRTVkXYl319JRvBv7r0RTNPxYsLpk=;
 b=k8ufBOWjsG3gRbt7amCyqP3aELCKohfuJ8oVhSRSBjfxb2DjEmPgD2coSIfskdlg6e
 m/Wth5b6CWfOIq05a5dzMRktEoJprRfeVk6RIYj5n1A1XY6hkXtwxdHtyNsiRc9v1MkO
 chQOgtqkTqQldTpDOivOxdZDM8SSgvuBPSJCzXgTnj19kPwFf3kS5vkUBgFt8jBuajac
 J3yhFXgXcz/RJ+Ti0i6++2wZ95p68UKI4gxygUY5Be5lXaeyzeREiBN8P71MKtg0Ly+D
 qCuXtt+Hd3lA0MLhY7RGN12IB1aGzd4ib6K7pVs2XLx1LyW1cYX0sZoz9Rs5TJum/b2S
 5mhQ==
X-Gm-Message-State: AOAM532Nk0B64O+du+FcQ6xuK66whAQ+y2YNIgutOssnefdLRY/2LMcf
 2kafA8X4SlK4Zy4lg18E84iMqg==
X-Google-Smtp-Source: ABdhPJyEovXT0cY5nbLWbBD832kvDrUkp7RKbSbIZ20Y9VBdPTrFnsd/+qs9rLwMfvm5z8YcQOyz4w==
X-Received: by 2002:a17:90a:e02:: with SMTP id v2mr4324857pje.6.1601185074419; 
 Sat, 26 Sep 2020 22:37:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w185sm7477380pfc.36.2020.09.26.22.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 22:37:53 -0700 (PDT)
Date: Sat, 26 Sep 2020 22:37:53 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Sep 2020 22:37:51 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Check clint_time_val before use
In-Reply-To: <CAAhSdy1T38v-O2v+fiKJHcpOeoxteMwzxXs0wNG46qhRDXAUmA@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: anup@brainfault.org
Message-ID: <mhng-1183a9e0-5954-4e30-9a69-2fe95ae4f270@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_013756_995060_512DE043 
X-CRM114-Status: GOOD (  32.25  )
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

On Sat, 26 Sep 2020 22:35:39 PDT (-0700), anup@brainfault.org wrote:
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
>
> Overall, this approach is good but this change is incomplete so does not work.
>
> The linux/timex.h expects random_get_entropy() to be macro so we need a
> "#define" as well.
>
> After fixing rand_initialize() with custom random_get_entropy(), we get another
> issue in boot_init_stack_canary() because boot_init_stack_canary() directly
> calls get_cycles() so we remove use of get_cycles() from
> boot_init_stack_canary()
> and this is similar to ARM, ARM64, and MIPS kernel.

OK, are you going to send that patch or do you want me to?

>
> Regards,
> Anup
>
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
