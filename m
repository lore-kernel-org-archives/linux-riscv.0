Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DBBC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 06:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdtMBZJ1AD250k02X6JZIjZApJUqwhlYE5zSDRYpHaU=; b=bgXpNbMzm19SwF
	ttghuRTgvxSB+mtm6WeyGDiEUybvz/yEKSHnXiHHzWRt3pM18Sj7sC9xMynidbMRYE3Pogr8196GS
	4bZN001q41BcGa55rSEJyYYXYcAfp2rWa2njpsp+o7YfMRD3+czVhYLgwVgWJou8I9O3B4jpqxiS6
	YID9m6gc5wWIPSoT/eKMdqkL+fEm9Cs4gwTaLeZeAWs3yXQTK634kTnidNbYG6//JPsg0vRyXuVvo
	0+y5zlaOt8llWtvqoOZcAepIMCr8sitn8Oa4dOmlv/X1ntcqm7rqgHSLLs6vFkBcFeJpnpdPlqwf/
	j3iKA5Hb5ZJ2DWWD5Xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLzoD-00000001or0-0hqh;
	Tue, 25 Jun 2024 06:37:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLzo9-00000001ooC-28yD
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 06:37:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4W7ZrJ1BjYznXkm;
	Tue, 25 Jun 2024 14:37:20 +0800 (CST)
Received: from dggpemd100004.china.huawei.com (unknown [7.185.36.20])
	by mail.maildlp.com (Postfix) with ESMTPS id 92F3C180064;
	Tue, 25 Jun 2024 14:37:24 +0800 (CST)
Received: from [10.67.109.211] (10.67.109.211) by
 dggpemd100004.china.huawei.com (7.185.36.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 25 Jun 2024 14:37:24 +0800
Message-ID: <cf29a1aa-add7-4a39-a9c6-f9bcc24d99f0@huawei.com>
Date: Tue, 25 Jun 2024 14:37:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Dynamically allocate cpumasks and further
 increase range and default value of NR_CPUS
Content-Language: en-US
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
References: <20240614075306.357861-1-liuyuntao12@huawei.com>
From: "liuyuntao (F)" <liuyuntao12@huawei.com>
In-Reply-To: <20240614075306.357861-1-liuyuntao12@huawei.com>
X-Originating-IP: [10.67.109.211]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemd100004.china.huawei.com (7.185.36.20)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_233737_766269_3613F863 
X-CRM114-Status: GOOD (  17.37  )
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

Gentle ping

On 2024/6/14 15:53, Yuntao Liu wrote:
> Currently default NR_CPUS is 64 for riscv64, since the latest QEMU virt
> machine supports up to 512 CPUS, so set default NR_CPUS 512 for riscv64.
> 
> Under the promotion of RISC-V International and related chip
> manufacturers, RISC-V has also begun to enter the server market, which
> demands higher performance. Other major architectures (such as ARM64,
> x86_64, MIPS, etc) already have a higher range, so further increase
> this range up to 4096 for riscv64.
> 
> Due to the fact that increasing NR_CPUS enlarges the size of cpumasks,
> there is a concern that this could significantly impact stack usage,
> especially for code that allocates cpumasks on the stack. To address
> this, we have the option to enable CPUMASK_OFFSTACK, which prevents
> cpumasks from being allocated on the stack. we choose to enable this
> feature only when NR_CPUS is greater than 512, why 512, since then
> the kernel size with offstack is smaller.
> 
> vmlinux size comparison(difference to vmlinux_onstack_NR_CPUS baseline):
> 
> NR_CPUS     256         512         1024        2048        4096
> onstack     19814536    19840760    19880584    19969672    20141704
> offstack    19819144    19840936    19880480    19968544    20135456
> difference  +0.023%     +0.001%     -0.001%     -0.001      -0.031%
> is_smaller  n           n           y           y           y
> 
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>   arch/riscv/Kconfig | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0525ee2d63c7..5960713b3bf9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -77,6 +77,7 @@ config RISCV
>   	select CLINT_TIMER if RISCV_M_MODE
>   	select CLONE_BACKWARDS
>   	select COMMON_CLK
> +	select CPUMASK_OFFSTACK if NR_CPUS > 512
>   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>   	select EDAC_SUPPORT
>   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
> @@ -428,11 +429,11 @@ config SCHED_MC
>   config NR_CPUS
>   	int "Maximum number of CPUs (2-512)"
>   	depends on SMP
> -	range 2 512 if !RISCV_SBI_V01
> +	range 2 4096 if !RISCV_SBI_V01
>   	range 2 32 if RISCV_SBI_V01 && 32BIT
>   	range 2 64 if RISCV_SBI_V01 && 64BIT
>   	default "32" if 32BIT
> -	default "64" if 64BIT
> +	default "512" if 64BIT
>   
>   config HOTPLUG_CPU
>   	bool "Support for hot-pluggable CPUs"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
