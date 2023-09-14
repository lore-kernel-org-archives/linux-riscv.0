Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC129EEAA53
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/Rn+oiZzArFgbRzaWvPO2DerozvcrC244Umq02CDo4=; b=uA0tLRet5tcytH
	Hk4Zaf2K+mrOD4uofuHJUvzzAe6TD6tc6QOWGCdL/6Gn/mhmJU484tPODfSMJxlLyytiUN6bP11tA
	tKMqFroZlMWJJL2WgRPO15rl3SuAopbzNiiAxL6irNDBQaVoNr7Y2/n8yqtHV6MVjWuTcVrgOb0zE
	QcFi4Md8ZO64MEsUcdbCDo3U0xfzUYlOUiLkTixCTD/jFIdFxY4w3nJoV9bOl9HyZT7p8Kswy6wgn
	BTWmS/oZjoXKPhv8TdoygJpySZNzAbaxEhQ6PQVOOmK7ks25wPyVFx/A7g3AAfNUZjnt4fRAVFQw1
	KVTQKqLJ0vy0PAcnkvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgonN-008r5q-0I;
	Thu, 14 Sep 2023 16:02:21 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgonI-008qzo-1R;
	Thu, 14 Sep 2023 16:02:18 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rmhlw1C71z67Jb4;
	Thu, 14 Sep 2023 23:57:16 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 17:01:56 +0100
Date: Thu, 14 Sep 2023 17:01:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 31/35] arm64: psci: Ignore DENIED CPUs
Message-ID: <20230914170155.000065cf@Huawei.com>
In-Reply-To: <20230913163823.7880-32-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-32-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_090216_764417_09A938A9 
X-CRM114-Status: GOOD (  22.19  )
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

On Wed, 13 Sep 2023 16:38:19 +0000
James Morse <james.morse@arm.com> wrote:

> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> When a CPU is marked as disabled, but online capable in the MADT, PSCI
> applies some firmware policy to control when it can be brought online.
> PSCI returns DENIED to a CPU_ON request if this is not currently
> permitted. The OS can learn the current policy from the _STA enabled bit.
> 
> Handle the PSCI DENIED return code gracefully instead of printing an
> error.

Specification reference would be good particularly as it's only been
added as a possibility fairly recently.

> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> [ morse: Rewrote commit message ]
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/kernel/psci.c     | 2 +-
>  arch/arm64/kernel/smp.c      | 3 ++-
>  drivers/firmware/psci/psci.c | 2 ++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index 29a8e444db83..4fcc0cdd757b 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -40,7 +40,7 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
>  {
>  	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
>  	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
> -	if (err)
> +	if (err && err != -EPROBE_DEFER)

Hmm. EPROBE_DEFER has very specific meaning around driver requesting a retry
when some other bit of the system has finished booting. 
I'm not sure it's a good idea for this use case.  Maybe just keep to EPERM
as psci_to_linux_errno() will return anyway.  Seems valid to me, or
is the requirement to use EPROBE_DEFER coming from further up the stack?



>  		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
>  
>  	return err;
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 8c8f55721786..e958db987665 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -124,7 +124,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  	/* Now bring the CPU into our world */
>  	ret = boot_secondary(cpu, idle);
>  	if (ret) {
> -		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
> +		if (ret != -EPROBE_DEFER)
> +			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
>  		return ret;
>  	}
>  
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index d9629ff87861..f7ab3fed3528 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -218,6 +218,8 @@ static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point)
>  	int err;
>  
>  	err = invoke_psci_fn(fn, cpuid, entry_point, 0);
> +	if (err == PSCI_RET_DENIED)
> +		return -EPROBE_DEFER;
>  	return psci_to_linux_errno(err);
>  }
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
