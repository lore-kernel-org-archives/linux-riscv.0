Return-Path: <SRS0=Qujn=DH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA77C2D0A8
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 06:58:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBDD62075F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 06:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZ95/2n7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="IGLm/TPd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBDD62075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2D82YmvLHyTluygOSaMosXYTXYY8SSD63w0ESxTMfvU=; b=nZ95/2n7gNTjhl6kFU+/3y5hE
	XW73VpsBGCOX4uTFuPKwDcBnsP/i/moF31Ov+UkqUC5MDJc2yyapu3qSyIDhUlrZ9WxhqwAehCQGo
	OwOQgoZ69PJMsXB60CG7VoHXzujGN3j1PsS1mjyUPxMNQxmvOonaEFHOimFUn4QlwAqVoFm/rvR1+
	j2rEdYOokMHhG8G5IjEr/VvYTMnuFPQtMJOC4w36UqyghEfIqApXaunEAgxud3p9yzsyPZy3DCjSz
	yWtsmrlx2sXPLIlCAAwnXdyvVlWJyUhDu5YcSe8uZ/GxhmIEWjUJoRkaJxDT++l8duCJtu7nlub4P
	JmNak+P1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNW4P-0006LT-4F; Wed, 30 Sep 2020 06:58:33 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNW4M-0006K0-AK
 for linux-riscv@lists.infradead.org; Wed, 30 Sep 2020 06:58:31 +0000
Received: by mail-pj1-x1044.google.com with SMTP id b17so364660pji.1
 for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2020 23:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=WxGFU9YDPgIQ/fxu1xfkvWboEWfSXnck0Qqf8eZXDR4=;
 b=IGLm/TPd2cst9B3C+u06qjtEKQHk+YAAmFT2oHnDCCUKaQfjJ/ekdr/zHUEGjJKH3E
 a4fh5Uxiqzy2uwR1TgeEhTonnE48LpF7QM8lExLsyIQxGz76DLcANWFokDgFvV0Iw6wg
 EYyIjBtOnJr1WYzHGvpi3M4ElFtJOkPJop5KNWYpGn7VUJmi52Nh985b02bXCSFrk2zM
 vxDjjfFfeGop+iYi0luPhQDM+LIYBoxXYnidtry8EZM5fnwD0hSO3P/cESQWCok6DM9+
 5p2OuSU+nKfAR0sHWVCIXnl18hp4dqtLlsk7fC65wx3Q9+RkxL5o3oivfTWWWdEtt298
 VvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WxGFU9YDPgIQ/fxu1xfkvWboEWfSXnck0Qqf8eZXDR4=;
 b=orjKQuIb68bq8/0OJ53m9rvhHAsUz0KpRwXTa4s1gf0c3yVYzD4fqamFtsHeyL0X92
 EtlvI+GhEDB+lZh+5d5G8/7rlgF43UqdSQXJT4X4cS2fgtmm30B2obun3Aj5C0e/iFyH
 XYFohdfhkH+XW0i5/ByOaSv7LTDyc3K22YdkMLGMaZQSFPLHffIqtVmjdNUlXhDvH8oq
 gx+UIFb2PqiE6suKWMIxjU/mmPmBpamGtHJqPnRTMIqzrUBF+pQrNpvhlmQeuHu60A59
 bJrJdrDkkBU0Nu3d+U1rmS9ZKLSKgiw4TF7NSLvk4PSoAhklT9ae9o1jgVXI/bB4LGWN
 mFGA==
X-Gm-Message-State: AOAM533QH4mhIJARY98h0lqovpne2lUHaWWl41sDs+MvIXnsZ6JwptZy
 8d9dhSM4S71v5+uq/kKxnfHAXw==
X-Google-Smtp-Source: ABdhPJx5K7wSx+QNqAsFDY7NVRMJVu6NqeQEZpcM36Fmvm6hPdyBnKRyFQgmxcyXEBEwYV++xLMsFw==
X-Received: by 2002:a17:90a:ca82:: with SMTP id
 y2mr1238562pjt.233.1601449108087; 
 Tue, 29 Sep 2020 23:58:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a71sm1063804pfa.26.2020.09.29.23.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 23:58:27 -0700 (PDT)
Date: Tue, 29 Sep 2020 23:58:27 -0700 (PDT)
X-Google-Original-Date: Tue, 29 Sep 2020 23:58:25 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Check clint_time_val before use
In-Reply-To: <c0ec481bf0413f391b16415530d2606114ea150a.camel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-6eec6bf8-1c59-4c5a-9a93-8e4f7bd7faed@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_025830_393283_940F2309 
X-CRM114-Status: GOOD (  21.48  )
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

On Sat, 26 Sep 2020 22:52:19 PDT (-0700), Damien Le Moal wrote:
> On Sun, 2020-09-27 at 11:09 +0530, Anup Patel wrote:
>> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
>> because clint_time_val is used even before CLINT driver is probed
>> at following places:
>> 1. rand_initialize() calls get_cycles() which in-turn uses
>>    clint_time_val
>> 2. boot_init_stack_canary() calls get_cycles() which in-turn
>>    uses clint_time_val
>> 
>> The issue#1 (above) is fixed by providing custom random_get_entropy()
>> for RISC-V NoMMU kernel. For issue#2 (above), we remove dependency of
>> boot_init_stack_canary() on get_cycles() and this is aligned with the
>> boot_init_stack_canary() implementations of ARM, ARM64 and MIPS kernel.
>> 
>> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
>> for M-mode systems")
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> ---
>> Changes since v2:
>>  - Take different approach and provide custom random_get_entropy() for
>>    RISC-V NoMMU kernel
>>  - Remove dependency of boot_init_stack_canary() on get_cycles()
>>  - Hopefully we don't require to set clint_time_val = NULL in CLINT
>>    driver with a different approach to fix.
>> Changes since v1:
>>  - Explicitly initialize clint_time_val to NULL in CLINT driver to
>>    avoid hang on Kendryte K210
>> ---
>>  arch/riscv/include/asm/stackprotector.h |  4 ----
>>  arch/riscv/include/asm/timex.h          | 13 +++++++++++++
>>  2 files changed, 13 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
>> index d95f7b2a7f37..5962f8891f06 100644
>> --- a/arch/riscv/include/asm/stackprotector.h
>> +++ b/arch/riscv/include/asm/stackprotector.h
>> @@ -5,7 +5,6 @@
>>  
>>  #include <linux/random.h>
>>  #include <linux/version.h>
>> -#include <asm/timex.h>
>>  
>>  extern unsigned long __stack_chk_guard;
>>  
>> @@ -18,12 +17,9 @@ extern unsigned long __stack_chk_guard;
>>  static __always_inline void boot_init_stack_canary(void)
>>  {
>>  	unsigned long canary;
>> -	unsigned long tsc;
>>  
>>  	/* Try to get a semi random initial value. */
>>  	get_random_bytes(&canary, sizeof(canary));
>> -	tsc = get_cycles();
>> -	canary += tsc + (tsc << BITS_PER_LONG/2);
>>  	canary ^= LINUX_VERSION_CODE;
>>  	canary &= CANARY_MASK;
>>  
>> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
>> index 7f659dda0032..ab104905d4db 100644
>> --- a/arch/riscv/include/asm/timex.h
>> +++ b/arch/riscv/include/asm/timex.h
>> @@ -33,6 +33,19 @@ static inline u32 get_cycles_hi(void)
>>  #define get_cycles_hi get_cycles_hi
>>  #endif /* CONFIG_64BIT */
>>  
>> +/*
>> + * Much like MIPS, we may not have a viable counter to use at an early point
>> + * in the boot process. Unfortunately we don't have a fallback, so instead
>> + * we just return 0.
>> + */
>> +static inline unsigned long random_get_entropy(void)
>> +{
>> +	if (unlikely(clint_time_val == NULL))
>> +		return 0;
>> +	return get_cycles();
>> +}
>> +#define random_get_entropy()	random_get_entropy()
>> +
>>  #else /* CONFIG_RISCV_M_MODE */
>>  
>>  static inline cycles_t get_cycles(void)
> 
> Did not reply to the patch... So again for Kendryte:
> 
> Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks.  I've put this on for-next, right after the patch I just posted to add
EXPORT_SYMBOL(clint_time_val) as it turns out random_get_entropy() is used by a
driver.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
