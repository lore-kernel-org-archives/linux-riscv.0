Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FC7C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9h3tL8af1oZIZ2IYqf93kcjwwUhFI1Ptm4WFLkKXbp8=; b=t3Lc+kvI08ztjG
	HYEkXS7pOnj4D+q2mSXEGLSMH7vNkUf6/YZFY0FFmn0ztugIBMGFK4UZ3SrNbCuuPDdCbRt3VMyiw
	ir1F5lWVk7JU3VYSBiq99ccC51wIVnMzsefQdT3Z7EvxPSAZlAd4Y9ub6V75Q96bfBVLUsDh52nH0
	3PxB6YXJc3PVewTZZgHaROGEFV1ImiI1oUrZc0PyKXp3ygC3zqz2retZjEm768HsNrReZBm3DAi5z
	L0ezV0hGb6O0CuLy+tsx79C575qgnMR+buwgb+gFBiXPSPtRr8AoGNnoPDhjloM0zH86tyYyjB6zy
	5bwSc6C8ajayc1LK5oRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSdt-00000006wbC-2Op0;
	Wed, 26 Jun 2024 13:24:57 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSdh-00000006wW7-2QZU
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:24:49 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c9cc681ee4so3475553b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719408283; x=1720013083; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wkp55ahjVZ0Rfp573fGCok3PgZ8FQzhwmhHHebz4g1I=;
        b=aauX51/12WvFU4Cn+nGBYmYo3/CmvEpgohwuRBaOQiN+2bYY1mZEJZsbBPSkueh6Zj
         NbqSwLZpQlkd/SQj2WD5X/Q6i66MIYKdEv0OEe/ZqVt8JuKJ3X1cwbu56jzW72UDHZEB
         mlbltlDQQs0icBrIBY3bmd4ClUAX2wUDeEq568hi3i2yWaDattVLj6mBI3ayy/7xcAz+
         fBUi2NBNkxhShxY66zJFlNkwBQcTD5kAgoxBzTbyWdQViLEzC9jysSHGi2/YI3Eqxd6w
         FuDmvjWNiStLSCrHSk6p9qbkyRyhC6AxXdtAGafbZs16hPmlkrMX5eI1LBe3CN1A/2vM
         VZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719408283; x=1720013083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wkp55ahjVZ0Rfp573fGCok3PgZ8FQzhwmhHHebz4g1I=;
        b=TejbGXQerkav0IYMz81G2F5MbgmWpHqz36otXi1Xcq5D0084nsI/gv5ho8KWNCXjzw
         W49EqcUec/lHVt3giCJYE+rcgj1mO3tYQ5ttvqSjjGSKHwhfUex+bGi+RN54kgj5umEl
         LVLetaFg7NEINAwXicfPMBZY2ETtj9acqLnGuDYsjCbNzD2iAptxbNXHSlRwOyfoLFA/
         sSIaBczUkSBn672fA55Qyk4mOy3/m5ZcW6o1ahrN4TUh3At8XeOd5puakTeBb5gtSLR3
         GzKTQ9KRnX4jKeSN7k08DNA2NdYYep4rRPpkc4n84b80B266z8oc1qOJtmKCZ8cL5vUx
         TycA==
X-Forwarded-Encrypted: i=1; AJvYcCUt+kHh6e36n2WDQU2zKJxZyuhUeqkza71QwhKgF2nG19eXTHaA6K6kCeNCrb15TsGvkgKuV7itO26u3TnoN4cAxVY+I8wHtqqCkwzCw25s
X-Gm-Message-State: AOJu0Yz/49gLE0W/AnBBtc85CZIsKMh2mSzOFr4UVG/cKHs3CBwIk7Nm
	uPeE2rR3fR1BwiYMsuyE/O9YPfhqL+py4BzPkXUbrMT6w4X4Mxjuf1xtuhoa5VI=
X-Google-Smtp-Source: AGHT+IGjUEEcz36KEcz+5nyRJUX3HiZuhEGJ4dUtFILeDTtVRJBPYTVudg8HhkaZzHTox5uiPEmTvA==
X-Received: by 2002:a05:6808:f87:b0:3d2:83:341c with SMTP id 5614622812f47-3d545a89b08mr12556384b6e.51.1719408283452;
        Wed, 26 Jun 2024 06:24:43 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344086c5sm2320908b6e.0.2024.06.26.06.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:24:42 -0700 (PDT)
Message-ID: <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
Date: Wed, 26 Jun 2024 08:24:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to hpmevent
 mapping while starting cpus
To: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_062446_059883_5BCFCD6E 
X-CRM114-Status: GOOD (  15.44  )
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

On 2024-06-26 2:23 AM, Atish Patra wrote:
> From: Samuel Holland <samuel.holland@sifive.com>
> 
> Currently, we stop all the counters while a new cpu is brought online.
> However, the hpmevent to counter mappings are not reset. The firmware may
> have some stale encoding in their mapping structure which may lead to
> undesirable results. We have not encountered such scenario though.
> 

This needs:

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

otherwise your commit message looks fine to me.

> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index a2e4005e1fd0..94bc369a3454 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -762,7 +762,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>  	 * which may include counters that are not enabled yet.
>  	 */
>  	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -		  0, pmu->cmask, 0, 0, 0, 0);
> +		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
>  }
>  
>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
