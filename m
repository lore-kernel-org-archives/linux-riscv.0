Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A17C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyuzSfKoGDK+/OjXwWVrlKc6u8sFxvQN3hz+W1Jdq/Y=; b=JZkUc34VrcfZu7
	004eMQ2EteAPmFn1ZdQzFNxYzvKNrb9NaQy4TK3sAlkAdYS0jrNBviBI1Jm8UrzT5XYLuz0UU4bEZ
	VECG0KWXdQ96r6geySivAbiZgb1QlFI4Qu/Q78tJh7mvkDxx0dgkqeSs1s2vSbsRAR3jaLfSIXCVD
	VqfeNr7KPRqhOfvR4nGDCNyBSPB8dvNoe2tQcEGiiEpT7h8KIHXegXj1dQsl3KjKgeN6Ky3sTuOzI
	hCSdAwjJWBqLc3wP54Eyxd4L7mHhIgxBK2xIh28P1lldoFdQBpjtIG/2DkAuBzCtV7KSJEFogOmos
	h1WdCHnbczac3UPSPHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWAQ-0000000A5kO-39ZB;
	Wed, 27 Mar 2024 16:30:22 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWAO-0000000A5ih-0R20
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:30:21 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7d0845e992aso18881539f.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711557017; x=1712161817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3/CPQu0kt0AK01jL1gmP6nDgmIk8fvdY19xmLzWhxc=;
        b=Yi8vWMk/ENyn5CtbxumV0Wkv1eZPq3j51PTn1fExMghL0bcz3lpDzXP9ErrwIFYahy
         i1l+vqC/CX7VubWRByQaTY3S6YtUjfFDmjL+nM7OW8RgtcsNgzGeVlcSBr/l3NmfhW2R
         MxK7e6VGwuZJEcmaNGeli2teWOIevg7GiNm0gR77FjKXrzJMnKCt/oqRcQMEM5b+H6xU
         eaety5eQZ98LEc3bNU2+yQQ3UoEQPbUiVjPNmPCgWmL7jjS2ueuA9YdiYRx781o4ULro
         kV9/hIrj2GUCPiuH+YbVDW4KZWErMZxki/kihTvXmVeJGd0fDzxhnijfVGT/GtqE5yqH
         Wy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711557017; x=1712161817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3/CPQu0kt0AK01jL1gmP6nDgmIk8fvdY19xmLzWhxc=;
        b=P9EipvzY7Hgndkow0MULEG2pBGdW+eUc06B4sU7aLYZHUvLiORUhOblwY1Vo9XQul+
         kS3BquCZ7Rv5jGyZfdWtUCa58flekymCncsF56kj9OEWJnmFeAqeQwbgckMXcDLIeAak
         Jv9tFyFPsRnMvdQC9LMmDQ9kKaJGTaWiBVWzomAmDMSEBvlckO8HpvTL6jL6X80If1oX
         9ZR+e/qyE2nL/AIKFbqfUkwyJ3tdgW9nHVQvDCjKVSYOOA7FRvaMP5Oqos1snpyqRQNr
         dKC8MAPz0Wlc15BIvPNclMB356V5ikPgcXQfg3O/yEnTrqV2FJ7W6mHkvqych7a6SWvM
         VyJQ==
X-Gm-Message-State: AOJu0YzjDr4qopHVgFvTRkX6F91I/mkEAGrIij5Mg3GpykSCoKZ7KIsj
	mVI2koACcwbvX5cw31uLg6XpJjU1WPCXDqarlvGwezzAl7EOSL+hQZhq1EtIhAf0YrE6bPuzCml
	K
X-Google-Smtp-Source: AGHT+IEy3lKCG/WWVtYoOT4PxqKJ027BC01H+gdizwaqfKFmuLxv8JHVT57g0CZAesVwbRKs+7j44w==
X-Received: by 2002:a6b:da06:0:b0:7d0:2b22:7221 with SMTP id x6-20020a6bda06000000b007d02b227221mr502270iob.20.1711557017625;
        Wed, 27 Mar 2024 09:30:17 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id h8-20020a056602130800b007cc840d1d0bsm3647584iov.25.2024.03.27.09.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 09:30:17 -0700 (PDT)
Message-ID: <4f89f7e4-cd89-42a7-a13e-5eb25f7b2f4e@sifive.com>
Date: Wed, 27 Mar 2024 11:30:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-clint: Add
 set_state_shutdown
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240327153502.2133-1-jszhang@kernel.org>
 <20240327153502.2133-3-jszhang@kernel.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240327153502.2133-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_093020_202382_0FD78271 
X-CRM114-Status: GOOD (  15.28  )
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

Hi Jisheng,

On 2024-03-27 10:35 AM, Jisheng Zhang wrote:
> Add clocksource detach/shutdown callback to disable RISC-V timer interrupt when
> switching out clockevent from clint timer to another timer.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/clocksource/timer-clint.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index 09fd292eb83d..56cf6c672e6d 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -119,11 +119,21 @@ static int clint_clock_next_event(unsigned long delta,
>  	return 0;
>  }
>  
> +static int clint_clock_shutdown(struct clock_event_device *evt)
> +{
> +	void __iomem *r = clint_timer_cmp +
> +			  cpuid_to_hartid_map(smp_processor_id());
> +
> +	writeq_relaxed(ULONG_MAX, r);

This needs to be ULLONG_MAX to produce a 64-bit value on riscv32.

Regards,
Samuel

> +	return 0;
> +}
> +
>  static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
> -	.name		= "clint_clockevent",
> -	.features	= CLOCK_EVT_FEAT_ONESHOT,
> -	.rating		= 100,
> -	.set_next_event	= clint_clock_next_event,
> +	.name				= "clint_clockevent",
> +	.features			= CLOCK_EVT_FEAT_ONESHOT,
> +	.rating				= 100,
> +	.set_next_event			= clint_clock_next_event,
> +	.set_state_shutdown		= clint_clock_shutdown,
>  };
>  
>  static int clint_timer_starting_cpu(unsigned int cpu)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
