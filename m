Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454FEC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdKJ4FhUD8qMMYFTt3wAwoe9Qj8P20WXo3mvmRDZfaI=; b=dp6UgUmRS56cb0
	RojMC2U0vzwd6gjCN+qwI0HEoB74X1HBMDXnfXDeOUR2PRdmisFW+NQqR/5COAoMtYSbT9m+fugVv
	/2fdbv96zMRAeBOLFTsDVlS40UJoxnKByQdjA3wUL8cBXLWJlReE+PnSZajWok5b5MJ68o+X/JHkB
	53P+RTze7srt/MLuJrasHKY4fgI4fDSA1W15bMj4U6F32I8B6xn+DcgapL8xXnKv73flV4pjD/w4W
	Q+yVDN8B8KKsOIVw2WGxP+qjhyfyXdAPrvLRXDwgJ4sAbjGeO6Ey8Ak3VFz0z0QgdmBtmos/JzPGr
	Vp6HbI+zhIMfLCgpoRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seaaT-0000000A2x7-1JBb;
	Thu, 15 Aug 2024 13:32:21 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seaaQ-0000000A2wZ-08ay
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 13:32:19 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-81f921c40a0so38325039f.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723728736; x=1724333536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c90FMbGqmHJsy39PbcUXujyRxpEVVDaAYWfFKvTYmOY=;
        b=Jrw9o0RG+T5DVVa+aSLXnfFZN/JWmAKmW26/ChGmCkrF1JU59nXmFwd2V0g04N8iEO
         FGgHw/UWLqOF2IKC3rj0eF1jZNb1AD130PT5cVKnl2JYXK/JoD0k0h5U22mA5EJIkOgO
         UxSHG/i6YKrjNJIJsXOmXKG2/qWW5WNAWIU3Q0HKi5B9eN61TMFw+CpV5Ee5OBXoijAb
         lNAdL59rt7AIKPujAUs6alHmGMqoty5/LV2c43b4h6PPJ3+A7J6AGfNXxklt1PQUxXJR
         FH1tVh2GOuXZNFQ5syurKv+ASH7+X+yygkZyBHxbicnsM639kqY8yByYnK4R+lpLkfmr
         kMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723728736; x=1724333536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c90FMbGqmHJsy39PbcUXujyRxpEVVDaAYWfFKvTYmOY=;
        b=J+VoT4zc8UKud3ZgIzICqjBmzSn31h30MfQ/30AMyiFTcHSGQFfWeXVxGmOJixR+Zs
         rtllOq8P2Qm7MpOXWW/CQmrQGrIogiVkcQgMMKlhcddupSd5xiezdOkyW9FClwtrCIdC
         SRGiuB/7W37FyGU7VYQs13eQKzNS44XZI3YgkL4coGcGu61i1vI+dkj56OTwz4zUco7u
         WtirB1qKnJkDBokLJjAGImWNrk1tRtD21p16+5QHUPSzuHs67Wf8STaFpRZNslYp/7qe
         gcM0rz/Ol1Rfvq8mjbC8XMqXuM4UZdGZRRev0rWPU3SsaaWe/nvLa3cdGxPP7r1L5H0v
         q02Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1A8O/XTJBbox8/dUEOrPE4HwWBrU7R3ylFuDlg90BZVbVMXumfD2HeMkk/jp37KOKwEjHiwcFxyrAD0PE/RTmwbtPmf3sNfrJTv2OWBuP
X-Gm-Message-State: AOJu0Yy5UZo5tFOai2CP+b4NveKUjHSxgR9thR/OW+kC60pTn1hxWY/6
	lfJbddmdRFzwineMwqGMz8qxaUaa9AgynkmczTRAoLEsN5/0YBANvMfyPQANm9NeGE6Q+WiQbnk
	Q
X-Google-Smtp-Source: AGHT+IHI7UfNjjro7QbfS9BfRNW6H3aTBH/ngYckglkBrk5LzBa9PTiRaSVPXPfCdh4Pdsz1Ab81yg==
X-Received: by 2002:a05:6e02:1808:b0:375:dc39:cfd2 with SMTP id e9e14a558f8ab-39d1245483amr76389715ab.11.1723728736498;
        Thu, 15 Aug 2024 06:32:16 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39d1ec03005sm5645905ab.28.2024.08.15.06.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 06:32:16 -0700 (PDT)
Message-ID: <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
Date: Thu, 15 Aug 2024 08:32:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87plqalyd4.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_063218_143423_3D835260 
X-CRM114-Status: GOOD (  22.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas, Emil,

On 2024-08-15 8:16 AM, Thomas Gleixner wrote:
> On Thu, Aug 15 2024 at 05:14, Emil Renner Berthing wrote:
>> Emil Renner Berthing wrote:
>>> 6.11-rc3 + these reverts:  https://us01.z.antigena.com/l/Er4kZWDmvL5-bLzHHJoZv0k71iwW2jCD5qNpiz0x0XdYY6oORF_nXh7U7jw6oubhi~32HI4i71jUW9v8~NvSvPeUWrdYx3WJBr2GPDUjOu6LYPCOBfR2dVQuMWvlNj4tDjXFp3QEQAmeawZflD4JrIJjtSYIbKfe6v-tgH7SEuHMeSSriU633Lv 
>>> 6.11-rc3 + Samuel's patch: https://us01.z.antigena.com/l/EULtAYky6ZvgqZ49KGS-WBsYTg~Ht1NoQtEYmUVb56ymS9jDagqYHLK90WDjnVt69GfB4IX5NSRQXmSfkNsTzB8lJmFvDihHQmGrsCv9FzlorD9yGfXDlQ6rG6vmn5BNDwlipmssGaOGfh9yko8n9ArWR4TLhEf~f9ODqme~NXXwA9DLLc9p 
>>
>> I think this confirms what Charlie found here:
>> https://lore.kernel.org/linux-riscv/ZoydV7vad5JWIcZb@ghost/
> 
> Yes. So the riscv timer is not working on this thing or it stops
> somehow.

That's correct. With the (firmware) devicetree that Emil is using, the OpenSBI
firmware does not have a timer device, so it does not expose the (optional[1])
SBI time extension, and sbi_set_timer() does nothing.

I wrote a patch (not submitted) to skip registering riscv_clock_event when the
SBI time extension is unavailable, but this doesn't fully solve the issue
either, because then we have no clockevent at all when
check_unaligned_access_all_cpus() is called.

How early in the boot process are we "required" to have a functional clockevent?
Do we need to refactor check_unaligned_access_all_cpus() so it works on systems
where the only clockevent is provided by a platform device?

Regards,
Samuel

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/intro.adoc

> Can you apply the debug patch below and check whether you see the
> 'J: ....' output at all and if so whether it stops at some point.
> 
> Thanks,
> 
>         tglx
> 
> ---
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -2459,6 +2459,9 @@ static void run_local_timers(void)
>  {
>  	struct timer_base *base = this_cpu_ptr(&timer_bases[BASE_LOCAL]);
>  
> +	if (!(jiffies & 0xFF))
> +		pr_info("J: %lx\n", jiffies);
> +
>  	hrtimer_run_queues();
>  
>  	for (int i = 0; i < NR_BASES; i++, base++) {
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
