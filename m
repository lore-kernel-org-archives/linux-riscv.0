Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5EEC07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1ea8mqhv1JOHbl+vp+NMNjwbiXR439wDJzeukWeaJw=; b=ROXXoY+a3AdUyY
	x8ibGaXH2RgzNiZxrdhI7z/mKUn+Wiqh7VIE6tnPuH6PktFHrh/RjL+5YCfuV+JTVTCh6sHACJUTk
	YUmO25Gk17j+uz3ZL4WAUey5znQifnFu2NAFl4vtBw3pKBQ7HGzm+ObAMb4TqFMhh7RkMiKeL2NbC
	7fQaHXDwOkdE94+IStzb6ay8RBgNF2F7L3gmX3u/XpQHAvcZPiggw0DRuodBfXes/iaOAfCfl7PjW
	wClIBO92Vu6yENbEHAXaDOSWOgTv4YmxxwFAzSp/f9GY4pfqAOwmCBZmdzX8Q0QiSEUZFOLhqy+jy
	fjrtshkdPcOpMh8WyUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kBG-00BNnz-19;
	Thu, 30 Nov 2023 16:46:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kBB-00BNkj-01;
	Thu, 30 Nov 2023 16:46:24 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Sh25S5Wz5z6K5lf;
	Fri,  1 Dec 2023 00:41:32 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C3F214058E;
	Fri,  1 Dec 2023 00:46:11 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 Nov
 2023 16:46:10 +0000
Date: Thu, 30 Nov 2023 16:46:09 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: James Morse <james.morse@arm.com>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v2 11/35] arch_topology: Make
 register_cpu_capacity_sysctl() tolerant to late CPUs
Message-ID: <20231130164609.00000b4a@Huawei.com>
In-Reply-To: <ZTKEQz0DJuv/tqNH@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-12-james.morse@arm.com>
	<20230914130126.000069db@Huawei.com>
	<ZTKEQz0DJuv/tqNH@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_084621_322501_8C13F952 
X-CRM114-Status: GOOD (  46.43  )
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

On Fri, 20 Oct 2023 14:44:35 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Thu, Sep 14, 2023 at 01:01:26PM +0100, Jonathan Cameron wrote:
> > On Wed, 13 Sep 2023 16:37:59 +0000
> > James Morse <james.morse@arm.com> wrote:
> >   
> > > register_cpu_capacity_sysctl() adds a property to sysfs that describes
> > > the CPUs capacity. This is done from a subsys_initcall() that assumes
> > > all possible CPUs are registered.
> > > 
> > > With CPU hotplug, possible CPUs aren't registered until they become
> > > present, (or for arm64 enabled). This leads to messages during boot:
> > > | register_cpu_capacity_sysctl: too early to get CPU1 device!
> > > and once these CPUs are added to the system, the file is missing.
> > > 
> > > Move this to a cpuhp callback, so that the file is created once
> > > CPUs are brought online. This covers CPUs that are added late by
> > > mechanisms like hotplug.
> > > One observable difference is the file is now missing for offline CPUs.
> > > 
> > > Signed-off-by: James Morse <james.morse@arm.com>
> > > ---
> > > If the offline CPUs thing is a problem for the tools that consume
> > > this value, we'd need to move cpu_capacity to be part of cpu.c's
> > > common_cpu_attr_groups.  
> > 
> > I think we should do that anyway and then use an is_visible() if we want to
> > change whether it is visible in offline cpus.
> > 
> > Dynamic sysfs file creation is horrible - particularly when done
> > from an totally different file from where the rest of the attributes
> > are registered.  I'm curious what the history behind that is.
> > 
> > Whilst here, why is there a common_cpu_attr_groups which is
> > identical to the hotpluggable_cpu_attr_groups in base/cpu.c?  
> 
> Looking into doing this, the easy bit is adding the attribute group
> with an appropriate .is_visible dependent on cpu_present(), but we
> need to be able to call sysfs_update_groups() when the state of the
> .is_visible() changes.
Hi Russell,

Sorry, somehow I missed this completely until you referred back to it :(

This is pretty much what I was thinking so thanks for doing it.

> 
> Given the comment in sysfs_update_groups() about "if an error occurs",
> rather than making this part of common_cpu_attr_groups, would it be
> better that it's part of its own set of groups, thus limiting the
> damage from a possible error? I suspect, however, that any error at
> that point means that the system is rather fatally wounded.
> 
> This is what I have so far to implement your idea, less the necessary
> sysfs_update_groups() call when we need to change the visibility of
> the attributes.

Fwiw (and I think you shouldn't add this to the critical path for your
main series for obvious reasons), I think you are right that it makes
sense to do this in a separate group, but that if we were going to see
an error I'd 'hope' we shouldn't see anything that hasn't occurred
when groups were originally added. Maybe that's overly optimistic.

Sorry again for lack of reply before now and thanks for pointing this
out.  I'd love to see this posted after the ARM vCPU HP stuff is in.

Jonathan


> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 9ccb7daee78e..06c9fc6620d2 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -215,43 +215,24 @@ static ssize_t cpu_capacity_show(struct device *dev,
>  	return sysfs_emit(buf, "%lu\n", topology_get_cpu_scale(cpu->dev.id));
>  }
>  
> -static void update_topology_flags_workfn(struct work_struct *work);
> -static DECLARE_WORK(update_topology_flags_work, update_topology_flags_workfn);
> -
>  static DEVICE_ATTR_RO(cpu_capacity);
>  
> -static int cpu_capacity_sysctl_add(unsigned int cpu)
> -{
> -	struct device *cpu_dev = get_cpu_device(cpu);
> -
> -	if (!cpu_dev)
> -		return -ENOENT;
> -
> -	device_create_file(cpu_dev, &dev_attr_cpu_capacity);
> -
> -	return 0;
> -}
> -
> -static int cpu_capacity_sysctl_remove(unsigned int cpu)
> +static umode_t cpu_present_attrs_visible(struct kobject *kobi,
> +					 struct attribute *attr, int index)
>  {
> -	struct device *cpu_dev = get_cpu_device(cpu);
> -
> -	if (!cpu_dev)
> -		return -ENOENT;
> -
> -	device_remove_file(cpu_dev, &dev_attr_cpu_capacity);
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct cpu *cpu = container_of(dev, struct cpu, dev);
>  
> -	return 0;
> +	return cpu_present(cpu->dev.id) ? attr->mode : 0;
>  }
>  
> -static int register_cpu_capacity_sysctl(void)
> -{
> -	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "topology/cpu-capacity",
> -			  cpu_capacity_sysctl_add, cpu_capacity_sysctl_remove);
> +const struct attribute_group cpu_capacity_attr_group = {
> +	.is_visible = cpu_present_attrs_visible,
> +	.attrs = cpu_capacity_attrs
> +};
>  
> -	return 0;
> -}
> -subsys_initcall(register_cpu_capacity_sysctl);
> +static void update_topology_flags_workfn(struct work_struct *work);
> +static DECLARE_WORK(update_topology_flags_work, update_topology_flags_workfn);
>  
>  static int update_topology;
>  
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index a19a8be93102..954b045705c2 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -192,6 +192,9 @@ static const struct attribute_group crash_note_cpu_attr_group = {
>  static const struct attribute_group *common_cpu_attr_groups[] = {
>  #ifdef CONFIG_KEXEC
>  	&crash_note_cpu_attr_group,
> +#endif
> +#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
> +	&cpu_capacity_attr_group,
>  #endif
>  	NULL
>  };
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index e117c06e0c6b..745ad21e3dc8 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -30,6 +30,8 @@ struct cpu {
>  	struct device dev;
>  };
>  
> +extern const struct attribute_group cpu_capacity_attr_group;
> +
>  extern void boot_cpu_init(void);
>  extern void boot_cpu_hotplug_init(void);
>  extern void cpu_init(void);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
