Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7FBEEAA4F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FubEAplJmvr2O9U6041FX4QEgYc4H8VoZJ7LGrL/970=; b=lYmxokzuLDT/zX
	tmLAxriIoNYwR+5WWChxjcwVb7KcwRLxOlntvuPTCsZs1KLYtiQOA/QO9Sk+2RXq4jOz7AaWlYrA0
	yzbiGU16rpOMn5ZB7o1hTxCE0r41HdCkHO+7j6SemSvrLHB0NaUfJtU0C8OELYP4Lnigmy/DcHVqY
	kqWppg/lJYrHmUpoCVaYOQCu9ga1KeXPXS7D9yRl43R97Nx96lAX+dl2VpLl9E03J5bPoRDj4jr0b
	KZFhr7qF0vi4UsNU8AXADpnSZLCbJIVDeJNLKzZ8vWSgq5K8Ptt3HebAaPP9ozrMgmuCLbVu6h3KR
	/aN+dvrPYyvkUCWKwTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnln-008hiW-31;
	Thu, 14 Sep 2023 14:56:39 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnlj-008hhE-2c;
	Thu, 14 Sep 2023 14:56:37 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmgP90gY1z67Q1Y;
	Thu, 14 Sep 2023 22:55:57 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:56:33 +0100
Date: Thu, 14 Sep 2023 15:56:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: James Morse <james.morse@arm.com>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 06/35] arm64: setup: Switch over to
 GENERIC_CPU_DEVICES using arch_register_cpu()
Message-ID: <20230914155632.00003ca9@Huawei.com>
In-Reply-To: <ZQMTmi7blj/4FpbI@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-7-james.morse@arm.com>
	<20230914122715.000076be@Huawei.com>
	<ZQMTmi7blj/4FpbI@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_075636_128828_F965B036 
X-CRM114-Status: GOOD (  25.79  )
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

On Thu, 14 Sep 2023 15:07:22 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Thu, Sep 14, 2023 at 12:27:15PM +0100, Jonathan Cameron wrote:
> > On Wed, 13 Sep 2023 16:37:54 +0000
> > James Morse <james.morse@arm.com> wrote:
> >   
> > > To allow ACPI's _STA value to hide CPUs that are present, but not
> > > available to online right now due to VMM or firmware policy, the
> > > register_cpu() call needs to be made by the ACPI machinery when ACPI
> > > is in use. This allows it to hide CPUs that are unavailable from sysfs.
> > > 
> > > Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
> > > five ACPI architectures to be modified at once.
> > > 
> > > Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
> > > that populates the hotpluggable flag. arch_register_cpu() is also the
> > > interface the ACPI machinery expects.
> > > 
> > > The struct cpu in struct cpuinfo_arm64 is never used directly, remove
> > > it to use the one GENERIC_CPU_DEVICES provides.
> > > 
> > > This changes the CPUs visible in sysfs from possible to present, but
> > > on arm64 smp_prepare_cpus() ensures these are the same.
> > > 
> > > Signed-off-by: James Morse <james.morse@arm.com>  
> > 
> > After this the earlier question about ordering of cpu_dev_init()
> > and node_dev_init() is relevant.   
> > 
> > Why won't node_dev_init() call
> > get_cpu_devce() which queries per_cpu(cpu_sys_devices)
> > and get NULL as we haven't yet filled that in?
> > 
> > Or does it do so but that doesn't matter as well create the
> > relevant links later?  
> 
> node_dev_init() will walk through the nodes calling register_one_node()
> on each. This will trickle down to __register_one_node() which walks
> all present CPUs, calling register_cpu_under_node() on each.
> 
> register_cpu_under_node() will call get_cpu_device(cpu) for each and
> will return NULL until the CPU is registered using register_cpu(),
> which will now happen _after_ node_dev_init().
> 
> So, at this point, CPUs won't get registered, and initially one might
> think that's a problem.
> 
> However, register_cpu() will itself call register_cpu_under_node(),
> where get_cpu_device() will return the now populated entry, and the
> sysfs links will be created.
> 
> So, I think what you've spotted is a potential chunk of code that
> isn't necessary when using GENERIC_CPU_DEVICES after this change!
> 

Makes sense thanks. I was just being too lazy to check and bouncing it back
at James! *looks guilty*

Jonathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
