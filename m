Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A856CA0EFD
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2Zct06JhqyXx6vtP8Q9dduaMtYx9X8QD1/jRI0z1Ss=; b=JuRwBeRafIOUQ8
	wO9TYE1hMdP5r83k1NZqBSlthz3H4mjJGU72zBm/4TPQz0v5RVqMeh6tSSRBviBU5oEO+heKDWBep
	Ohwe8m4tc4B4mI3eGM6RGg6dlCxdxUvByUyj+4Ny+85yseOinkOPgFgk6pYLzHk5Z39VYpt3XPwJa
	wEQG5Jzdsby8uI+3YZEtPbUoyLgydKh9kMJsbSnA+yBbtrwS85SpOYtyhItkvFDeVQ5uczsxJrpI4
	FLa33OSWi/yCCvSx4MOjveOC+tS5EWeaVr9nlFUl3aj/aZ3EMFpmJumV4JVAoTDMmp9PgrI2suRdi
	dYANX7bG8Tuqx7KTJ05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk4fE-000000073vp-3fL1;
	Fri, 30 Aug 2024 16:39:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk4fB-000000073uz-34pm
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 16:39:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20543fdb7acso405205ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725035993; x=1725640793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXhOuqL854STd5ZQr5fPKbzs5ZNb8IMCUFzcuK2IV04=;
        b=MG1GBe6M0axxIvG9Z7VLHi4YiQ5N5w5w3Urg776LXdptPQCzNUIOqXUvqYgXNdho/7
         Ifq17zsEQYzO0wOfXKnVFizSF7HqzfL1h6MBXf91WxY59iUaTxQlVlFtr9a4uwM+fVlU
         ATT0d2PVmqZZRSlks63ZWWPOuZhPl4ttlD9vtWn+T4vgkaAAjH+tTlosWkIv1t9YUss9
         GBrUirzcEZWt8REf8rF6/amYcK9Y3GbsB0BowNKr570FzfadyLx1w66c4sk7FQphYO44
         iZbo9JV7mXe2Q3ztI4aasnw5raELwecEi5iBAfRFYenqZ/qk9V26dToqwhTiHNnb4xW3
         11Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725035993; x=1725640793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXhOuqL854STd5ZQr5fPKbzs5ZNb8IMCUFzcuK2IV04=;
        b=gZp+6A7EF22Ptf5y60EtrI41kUOLp3yW8Od1R7pJkV8cNfAu2yZ+yYAui/yNyd33Mi
         rNwBxNfkia0uX0hhbuDABazWDcL01YKR0eZ3VZ9ADHrDehTzglXoWhG4bixoYk/t31c6
         yhSsUOuExRAMGmdV5Pf1RMMNn0Nj8GmHdz/0nNxzQZjVQc51fxcxCkIFqml1M8JK5k8g
         d2VJdt5YML9JTx9Un2Gq+qTxUpFd9m23ZZ71dq7bjgLfiTNRNyHHL2NDdBcOwAPmmP9q
         3gShHQCKbdbq1VKXW2i4JPFUH/z5h0jG4RikGW/NfzEGzDek5yUtEJKWB83XUm4IQa8/
         jf3w==
X-Forwarded-Encrypted: i=1; AJvYcCViR39xKhHjDLzY0+ms3wLD5ly7UZFATNrMXutf17WQVv7M8bWlMG4O+0zp02b2fss8SlJ2TJKbRNaBcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnT5S6yewu74vUrf3f12/lmp7jFwgT4tNdmRiSGKkzmuwrEZAX
	QED4aZ56ogEmmzMNRJGx3In9Uc2O4qKhCcbposz5Sy8j0G0raJgN3C692rj6aKU=
X-Google-Smtp-Source: AGHT+IE6GEuuQ85tAdiCIrokN5B0H73Fw9Bwv0gUTFG6J9Bx1NclPQDdKmLH2RPFx4280oZ27e7nwQ==
X-Received: by 2002:a17:902:c402:b0:205:157d:cfe2 with SMTP id d9443c01a7336-205157dd273mr60806055ad.42.1725035992749;
        Fri, 30 Aug 2024 09:39:52 -0700 (PDT)
Received: from [192.168.1.78] (c-73-42-218-101.hsd1.wa.comcast.net. [73.42.218.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205345089aesm10748605ad.149.2024.08.30.09.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 09:39:52 -0700 (PDT)
Message-ID: <6d20b21d-7e88-4072-b33d-dbb45d2f0965@rivosinc.com>
Date: Fri, 30 Aug 2024 09:39:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v2] drivers: perf: Fix smp_processor_id() use in
 preemptible code
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Andrea Parri <parri.andrea@gmail.com>, Nam Cao <namcao@linutronix.de>
References: <20240829090034.15777-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240829090034.15777-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_093953_779212_31854F8E 
X-CRM114-Status: GOOD (  18.00  )
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

On 8/29/24 2:00 AM, Alexandre Ghiti wrote:
> As reported in [1], the use of smp_processor_id() in
> pmu_sbi_device_probe() must be protected by disabling the preemption, so
> simply use get_cpu()/put_cpu() instead.
> 
> Reported-by: Andrea Parri <parri.andrea@gmail.com>
> Reported-by: Nam Cao <namcao@linutronix.de>
> Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> Changes in v2:
> - Do not disable the preemption in static_key_enable() (Will)
> 
>   drivers/perf/riscv_pmu_sbi.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 31a17a56eb3b..febd8e74a72f 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1373,11 +1373,16 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>   
>   	/* SBI PMU Snapsphot is only available in SBI v2.0 */
>   	if (sbi_v2_available) {
> +		int cpu;
> +
>   		ret = pmu_sbi_snapshot_alloc(pmu);
>   		if (ret)
>   			goto out_unregister;
>   
> -		ret = pmu_sbi_snapshot_setup(pmu, smp_processor_id());
> +		cpu = get_cpu();
> +		ret = pmu_sbi_snapshot_setup(pmu, cpu);
> +		put_cpu();
> +
>   		if (ret) {
>   			/* Snapshot is an optional feature. Continue if not available */
>   			pmu_sbi_snapshot_free(pmu);

Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
