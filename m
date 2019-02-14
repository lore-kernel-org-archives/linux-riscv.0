Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D96C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 00:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C2E2083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 00:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o0fQZYn3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="H7pdVNh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C2E2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FGKwTZeMpLgbCISOAK9tctdlQNfdojzalB3wZyQrHXY=; b=o0fQZYn3jWqPlaTOw3NAu4/Gx
	FkspKQCY6yepquIVmBsyvenDFw9QM18/x2SzY5gMeEt+vGdotJtzgxY/jskgZCW8CUeoF+KsvaAGv
	EU/Fps+SuEMzEsQk/VQoX1S4Ro9ZL38Zb0vWQf8cGAkzYksyGv7m+t8PBguxUpXkPga7e1832fMJF
	FYlzSJx12KeI5q8qCfBT9LCauq7ulpAN4JLUE7/qBTSJpBddPzLXWv+117XUqWq4GNlaELWfheUkM
	z5BYTVuuLvc5Xn3dzn8kGDg9TUWd+Mo2v0reTj0EVlfXbQQSrEa0oS7whdX/e9GmC5tI9ryZqmdxQ
	ZTEMri7Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu52M-0005LI-5t; Thu, 14 Feb 2019 00:37:58 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu52H-0005Gx-Sx
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 00:37:55 +0000
Received: by mail-pg1-x542.google.com with SMTP id y1so2020770pgk.11
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 16:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pHNw059Ci1wHj7G3Kds8q+VVsU1SsIwdPhpbayBk3Jk=;
 b=H7pdVNh+4GGqUzIfWeoO9MUlkt9ktCqUjcJi68lP83Dramg4gIjVZfDfsVEuL7uD2Q
 aAg++qo3qVyPwxayHHsaMOIKBF7qm6JjD+eEoHlKze7umnRszT8T9iLO8qv6r/726kR4
 6d9WqgeMnJ1kKX+a2Zhhe+KW9pMvgzjixTBgJXAheKawxRuffWJm+8cE/q6Zh8enXggY
 4xZxRNVzGAu9E3msIH7+HFyT9sKXklacm6xt/YZhuKaawru6P+lAEQ45O3U3hz358Bt7
 chq9m7UoTuUeSojubgfTpP8uJRoEtY9IiApqmCKD47pJq0TtmN2YW8cV/txp1yovnIb1
 P1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pHNw059Ci1wHj7G3Kds8q+VVsU1SsIwdPhpbayBk3Jk=;
 b=qQdnI89XO1dHHGur7xLfcuVgH2b5wkAFBF3YfnHn6CbhvjwCPPDzDfLJBbawHjq+EU
 To2YgTkbkhZ33351h4Y6XWTjR0bV2zwLxkWRrRrDG7Z8LR2pMAwk7A94r86jjuL+EXow
 D3XMfF8moN0Ox8ribvR/amBMMHH5vlLQ/hzMjq2IwFnarJSFBDNaNnbSgqKd8rWVIwAX
 IGq02t3KP5FdRF57O6Dva1+2JICpG1Mc0RdTs0J88nzEyT383G9uc6ygcYaeZl9+dId2
 jMj915HcvtHU7m8QmoCrsuEprIgMAbWihFgvOMhmfwlV54rk7H6kU6PaS8PwLYbi9tTX
 gU/A==
X-Gm-Message-State: AHQUAuaaaEzF/Yc0yyC7UgOa+OVelO31t5LeZvAMHLY2X0JTD/Lwau1e
 zQONPaCl+CB/QcurJZxsOO/Kyw==
X-Google-Smtp-Source: AHgI3IZh1z6hIg9fDCBtbaOk7Pq+hXJIXsnzlpjVcVpq2T/Xeb+BXaYtSw4ccLvkc1Yr2GctzDiR0A==
X-Received: by 2002:a62:e50b:: with SMTP id n11mr1031760pff.212.1550104672989; 
 Wed, 13 Feb 2019 16:37:52 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g2sm603568pfi.95.2019.02.13.16.37.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 16:37:52 -0800 (PST)
Date: Wed, 13 Feb 2019 16:37:52 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 16:35:45 PST (-0800)
Subject: Re: [v4 PATCH 6/8] clocksource/drivers/riscv: Add required checks
 during clock source init
In-Reply-To: <7bd250fb-c896-64e1-d73b-6f3dd284e2d6@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: daniel.lezcano@linaro.org
Message-ID: <mhng-82b44439-e7ff-4464-9c9f-67c7eb686ecf@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_163754_093181_A6BA91C3 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, aou@eecs.berkeley.edu, jason@lakedaemon.net,
 alankao@andestech.com, dmitriy@oss-tech.org, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, johan@kernel.org,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, schwab@suse.de,
 marc.zyngier@arm.com, linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019 00:48:24 PST (-0800), daniel.lezcano@linaro.org wrote:
> On 12/02/2019 12:10, Atish Patra wrote:
>> Currently, clocksource registration happens for an invalid cpu for
>> non-smp kernels. This lead to kernel panic as cpu hotplug registration
>> will fail for those cpus. Moreover, riscv_hartid_to_cpuid can return
>> errors now.
>>
>> Do not proceed if hartid or cpuid is invalid. Take this opprtunity to
>> print appropriate error strings for different failure cases.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> Do you want me to take it through my tree ?

Works for me.  Aside from the typo:

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

>
>
>> ---
>>  drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
>> index 43189220..e8163693 100644
>> --- a/drivers/clocksource/timer-riscv.c
>> +++ b/drivers/clocksource/timer-riscv.c
>> @@ -95,13 +95,30 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>  	struct clocksource *cs;
>>
>>  	hartid = riscv_of_processor_hartid(n);
>> +	if (hartid < 0) {
>> +		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
>> +			n, hartid);
>> +		return hartid;
>> +	}
>> +
>>  	cpuid = riscv_hartid_to_cpuid(hartid);
>> +	if (cpuid < 0) {
>> +		pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
>> +		return cpuid;
>> +	}
>>
>>  	if (cpuid != smp_processor_id())
>>  		return 0;
>>
>> +	pr_info("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
>> +	       __func__, cpuid, hartid);

My only comment is that we flipped back and forth on whether or not to print 
info on driver initialization.  I like it because I have to go add the prints 
in to debug things, but IIRC we removed it at some point (probably more than 
once, as I have to keep adding these sorts of things back in and forget to 
remove them).

The review stands either way :)

>>  	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>> -	clocksource_register_hz(cs, riscv_timebase);
>> +	error = clocksource_register_hz(cs, riscv_timebase);
>> +	if (error) {
>> +		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> +		       error, cpuid);
>> +		return error;
>> +	}
>>
>>  	sched_clock_register(riscv_sched_clock,
>>  			BITS_PER_LONG, riscv_timebase);
>> @@ -110,8 +127,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>  			 "clockevents/riscv/timer:starting",
>>  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>>  	if (error)
>> -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> -		       error, cpuid);
>> +		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>> +		       error);
>>  	return error;
>>  }
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
