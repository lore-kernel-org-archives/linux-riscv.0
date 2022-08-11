Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CE4C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CJSXmN4oowEaxVGSRxBfW9UgRSo38n4nWzdGtxNGsco=; b=WCh1Qoxh58wDJGOilPOjfIb7Yj
	ehkmOS2LjuTTZXHEl8KrGeIQD/4mqx83TXQM7Lb8ToAvs0BjX8b8o2OgE0AGpmhCwWYXT/kw9pFSy
	yeR2b2bjcxmmwU5Cf2ERayhF3JNE/zbvV16GLST51t+x7JzFothJ2urTExj0xZ9PWdqchV8sCKBx9
	UnNMWITY+0HVwWOZeLHDOW0BCsudlw+q4W+UUAQPiUCRrO5UPxwNlHE4y6btoUe5tB3ugDUt2GtzX
	VGeZK9xe3aY88Yfp/F8bnP9lg5sBpCSLkFE6Fp0zgXAPSRItCetG5MZ0QzVRvsfMuRq8msA1cUUiF
	50HoaylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOT-005KLx-JN; Thu, 11 Aug 2022 21:07:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOP-005KCz-5I
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:07:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id q19so17502665pfg.8
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=VXQpyC7fFwbv9Li28qaJRP+HBIR9r8T1YqikalpAFnU=;
        b=3EQQkoaf86800to5W8613c2ZZebKhxCTfp9yJKLCmzlV8guOg6ro+Gdp0dEAZ7n3/4
         2eX07b9OnrV6yqXJhrNxN+KvbeKGjUWJj4wSDbjQluq5DhylCa7ExHNhaA8lz2phHykl
         rfQLgouQzR6dBjj89Kjb7u8MPaQarhT4coWCO0V3UwSauiWr6FwmT6kRmz2Z+0voT+OK
         yyxyx5jONxeDYsPmpW1x63WIGVM1XCzUSYOS+wE0LX9cm8xaxKgIa/2r5xzYmNobZ7sV
         +h+oRxM/oehCf3j6QwGJ5LwbSnp/rYw/PU/870Q25PKrzBWbI+jNKikJcLji8G+xwUDv
         2Hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=VXQpyC7fFwbv9Li28qaJRP+HBIR9r8T1YqikalpAFnU=;
        b=tjBsSVFxKh3bYKswymWhriHVpRDIqwhSCqtMqX2eAOU1syjbv46t4BVAX46mXpLrGe
         t/YKHkXNpl9Gqsu1rS7YskkDmwNZ56oxo7l9gJ56Ox8H7UcqrIBbLbkN/qL6GQWWsEBu
         brLYqj1k9tkcbN6LMkGJ4xUhRde0M9YvbtW36OMbT/ii3pgtLnoOFOOLMOL6QhoLBQlR
         Az1vCuIzNHmadOvkUIF0fopLxiOrcyC5cKz9inu43R3X7EWzrFb1/QHXs3AIFt+Iu1AD
         qtjSPZiM1qk468XfOhO6s58b6vUHpfW1IooNWKR6CBT7qLdFHQsZW3+5UlRqU5Cn/qE0
         yaQg==
X-Gm-Message-State: ACgBeo3ieWSKRDhm01HUZ7JxUMvBKfYVB8ji0QQGf4eb1t5zr2sUyxDW
	D8f0gaZODbHvjSmBEqxrZEcbDw==
X-Google-Smtp-Source: AA6agR6qoGfMx0ZRRLRr8IJxbyBa9p6fqBrxY1Cwn5TTvIye4Ab2wXel4ssOE8NR6iwpXbSf3SDf6A==
X-Received: by 2002:aa7:82c6:0:b0:52f:e41e:73d6 with SMTP id f6-20020aa782c6000000b0052fe41e73d6mr640453pfn.74.1660252018098;
        Thu, 11 Aug 2022 14:06:58 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id x23-20020aa78f17000000b005252a06750esm122036pfr.182.2022.08.11.14.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:06:57 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:06:57 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 13:18:42 PDT (-0700)
Subject: Re: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
In-Reply-To: <283ea0b7-2ff3-a02b-70f3-b056e077962e@microchip.com>
CC: ben.dooks@sifive.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, sudip.mukherjee@sifive.com, jude.onyenegecha@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-0e36a6ae-3cad-4696-bffe-a2e2c51aeb0f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_140701_243745_162BADD1 
X-CRM114-Status: GOOD (  16.76  )
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

On Thu, 14 Jul 2022 00:41:12 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 14/07/2022 08:29, Ben Dooks wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> On 14/07/2022 07:33, Conor.Dooley@microchip.com wrote:
>>> On 13/07/2022 22:53, Ben Dooks wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Running sparse shows cpu_ops_spinwait.c is missing two definitions
>>>> found in head.h, so include it to stop the following warnings:
>>>>
>>>> arch/riscv/kernel/cpu_ops_spinwait.c:15:6: warning: symbol '__cpu_spinwait_stack_pointer' was not declared. Should it be static?
>>>> arch/riscv/kernel/cpu_ops_spinwait.c:16:6: warning: symbol '__cpu_spinwait_task_pointer' was not declared. Should it be static?
>>>>
>>>> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
>>>
>>> Hey Ben,
>>> With this applied I still see a:
>>> arch/riscv/kernel/cpu_ops.c:21:29: warning: symbol 'cpu_ops_spinwait' was not declared. Should it be static?
>>>
>>> Seems to be in the same ballpack, so maybe you could fix that one too?
>> 
>> I've done that as a new patch in case it needs to be moved.
>> Not sure head.h was the right place nor where it ended up.
> 
> This is a rabbit hole man. I found another one while checking by
> build logs to check that that one had been fixed. I'll send a patch
> this time..
> 
> For this one:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

IMO we also need something like this

    diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
    index 170d07e57721..f92c0e6eddb1 100644
    --- a/arch/riscv/kernel/cpu_ops.c
    +++ b/arch/riscv/kernel/cpu_ops.c
    @@ -15,9 +15,7 @@
     const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
    
     extern const struct cpu_operations cpu_ops_sbi;
    -#ifdef CONFIG_RISCV_BOOT_SPINWAIT
    -extern const struct cpu_operations cpu_ops_spinwait;
    -#else
    +#ifndef CONFIG_RISCV_BOOT_SPINWAIT
     const struct cpu_operations cpu_ops_spinwait = {
            .name           = "",
            .cpu_prepare    = NULL,

I squashed that in and added a CONFIG_RISCV_BOOT_SPINWAIT=y test, as 
defconfig is =n now.  I'm not seeing these warnings, but it's cleaner 
this way.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
