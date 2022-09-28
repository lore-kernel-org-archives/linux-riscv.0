Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCACC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 20:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFtKdMr1dlRcCFu24E7Hl98VLVSfbdEkpy3UhkAn3EA=; b=GOgeip26FSq0EN
	rjKUmAh7J9k7Onk/wxOneXdD/V6Y5al1yax3uUQUrrWZsQuGGEwvHbq27cve3zrEIeDpi47JKkNW0
	EtWQawNoPRF53ntI9hQsh+/BmXGNL8/syBk822Bvj7YraEGUX/b1gJdK4ptXZGztBzDjrDOnLiLAC
	fnqjJD3wmD7ZOAd8U7LHfBXu6L6L7o8JEnNIAiMgbDj+GGShaalIjI5The6mtbwOpeWN4V6edNqeV
	YP6KCMgxpjqfyEVu4YbLb0QYk9U/128JUJt5Wm1e7f94iBa9CGTQBdA5OtjBBr8oxZIdYMnS5qnSV
	jdSloquFgvRzafyUJrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ode3i-000N5H-FU; Wed, 28 Sep 2022 20:53:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ode3f-000N4u-CL
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 20:53:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3C45FB8216E;
	Wed, 28 Sep 2022 20:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A00FC433D6;
	Wed, 28 Sep 2022 20:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398407;
	bh=QQwYSISk70NzKVArz8X4r7miJXCX3+pMEitwGkJ7gBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRqQMr9hQJfHVgbQ3o3EHU84SiICEjgsnkvFWX2fPpdmCyMsiS+jQOwTt+a57c7ZR
	 DXhjQyZs8nQJnx09jdqno+MHnEF3xP4E7y424pcjUxPPsPJAp065/EVT7J8VdWYXxE
	 2Kc/Waqm1KsnVzJ7wu6O344k4U9YITybq4jAouw1VULWY6HIqfjWybs/wgId0oTTBO
	 0pSuBwoXvP5idNrikY2W2ec/hXwL907jz6yGRCu9lMP29LQJYHqRwdXY7I0A4sudnX
	 qxldUAE1GdxQhcpCWs6rnSTA4VLNolV+lqaIXRnVii1oYmNjV2oCMhF74rVfoEbjku
	 MBoHwoeOJMfUQ==
Date: Wed, 28 Sep 2022 21:53:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Re-enable counter access from userspace
Message-ID: <YzS0RNzH2CprLSyc@spud>
References: <20220928131807.30386-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220928131807.30386-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_135331_603611_A237E684 
X-CRM114-Status: GOOD (  20.31  )
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

On Wed, Sep 28, 2022 at 06:18:07AM -0700, Palmer Dabbelt wrote:
> These counters were part of the ISA when we froze the uABI, removing
> them breaks userspace.
> 
> Link: https://lore.kernel.org/all/YxEhC%2FmDW1lFt36J@aurel32.net/
> Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Completely forgot about this and was wondering why my timer accessing,
userspace program was not working on an unmatched but did on an
icicle... This patch makes it work again :)

Tested-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  drivers/perf/riscv_pmu_sbi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 6f6681bbfd36..e45daffbfb36 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -645,8 +645,11 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
>  	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
>  
> -	/* Enable the access for TIME csr only from the user mode now */
> -	csr_write(CSR_SCOUNTEREN, 0x2);
> +	/*
> +	 * Enable the access for CYCLE, TIME, and INSTRET CSRs from userspace,
> +	 * as is necessary to maintain uABI compatibility.
> +	 */
> +	csr_write(CSR_SCOUNTEREN, 0x7);
>  
>  	/* Stop all the counters so that they can be enabled from perf */
>  	pmu_sbi_stop_all(pmu);
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
