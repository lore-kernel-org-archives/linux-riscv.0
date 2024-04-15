Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C809BC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qu1V90fOl5kccNz43p8XNVL3I0g872SQ+oreoO4E324=; b=XPBUkJoCHWf5C0
	avJxW3xwVDMm9I2HoCyJEZWmFa72lzxx1uWn1/DXoZxT3zPzQmuf8hI3YNIuZdH5Kj3mo9JGbA1bO
	3GfjpoymOQGiJNamBma60F63H9vNrWYbE/UKSWkFSzEKAtl6ZSAC0uNXsF6ja269jfbKLZv7YOLcT
	aThrzf95Re+QOszfn43uyDwztkfjzgq18xbVHznJ7DzOCrjEf4g1NP+d3iIDmq5dUI3NU9izqQXdd
	VM47+AQSJkeCM2Xyr7p8xEktpzFDyQ7A1Hq5Z5nPqOYpCXa9r59oZV9XKTfxi2MQH9r0sqbkRCY32
	Lmorrg3gD2zmq/No1Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMB7-00000008PpR-2jZ8;
	Mon, 15 Apr 2024 13:15:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMB3-00000008Pmi-19Da
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:15:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41881bce2a8so748975e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713186915; x=1713791715; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkfoH6pgevkYBCq40yfYP4WU2j0tmJHdJg6k4nyDGog=;
        b=XAa/5mxM2KTS3TZuAUd/uD62LQ1zpwsaw53311Mzomo6BwvMSk1M791u098zLc0nAW
         p3E3KRroGgHxsBoqHlYYI7WOV3QBXANd2yQNFuZSu5jY4++fBMC0PH+viTMLEEylMPn4
         6jzuB/kqKdigBVNrDG6wYtpmdFsUR/c3Ynjm2Kh0wgZo81xaAioNhzTp+DTWKAkT1tRo
         pAL+nICn4smUmz7NBYFjBQuxgrnn/2Lca6ImNipCygfvUDwe0uHym+KpnbEKzRX6/qd5
         53it+ZR6V2mIQevjUiV0EceFkAZq3VAAfMVMMPL7+ETx2eD4T3264X0yrvr+JYW8CJ61
         Z6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713186915; x=1713791715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkfoH6pgevkYBCq40yfYP4WU2j0tmJHdJg6k4nyDGog=;
        b=sJtBecMAonkuPDQhmMZL0hDCfaH8zvbst/sLdTnwl6XYBbI/xbNN6WZV9OduJaqO44
         kO0Z+O2OQg14Ja9rIJB5WytLHjp0pTgYSuNDPXz3+vd952LHksGGA7gpYkL+IXrw8xkr
         TFC8rrdC9t5LJtmh2oW1SUPUkTAyrNIcUE8xoek4QVAy9hZ4lOHMFIztrFsScZWFwGKm
         r+4bzgfu53t2F4wabuE+P+Br7B0qru8IMWUtNCZCU/wXPhA6rfpY3CDyfiwGxQQGstZ7
         CGY9nD062lyck8aQWf46SqPM2+Kh+DDRE/l+Oz0Bx5v5bqyapejuw4/A+fTNgRpYABQu
         P2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXvPiFqRqclhDyC7ucUYObCvp5+4j/uxmmbaCW1p4Uj7yzBKmlKch7FH31cS0Aa6V4lh1q2ju7ECLBNwKeieYglVfmCsf5aoikzC3lIfU7r
X-Gm-Message-State: AOJu0Yz9vBENT+u/Cohfi+UHQNkRPbDnEpx8ZBkRwDnl1NepQXATPfeJ
	/LpfF1xq1Odu0ZO24sOzqSf8FA8c99nTrPbHqrhNIFcphoYQjL2jDS4MWEEi1Jc=
X-Google-Smtp-Source: AGHT+IHaN+91KLEi7R/RxmtZuQH0jSX9Ui8qFAfF8HKSuojq26EX0a+2rvsHFXS88Kq+hml8I98gaQ==
X-Received: by 2002:a05:600c:4f4e:b0:418:2394:c60e with SMTP id m14-20020a05600c4f4e00b004182394c60emr3981791wmq.24.1713186914737;
        Mon, 15 Apr 2024 06:15:14 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z15-20020adfe54f000000b00345c2f84d5asm12068662wrm.10.2024.04.15.06.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:15:14 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:15:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 08/24] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Message-ID: <20240415-1654deb9446d6c0ebb858b30@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-9-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-9-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_061517_324283_43F727BC 
X-CRM114-Status: GOOD (  25.97  )
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

On Wed, Apr 10, 2024 at 05:07:36PM -0700, Atish Patra wrote:
> SBI v2.0 SBI introduced PMU snapshot feature which adds the following
> features.
> 
> 1. Read counter values directly from the shared memory instead of
> csr read.
> 2. Start multiple counters with initial values with one SBI call.
> 
> These functionalities optimizes the number of traps to the higher
> privilege mode. If the kernel is in VS mode while the hypervisor
> deploy trap & emulate method, this would minimize all the hpmcounter
> CSR read traps. If the kernel is running in S-mode, the benefits
> reduced to CSR latency vs DRAM/cache latency as there is no trap
> involved while accessing the hpmcounter CSRs.
> 
> In both modes, it does saves the number of ecalls while starting
> multiple counter together with an initial values. This is a likely
> scenario if multiple counters overflow at the same time.
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu.c       |   1 +
>  drivers/perf/riscv_pmu_sbi.c   | 224 +++++++++++++++++++++++++++++++--
>  include/linux/perf/riscv_pmu.h |   6 +
>  3 files changed, 219 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index b4efdddb2ad9..36d348753d05 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -408,6 +408,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>  		cpuc->n_events = 0;
>  		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
>  			cpuc->events[i] = NULL;
> +		cpuc->snapshot_addr = NULL;
>  	}
>  	pmu->pmu = (struct pmu) {
>  		.event_init	= riscv_pmu_event_init,
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f23501898657..e2881415ca0a 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -58,6 +58,9 @@ PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:63");
>  
>  static bool sbi_v2_available;
> +static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
> +#define sbi_pmu_snapshot_available() \
> +	static_branch_unlikely(&sbi_pmu_snapshot_available)
>  
>  static struct attribute *riscv_arch_formats_attr[] = {
>  	&format_attr_event.attr,
> @@ -508,14 +511,109 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>  	return ret;
>  }
>  
> +static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct cpu_hw_events *cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
> +
> +		if (!cpu_hw_evt->snapshot_addr)
> +			continue;
> +
> +		free_page((unsigned long)cpu_hw_evt->snapshot_addr);
> +		cpu_hw_evt->snapshot_addr = NULL;
> +		cpu_hw_evt->snapshot_addr_phys = 0;
> +	}
> +}
> +
> +static int pmu_sbi_snapshot_alloc(struct riscv_pmu *pmu)
> +{
> +	int cpu;
> +	struct page *snapshot_page;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct cpu_hw_events *cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
> +
> +		if (cpu_hw_evt->snapshot_addr)
> +			continue;
> +
> +		snapshot_page = alloc_page(GFP_ATOMIC | __GFP_ZERO);
> +		if (!snapshot_page) {
> +			pmu_sbi_snapshot_free(pmu);
> +			return -ENOMEM;
> +		}
> +		cpu_hw_evt->snapshot_addr = page_to_virt(snapshot_page);
> +		cpu_hw_evt->snapshot_addr_phys = page_to_phys(snapshot_page);
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmu_sbi_snapshot_disable(void)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
> +			-1, 0, 0, 0, 0);

The SBI_SHMEM_DISABLE patch got moved in front of this patch, but looks
like it was forgotten to apply it.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
