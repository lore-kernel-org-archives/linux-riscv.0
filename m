Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52FDEDE9AD
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HagkZHzfbAjdT6cLcQSWgz0sZMUc57FIsSPIDBoW8k=; b=GlJC5d/d6uzwag
	xL9dgSCHq2ssAo4wN+F/edkIQSzP5gnkxjPucLkum8+fIwk/ii6lreE4vrPDUWvKr/aep+SwQjRAN
	SuTJdqbpTLCfGigHr4TjDqm5EGzMVpk++OeDWay/NIk+TaM/neDjwbqlMg/ZTqBC0zMPrWvhEjDHn
	dqYJ82D6GQlniXZtbHj3fIzo3qs1qOSOM+KROVxOpDvGdyv1ZfbVHWqma77bf9RTZhqTr5LuSLgY/
	KfwXSjaX21/FPxFNCMtfbdbqYHtFNdjH3Pi2yaSSTsKcbdISgc8yJ3hhJDlZ5ZJo9EUtrxBzmwIke
	IyVeZ+6rpLRnXH76Jf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgl2T-008Hbx-2V;
	Thu, 14 Sep 2023 12:01:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgl2P-008HaE-1e;
	Thu, 14 Sep 2023 12:01:39 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmbQR00lDz68944;
	Thu, 14 Sep 2023 19:56:46 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 13:01:27 +0100
Date: Thu, 14 Sep 2023 13:01:26 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v2 11/35] arch_topology: Make
 register_cpu_capacity_sysctl() tolerant to late CPUs
Message-ID: <20230914130126.000069db@Huawei.com>
In-Reply-To: <20230913163823.7880-12-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-12-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_050137_840309_50A986BB 
X-CRM114-Status: GOOD (  25.47  )
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

On Wed, 13 Sep 2023 16:37:59 +0000
James Morse <james.morse@arm.com> wrote:

> register_cpu_capacity_sysctl() adds a property to sysfs that describes
> the CPUs capacity. This is done from a subsys_initcall() that assumes
> all possible CPUs are registered.
> 
> With CPU hotplug, possible CPUs aren't registered until they become
> present, (or for arm64 enabled). This leads to messages during boot:
> | register_cpu_capacity_sysctl: too early to get CPU1 device!
> and once these CPUs are added to the system, the file is missing.
> 
> Move this to a cpuhp callback, so that the file is created once
> CPUs are brought online. This covers CPUs that are added late by
> mechanisms like hotplug.
> One observable difference is the file is now missing for offline CPUs.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> If the offline CPUs thing is a problem for the tools that consume
> this value, we'd need to move cpu_capacity to be part of cpu.c's
> common_cpu_attr_groups.

I think we should do that anyway and then use an is_visible() if we want to
change whether it is visible in offline cpus.

Dynamic sysfs file creation is horrible - particularly when done
from an totally different file from where the rest of the attributes
are registered.  I'm curious what the history behind that is.

Whilst here, why is there a common_cpu_attr_groups which is
identical to the hotpluggable_cpu_attr_groups in base/cpu.c?


+CC GregKH
Given changes in drivers/base/

> ---
>  drivers/base/arch_topology.c | 38 ++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index b741b5ba82bd..9ccb7daee78e 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -220,20 +220,34 @@ static DECLARE_WORK(update_topology_flags_work, update_topology_flags_workfn);
>  
>  static DEVICE_ATTR_RO(cpu_capacity);
>  
> +static int cpu_capacity_sysctl_add(unsigned int cpu)
> +{
> +	struct device *cpu_dev = get_cpu_device(cpu);
> +
> +	if (!cpu_dev)
> +		return -ENOENT;
> +
> +	device_create_file(cpu_dev, &dev_attr_cpu_capacity);
> +
> +	return 0;
> +}
> +
> +static int cpu_capacity_sysctl_remove(unsigned int cpu)
> +{
> +	struct device *cpu_dev = get_cpu_device(cpu);
> +
> +	if (!cpu_dev)
> +		return -ENOENT;
> +
> +	device_remove_file(cpu_dev, &dev_attr_cpu_capacity);
> +
> +	return 0;
> +}
> +
>  static int register_cpu_capacity_sysctl(void)
>  {
> -	int i;
> -	struct device *cpu;
> -
> -	for_each_possible_cpu(i) {
> -		cpu = get_cpu_device(i);
> -		if (!cpu) {
> -			pr_err("%s: too early to get CPU%d device!\n",
> -			       __func__, i);
> -			continue;
> -		}
> -		device_create_file(cpu, &dev_attr_cpu_capacity);
> -	}
> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "topology/cpu-capacity",
> +			  cpu_capacity_sysctl_add, cpu_capacity_sysctl_remove);
>  
>  	return 0;
>  }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
