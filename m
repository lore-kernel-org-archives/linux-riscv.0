Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF60E83EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khOaXV7U1pk4E5yuquHaaAHmM+eVHZMYotsfpMr9n2Y=; b=yRMjdha52lrLn7
	Qyw1Yeb4WWjvLzU0AYqN0yRBSTX0yBWbpmnJxP6QsxNEkVNWE+dgMGYfZdHUKe4+XwDEq8Pq93z3a
	pd+68dLVwCxOs6DtJ5cwqAVIqF2ByaBlmwve/0e08QyikaVLEOKQUf4h3ux+tkF9LkNZdrzXur/Pn
	ybrDtgWYFmh53VzhTN7NC07ETGElLI5oGomIUNzYWY+QTMbvBPOsxG8oJ9ERCav7f5gniz00S8JmI
	+kAp6Vw3vidPy9V5zHgl5EQT5ZCzvcVmfeXrnBJ/5m1pF1kVd8mbyG/EuubkzQv1Rpfd3cwvgSBr/
	ehCsOtpLkWXNcpLa9cIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZ14-00000008CAh-10ew;
	Wed, 04 Feb 2026 09:17:42 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZ11-00000008C9e-3eJB
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 09:17:41 +0000
Message-ID: <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770196650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IM64raMxarRH21Rk3+wQo3JPtTbDyko4g9ZllcP0l4=;
	b=cQ1myd0Je2JXYaEJUEmGa3aP13WgndYrjdtGgnsuEw9PBYGbegG2HOz3JB+OeS9YforUNa
	/BfqNOHRZXXZV8XbQQJcBz2tOfNeZpHG/L6E13oPGE2P2fRlfYpIocrp2g0doyVp636mSP
	8kAmvv2aRav2U86omWAUbftKt+EsBuY=
Date: Wed, 4 Feb 2026 01:17:25 -0800
MIME-Version: 1.0
Subject: Re: [PATCH] drivers/perf: riscv: Keep the fixed counter counting
To: cp0613@linux.alibaba.com, anup@brainfault.org, alex@ghiti.fr,
 pjw@kernel.org, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260131112440.2915-1-cp0613@linux.alibaba.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260131112440.2915-1-cp0613@linux.alibaba.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_011740_088508_1BD42310 
X-CRM114-Status: GOOD (  17.89  )
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


On 1/31/26 3:24 AM, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> The RISC-V SBI PMU driver disables all PMU counters during initialization
> via pmu_sbi_stop_all. For fixed counters CYCLE, TIME and INSTRET, this is
> unnecessary for the following two reasons:
>
> 1. Some kernel driver code may directly read CYCLE and INSTRET to perform
>     simple performance analysis.

Is this for some debugging purpose to read the instret/cycle count at 
boot time or real use case for driver performance analysis ?

If it is the latter, that will be problematic for various reasons such 
as context switching will lead to inaccurate numbers.

> 2. In legacy mode, user space directly reads CYCLE and INSTRET. (echo 2 >
>     /proc/sys/kernel/perf_user_access)
>
> Therefore, We keep counting CYCLE, TIME and INSTRET.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>   drivers/perf/riscv_pmu_sbi.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 7dd282da67ce..93aaab324443 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -899,6 +899,9 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
>   
>   static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>   {
> +	/* We keep counting CYCLE, TIME and INSTRET. */
> +	pmu->cmask &= ~0x7;
> +

This is incorrect. The cmask should be set based on the perf_user_access 
value. We should not continue counting the CYCLE/INSTRET when legacy 
mode is not set. if (sysctl_perf_user_access == SYSCTL_LEGACY) 
csr_write(CSR_SCOUNTEREN, 0x7); else csr_write(CSR_SCOUNTEREN, 0x2);

>   	/*
>   	 * No need to check the error because we are disabling all the counters
>   	 * which may include counters that are not enabled yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
