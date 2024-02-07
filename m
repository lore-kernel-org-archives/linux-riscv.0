Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB31C4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 18:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rE08/uBEMRE1L8iJj5F9ZgjgS/5K2jTfVDqupeDlgnw=; b=sd2bBVkKbcv3Ui
	lfnufp7GJlER3n1mfNrY7MeOXa8XWgHjgcsx4EiQSToAQzOPNP9m2yT/WoUQXPdwzybeY/ASdLVUz
	glGXm8dnIL9VN2fC/GMMV6TBuN+p/Yx5tPcykScMu31tArDN7qIHwSbvCpOnaQigB3pGBCPsBEIyP
	qk/4nR62/nUxoreDzIbFaT19N3TZlmdj1dYSUTNUQtRG81D+3Xf7sOMTte/IR3Zu0A215mcwBNXgr
	lVVUkt4da+iQWz9R8lQaYUEGXZDYfVqPfgyxGxf5+lRTQdpCxpwuIzDVrMatSOblTQuuFADDP490M
	34Z5HTMcuJZYwIJDOBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmOq-0000000BR8H-12Xj;
	Wed, 07 Feb 2024 18:11:56 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmOn-0000000BR7s-1tZP
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 18:11:54 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so839745276.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 10:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707329511; x=1707934311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsW74Q1+T1mksmXsIbj29+DJwVSribZJe7h8Y37ezZ8=;
        b=WDUodB/bFk1OHksWDoXNDA1feiWWu3sx6aZeLO1YQ8mK9hBCE1WX7Iwptlwv9gU6ZU
         xjWbWhkSdKw3GhfnzSUYXvtwOtx+xGscrNzpOUfVHQEymqJBv2kOnSqer1kNkY9xFaP5
         gcs6ZeSO5ukSxspc+ixyWRX3k/9xiFPLtCTx6SrAt7u2Pu1TU1e93v8IoCdsgY+CqRTx
         tAQrY0wiu21bcmCfC5O8po4gKKoUbY5+Subn298FRtFZOTkud5O9aTVe0ujbScGAyklm
         IBLppDP7/RzG7wiKr1NcRO5JDVW8NAcGdi2Q6ahk3hdDl3nMN6p5W7ma0j0xZu5idxme
         YXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707329511; x=1707934311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsW74Q1+T1mksmXsIbj29+DJwVSribZJe7h8Y37ezZ8=;
        b=uNQp7GYRq2v94jxamP7K/crEvnCSDEzOKgLXt+e5MwGgDmy2gYcYVjPqIrJpYtCbcB
         s1yolETVWolQOIqgRzP+3Ep6aqlDnLCAm1J/q8felp0E0HHjrxqImP67jI/oKxyvjJ7y
         /97yCwI8d8G4XeZmXhRMGJI5tUz2hqoGvruUU7uoLN+DRDvQdSDWtxfDDQsUE5YEMQxg
         w8EaXqz7EUxw7FvysfEOeNga+KaQkwYf9amTRUqY9YBQXhGHrUct3wlJRXh/UZCzNZF9
         Zi/3KUpgTPTA1hTA61Ngm4qNP8oJF3D/p99rBqP/GxrNzFyi9vkUqjBSv/593LvO5NY6
         NvKA==
X-Gm-Message-State: AOJu0Yyn9Ii7FQzkZ5AodSplzl8WZGFqOhKb4VVvFuV42koy6pue9TGP
	qn53HApOqyyDqUX8FZ+PFxowTFYzdVRXNzmCjkTuzj7QLXiOPU3Dy9/wriHZt18=
X-Google-Smtp-Source: AGHT+IGqZ0PdGpZMTBV9zF8UO5NAGQRLPRdqGQhiGhIPGCtJUZIMcIORIqQV5b1hc7bjtFSOILoTUA==
X-Received: by 2002:a25:9304:0:b0:dc6:ae82:ed36 with SMTP id f4-20020a259304000000b00dc6ae82ed36mr5929066ybo.40.1707329510906;
        Wed, 07 Feb 2024 10:11:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcQ5OWT4CCOH/PP3Db4QUMkXA+yDlW1mbkX17EfCnXO5gK8WOP/Xozf7ihPYcix4koure7BaQW5jT+ar6hA8rU17AbGDtV9covzDt1yNLSG1P4laJoHR0ntUhk99ZUWbfKqm1YcNQqULJ7eQVL29wLgObNrVDkiLAvQdf+eFAwVvHPODwymRFSbyhAkiecQm7NU/yWYul68ExHWOfZVCb2tfBlPnAHZtfglgzEMwc35w1Oc+/TSnmVvH1MHnuSKrc8LZwgCDwwCYsb6KDShzTJWPNbkQVMLbcYNjFafFVuFJ0WiN631bsWhNTiTBkQKnUF/lsOjBbj8vrqDVTrB7EJhC2Rb2k+J2fxVJDrRj7AfQ==
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id f6-20020a5b0c06000000b00dc6da5dbe1csm292874ybq.39.2024.02.07.10.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 10:11:50 -0800 (PST)
Message-ID: <22d7dcc9-a14a-4e96-bfee-dd358af0afd5@sifive.com>
Date: Wed, 7 Feb 2024 12:11:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource: timer-riscv: Clear timer interrupt on
 timer initialization
Content-Language: en-US
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: atishp@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ley Foon Tan <lftan.linux@gmail.com>,
 stable@vger.kernel.org
References: <20240129072625.2837771-1-leyfoon.tan@starfivetech.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240129072625.2837771-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_101153_702653_39CA6CE5 
X-CRM114-Status: GOOD (  15.64  )
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

On 2024-01-29 1:26 AM, Ley Foon Tan wrote:
> In the RISC-V specification, the stimecmp register doesn't have a default
> value. To prevent the timer interrupt from being triggered during timer
> initialization, clear the timer interrupt by writing stimecmp with a
> maximum value.
> 
> Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
> Cc:  <stable@vger.kernel.org>
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> ---
> v2:
> Resolved comments from Anup.
> - Moved riscv_clock_event_stop() to riscv_timer_starting_cpu().
> - Added Fixes tag
> ---
>  drivers/clocksource/timer-riscv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index e66dcbd66566..672669eb7281 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -116,6 +116,9 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  		ce->rating = 450;
>  	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
>  
> +	/* Clear timer interrupt */
> +	riscv_clock_event_stop();

This change breaks boot on Unmatched. The bug is that the above call to
clockevents_config_and_register() sets the timer (see below), but the timer
interrupt never fires due to the added call to riscv_clock_event_stop(). You
need to move this line earlier in the function.

Here's the stack trace from the initial call to riscv_clock_next_event():
riscv_clock_next_event+0x12/0x3c
clockevents_program_event+0x9c/0x1c6
tick_setup_periodic+0x82/0x9e
tick_setup_device+0xa0/0xbe
tick_check_new_device+0x96/0xc6
clockevents_register_device+0xbe/0x128
clockevents_config_and_register+0x20/0x30
riscv_timer_starting_cpu+0xa2/0xec
cpuhp_invoke_callback+0x160/0x61e
cpuhp_issue_call+0x140/0x16e
__cpuhp_setup_state_cpuslocked+0x186/0x2b0
__cpuhp_setup_state+0x3a/0x60
riscv_timer_init_common+0xea/0x184
riscv_timer_init_dt+0xbe/0xc2
timer_probe+0x70/0xdc
time_init+0x74/0xa0
start_kernel+0x194/0x35e

Regards,
Samuel

> +
>  	enable_percpu_irq(riscv_clock_event_irq,
>  			  irq_get_trigger_type(riscv_clock_event_irq));
>  	return 0;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
