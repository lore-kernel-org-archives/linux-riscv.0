Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A8FCFC27C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhmA+StpwnEgIJXFCakRTraR66D/lzRQRCw1DyUo2Ok=; b=ZixUsQsrGmcfLQHMrM52WS5LV/
	dt1Mah3uTW+lHUpObiqRBCty6ZQ6ulEQNnueknH3Accz4B64NulzBqzmS93ZlOZeuTjFDAfxRVfP+
	aGYMQ/CWRdF/Ime/ccg8j2eeBmI01yThkR3Dq4yFb32P3b/5hXBJZ1QmWK2k4dQmF08NEHkDMmaCA
	zwhf6bIC1iBrHsrOsuzZeurBprMU27WradZ4ejQCw9LqEUv54kJVa7gJsVa8opaFywAOgty49Tgr6
	v6IpeI46Bjku6kIyuFGbw322zJJbihPJ9u3YDUhKuS2qvEZ+eXAMujNqX1DAEiSnglvei+Z9pqMc4
	EhcAsW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRc5-00000008SyO-0v9S;
	Fri, 21 Nov 2025 13:55:49 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRc2-00000008SxM-0OV3;
	Fri, 21 Nov 2025 13:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=WF7zmEjCDjV6ilB5EvAYSDT7Fkd1062FEPH2y/AHz5Q=;
	b=h+ePWbcsST9l746MDpEgWl0av8qMn9RFmoMNI9/ACZqCufKaNcGz+VOD/Zvxz4
	viteYnhznScDQsYG1xvy/O8YpB1oxzfzP80wHn77U4l3Kut8AB0C+JG1HMkrQ92r
	iA42efWFnSYs5rnU8VDMWkGO79tgmtARXuCsi6o9haLI4=
Received: from nilq-virtual-machine.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD39wn_biBpQoUTAQ--.36592S2;
	Fri, 21 Nov 2025 21:54:09 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: sunilvl@ventanamicro.com
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	conor+dt@kernel.org,
	deng.weixian@zte.com.cn,
	devicetree@vger.kernel.org,
	frowand.list@gmail.com,
	hu.yuye@zte.com.cn,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maz@kernel.org,
	ni.liqiang@zte.com.cn,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	saravanak@google.com,
	tglx@linutronix.de,
	dai.hualiang@zte.com.cn,
	liu.qingtao2@zte.com.cn,
	guo.chang2@zte.com.cn,
	wu.jiabao@zte.com.cn,
	liu.wenhong35@zte.com.cn
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for direct-mode
Date: Fri, 21 Nov 2025 21:54:07 +0800
Message-Id: <20251121135407.53372-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aSAn8DdQVBBzenlJ@sunil-laptop>
References: <aSAn8DdQVBBzenlJ@sunil-laptop>
MIME-Version: 1.0
X-CM-TRANSID: _____wD39wn_biBpQoUTAQ--.36592S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx-BMDUUUU
X-Originating-IP: [111.162.113.123]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbiYBYN5WkgaBd5mQAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_055546_490624_CE8ABDEF 
X-CRM114-Status: GOOD (  29.01  )
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
Content-Type: multipart/mixed; boundary="===============0447176273184525684=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0447176273184525684==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Dear Sunil,

> > > diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
> > > +static const struct of_device_id aplic_match[] = {
> > > + { .compatible = "riscv,aplic" },
> > > + {}
> > > +};
> > > +
> > > +static struct platform_driver aplic_driver = {
> > > + .driver = {
> > > +  .name  = "riscv-aplic",
> > > +  .of_match_table = aplic_match,
> > > + },
> > > + .probe = aplic_probe,
> > > +};
> > > +builtin_platform_driver(aplic_driver);
> > 
> > Dear Anup Patel and all concerned,
> > 
> > I am writing to inquire about the historical rationale behind defining the APLIC driver's
> > initialization priority using builtin_platform_driver in the current implementation.
> > 
> > In our environment, we are encountering an issue where this priority level causes ACPI-based PCIe
> > enumeration to be executed in the system_unbound_wq work queue. This parallel execution model
> > results in PCIe devices being enumerated in an arbitrary order rather than strictly following the
> > sequence defined in the ACPI DSDT table.
> > 
> > The random enumeration order is adversely affecting customer experience, particularly in scenarios
> > where device ordering is critical for proper system operation or application compatibility.
> > 
> > We are considering modifying the APLIC driver's initialization priority to ensure PCIe enumeration
> > occurs sequentially according to the DSDT specification. However, before proceeding with such
> > changes, we wanted to consult with you regarding:
> > 
> > 1. Were there specific technical considerations that led to the current priority selection?
> > 2. Are there any potential side effects or broader impacts that we might have overlooked?
> > 3. Would you support such a priority adjustment, or do you have alternative suggestions to 
> > address the enumeration order issue?
> > 
> > We greatly appreciate your insights and expertise on this matter, as it will help us make an
> > informed decision while maintaining system stability and compatibility.
> > 
> > Thank you for your time and consideration.
> > 
> 
> IRQ subsystem maintainers rejected the idea of relying on initcalls to
> enforce probe order because initcalls do not guarantee ordering. The
> Linux driver model instead ensures probe order through device
> dependencies. Since PCI INTx depends on the APLIC being probed first,
> the PCI host bridge probe cannot occur until after the APLIC probe
> completes. This requirement and behavior are the same for both DT and
> ACPI. In DT, the driver model uses fw_devlink to establish probe
> ordering, while in ACPI this is handled through either an explicit _DEP
> or, on RISC-V, the GSI mapping.
> Typically, this dependency appears in the DSDT only for the PCI host
> bridge. Individual PCIe devices are enumerated through the standard PCI
> scan once the host bridge has been probed. Therefore, I’m not sure what
> you meant by a probe sequence defined in the DSDT for PCIe devices.
> Regards,
> Sunil

I understand the scenario you described with a single PCI host bridge, where devices are enumerated
through standard PCIe scanning after the host bridge completes probing. However, in ARM and RISC-V
architectures, systems often have multiple PCI host bridges. We're currently facing an issue in a
6-host-bridge system where all bridges depend on the APLIC driver. They must wait until the APLIC
driver completes and callsacpi_dev_clear_dependenciesto resolve dependencies, after which they're
sequentially added to the system_unbound_wq work queue. However, during execution in the work queue,
these 6 host bridges undergo parallel enumeration, preventing them from following the order defined
in the firmware's ACPI DSDT table. Specifically:
1. The ACPI DSDT table declares the 6 host bridges in a fixed sequence
Device(PC06) {
    Name(_HID, "PNP0A08")
    Name(_CID, "PNP0A03")
    Name(_UID, 0x6)
   ......
}
Device(PC07) {
    Name(_HID, "PNP0A08")
    Name(_CID, "PNP0A03")
    Name(_UID, 0x7)
    ......
}
Device(PC08) {
    Name(_HID, "PNP0A08")
    Name(_CID, "PNP0A03")
    Name(_UID, 0x8)
    .....
}
...
Device(PC11) {
    Name(_HID, "PNP0A08")
    Name(_CID, "PNP0A03")
    Name(_UID, 0xB)
......
}

2. But the OS enumerates them in random order upon each boot (first boot sequence ≠ second boot sequence)
first boot sequence ~ # dmesg |grep -i "PCI Root"
[ 8794.588531] ACPI: PCI Root Bridge [PC08] (domain 0006 [bus 80-ff])
[ 8794.624478] ACPI: PCI Root Bridge [PC06] (domain 0005 [bus 00-ff])
[ 8794.672741] ACPI: PCI Root Bridge [PC10] (domain 0008 [bus 00-ff])
[ 8794.696680] ACPI: PCI Root Bridge [PC07] (domain 0006 [bus 00-7f])
[ 8794.728234] ACPI: PCI Root Bridge [PC11] (domain 0009 [bus 00-ff])
[ 8794.755098] ACPI: PCI Root Bridge [PC09] (domain 0007 [bus 00-ff])
second boot sequence ~ # dmesg |grep -i "PCI Root"
[ 8794.588531] ACPI: PCI Root Bridge [PC09] (domain 0007 [bus 00-ff])
[ 8794.624478] ACPI: PCI Root Bridge [PC06] (domain 0005 [bus 00-ff])
[ 8794.672741] ACPI: PCI Root Bridge [PC08] (domain 0006 [bus 80-ff])
[ 8794.696680] ACPI: PCI Root Bridge [PC11] (domain 0009 [bus 00-ff])
[ 8794.728234] ACPI: PCI Root Bridge [PC07] (domain 0006 [bus 00-7f])
[ 8794.755098] ACPI: PCI Root Bridge [PC10] (domain 0008 [bus 00-ff])

This creates a critical issue: when NVMe devices are connected to these host bridges, the
unpredictable kernel scanning sequence causes device identifiers (e.g., /dev/nvme0n1, /dev/nvme1n1)
to change across reboots. In server environments, such device naming instability is unacceptable as
it breaks storage configuration reliability and consistency.

So far, we've only observed this disorderly enumeration in RISC-V multi-host-bridge scenarios, where
APLIC dependency leads to enumeration via system_unbound_wq. We'd like to consult kernel experts:
1. Has the impact of enumeration disorder in multi-host-bridge scenarios been considered?
2. Are there viable solutions to address the random enumeration caused by system_unbound_wq?

Best regards,
Liqiang



--===============0447176273184525684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0447176273184525684==--
