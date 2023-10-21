Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B2FC001E0
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Oct 2023 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=be3ynRhbaWtdWqH6lD2QbgqoyltZDpDcIx7iTomaY/o=; b=itL//gBbuSLDNs
	IIcdnitVmwMQgNmyjZM1YlTU0c23PfM9XALiHEYk4qnpVf8/amVaZ6kRyXMvnVTwjc9N2a1B/hXFx
	UAEFRLafGlKve6j5uPMOsyhIgRHnknqTfY5AlSrHTR+CbewgmKpo/3ABBTiOJkt2WZxnkvdQV+vf+
	rxjqLYSy/ZWotSQw8SUtHJukZAhFTROJeCVaJJir8EV71ylgbV8m4iZIYeZ+jn+EMSUv4M0L1aKCy
	7uSqUm3vh7lqRsSda/uhXiq4Fdvybwpeh7D33grVhcnH3KBB2MemAcfNOji33iRQoiPxxz5d0bW6/
	YS/5JdTQ2XHAwFNLgreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu9fH-003vv2-2H;
	Sat, 21 Oct 2023 10:57:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu9f9-003vtt-2W;
	Sat, 21 Oct 2023 10:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7255C60F87;
	Sat, 21 Oct 2023 10:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85359C433C8;
	Sat, 21 Oct 2023 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697885818;
	bh=lWjx0bstoWSn8O+1+vq3s6PJ4JDA6SyKY8ViX2L7YW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTcaPIRtnQmlyxhrbVQzTkIF6yu1dZwfQH0HKzzZf+IdjhhVDBzohjKljAvRxu6ZC
	 +EK0hYdtjcSMWn6+4ncGofksLqwZ6P5+pfIq4uHxdEPiU2xTLxyhLfke0SYjlmgd4x
	 HJxhZl7xo4cAk+d9+HLkSGCqfb+thCkty+PvIYNY=
Date: Sat, 21 Oct 2023 12:56:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 11/35] arch_topology: Make
 register_cpu_capacity_sysctl() tolerant to late CPUs
Message-ID: <2023102128-banter-circular-85a2@gregkh>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-12-james.morse@arm.com>
 <20230914130126.000069db@Huawei.com>
 <ZTJqOTfDEnL9wgtY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTJqOTfDEnL9wgtY@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_035659_884927_7DA9FDFC 
X-CRM114-Status: GOOD (  30.76  )
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

On Fri, Oct 20, 2023 at 12:53:29PM +0100, Russell King (Oracle) wrote:
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
> > 
> > 
> > +CC GregKH
> > Given changes in drivers/base/
> 
> It would be good to have a comment on this from Greg before I post
> an updated series of James' patches with most of the comments
> addressed, possibly later today.

Sorry, I don't see what I am supposed to comment on, so please just send
a new series and I'll look at that.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
