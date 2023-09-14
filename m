Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848C9EDE9A4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0V9vFdl0HWpbCUIS3yeBJ/HTjXtyfGfHBZQ4cpTF4yA=; b=jOqImMWlavb43Y
	fz0oV/d0DBNo0AS7Bqex6PljBTXAKUBGXIVdBVTn+F0WJfW7Mv0gnSxUV5Tg0LgUPY7pxu8pJx8iy
	uRDSuC9qiAYulBLCK/45Ckd5UxwoySwVfFGf+eNgNTkMqS6nxXzWPx/wALUPGjsA1yTlB2GLh18/n
	xfCBXD5u8o4enKrnsmgjqdnTICWbwKCvYt4WAZrZMRM3+vzQIW0pZOnRmunneKTQ+JxvkRDSCoabm
	DbI9W3zgna2TtzfMmIh9mSQUckfYb7cu0Hf/lrxUJad+E4QpoUFqm8K0dKe7K4cAfdvzeuyUn74ll
	UHL/puIJiHafA7RZ+4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkFd-008Cf3-1O;
	Thu, 14 Sep 2023 11:11:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkFZ-008CeL-2O;
	Thu, 14 Sep 2023 11:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mJIualwweUZGp55FBJbOqzxQCkNxNmUE1MPBTrTAheg=; b=lQUPBh86IwhBsrufNHvbGJoswo
	o9WAIvldkMVcmqVtmLe5/6bLSewxs+Z2zKOFUciTaBwoznYr/4l9q1BrCNdgMNpyyPJ/FQAJQqRpt
	HHPuTWXi9FGJI4Fsakq2zuSMCKpyqM9oWOuYFQg3YEY87mcZjBbVyzCG8PlrEOJO4eUs3JYcUsNSV
	8M1bStdBbGXRz//qXyqilYXz8P/SR3qc6qUFRIBYgyqe6k/ZgeXQE3yBRrtC1g7RGzGLmqTUy/SDw
	/fKly5ax5mvdKXPRIs0p+eZHMMcY7PYLdgGANRVsDAltijZWEvJAGZoJa9kIJdA5fKcBYM17kUQa+
	XM7+8THQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55622)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgkFT-0003wU-1z;
	Thu, 14 Sep 2023 12:11:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgkFT-0004iX-Gc; Thu, 14 Sep 2023 12:11:03 +0100
Date: Thu, 14 Sep 2023 12:11:03 +0100
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
Subject: Re: [RFC PATCH v2 02/35] drivers: base: Use present CPUs in
 GENERIC_CPU_DEVICES
Message-ID: <ZQLqRzSeOlBiKCuB@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-3-james.morse@arm.com>
 <ZQLCZsw+ZGbTM8oK@shell.armlinux.org.uk>
 <20230914115613.0000778e@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914115613.0000778e@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_041109_802135_7DEDCD68 
X-CRM114-Status: GOOD (  32.55  )
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

On Thu, Sep 14, 2023 at 11:56:13AM +0100, Jonathan Cameron wrote:
> On Thu, 14 Sep 2023 09:20:54 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Wed, Sep 13, 2023 at 04:37:50PM +0000, James Morse wrote:
> > > Three of the five ACPI architectures create sysfs entries using
> > > register_cpu() for present CPUs, whereas arm64, riscv and all
> > > GENERIC_CPU_DEVICES do this for possible CPUs.
> > > 
> > > Registering a CPU is what causes them to show up in sysfs.
> > > 
> > > It makes very little sense to register all possible CPUs. Registering
> > > a CPU is what triggers the udev notifications allowing user-space to
> > > react to newly added CPUs.
> > > 
> > > To allow all five ACPI architectures to use GENERIC_CPU_DEVICES, change
> > > it to use for_each_present_cpu(). Making the ACPI architectures use
> > > GENERIC_CPU_DEVICES is a pre-requisite step to centralise their
> > > cpu_register() logic, before moving it into the ACPI processor driver.
> > > When ACPI is disabled this work would be done by
> > > cpu_dev_register_generic().
> > > 
> > > Of the ACPI architectures that register possible CPUs, arm64 and riscv
> > > do not support making possible CPUs present as they use the weak 'always
> > > fails' version of arch_register_cpu().
> > > 
> > > Only two of the eight architectures that use GENERIC_CPU_DEVICES have a
> > > distinction between present and possible CPUs.
> > > 
> > > The following architectures use GENERIC_CPU_DEVICES but are not SMP,
> > > so possible == present:
> > >  * m68k
> > >  * microblaze
> > >  * nios2
> > > 
> > > The following architectures use GENERIC_CPU_DEVICES and consider
> > > possible == present:
> > >  * csky: setup_smp()
> > >  * parisc: smp_prepare_boot_cpu() marks the boot cpu as present,
> > >    processor_probe() sets possible for all CPUs and present for all CPUs
> > >    except the boot cpu.  
> > 
> > However, init/main.c::start_kernel() calls boot_cpu_init() which sets
> > the boot CPU in the online, active, present and possible masks. So,
> > _every_ architecture gets the boot CPU in all these masks no matter
> > what.
> > 
> > Only of something then clears the boot CPU from these masks (which
> > would be silly) would the boot CPU not be in all of these masks.
> Hi Russel,
> 
> Upshot is that the code in parisc smp_prepare_boot_cpu() can be dropped?
> Seems like another useful simplification to add to front of this series.

Yes - but I personally (and probably others) would like to see progress
made towards getting at least some of the changes in this series merged,
rather than seeing this series hang around longer and grow. Nothing in
this series touches any architecture's smp_prepare_boot_cpu(), so such
a change would not interfere with this series.

Therefore, I suggest that removing those two set_cpu_*() calls in
smp_prepare_boot_cpu() is something that could happen irrespective of
anything in this series, and I would encourage PA-RISC folk to do that
anway.

The same is true of Loongarch, mips, sh, and sparc32, and they can
independently sort this.

> Seems there are lots of other empty implementations of smp_prepare_boot_cpu()
> maybe worth making that optional whilst here and dropping all the empty ones?

Yes, and again, this could be a series separate from this one. If one
arch wants to add the empty weak version of smp_prepare_boot_cpu(),
then it would be a matter of others deleting their empty implementation
(possibly after first having cleaned up the unnecessary set_cpu_*()
calls).

In any case, I would expect that patches doing any of the above would
end up being cherry-picked from a series by arch maintainers, so at
least to me it makes zero sense to include it with this already large
series, and would make the management of this series more complex.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
