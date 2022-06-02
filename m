Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DFFC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 04:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+2107+pmPH9GCcTwWlKAchA3NbCL9XycEN4tXpburns=; b=vJNEsKI6AZCuvZLSMXM4Zr1PTC
	E2gciimwlEQPsM2eUE4EUg5l7is5b2muem4OW0mMiX/4PvcP/ftlL20DAXzTBh4/CXCLbnN3FQf62
	qIpVn9iJiU0IQlF0psVzoQitLmUTXJQe4htZZ4yECZGYry5++M4ibqWe6a4aVaTAYDGr5eiOR1VEt
	No/Dj3xiFqNTjHJ+8+zUCpMFUIeVZ/8qx1eUQapsnUpjPgAGvy3+D5nAL34tNx+4YZQ55/D05MQ22
	nYYu2WaJ0Ipxeff1uJqGuCEC9kKS8AW/iwYORW6s+T/N0IvElXJNJPtBZ8EltG0UNYujCVtQtLGWe
	aswCH5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwcQk-001MCx-Ew; Thu, 02 Jun 2022 04:27:30 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwcQh-001MBZ-L5
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 04:27:29 +0000
Received: by mail-pj1-x102f.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so8272603pjo.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 21:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=rJJAkVFbshCZ1KNb+eunOqGmqPeRoBTVub1Qbj3oFRY=;
        b=AvJtMzIzvj6uPnVlGWOWinJJZQjRMrC1R04t5mpQEHEroRwkP89gXqYYXM/ymVIM3W
         TgDcR5j9AQ73BFB9G6uZPMOsYzVvpczZ8naGRZpo3WGqZ2rPYzZDy7yGh9E6NiyK/+cM
         z1KlVEjleb2f8CQ4PBcqcBvURiGSKHBYzhQ9WxZEjUib5B7P5ELYID1aDKgdjmZeJyfa
         SNPqyaF693vlFtmyJnpKVzlWi5wFGGvO+/D05xNPVwxO08MJYIGOKmL5wfKjRWfdICLd
         ZDSpvkEtRIwP8+BpgsjUH5bNYKfLkXQPYrDfN7ihCJatDHpfOOeTVCP88OKlnjuU0AJi
         ZHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=rJJAkVFbshCZ1KNb+eunOqGmqPeRoBTVub1Qbj3oFRY=;
        b=ePD8Ya0qSb9EFQ5Ehh7+lek+j/4CyhiqGzoU5QNhwCJNWjIVmtXe5RVzp4l8uORSs3
         +EtlVQ+t39T3EhtF3i7Sx+yPJvbbX+DNMSNfksJDgtiOD/dghoFtoi4tKlAOawSx44vc
         0sd/jESnq8uYk7ydx/zebxctaZS74KfBvmse7/sdovNKNlc0QBT6Kflvd6x6EucZ6LJ1
         icto0jzlWttukBkVvl2qDSvXwMKlt/FFb5R2WJwEhelHoqOHVt+TK6NEYCfck3CVa6SK
         LOj5xj/+Kk934kEVXtvt5PmrMqUHMJ3XSbFNwQvIdl+5pCN0uMnGi4HIiaNc8e1n0KF2
         FG+w==
X-Gm-Message-State: AOAM532fVNpBQzW3xKSybS5huG8no/mxjmVIOUT3guW9k6QAZL3teOU1
	Q1qbfQ7kcRKpo//ElC7sJs6BrXhDWdYfCA==
X-Google-Smtp-Source: ABdhPJwGRUOHYEmHxnwbfy/AQp5vw7pQiRwUUU6ulDrtcILusjlXBXLw76bOO79j7bI/QIgSPXfipQ==
X-Received: by 2002:a17:90a:e7c6:b0:1e0:9cf7:d042 with SMTP id kb6-20020a17090ae7c600b001e09cf7d042mr3092718pjb.234.1654144044475;
        Wed, 01 Jun 2022 21:27:24 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001df239bab14sm2212622pjd.46.2022.06.01.21.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 21:27:23 -0700 (PDT)
Date: Wed, 01 Jun 2022 21:27:23 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 21:27:12 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix irq_work when SMP is disabled
In-Reply-To: <11970543.O9o76ZdvQC@phil>
CC: linux-riscv@lists.infradead.org, samuel@sholland.org, aou@eecs.berkeley.edu,
  greentime.hu@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
  samuel@sholland.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org, heiko@sntech.de
Message-ID: <mhng-75fe722b-942d-4184-89d3-1ac2ca7ba9c6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_212727_728915_640EC70D 
X-CRM114-Status: GOOD (  22.28  )
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

On Tue, 03 May 2022 16:16:26 PDT (-0700), heiko@sntech.de wrote:
> Am Samstag, 30. April 2022, 05:00:23 CEST schrieb Samuel Holland:
>> irq_work is triggered via an IPI, but the IPI infrastructure is not
>> included in uniprocessor kernels. As a result, irq_work never runs.
>> Fall back to the tick-based irq_work implementation on uniprocessor
>> configurations.
>>
>> Fixes: 298447928bb1 ("riscv: Support irq_work via self IPIs")
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>
> That uniprocessor part seems a tiny bit neglected - as I saw previously
> with alternatives not getting applied as well, so

Ya, it definately is -- and not just me missing this fix, I'd also 
dropped the CONFIG_SMP=n test from my list by accident.  Luckily it 
still boots in QEMU, so at least it's not as brokn as it could be.

>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
> Though somehow I find the arm32 style a tad nicer by defining
> an is_smp() function [0] that holds the necessary checks.
>
> But I guess that is a style preference.

IIUC that's slightly different: this is a compile-time issue related to 
the IPI framework not coming up at all, not a runtime "are we on a 
uniprocessor" issue.

I put this on for-next (no fixes right now, I'm still collecting 5.19 
merge window material).

Thanks!

>
>
> Heiko
>
>
> [0] https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/smp_plat.h#L18
>> ---
>> This was found while bringing up cpufreq on D1. Switching cpufreq
>> governors was hanging on irq_work_sync().
>>
>>  arch/riscv/include/asm/irq_work.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
>> index d6c277992f76..b53891964ae0 100644
>> --- a/arch/riscv/include/asm/irq_work.h
>> +++ b/arch/riscv/include/asm/irq_work.h
>> @@ -4,7 +4,7 @@
>>
>>  static inline bool arch_irq_work_has_interrupt(void)
>>  {
>> -	return true;
>> +	return IS_ENABLED(CONFIG_SMP);
>>  }
>>  extern void arch_irq_work_raise(void);
>>  #endif /* _ASM_RISCV_IRQ_WORK_H */
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
