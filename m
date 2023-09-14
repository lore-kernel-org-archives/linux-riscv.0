Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084D1EEAA40
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzoDL3C36EQMvOFjS7r2QKSKk0+6e9awFs5Z95NVVC8=; b=Sg1MN4p2pZRCtz
	ikTep7rpKl8zx18BiaOaTbFNhzb1Wg5lDOWEf1VZSZDOj7flyp/TtUrvEwlpbz6W/gRJN1V9Hhjyj
	NjWVzP9HlcyF9eOW6lYfBlkxM8vbs1yk6HALcv/d3NJwXd9PB6Zl5VRqwkR5pIWLPRlg/kLELPXP7
	O4m6AT8zGVDW1WeSqEHUbzgkbLhe65ylHcGp3Z9rB9vg3lNuRb1nYk/GX+ydfU8QmYEJiHH2O4pSI
	oLNEf692BjmPWEF7LTMV5f7vRvJW7qhAQ37la3hcJdF3PvN20oQHaFTJRxYRUxr5S6+pyJT0jgAnw
	gfDI6kW31MRh7pBNySig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn0J-008auj-06;
	Thu, 14 Sep 2023 14:07:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn0F-008atM-16;
	Thu, 14 Sep 2023 14:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GIdT/cJmFA2qx50pgPlJRNzy/bheI4vUqGYQu+a7PMI=; b=raixHrVeNVHHMS+SmMW0fsVxI+
	rZLO2b1FApnkXyJLVlkjBZUzsfFxmDi2JMVVu/R8wleWSzTAHzOFKzQL/zWb/JJhTJQkeyGGl2H3d
	1EsUw8fAPKHCZzu4CyyEqx+rG9yuFwm7T+vos+z7VLqGttytZaDieHznwmb3696A6aPLvSAslWr7a
	thmdyxIrHQUHf4/fW3Cr1tTqOrfips0KHORhG+5wXWbJd9QGypzhjjzPeg+uOfhgIbBdTkF3z9ckY
	NUhze25dfC5TxiZv0q43BsedV3/l/zOQC9B/nOQb7gFNThJ/nZ0J8fzai0g8EC7sBDROC7wVMPZBJ
	p/hgjtbQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37510)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgn08-0004Jo-2O;
	Thu, 14 Sep 2023 15:07:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgn06-0004ol-Vs; Thu, 14 Sep 2023 15:07:22 +0100
Date: Thu, 14 Sep 2023 15:07:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 06/35] arm64: setup: Switch over to
 GENERIC_CPU_DEVICES using arch_register_cpu()
Message-ID: <ZQMTmi7blj/4FpbI@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-7-james.morse@arm.com>
 <20230914122715.000076be@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914122715.000076be@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_070731_385434_E17F9FE7 
X-CRM114-Status: GOOD (  21.20  )
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

On Thu, Sep 14, 2023 at 12:27:15PM +0100, Jonathan Cameron wrote:
> On Wed, 13 Sep 2023 16:37:54 +0000
> James Morse <james.morse@arm.com> wrote:
> 
> > To allow ACPI's _STA value to hide CPUs that are present, but not
> > available to online right now due to VMM or firmware policy, the
> > register_cpu() call needs to be made by the ACPI machinery when ACPI
> > is in use. This allows it to hide CPUs that are unavailable from sysfs.
> > 
> > Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
> > five ACPI architectures to be modified at once.
> > 
> > Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
> > that populates the hotpluggable flag. arch_register_cpu() is also the
> > interface the ACPI machinery expects.
> > 
> > The struct cpu in struct cpuinfo_arm64 is never used directly, remove
> > it to use the one GENERIC_CPU_DEVICES provides.
> > 
> > This changes the CPUs visible in sysfs from possible to present, but
> > on arm64 smp_prepare_cpus() ensures these are the same.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> 
> After this the earlier question about ordering of cpu_dev_init()
> and node_dev_init() is relevant.   
> 
> Why won't node_dev_init() call
> get_cpu_devce() which queries per_cpu(cpu_sys_devices)
> and get NULL as we haven't yet filled that in?
> 
> Or does it do so but that doesn't matter as well create the
> relevant links later?

node_dev_init() will walk through the nodes calling register_one_node()
on each. This will trickle down to __register_one_node() which walks
all present CPUs, calling register_cpu_under_node() on each.

register_cpu_under_node() will call get_cpu_device(cpu) for each and
will return NULL until the CPU is registered using register_cpu(),
which will now happen _after_ node_dev_init().

So, at this point, CPUs won't get registered, and initially one might
think that's a problem.

However, register_cpu() will itself call register_cpu_under_node(),
where get_cpu_device() will return the now populated entry, and the
sysfs links will be created.

So, I think what you've spotted is a potential chunk of code that
isn't necessary when using GENERIC_CPU_DEVICES after this change!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
