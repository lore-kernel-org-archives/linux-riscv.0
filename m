Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D1FC636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9U9rrp1NYwFEY4ozi9VNWXLfaoZrRAmZK0v7+E/wTgs=; b=lxb6xV3Nk8oLKYAsdlGQ1+Co4Z
	8ddTP5FT3vz/poZC80Jsm7hy7IenDLyaupYWgx7Yk5tykoJLbdqy503llSU7XziSMzySMLBEcOh2O
	6UdsGXhAVDWFlOOKmBIMYge/KYbHq61UkE4BP0aVoXvx8ezP5LlF/GAw1vF1vYcLCz/xn4xHJi/Lx
	PeLRQzX8MgM7aTlLD5Or2+L2lvEYIA/KQshFX8xnyBUuY6d+rA6Op4grN36DRYzvfsc6EkbpL9F6p
	lKqD3gc63ob/tcMOoLWTHotvIlZODM3AhbeD2i/KAC0dBvQsz2Qihn9sIEV9oq7QKtw21jDW8yozY
	qCXgaE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDeX-003Bv1-49; Thu, 09 Feb 2023 20:36:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDeT-003Bty-VI
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 20:36:20 +0000
Received: by mail-pl1-x629.google.com with SMTP id o8so1859910pls.11
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 12:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FP60phxXmm0WhYSgn3CIO/JFGc6EWI16kLsCgTK4Og=;
        b=dHLK4TkOa4fkDNGjjnndev7N6sTnN1ObsXe852ON+Wo0CtTcV8zZTJjA8r13ULTZ4m
         63TaM2RMtSeWZ5B7+8khmTUqvXcjkOeBkI9YgI93UU4S3GRDlXO/Xsi23Ek0v5xq5c+u
         aImS6U2j0R/qu8EXGaN1w+9Yv6oIWYc4yqUKFNAXNfNxKzQ+3aTJ0cTQyZ6IutUjc8Bd
         2OkP8wANfxcFy8Bwtck0ejj0rIXtJEbZbSlLNL+hM4X2dILI1Ncy0CUSvsbiaXxujGYu
         g73TfxUgDhgbRQRV/NOQURDMxd0kTazmBwxtVcUj45HSypSDWcJ8jKz4sPEfqCltMiQz
         U2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FP60phxXmm0WhYSgn3CIO/JFGc6EWI16kLsCgTK4Og=;
        b=r+MqxUeXCA7TKWqWORxZFCxSyaaTBU+tuHKNGvPlFNH78dbLuwnrKLLHe6mZFMz4oU
         MNPC+3ZBHdyqhH7o6gIxFqjiDL5CgxDvTmPSeddcldIi5tvN6u9R4Zu//yMQxTdoQTN0
         byBCZannJTzzHxPCc1iJxCteo6CREXrw6HOXX0/TGFdkjNr19+AyJojqZ0yoYCl7DlDR
         SF3M5yjgFJ/wMq92KYXN/jliS2x1jCQXBHNsK0HAxOdcr4yuLK16KTMoHdevzGFgunYc
         YUScCygIVuO/th5g5fWWXE9tEPcJUHBagneoI2IQuTZosGkGF8n0nkzH8NpFIdD1HQC8
         2UVw==
X-Gm-Message-State: AO0yUKX7H7gY/I3ZMVB4+PRfw4JbbBy7g+pAAnHaODkbApgWAzfxDjTo
	HKZOnQVg8tDX8w57nFNgx/d1XA==
X-Google-Smtp-Source: AK7set8ueCh8MZ68Gx41h0zuuIYyT5ckl5K+XpwKeZssGWuFXzxg/dzRNOmdnmUTitBHnloSbZoqow==
X-Received: by 2002:a17:902:f30d:b0:19a:68b2:5458 with SMTP id c13-20020a170902f30d00b0019a68b25458mr1323828ple.63.1675974974870;
        Thu, 09 Feb 2023 12:36:14 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jf19-20020a170903269300b0019a6cce205bsm468321plb.154.2023.02.09.12.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 12:36:14 -0800 (PST)
Date: Thu, 09 Feb 2023 12:36:14 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 12:35:31 PST (-0800)
Subject: Re: [PATCH V2] clocksource: riscv: Patch riscv_clock_next_event() jump before first use
In-Reply-To: <CDDAB2D0-264E-42F3-8E31-BA210BEB8EC1@rivosinc.com>
CC: daniel.lezcano@linaro.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Matt Evans <mev@rivosinc.com>, tglx@linutronix.de
Message-ID: <mhng-6fc3dd67-9502-4c46-91b8-4837116d097f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_123618_315163_7AF65FE2 
X-CRM114-Status: GOOD (  22.93  )
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

On Wed, 01 Feb 2023 11:49:42 PST (-0800), Matt Evans wrote:
> A static key is used to select between SBI and Sstc timer usage in
> riscv_clock_next_event(), but currently the direction is resolved
> after cpuhp_setup_state() is called (which sets the next event).  The
> first event will therefore fall through the sbi_set_timer() path; this
> breaks Sstc-only systems.  So, apply the jump patching before first
> use.
>
> Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
> Signed-off-by: Matt Evans <mev@rivosinc.com>
> ---
>
> V1 -> V2: Commit msg tweak.
>
>  drivers/clocksource/timer-riscv.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 969a552da8d2..a36d173fd6cd 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -177,6 +177,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  		return error;
>  	}
>  
> +	if (riscv_isa_extension_available(NULL, SSTC)) {
> +		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> +		static_branch_enable(&riscv_sstc_available);
> +	}
> +
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
>  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
> @@ -184,11 +189,6 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>  		       error);
>  
> -	if (riscv_isa_extension_available(NULL, SSTC)) {
> -		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> -		static_branch_enable(&riscv_sstc_available);
> -	}
> -
>  	return error;
>  }
>  
> -- 
> 2.30.2

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks like I've taken stuff here before, but I'm also happy to have the 
clocksource folks pick this up so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I don't think this is a particularly critical fix, as IIUC there's still 
no Sstc-only hardware in the real world.  Given how late we are I'd err 
towards putting this on for-next anyway, so I'll give the clocksource 
folks a bit more time to chime in.  Otherwise I'll put it on for-next 
before the merge window (assuming we're got an rc8 coming).

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
