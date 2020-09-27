Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B56C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 00:20:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 381042371F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 00:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="znQpiJUU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="KgYHR3ev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 381042371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NFBmzL3+P70SNjY8RM3Atha5Aq6YpLnKEwbIb7U+tsU=; b=znQpiJUUs/exv5HN9fO8mRjk0
	H7/zvC57kYDE6DanU2ukKMTFbHbXrAQI5YemX7DEUDKdnnmcWO7bva4VChEnmmmSf27g9OUb8yLQf
	lPICJjFDad3QO2S0a10Tzfqju0fg982TJXdRLUQCSXq1v6GRsXaWuHCkvZM4iDISAcUWZZ8Q5yJyd
	jt99wlGnPseQOtbePgvoav0QDztez291fGTlC734q3dDOtvNeVf3qjtaTT21WemqonIWuXp4twidQ
	VVt9rekiACvszQ1d60zIgK8O1p+CpX9glTJGgrFSJhf1fnl1kR80kZU6p/1/604wAbYkspqVuKVjI
	ejZRJQYsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMKQL-0004ds-ME; Sun, 27 Sep 2020 00:20:17 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMKQJ-0004dM-ET
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 00:20:16 +0000
Received: by mail-pj1-x1042.google.com with SMTP id jw11so1496111pjb.0
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 17:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Hs9mLaM9QJjA7QhpUv/f+9+N0sU3vQhU7QQqL2xb8zU=;
 b=KgYHR3evLAlofZjmxy7xtcAssDoyckmUck6gmNfmVG1EL2iTR188aSUJtHSDSUZ0nE
 xdC+ewr7xw4AyO2CdGamgs2aGkb/k4ssA/QFlBNU/S0eQmKTr2bQxOc/IfrMaTqJ7oj3
 HMCmF2I1Z3qsdwGEOIaGR4Vlja3UhrUTgW2nK+C9ChSgaeKij3W1ld0FsaG93eJ2DDHn
 87E2Q131HOs1rp9i6xb9jXwnfWnZnarbC/EAgVTSPXX6SdagZbxMTe4zQdVjMtni5rEz
 COebEo9K4rUZQX5WnLf17bP7E3ngbcJKqJxn/2O8CDMNzMnaMYeQ+b3k6SWvpzRSK5VS
 scWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Hs9mLaM9QJjA7QhpUv/f+9+N0sU3vQhU7QQqL2xb8zU=;
 b=gHM20YAR0w/NRN6bAhsDnmJFe3ojRA1PqQZzfrnhm3T52jqYI96UuX2TLfMz28WamS
 apn9SexuQgG1ZKBDGO5aEAEgB8h+Nv/8nHKkr7f+6wDJnueEr0brz1kNU4PdLjfKz4TA
 coEtDGM7ObujCOn+ibMYVcnmwFiXJmyRTG5K9DlTtdgiHPc0AY1/WSIfMGp6Ih3U9dqQ
 rjLkrN5xBM/YEQZiGOwZstFfxoLMsAdb3WHH61No2ch4hz+w2++c7de5ZPWrAes1gz0E
 sAqx6dWEQ2uhrggFdyi+7hOevQOokECUT6dXY/nP7hf1UzZ70SnFJSBYjHSTmQPGytnC
 WRkg==
X-Gm-Message-State: AOAM532tc1CoOhAHSF7HTx0COZz1GHX7BLcTkdMq7OMzz+wu54N9Zs+W
 DHtvZaMPe89thJaFAMVL2UZL6g==
X-Google-Smtp-Source: ABdhPJxkhIWEgptCK4x109gR4W2bv8RGxG+jJF3c1D6WYNNJo8naz9TwJLCO+qKn5JJ+pO0QemPEZw==
X-Received: by 2002:a17:90a:528a:: with SMTP id
 w10mr3580342pjh.107.1601166013023; 
 Sat, 26 Sep 2020 17:20:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p11sm6640791pfq.130.2020.09.26.17.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 17:20:12 -0700 (PDT)
Date: Sat, 26 Sep 2020 17:20:12 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Sep 2020 17:20:10 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Check clint_time_val before use
In-Reply-To: <4950cd11fcf66bc3606f309d6289577b5dc65b2e.camel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-bcea0448-fc43-406d-a56c-53e16306e12d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_202015_526718_309E3192 
X-CRM114-Status: GOOD (  26.22  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2020 03:31:29 PDT (-0700), Damien Le Moal wrote:
> On Sat, 2020-09-26 at 15:51 +0530, Anup Patel wrote:
>> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
>> because the get_cycles() and friends are called very early from
>> rand_initialize() before CLINT driver is probed. To fix this, we
>> should check clint_time_val before use in get_cycles() and friends.

I don't think this is the right way to solve that problem, as we're essentially
just lying about the timer rather than informing the system we can't get
timer-based entropy right now.  MIPS is explicit about this, I don't see any
reason why we shouldn't be as well.

Does this fix the boot issue (see below for the NULL)?  There's some other
random-related arch functions so this might not be quite the right way to do
it.

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index 7f659dda0032..7e39b0068932 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -33,6 +33,18 @@ static inline u32 get_cycles_hi(void)
 #define get_cycles_hi get_cycles_hi
 #endif /* CONFIG_64BIT */
 
+/*
+ * Much like MIPS, we may not have a viable counter to use at an early point in
+ * the boot process.  Unfortunately we don't have a fallback, so instead we
+ * just return 0.
+ */
+static inline unsigned long random_get_entropy(void)
+{
+	if (unlikely(clint_time_val == NULL))
+		return 0;
+	return get_cycles();
+}
+
 #else /* CONFIG_RISCV_M_MODE */
 
 static inline cycles_t get_cycles(void)

>> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
>> for M-mode systems")
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> ---
>> Changes since v1:
>>  - Explicitly initialize clint_time_val to NULL in CLINT driver to
>>    avoid hang on Kendryte K210
>> ---
>>  arch/riscv/include/asm/timex.h    | 12 +++++++++---
>>  drivers/clocksource/timer-clint.c |  2 +-
>>  2 files changed, 10 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
>> index 7f659dda0032..6e7b04874755 100644
>> --- a/arch/riscv/include/asm/timex.h
>> +++ b/arch/riscv/include/asm/timex.h
>> @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;
>>  #ifdef CONFIG_64BIT
>>  static inline cycles_t get_cycles(void)
>>  {
>> -	return readq_relaxed(clint_time_val);
>> +	if (clint_time_val)
>> +		return readq_relaxed(clint_time_val);
>> +	return 0;
>>  }
>>  #else /* !CONFIG_64BIT */
>>  static inline u32 get_cycles(void)
>>  {
>> -	return readl_relaxed(((u32 *)clint_time_val));
>> +	if (clint_time_val)
>> +		return readl_relaxed(((u32 *)clint_time_val));
>> +	return 0;
>>  }
>>  #define get_cycles get_cycles
>>  
>>  static inline u32 get_cycles_hi(void)
>>  {
>> -	return readl_relaxed(((u32 *)clint_time_val) + 1);
>> +	if (clint_time_val)
>> +		return readl_relaxed(((u32 *)clint_time_val) + 1);
>> +	return 0;
>>  }
>>  #define get_cycles_hi get_cycles_hi
>>  #endif /* CONFIG_64BIT */
>> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
>> index d17367dee02c..8dbec85979fd 100644
>> --- a/drivers/clocksource/timer-clint.c
>> +++ b/drivers/clocksource/timer-clint.c
>> @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
>>  static unsigned int clint_timer_irq;
>>  
>>  #ifdef CONFIG_RISCV_M_MODE
>> -u64 __iomem *clint_time_val;
>> +u64 __iomem *clint_time_val = NULL;

This one I definately don't get.  According the internet, the C standard says

    If an object that has static storage duration is not initialized
    explicitly, it is initialized implicitly as if every member that has
    arithmetic type were assigned 0 and every member that has pointer type were
    assigned a null pointer constant.

so unless I'm missing something there shouldn't be any difference between these
two lines.  When I just apply this I get exactly the same "objdump -dt" before
and after.  I do see some difference in assembly, but only when I don't pass
"-fno-common" and that ends up being passed during my Linux builds.

>>  #endif
>>  
>>  static void clint_send_ipi(const struct cpumask *target)
> 
> For Kendryte:
> 
> Tested-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> -- 
> Damien Le Moal
> Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
