Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEA8D3176B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+S5lxnITpCjAiFoLSucHSAz8lnv9x3vFwgsEe/09rAo=; b=f6V7In+E85jGHa
	ksoGlroy21SMOIxxG+OG0TT1E9SrSctDe09kTX8fNreOjinnvXapcTBLV4l21+PqpC5kWXWUyUTo0
	ZJTbiAHOgXz5I8TAi1NDAPwBl+jNXKXrR3uV8fosdOQ8PZZ2o3CcwtlmHCWqe6u5S9MavEgjPrx8Z
	40/3gUD0Cx9Vmjn8usRp9CYxEjFNXWHqqY3r/T7ttM3XVW7Pm8sl8ERIuAQNjqedkW9ewbfGVe9Cm
	fai1B4zL93eefKO14MT9G/uATzvj1CxRjgfKoEIVYC2QAlHCT2kOqJTh4uuQWCUjY/BWeNxdqtrwb
	mNvIIglSGyilCSr+qULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NO8-00000000DDJ-1r2c;
	Tue, 05 Nov 2024 17:30:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NCK-00000000BXr-3MOb
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 17:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36981A4350D;
	Tue,  5 Nov 2024 17:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA699C4CECF;
	Tue,  5 Nov 2024 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730827110;
	bh=9swtDu2MiH44n97pp1Y1dGpeIR7FF3ZuO/eaWS+/fms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NyRuaU3mAqVyBJ2Cdj7wtgjmaCAPEROP8WeCLFEDLXTtWYJ8LvAEnx41zJTF19TZR
	 WqNiCmQeYYppdQ/G7coVDO99ruUXbINQnnjX0jV0nVx2fUwsXGUeOOzB+ZVwt01Dat
	 CwLkpQ62vQHoZM1x8Q1WPdsQfGQJsM7YuVbMbSwSL23Xo1CPBzT4h1W8HjT8TVJdUp
	 5jng8y7vU44SbyjS4eoQ7f9aaJVsrRfw+MySbATBvgHaXdihocDaZSZxGuBXX94NbT
	 CMqhkOdLGphKcMFR3tByCtnx/a8GPTnPkE0InsbOiM54BBtCx/7PPqTTQPHHWPncZJ
	 ixdkddyDGx3PQ==
Date: Tue, 5 Nov 2024 11:18:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/2] PCI: microchip: rework reg region handing to
 support using either instance 1 or 2
Message-ID: <20241105171828.GA1474726@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104-stabilize-friday-94705c3dc244@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_091832_988298_483D97BE 
X-CRM114-Status: GOOD (  39.87  )
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

On Mon, Nov 04, 2024 at 11:18:43AM +0000, Conor Dooley wrote:
> On Fri, Nov 01, 2024 at 02:51:29PM -0500, Bjorn Helgaas wrote:
> > On Wed, Aug 14, 2024 at 09:08:42AM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > The PCI host controller on PolarFire SoC has multiple "instances", each
> > > with their own bridge and ctrl address spaces. The original binding has
> > > an "apb" register region, and it is expected to be set to the base
> > > address of the host controllers register space. Defines in the driver
> > > were used to compute the addresses of the bridge and ctrl address ranges
> > > corresponding to instance1. Some customers want to use instance0 however
> > > and that requires changing the defines in the driver, which is clearly
> > > not a portable solution.
> > 
> > The subject mentions "instance 1 or 2".
> > 
> > This paragraph implies adding support for "instance0" ("customers want
> > to use instance0").
> > 
> > The DT patch suggests that we're adding support for "instance2"
> > ("customers want to use instance2").
> > 
> > Both patches suggest that the existing support is for "instance 1".
> > 
> > Maybe what's being added is "instance 2", and this commit log should
> > s/instance0/instance 2/ ?  And probably s/instance1/instance 1/ so the
> > style is consistent?
> 
> Hmm no, it would be s/instance1/instance 2/ & s/instance0/instance 1/.
> The indices are 1-based, not 0-based.
> 
> > Is this a "pick one or the other but not both" situation, or does this
> > device support two independent PCIe controllers?
> > 
> > I first thought this driver supported a single PCIe controller, and
> > you were adding support for a second independent controller.
> 
> I don't know if they are fully independent (Daire would have to confirm)
> but as far as the driver in linux is concerned they are. As far as I
> know, you could operate both instances at the same time, but I've not
> heard of any customer that is actually doing that nor tested it myself.
> Operating both instances would require another node in the devicetree,
> which should work fine given the private data structs are allocated at
> runtime. I think the config space is shared.
> 
> > But the fact that you say "the [singular] host controller on
> > PolarFire", and you're not changing mc_host_probe() to call
> > pci_host_common_probe() more than once makes me think there is only a
> > single PCIe controller, and for some reason you can choose to operate
> > it using either register set 1 or register set 2.
> 
> The wording I've used mostly stems from conversations with Daire. We've
> kinda been saying that there's a single controller with two root port
> instances. 

If these are two separate Root Ports, can we call them "Root Ports"
instead of "instances"?  Common terminology makes for common
understanding.

> Each root port instance is connected to different IOs,
> they're more than just different registers for accessing the same thing.

Sounds like some customers use Root Port 1 and others use Root Port 2,
maybe based on things like which pins are more convenient to route.

I would very much like to reword these commit logs using as much
standard PCIe terminology as possible.  Most of these native PCIe
controller drivers have Root Complex and Root Port concepts all mixed
together, and anything we can do to standardize them will be a
benefit.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
