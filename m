Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AFDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADAkQz1UtOeR0U9Umgdg4PGatR3AbP/y6HkKAQlVDaA=; b=ybo/DmJPaHVTZu
	1W3q1rFkByzD/HUhhPicUFXkR39+UXRwGBU5LgxlvjfSCzh3aOkF+8YBtSwFg70QHIFhfqv77oOrd
	oTcbMDZaGF4zL+DIHaGlyedIkPoW9aAR047pULqYENk5i+XOTDRrALM7nIPGdZoHxwhPLrOV0rDXU
	oLUS7YRXwAgaMS82fX8OiUB1XsFcG+P3am/nn+JFa5RMylxwyWfF8nzmk0UggyPxrmSq0cD9xj6F/
	SBd0W7AyVcrD6xkqNHiCNJKyu+NVBxd4O671J4FFfGKZMpLibw6bbtgccLkdYU89w1G4bRKnsASvU
	4sctEPw27DdahiJz5KAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpxi-000yze-0k;
	Thu, 14 Dec 2023 17:57:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpxc-000yyk-37;
	Thu, 14 Dec 2023 17:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L5kH8hIOwqwSSDYrxYuLkFSUt4lz/pRwIQ1vDoFypus=; b=bOgj+hxbflOy6cpdwb0AvqLThn
	fosBo2pgUtid/Btg47D1Tr3fCNbhKvXDaFyqcQYQOH+89NazR4QJ+nEdeEWaM9Zg8F7j05T5cdfgY
	VM0/6oQ5Ia3iYudlE0F/bur8gqKg6jOipwcfxclKO24mpPwoNEGS+tH8oMOIY0M/Mu+mNs52+wi+F
	lm2Ni4mV9JyW5Xe5z2A66vskhG5XC6BjK4hHnl/tR3bWJCTUoI5s6XIt40Rmf7oAfWwyL5XMzUAT4
	/eBXYVzBh9GeGUvZJBlu9nSJESu+sZ6JrCvtRt5k+bC7E6cUZkcVRSXfwHypdgwrPjdz2GiqQfqO/
	Cgy7guXg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38096)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rDpxV-0001oM-19;
	Thu, 14 Dec 2023 17:57:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rDpxX-0002km-Ed; Thu, 14 Dec 2023 17:57:19 +0000
Date: Thu, 14 Dec 2023 17:57:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
Message-ID: <ZXtB/+2kDtaz1Zf4@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
 <20231214173626.00005062@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214173626.00005062@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_095725_011341_C969DB1C 
X-CRM114-Status: GOOD (  25.97  )
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

On Thu, Dec 14, 2023 at 05:36:26PM +0000, Jonathan Cameron wrote:
> On Wed, 13 Dec 2023 12:49:21 +0000
> Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> 
> > From: James Morse <james.morse@arm.com>
> > 
> > ACPI has two ways of describing processors in the DSDT. From ACPI v6.5,
> > 5.2.12:
> > 
> > "Starting with ACPI Specification 6.3, the use of the Processor() object
> > was deprecated. Only legacy systems should continue with this usage. On
> > the Itanium architecture only, a _UID is provided for the Processor()
> > that is a string object. This usage of _UID is also deprecated since it
> > can preclude an OSPM from being able to match a processor to a
> > non-enumerable device, such as those defined in the MADT. From ACPI
> > Specification 6.3 onward, all processor objects for all architectures
> > except Itanium must now use Device() objects with an _HID of ACPI0007,
> > and use only integer _UID values."
> > 
> > Also see https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#declaring-processors
> > 
> > Duplicate descriptions are not allowed, the ACPI processor driver already
> > parses the UID from both devices and containers. acpi_processor_get_info()
> > returns an error if the UID exists twice in the DSDT.
> > 
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
> > Qemu TCG describes CPUs using processor devices in a processor container.
> > For more information, see build_cpus_aml() in Qemu hw/acpi/cpu.c and
> > https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#processor-container-device
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > ---
> > Outstanding comments:
> >  https://lore.kernel.org/r/20230914145353.000072e2@Huawei.com
> Looks like you resolved those (were all patch description things).
> 
> So I'm happy.
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Great, I wasn't sure if I had resolved them to your satisfaction, so I
kept the reference to your original review. I've now removed it and
added your r-b. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
