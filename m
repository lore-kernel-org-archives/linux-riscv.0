Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85293C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMtI1Y/IQBhcPr6bu07AjA1HWgsQnD7l5K840Zdn+ns=; b=Guf1EeqwWKK0cg
	c/iwBbbCFT+LzFfc2zuuqbM732Hhh8+QXfo30FoSMHnqP8TQzIS64Rv/paXszaHDIMo3F+hCWXZNt
	0VTzA3QqJ2tyC7V0r/C4EdiENBbTzh7ZmAF95rScwXkEns8HTt22XyVkVKAmaxehJxM8/nFd58CCX
	UkKdkj/dmYy70XgKRhvpjnoDntQFLXYaOG1hEhixLmzQ8VAYLdc3pE5nFOc+lCSTCDLP88Nenoh1X
	NsOSW+oxawhufML4JtGM836vv5BjwcsMobirkPDsgDSoGAP5KOa1j9cJhPHeN4iQ7Wu6VHV5EIe3r
	U/aAg91HV+sPIg0DtsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk66p-00000006tsN-3yNM;
	Tue, 12 Mar 2024 17:40:15 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk66n-00000006trc-1W9c
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 17:40:14 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7dae66def19so110320241.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710265211; x=1710870011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpw2E4SJc0M22jdFp92JFgYe9UBmYMEBdWoo4cjNNVw=;
        b=iBw/Hy+OFIWwyDziP54uO3qS+aMUPEEramrzx7usMBtuo0Bk8M5Y4FxYnEZqdREdg0
         XkG8+aop1imYnqaAJXL4bN+FZV+sSHk5uW6ap/TN7VRbjBw2JLWJhKoItMJop0elHvRM
         nkcKI6Q+P4wCzw/ruJ0s2uf10A6ipJecnNua47BpcjeO19bWG96xc4A3rXvpkX+EOZ27
         9Er/q2eLsYBX9zbQXZeZHckWAubDifyfvJLKXOmJE7ItwKTdvCHimn8VblgGNPq7a7ZP
         aN7Xf916ArtrAE3gwNcLMYUPKZkf2tq+pMu/Kfym7Kr3r2TFkaGMZ+DEF+8h9R5de2ui
         uMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710265211; x=1710870011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpw2E4SJc0M22jdFp92JFgYe9UBmYMEBdWoo4cjNNVw=;
        b=CQFr7wyCsAEgqP7vjB9VuitFecUIeKaTXoheQ9ERilmrVyi8hrQyWg/kSp56YHi4O8
         WQmkY4aTSfD1cbLX5ltinK+31HqOeD2OiIv/Hzxm4tqar/uP8J6UNTrSaSjgGTbJ8oJ3
         aqTcGrdSRVnHOaESq+vZPKrJlXzB+GWnqQQfeHvwxtA9I7w/2zJYtbkvPaPJM4zAcOdP
         0f9F6ORoX1vM7Ei8IdGdsOqMKvhvd8/M36FiShtBnzn8vfi7zYVHkCKuUB0viPuMia/j
         F0R1p0jTqr5tP/REIRehtsUMZpX16KiJoLDYl7JbZRho0l/BYQ7cQpSN5Y8wfidEoWip
         8Hvw==
X-Forwarded-Encrypted: i=1; AJvYcCVWqB2ZbOpddh/6SY4hN39t7oKoJTfZP/xJV6+dRTKVbAZzEML8YNjTZaq0Ui/z1qmFNtSB+nB19NDyNNgt7LRswYLCUXGPD5kjxZDq6y10
X-Gm-Message-State: AOJu0YzEm7rBghPP/BsNfsftf4eYMI9aSTfKTP93EgKOSWM1x0Ded3Nr
	BmUnfd+6+PMk0ZKYgZqDyn7XDoKFQml1r1cldgvxgLdvKbH2Iw0GGwwZXdBskNs=
X-Google-Smtp-Source: AGHT+IEd4hdtpXCmBTFIuQSY5VdumAtaZdC3rn4gdZrVXmnlmWQRxKpf+oJQ07k7pUQvySNuNaMayA==
X-Received: by 2002:a1f:7d07:0:b0:4d3:4aad:1b9c with SMTP id y7-20020a1f7d07000000b004d34aad1b9cmr911341vkc.0.1710265211052;
        Tue, 12 Mar 2024 10:40:11 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id j6-20020a0cc346000000b0068f6e1c3582sm3790897qvi.146.2024.03.12.10.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 10:40:10 -0700 (PDT)
Message-ID: <f9cc5817-234e-4612-acbb-29977e0da760@sifive.com>
Date: Tue, 12 Mar 2024 12:40:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clocksource: timer-riscv: Clear timer interrupt on
 timer initialization
Content-Language: en-US
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: atishp@rivosinc.com, Anup Patel <apatel@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ley Foon Tan <lftan.linux@gmail.com>, stable@vger.kernel.org
References: <20240306172330.255844-1-leyfoon.tan@starfivetech.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240306172330.255844-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_104013_505721_2416621B 
X-CRM114-Status: GOOD (  10.46  )
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

On 2024-03-06 11:23 AM, Ley Foon Tan wrote:
> In the RISC-V specification, the stimecmp register doesn't have a default
> value. To prevent the timer interrupt from being triggered during timer
> initialization, clear the timer interrupt by writing stimecmp with a
> maximum value.
> 
> Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> ---
> v3:
> Resolved comment from Samuel Holland.
> - Function riscv_clock_event_stop() needs to be called before
>   clockevents_config_and_register(), move riscv_clock_event_stop().
> 
> v2:
> Resolved comments from Anup.
> - Moved riscv_clock_event_stop() to riscv_timer_starting_cpu().
> - Added Fixes tag
> ---
>  drivers/clocksource/timer-riscv.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
