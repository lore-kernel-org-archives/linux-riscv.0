Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXjRgCe9MRRbQE3tUBUXAAMM/x0MFHgJWe3LBOwkQc0=; b=SfB2X8qDOuB8IQ
	GhGwwDgdcyDZnhvNG2efFIwk1+aUNohpUhtrmCa6QPCArv0ZAlO8cD5KXDyDB35Ilid0zo2DJftfT
	csoOHKpM+rbX9JSpGd1cKBOB/JaWXTJE7kY6ta8dPexjKzsJSHUOCFDDC1i/FF4Npb8WNp74zLYQy
	yQQVs3e3UgfGlEUt2pFZBUIVXkFcFHL83n4PCmcrceHo0wU6Zuatw5r/Dp71zV01gFxRhrf6chHkI
	McbYnHB+5UgtXHnYmBOcoFO1l8w5stjHEoVcAViaYoi3A6zLWgEsms9Xk0LGJmPvmIXBo+ccs57jF
	6QbZmvPXAMyM+6Ud+ELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyrrj-00BETl-0Z;
	Fri, 03 Nov 2023 10:57:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyrrc-00BEOz-2p;
	Fri, 03 Nov 2023 10:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o8sTPKBWvFBC0Aptf11FbR8YSjSZdMGSDFlY4xWXWaI=; b=Sj2cjVoT9t+IOEoqQJ53YxE07G
	ErC9itrvBOY3rqkJZRzR3n9bWZmyCAlY+FA8WFuA/L5AFNiXzVY2H+HphKII4xZNCSjqPbge8eN8U
	J51d33/f8Adj2ntImyjj3U5WsYbrID7xiuHjsgFHB6RGN8a+KnsnT1A1RAVykm5QwogyLIMRL2+ND
	KHZj5MNv1iC3JSpkpSZEIJmdryDiAAgMYVFq74uos+pcX3pukJEsDJGJcSZNDUa713nqdVfJiPMTW
	syuWouFnbkMouLpsBe6bht6umC+OeFMdVqURYoVtihs2GWzplgJBOcdfBihzbT2eu9HXbFY53GUiI
	vVSNNROg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37210)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qyrrR-0005Sc-2Y;
	Fri, 03 Nov 2023 10:57:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qyrrT-0008L2-Er; Fri, 03 Nov 2023 10:57:11 +0000
Date: Fri, 3 Nov 2023 10:57:11 +0000
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
Subject: Re: [RFC PATCH v2 15/35] ACPI: processor: Add support for processors
 described as container packages
Message-ID: <ZUTSB14JgDzFSlHK@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-16-james.morse@arm.com>
 <20230914145353.000072e2@Huawei.com>
 <ZUTOwuZVLvzptuuP@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZUTOwuZVLvzptuuP@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_035720_937381_439B8AD2 
X-CRM114-Status: GOOD (  33.11  )
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

On Fri, Nov 03, 2023 at 10:43:15AM +0000, Russell King (Oracle) wrote:
> On Thu, Sep 14, 2023 at 02:53:53PM +0100, Jonathan Cameron wrote:
> > On Wed, 13 Sep 2023 16:38:03 +0000
> > James Morse <james.morse@arm.com> wrote:
> > 
> > > ACPI has two ways of describing processors in the DSDT. Either as a device
> > > object with HID ACPI0007, or as a type 'C' package inside a Processor
> > > Container. The ACPI processor driver probes CPUs described as devices, but
> > > not those described as packages.
> > > 
> > 
> > Specification reference needed...
> > 
> > Terminology wise, I'd just refer to Processor() objects as I think they
> > are named objects rather than data terms like a package (Which include
> > a PkgLength etc)
> 
> I'm not sure what kind of reference you want for the above. Looking in
> ACPI 6.5, I've found in 5.2.12:
> 
> "Starting with ACPI Specification 6.3, the use of the Processor() object
> was deprecated. Only legacy systems should continue with this usage. On
> the Itanium architecture only, a _UID is provided for the Processor()
> that is a string object. This usage of _UID is also deprecated since it
> can preclude an OSPM from being able to match a processor to a
> non-enumerable device, such as those defined in the MADT. From ACPI
> Specification 6.3 onward, all processor objects for all architectures
> except Itanium must now use Device() objects with an _HID of ACPI0007,
> and use only integer _UID values."
> 
> Also, there is:
> 
> https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#declaring-processors
> 
> Unfortunately, using the search facility on that site to try and find
> Processor() doesn't work - it appears to strip the "()" characters from
> the search (which is completely dumb, why do search facilities do that?)
> 
> > > The missing probe for CPUs described as packages creates a problem for
> > > moving the cpu_register() calls into the acpi_processor driver, as CPUs
> > > described like this don't get registered, leading to errors from other
> > > subsystems when they try to add new sysfs entries to the CPU node.
> > > (e.g. topology_sysfs_init()'s use of topology_add_dev() via cpuhp)
> > > 
> > > To fix this, parse the processor container and call acpi_processor_add()
> > > for each processor that is discovered like this. The processor container
> > > handler is added with acpi_scan_add_handler(), so no detach call will
> > > arrive.
> > > 
> > > Qemu TCG describes CPUs using packages in a processor container.
> > 
> > processor terms in a processor container. 
> 
> Are you wanting this to be:
> 
> "Qemu TCG describes CPUs using processor terms in a processor
> container."
> 
> ? Searching the ACPI spec for "processor terms" (with or without quotes)
> only brings up results for "terms" - yet another reason to hate site-
> provided search facilities, I don't know why sites bother. :(

Given what
https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#processor-container-device
says, and what QEMU does (as I detailed in my reply to Gavin), I think
this should be:

"Qemu TCG describes CPUs using processor devices in a processor
container."

which uses the same terminology as the ACPI specification. Maybe also
including a reference to the above URL would be a good idea too?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
