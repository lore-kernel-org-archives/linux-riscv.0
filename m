Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F24FC46CA2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBRQy/PiPloJPF6c4xmdGnt2jqJ2I+seUY9qYJipk04=; b=OI9e5RWKh6E1uy
	zI7lVmfvyOh3/ND3KGBuhPkmtFQ+TO6E2TwsPNk4K5DPcofWrzgXt2YaNopmz1Pag5yu2OPuw8dpK
	8U6lEULEsNIvEqzgYWSOtxk+oGS63TpA05JqfpgVRw69kC00Msw66HjUgpr88Se3u+nbz2DPt65AI
	68xvTI7VDW4XfsepsyA3luNwQFgXbcmDo0/vR4krtQTOunQjYuGKmOHdNHrag+wk6lGR4g96iv+hL
	XKrAFhHGIaaqq31lAIrN4cRcJUE0iux4Pf1TJoL1tSM2K/4HUZOGGCWpUO2avvQOLnOQSP65U6OCr
	mo+GluT/aCGfua5qtWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9qY-009eYX-1v;
	Mon, 18 Dec 2023 09:23:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9qU-009eWH-1R;
	Mon, 18 Dec 2023 09:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB041CE0F52;
	Mon, 18 Dec 2023 09:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17966C433C8;
	Mon, 18 Dec 2023 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702891407;
	bh=GHAwRyvzYMoO5t9DJy2L/vZFGZ5Dq9mWQeMLRWVKZx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJud1fJDL22h4rushErpJMmUrhO3xcrslPsqJRk6uc2IzcXDtSELA0otvbONR8FTW
	 L6MBy2qAm1/d885aKTGZ52miElldnk4dux1oGBB7Qwie/Jstp0/xoF4pir4VX06dNl
	 WBVzRRDgFKNRb1ghAyxl6IzWv7qEoMD3t69caobPE1s/iGljqRMHYLRBOTapLw3KLN
	 qQ9il4M5nD24gxNHN3ub9/SXuLvIsqeY9z0yA+LkYmcU+y7TMSg6l78d29OVQGPo/H
	 beQmrNVxT0E83mkzpMD1ZcGj9HNmeZcG2UZcZu57S7oyla7BogUN1qFgJvr6HKhaxE
	 r6nP6bW7hsUFw==
Date: Mon, 18 Dec 2023 10:23:18 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
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
Subject: Re: [PATCH RFC v3 13/21] ACPICA: Add new MADT GICC flags fields
Message-ID: <ZYAPhlwPUT/7dN4n@lpieralisi>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOgs-00Dvko-6t@rmk-PC.armlinux.org.uk>
 <20231215162322.00007391@Huawei.com>
 <ZXyEiHLFBsoUkfNI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXyEiHLFBsoUkfNI@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_012330_977935_2C46C739 
X-CRM114-Status: GOOD (  21.66  )
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

On Fri, Dec 15, 2023 at 04:53:28PM +0000, Russell King (Oracle) wrote:
> On Fri, Dec 15, 2023 at 04:23:22PM +0000, Jonathan Cameron wrote:
> > On Wed, 13 Dec 2023 12:50:18 +0000
> > Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> > 
> > > From: James Morse <james.morse@arm.com>
> > > 
> > > Add the new flag field to the MADT's GICC structure.
> > > 
> > > 'Online Capable' indicates a disabled CPU can be enabled later. See
> > > ACPI specification 6.5 Tabel 5.37: GICC CPU Interface Flags.
> > > 
> > > Signed-off-by: James Morse <james.morse@arm.com>
> > > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > I see there is an acpica pull request including this bit but with a different name
> > For reference.
> > https://github.com/acpica/acpica/pull/914/commits/453a5f67567786522021d5f6913f561f8b3cabf6
> > 
> > +CC Lorenzo who submitted that.
> 
> > > +#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3)	/* 03: CPU is online capable */
> > 
> > ACPI_MADT_GICC_ONLINE_CAPABLE
> 
> It's somewhat disappointing, but no big deal. It's easy enough to change
> "irqchip/gic-v3: Add support for ACPI's disabled but 'online capable' CPUs"
> to use Lorenzo's name when that patch hits - and it becomes one less
> patch in this patch set when Lorenzo's change eventually hits mainline.
> 
> Does anyone know how long it may take for Lorenzo's change to get into
> mainline? Would it be by the 6.8 merge window or the following one?

I wish I knew. I submitted ACPICA changes for the online capable bit
since I had to add additional flags on top (ie DMA coherent) and it
would not make sense to submit the latter without the former.

I'd be great if the ACPICA headers can make it into Linux for the upcoming
merge window, not sure what I can do to fasttrack the process though
(I shall ping the maintainers).

Lorenzo

> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
