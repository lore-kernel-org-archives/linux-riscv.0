Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5360C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHcBPS6qQ87CzMvioxmwmvQQqFaCrpO03E8oLX+cnQg=; b=c8LETNJ2KzVxNc
	ZV/52Py32QCrTKWc3QMocMsUzJnqFYGylJt5e8NRVkw3HN4CBBD/3aXRg1wrxzK1noIWrW6fhzwfr
	KuQHbslE0wf2HG0VMBKlJ8T3WeGHs2sHww572qOVUYE/gYo8mmqAq/fPq8f19hMc3VsNmWjfGppz/
	UaUdSpp/rJh3E/ytRw0KMZExVPeeUkNxlRYz9J6aMXwsUr4i/JjK/1uoDOAnEuYzr9pefuy+ybnhZ
	7sLCT7ayz8y4raha0hARt4EbQVbaAqRTK1e+/pMCpbnIHJ7jGv8Co7rK7O6f93hMrp05pPrngFzrk
	daMGyoQwvE9qkDqwCn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUT59-0000000DAQs-0wNn;
	Mon, 29 Jan 2024 14:57:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUT54-0000000D9yS-3omr;
	Mon, 29 Jan 2024 14:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M1dyK4/mPjmXezB9OECra+eUv49q0u5KCO/rCTgyWjo=; b=zshAlN5dO4KSpCUyuhnHvqGFw5
	Gh7/mHP6cgVBHrE5nMDsXFPalTDr1ZzFPzRd+TI3s6neNq9Af58Vp3/mYT3mH1KRmbTzeAaN4hL6H
	fwQhoOIa1yKFj+i7nMitwQv1yOG0Pz0nUWKhd2M/o536j+TlvQga+8v5LJ3avKX49iZjAYE3R321y
	O2ps7v/NwXnLCZBPRDhB722lFSCJPiCiWdXOhGxpRCt+7PfqIGluNFkn4mXrYxw2Koq2c9Rr4ObDV
	7YwmV/eFjDI793/wrAU7O0xFV+v50tPaN/a1bIX95nRfhzCTLPIOqUuhcS09c50fU0hLrjkOGJEos
	mD5qTJTg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60316)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rUT2l-0000YR-0u;
	Mon, 29 Jan 2024 14:55:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rUT2f-0004dh-CJ; Mon, 29 Jan 2024 14:55:21 +0000
Date: Mon, 29 Jan 2024 14:55:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or
 functional) devices
Message-ID: <Zbe8WQRASx6D6RaG@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
 <20231215161539.00000940@Huawei.com>
 <5760569.DvuYhMxLoT@kreacher>
 <20240102143925.00004361@Huawei.com>
 <20240111101949.000075dc@Huawei.com>
 <ZZ/CR/6Voec066DR@shell.armlinux.org.uk>
 <20240112115205.000043b0@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112115205.000043b0@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_065750_963409_EBE7E7B0 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Jonathan,

On Fri, Jan 12, 2024 at 11:52:05AM +0000, Jonathan Cameron wrote:
> On Thu, 11 Jan 2024 10:26:15 +0000
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > @@ -2381,16 +2388,38 @@ EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
> >   * acpi_dev_ready_for_enumeration - Check if the ACPI device is ready for enumeration
> >   * @device: Pointer to the &struct acpi_device to check
> >   *
> > - * Check if the device is present and has no unmet dependencies.
> > + * Check if the device is functional or enabled and has no unmet dependencies.
> >   *
> > - * Return true if the device is ready for enumeratino. Otherwise, return false.
> > + * Return true if the device is ready for enumeration. Otherwise, return false.
> >   */
> >  bool acpi_dev_ready_for_enumeration(const struct acpi_device *device)
> >  {
> >  	if (device->flags.honor_deps && device->dep_unmet)
> >  		return false;
> >  
> > -	return acpi_device_is_present(device);
> > +	/*
> > +	 * ACPI 6.5's 6.3.7 "_STA (Device Status)" allows firmware to return
> > +	 * (!present && functional) for certain types of devices that should be
> > +	 * enumerated. Note that the enabled bit should not be set unless the
> > +	 * present bit is set.
> > +	 *
> > +	 * However, limit this only to processor devices to reduce possible
> > +	 * regressions with firmware.
> > +	 */
> > +	if (device->status.functional)
> > +		return true;

I have a report from within Oracle that this causes testing failures
with QEMU using -smp cpus=2,maxcpus=4. I think it needs to be:

	if (!device->status.present)
		return device->status.functional;

	if (device->status.enabled)
		return true;

	return !acpi_device_is_processor(device);

So we can better understand the history here, let's list it as a
truth table. P=present, F=functional, E=enabled, Orig=how the code
is in mainline, James=James' original proposal, Rafael=the proposed
replacement but seems to be buggy, Rmk=the fixed version that passes
tests:

P F E	Orig	James	Rafael		Rmk
0 0 0	0	0	0		0
0 0 1	0	0	0		0
0 1 0	1	1	1		1
0 1 1	1	0	1		1
1 0 0	1	0	!processor	!processor
1 0 1	1	1	1		1
1 1 0	1	0	1		!processor
1 1 1	1	1	1		1

Any objections to this?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
