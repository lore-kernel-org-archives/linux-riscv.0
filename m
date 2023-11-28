Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF93C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rVWE+q538HPKsC/yZKNIMOOfe5xki9wQY0vcwlg+7A=; b=4f4ylsFz7obOGM
	EtN8KGw3e01K9EUYLtp70Pgcu4JRJ1ScyTMHrRxbuRIrJqvtIGHxbl+XI7L6APG3UChTsIoRq55I0
	5IO9H/gCTejV1lmOGEqSQKmdp16WQCVBNGC+gonB8sEqWoN71RxKJloerlJY2/Sph/AI3Z4MmFu6q
	rdGuwR0e1TVCgPCEn9tts0xhDt4a3tx0iZfqloQvnUkxHj4vjwFDZOSh9RDf/bfseSVZGE2umSvG2
	35cIWLZqVeX6vFKQCBWaFnRq6S07usMPv2j8XP3Fhm+tpwxWofy15JTKRtzcgOamjufzvllkQzl+z
	RdDiaF4Q+ZvFjBaaaH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zhx-005cfa-2y;
	Tue, 28 Nov 2023 15:09:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zhu-005cem-0O;
	Tue, 28 Nov 2023 15:09:03 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Sfm2J09dQz6J6pH;
	Tue, 28 Nov 2023 23:04:24 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FA6614025A;
	Tue, 28 Nov 2023 23:08:56 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 Nov
 2023 15:08:55 +0000
Date: Tue, 28 Nov 2023 15:08:54 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse
	<james.morse@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>
Subject: Re: [PATCH RFC 13/22] arm64: setup: Switch over to
 GENERIC_CPU_DEVICES using arch_register_cpu()
Message-ID: <20231128150854.00005370@Huawei.com>
In-Reply-To: <E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
	<E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_070902_458470_EFEFD34D 
X-CRM114-Status: GOOD (  22.80  )
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

On Tue, 07 Nov 2023 10:30:25 +0000
Russell King <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
> To allow ACPI's _STA value to hide CPUs that are present, but not
> available to online right now due to VMM or firmware policy, the
> register_cpu() call needs to be made by the ACPI machinery when ACPI
> is in use. This allows it to hide CPUs that are unavailable from sysfs.
> 
> Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
> five ACPI architectures to be modified at once.
> 
> Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
> that populates the hotpluggable flag. arch_register_cpu() is also the
> interface the ACPI machinery expects.
> 
> The struct cpu in struct cpuinfo_arm64 is never used directly, remove
> it to use the one GENERIC_CPU_DEVICES provides.
> 
> This changes the CPUs visible in sysfs from possible to present, but
> on arm64 smp_prepare_cpus() ensures these are the same.
> 
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Given this series adds an arch_cpu_is_hotpluggable() callback we probably
want something in this patch description to say why this
isn't using that, but instead overriding arch_register_cpu()

Jonathan

> ---
> Changes since RFC v2:
>  * Add note about initialisation order change.
> ---
>  arch/arm64/Kconfig           |  1 +
>  arch/arm64/include/asm/cpu.h |  1 -
>  arch/arm64/kernel/setup.c    | 13 ++++---------
>  3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7b071a00425d..84bce830e365 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -132,6 +132,7 @@ config ARM64
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_CLOCKEVENTS_BROADCAST
>  	select GENERIC_CPU_AUTOPROBE
> +	select GENERIC_CPU_DEVICES
>  	select GENERIC_CPU_VULNERABILITIES
>  	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_IDLE_POLL_SETUP
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index f3034099fd95..b1e43f56ee46 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -38,7 +38,6 @@ struct cpuinfo_32bit {
>  };
>  
>  struct cpuinfo_arm64 {
> -	struct cpu	cpu;
>  	struct kobject	kobj;
>  	u64		reg_ctr;
>  	u64		reg_cntfrq;
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 417a8a86b2db..165bd2c0dd5a 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -402,19 +402,14 @@ static inline bool cpu_can_disable(unsigned int cpu)
>  	return false;
>  }
>  
> -static int __init topology_init(void)
> +int arch_register_cpu(int num)
>  {
> -	int i;
> +	struct cpu *cpu = &per_cpu(cpu_devices, num);
>  
> -	for_each_possible_cpu(i) {
> -		struct cpu *cpu = &per_cpu(cpu_data.cpu, i);
> -		cpu->hotpluggable = cpu_can_disable(i);
> -		register_cpu(cpu, i);
> -	}
> +	cpu->hotpluggable = cpu_can_disable(num);
>  
> -	return 0;
> +	return register_cpu(cpu, num);
>  }
> -subsys_initcall(topology_init);
>  
>  static void dump_kernel_offset(void)
>  {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
