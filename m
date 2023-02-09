Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A958C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yr5YJy5Tm+ZeLe1YXU/cpZdfi0NlVTJMw2RbLaJnzPc=; b=i+FdnLLYwHLYJwhmHDdGDq6SPz
	6UmlLziTJ3h6wGtGppXfECTHtvLR1bHQCHT99mSHT0P3KCIE0QLVwX+AU4zhwXaKdXqdiOkBG8/Yk
	Qf4owb7jKTsm8FTQ8VwsOF6gaGLcWr+1mROg8Y12/CEMZ/PWul3qTKsqbnyNvdP4SnUEpu0gmrCrb
	vOPg+AmRrMF1dbW/27zCO5X4CBzumqOpwctpDu5z1GyP+eT2UOLA3Bp6CtKHzm5IaXjqvAz/NEDqR
	MLaDcojmkU3MxDhh5GwII5PdD3/gVUGAI7z/kjdsv6pxg4Cy/px8U66B3uiJlo4TkvdUOZ9TaeX4F
	3nGahCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGW5-003c4b-3B; Thu, 09 Feb 2023 23:39:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGVq-003bxv-TR
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:39:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id o8so2344879pls.11
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 15:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adGyWVOR2nlTk/KUDUV+jez2l94K5Pjv+2axtOX1duc=;
        b=S+EeEmO/AgJdkddnM+GWSByan9rLpwI4+43Gudk5YalfLOzLAuwamWpHK1A3g3yUED
         2LnBV8HTZPc5z9nodgYPXMOI/udYa0xc9TX+C4DsT/U87QDK1AcC8BCnSXXNJJ6fT5Zs
         61SmNWhg80g9TqDEubKkH6lE7kKTZ+w0xi2dRR7ZSRj599yP6SBBqSC5op2UzK8IxpPI
         s2CIbVc4Xnip8zB854CKHUooPrlnKf2DT9RLPxe5ahTT7lwNfQOV9C5pPCAXsQ4FqKgh
         5gHPZTOJngYLLtrbDWUKwWu0s44ZhIBjeDqMW8+WWJElEZkfDoT/F9R5Iq3aoULeaNbp
         wQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adGyWVOR2nlTk/KUDUV+jez2l94K5Pjv+2axtOX1duc=;
        b=xYG6EKTMOFPqXaq5nWO71BW/JMQM+/Q03OecSbOtWW+yg59icFGUl9OekZBUYV3bq1
         YrBD6xk+PSGqpLoXsdqQYpraBK7oU9v0AXLJQm7yuUxnb2tBsgIHRDJ6T8v5wIupQ0P/
         2oA/73glyivJgibH11He2aEJhCNVvQgt23XuVe/nJhp/wFtJBhp7C/4wk9AJA7x4+TN0
         lsy4TInwP5YBnLVDTwRD+pDYwS+RKcifoa/wQ0do0m0TOQSJv4bF+nvW8AmztbYVYdH+
         LtH9qizZTHKw0bonGRmkZsZSIhQoYNhoPITGmMoHx16FvHC6H9mKghonpS+CFsgYM78S
         IW4g==
X-Gm-Message-State: AO0yUKVsPJvFoqwJjbZEA9WwUKNhVt/e+c8uPk5Nhp0PZwfAukuPsSPj
	uLiTFctvjgqtXOmkVCsYsinQBBJYlZjRltk6
X-Google-Smtp-Source: AK7set/PIVkjEJocB7mqQ2J4zvRNKQNxBKAt4KUZK4EGawWrd33e2I/AS6Uk8j9LVQifXxOgK4Aitg==
X-Received: by 2002:a17:902:e385:b0:199:4d57:63a7 with SMTP id g5-20020a170902e38500b001994d5763a7mr5588208ple.52.1675985972689;
        Thu, 09 Feb 2023 15:39:32 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d3d300b0019611a075fasm2077211plb.58.2023.02.09.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 15:39:32 -0800 (PST)
Date: Thu, 09 Feb 2023 15:39:32 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 15:38:52 PST (-0800)
Subject: Re: [PATCH] clocksource/drivers/riscv: Refuse to probe on T-Head
In-Reply-To: <87a0a7c9-6069-b043-2fc2-8d1bc05ddb1a@sholland.org>
CC: linux-riscv@lists.infradead.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: samuel@sholland.org
Message-ID: <mhng-25d39bba-2df2-4976-a3c0-b867a54cb61c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153934_991065_48EEBFCE 
X-CRM114-Status: GOOD (  27.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 09 Feb 2023 15:35:53 PST (-0800), samuel@sholland.org wrote:
> Hi Palmer,
>
> On 2/9/23 17:23, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> As of d9f15a9de44a ("Revert "clocksource/drivers/riscv: Events are
>> stopped during CPU suspend"") this driver no longer functions correctly
>> for the T-Head firmware.  That shouldn't impact any users, as we've got
>
> The current situation is that the C9xx CLINT binding was just accepted,
> so the CLINT is not yet described in any devicetree. So at least with
> upstream OpenSBI, which needs the CLINT DT node, the SBI timer extension
> never worked at all.
>
>> a functioning driver that's higher priority, but let's just be safe and
>> ban it from probing at all.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> This feel super ugly to me, but I'm not sure how to do this more
>> cleanly.  I'm not even sure if it's necessary, but I just ran back into
>> the driver reviewing some other patches so I figured I'd say something.
>
> This is not necessary as long as we add the riscv,timer node with the
> riscv,timer-cannot-wake-cpu property before we add the CLINT node. So it
> should not be a problem for any C9xx platform going forward.

Awesome, that sounds way better.

>
> Regards,
> Samuel
>
>> ---
>>  drivers/clocksource/timer-riscv.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
>> index a0d66fabf073..d2d0236d1ae6 100644
>> --- a/drivers/clocksource/timer-riscv.c
>> +++ b/drivers/clocksource/timer-riscv.c
>> @@ -139,6 +139,22 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>  	if (cpuid != smp_processor_id())
>>  		return 0;
>>
>> +	/*
>> +	 * The T-Head firmware does not route timer interrups to the core
>> +	 * during non-retentive suspend.  This is allowed by the specifications
>> +	 * (no interrupts are required to wake up the core during non-retentive
>> +	 * suspend), but most systems don't behave that way and Linux just
>> +	 * assumes that interrupts work.
>> +	 *
>> +	 * There's another timer for the T-Head sytems that behave this way
>> +	 * that is already probed by default, but just to be sure skip
>> +	 * initializing the SBI driver as it'll just break things later.
>> +	 */
>> +	if (sbi_get_mvendorid() == THEAD_VENDOR_ID) {
>> +		pr_debug_once("Skipping SBI timer on T-Head due to missed wakeups");
>> +		return 0;
>> +	}
>> +
>>  	domain = NULL;
>>  	child = of_get_compatible_child(n, "riscv,cpu-intc");
>>  	if (!child) {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
