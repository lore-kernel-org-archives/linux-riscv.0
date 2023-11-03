Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CE3C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fOEVZ0Bad9sWz877y7ceJBgqLsc+f+fAFvzDfXxRW8=; b=zxOvhfLG40ooUW
	/HzWezbFZ3DDJ9Buxkh373ZIM3DK2Mq9VqcwOKyTarYU9yZm0NiDCrip5OTgNvGyzOi2E/VI4ownu
	DR8FNAHmQaQno46eUp56eHVEVbgNVt1Kr5XhWhjY3PlgLjpwZzuH77DI6kWz6dnNNjPfzTYEHybmg
	TMw2MLrsdqPfZ+50V+txfRO3SaIdO1976/DI0QEONdjxPXHLVKvkDWwMHKAOer7p+m7Z6x/dTRqsR
	44tf6KedOI45MHrnXs2hjX11AvyHbf4vxLyfXkq6LJg8/FyrPmT83RIUs1f30XLb+1rFMoFDXIbiF
	VVoot934Vk/oz05Psx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyreL-00B8hw-0w;
	Fri, 03 Nov 2023 10:43:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyreF-00B8g7-01;
	Fri, 03 Nov 2023 10:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qAFZIXflbodoDXB4lem1gRSjUMp78Vi8Q3DaxqkIfhU=; b=knJhz0h/4TAM6ag6xJdTXGbVEQ
	jgaGe2cRFDXkZBUAzAUvwa++0RzEJhjwejiB9ms9fjYudo3W3AgTALd3sppJLSVskUZfJhr2dhoPv
	KjY6HeswmZf3z1GTqmMzRr2u2Q10Un8ozUX8l1hVZs0HbtdRFL1pYzSqlalYpE+yys3H2YZLu1OhU
	xcqVnpomu08Dq/lmzTRZQzzYNepazRsgwMoaW/dZ7rNvJfHkyrSKh00WiQB1GTUfBb7ctuTprn5xj
	uB/Zj7lX7WxlcM3icqvf8dhXvDts6XMzbMioJ53frMbOmF/lp84VWErHzsr1//WEBRYjqdphC9Fy3
	gA/7nWgA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38622)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qyrdz-0005RQ-1z;
	Fri, 03 Nov 2023 10:43:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qyrdz-0008KY-04; Fri, 03 Nov 2023 10:43:15 +0000
Date: Fri, 3 Nov 2023 10:43:14 +0000
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
Message-ID: <ZUTOwuZVLvzptuuP@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-16-james.morse@arm.com>
 <20230914145353.000072e2@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914145353.000072e2@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_034331_045298_D2B2A921 
X-CRM114-Status: GOOD (  25.23  )
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

On Thu, Sep 14, 2023 at 02:53:53PM +0100, Jonathan Cameron wrote:
> On Wed, 13 Sep 2023 16:38:03 +0000
> James Morse <james.morse@arm.com> wrote:
> 
> > ACPI has two ways of describing processors in the DSDT. Either as a device
> > object with HID ACPI0007, or as a type 'C' package inside a Processor
> > Container. The ACPI processor driver probes CPUs described as devices, but
> > not those described as packages.
> > 
> 
> Specification reference needed...
> 
> Terminology wise, I'd just refer to Processor() objects as I think they
> are named objects rather than data terms like a package (Which include
> a PkgLength etc)

I'm not sure what kind of reference you want for the above. Looking in
ACPI 6.5, I've found in 5.2.12:

"Starting with ACPI Specification 6.3, the use of the Processor() object
was deprecated. Only legacy systems should continue with this usage. On
the Itanium architecture only, a _UID is provided for the Processor()
that is a string object. This usage of _UID is also deprecated since it
can preclude an OSPM from being able to match a processor to a
non-enumerable device, such as those defined in the MADT. From ACPI
Specification 6.3 onward, all processor objects for all architectures
except Itanium must now use Device() objects with an _HID of ACPI0007,
and use only integer _UID values."

Also, there is:

https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#declaring-processors

Unfortunately, using the search facility on that site to try and find
Processor() doesn't work - it appears to strip the "()" characters from
the search (which is completely dumb, why do search facilities do that?)

> > The missing probe for CPUs described as packages creates a problem for
> > moving the cpu_register() calls into the acpi_processor driver, as CPUs
> > described like this don't get registered, leading to errors from other
> > subsystems when they try to add new sysfs entries to the CPU node.
> > (e.g. topology_sysfs_init()'s use of topology_add_dev() via cpuhp)
> > 
> > To fix this, parse the processor container and call acpi_processor_add()
> > for each processor that is discovered like this. The processor container
> > handler is added with acpi_scan_add_handler(), so no detach call will
> > arrive.
> > 
> > Qemu TCG describes CPUs using packages in a processor container.
> 
> processor terms in a processor container. 

Are you wanting this to be:

"Qemu TCG describes CPUs using processor terms in a processor
container."

? Searching the ACPI spec for "processor terms" (with or without quotes)
only brings up results for "terms" - yet another reason to hate site-
provided search facilities, I don't know why sites bother. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
