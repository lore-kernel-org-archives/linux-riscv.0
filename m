Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD3EDE9A4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMBzZUMLONWtIeIBeJDORjAs8pb3lfIBWkPZfR6iffo=; b=gviHOz2tya/R8Z
	/AaJgbpRGjEwmf0wdj1ADL+GUKyKDHrJldvpLIQmRtOV7GwY5GSt/zIaJh/kIxyUYKLatFEDTudxF
	AlH+8AKM/NacWkjuZiNSXFc6zHvTiFMgC8mKbgzGIeM5Qa1KDzNSpMWzFKE2imtyZh3I7LQKKFiHo
	UsNTVPIOoR0HEDbck5cHcgAcXf5ZK3LSFLhghR26mN6Sw+xCq+9OxLlR4FZndiMl1+BKQWLNqGQaG
	HSDIBK/ForGodVu16C2GmS5Y2BlMilO7N1P8rCPLpW6n2BjsgBMkl/r2VHWALMOan9oKX4rdo29Qk
	c4f9wpQvva5/xnpLRTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgk5C-0086U1-2W;
	Thu, 14 Sep 2023 11:00:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgk59-0086QU-10;
	Thu, 14 Sep 2023 11:00:24 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmZ7B5FLBz6HJdN;
	Thu, 14 Sep 2023 18:58:30 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 12:00:15 +0100
Date: Thu, 14 Sep 2023 12:00:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 03/35] drivers: base: Allow parts of
 GENERIC_CPU_DEVICES to be overridden
Message-ID: <20230914120014.00002866@Huawei.com>
In-Reply-To: <20230913163823.7880-4-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-4-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_040023_494463_34E0BFDE 
X-CRM114-Status: GOOD (  12.81  )
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

On Wed, 13 Sep 2023 16:37:51 +0000
James Morse <james.morse@arm.com> wrote:

> Architectures often have extra per-cpu work that needs doing
> before a CPU is registered, often to determine if a CPU is
> hotpluggable.
> 
> To allow the ACPI architectures to use GENERIC_CPU_DEVICES, move
> the cpu_register() call into arch_register_cpu(), which is made __weak
> so architectures with extra work can override it.
> This aligns with the way x86, ia64 and loongarch register hotplug CPUs
> when they become present.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since RFC:
>  * Dropped __init from x86/ia64 arch_register_cpu()
Confused...

> diff --git a/arch/ia64/kernel/topology.c b/arch/ia64/kernel/topology.c
> index 94a848b06f15..741863a187a6 100644
> --- a/arch/ia64/kernel/topology.c
> +++ b/arch/ia64/kernel/topology.c
> @@ -59,7 +59,7 @@ void __ref arch_unregister_cpu(int num)
>  }
>  EXPORT_SYMBOL(arch_unregister_cpu);
>  #else
> -static int __init arch_register_cpu(int num)
> +int __init arch_register_cpu(int num)

Still seems to be here...

>  {
>  	return register_cpu(&sysfs_cpus[num].cpu, num);
>  }

Even more confused because the block wasn't in the RFC at all.
Maybe dropped static?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
