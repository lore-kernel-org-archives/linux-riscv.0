Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1ECC10F15
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyqyiF3sqTROYUymS50pvzGnVJ8uJsK9lD+/TQhb7DM=; b=l0X5148gzSErkz
	dmPz/sMU9i1UkdcjQvgQ6nausT1+4mZbhoPch5VGaaPGiPy49FlBJr7kHEfaJqC6MaEcXtdNHWzIU
	OHuJJRhp83QCCHoAmorhILx7x1ujIfl+J3FfH3uJLkSlzzghjee82mg2wERfz/2v1eoRJ573nVJYb
	x3OJJEVsfUx8gyBtxTR3bwYeSGzuKqQgR+WzAIsiD90AQYXxcXqlpxtXIP81tL3L/s8ryniOB23uT
	8inq1uXNhnIrnhDE2C6f0xSRdnyHzpGSi6tPtjmUe5jgOBqr7YekNiBzk0/7Wb3Rzc3MtdfSrQRVE
	M/xIzs57frR5nOCW1gVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05OY-00000009zTe-1sje;
	Thu, 25 Apr 2024 20:08:38 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05OV-00000009zSh-42WE
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 20:08:37 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-36b0ae2b7d7so6418495ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 13:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1714075714; x=1714680514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmZS627iyI6cXvDn9mYzVXZNUslQZgCxIUmm314nlkE=;
        b=MbMMw7TtLeA/8H8S5Ld/crBPcCSul4N7wZdiuhA+x5JkTPLLXaPUXnjE7tixwissN0
         YlDkHhjrCYinHEmkup7zXkgEo884t2b91+A63o9NHU36RFIF3JxXvulcfxUWd+IyiN0n
         d5CVH/Vs6D48bpEWf0U/wDDjRxIz+ZQ/xnMoCBb35RkF9j8KWmi/drIJB0zXz/dpzy2p
         4NTNZpNDLO7H+9rKJWfARTwVN1Ha2Fpsvia4FpRriGrZPBJlG4FPfiT7QGlmSftpf7BD
         2deH9oRg88v2RyvrG2Fx9YejE71EoTHIt6HGYuZcK5KcFyHIG6UJB3ZwSTAn++OYhmBx
         i24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714075714; x=1714680514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmZS627iyI6cXvDn9mYzVXZNUslQZgCxIUmm314nlkE=;
        b=YvmSNN8ShvB1OblJ7F1yA6DIbxF/JK3pelK04GNl/8bVm/vUuPBc5361IUGun/RiCp
         C1LGTwI93BeYFbsTYDQMno2sxzqDt7+xSMJG3BHLKVRShrr+18rL6i/Io9kp0u6QT5Bs
         +Kp+kmjCW8A8GeUEZMaq15yL6nY+fc0aO9pVVmowG5lD3jJiDAV4ednk4zSrnEcHoaVs
         Ug06KMTq6OW+/ZMhjwhcuqUe4MhwLaHg+sS0rv+S0ZhVZsh6+KeAfQM7BLAi+rbIkmXd
         7kKSqSF254vtbdXM1M/a+Rp9imMxszFArlDLlqDx2zSdViyUrYi/Y6zhRa7EBMnSK5q3
         DH9A==
X-Forwarded-Encrypted: i=1; AJvYcCVm7r+bFhy6Wq3KEgUXB3mTHuou2IJNDsbwzZ86zE1P6j8Yvb5E3B6ZqamDqoOtTXkwhaeRJGmoe+fcro7H6zG3f1H6+X9q2YvHqQwHkqLh
X-Gm-Message-State: AOJu0YxzAJEmY2nTAEIfAHBvP7TwBD7gcrJMqUS3NAJDDIJnXHSx/reX
	/s8P+1qA7aS5X0s5hhDEKDdrW3gi4CXucD5mFR8pkr0afIORSNdMOt8X56+mkNQ=
X-Google-Smtp-Source: AGHT+IF7UibZ9Tq2CyV/lcHoINwh7wba3leqbYShtMwVRmIS9aOy6+dNx8r1b604+CtMfbV/ku5vLA==
X-Received: by 2002:a05:6e02:144b:b0:36b:24c5:eee5 with SMTP id p11-20020a056e02144b00b0036b24c5eee5mr885883ilo.27.1714075714321;
        Thu, 25 Apr 2024 13:08:34 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id p6-20020a92d286000000b003687fe513f2sm3634471ilp.2.2024.04.25.13.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 13:08:33 -0700 (PDT)
Message-ID: <d2742ee1-7e3c-4c0d-8172-d3543fe78e5e@sifive.com>
Date: Thu, 25 Apr 2024 15:08:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-riscv/for-next 1/2] drivers/perf: riscv: Remove the warning
 from stop function
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
References: <20240425232933.4111680-1-atishp@rivosinc.com>
 <20240425232933.4111680-2-atishp@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240425232933.4111680-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_130836_014462_BDF7D7CC 
X-CRM114-Status: GOOD (  16.78  )
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

On 2024-04-25 6:29 PM, Atish Patra wrote:
> The warning message was initially added just to indicate that counter
> stop function is being called while the event is already stopped.
> 
> However, we update the state to stopped case now in an overflow handler
> after stopping the counter. If there is another child overflow handler
> is registered (e.g kvm) it may call stop again which will trigger the
> warning.
> 
> Fixes : commit 22f5dac41004d ("drivers/perf: riscv: Implement SBI PMU snapshot function")

This may be intentional, since you wanted these to be squashed, but this isn't
the right format for a Fixes: tag (no space before ":" and no "commit"). Otherwise,

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 36d348753d05..78c490e0505a 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -191,8 +191,6 @@ void riscv_pmu_stop(struct perf_event *event, int flags)
>  	struct hw_perf_event *hwc = &event->hw;
>  	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
>  
> -	WARN_ON_ONCE(hwc->state & PERF_HES_STOPPED);
> -
>  	if (!(hwc->state & PERF_HES_STOPPED)) {
>  		if (rvpmu->ctr_stop) {
>  			rvpmu->ctr_stop(event, 0);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
