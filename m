Return-Path: <SRS0=+nUN=CI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54034C433E6
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 02:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 202F62075B
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 02:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JEKp7XPP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtwZ/v6p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 202F62075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=h72eKH/zsp8dltcQV/0xfVoIhkjkx7U+/Dgh76uwYu0=; b=JEKp7XPPRTr8cjFsUGSCU5Hp8
	evR7qZWw/PeQbBYFVKm+CihcMUFGUD/D8XLl66ZsQF06QkZSIsUmqTkIcQEI25H52ikvjfNG9C04x
	/LdnSL5VoA6rJJq5oqqdds9fa6pm3B6jE0I3vXK/51txaehD1fDa/6a1KOx9PgcX1mJeWtZ7M/OBs
	3EaRRKHmOqaOUoNrPyg1YTKrWAu3i6FrH3bXhqPBxn90IfihkwoofDZCC57vZEUN1hGGQ775Bkh5+
	V6PdVg5wSKi3RoL1Vq+Kqd/wh9lk5oiklOqgSeIfA/noW3vcYhxg0UIeZe6uojjKvX2eNerT4E/FT
	eAzxN2iFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCDUX-0003lE-GT; Sun, 30 Aug 2020 02:54:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCDUS-0003kV-4q; Sun, 30 Aug 2020 02:54:45 +0000
Received: from localhost (113.sub-72-107-119.myvzw.com [72.107.119.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9897D2075B;
 Sun, 30 Aug 2020 02:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598756081;
 bh=Z3utoNDrOsl5rBfHIimSAKozg7AYBP8nGpqxszM//w0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jtwZ/v6p2sVfweeOXgXlYs5Vnq9wMh10kTQjajvH7IdOshWMhSKCj27bkwKMpHy+J
 Qk7+qfwS1qADtdTbFQaqgVtbf2ylygBfMX7uq6EJiNYEWaOw9HbZh5aCjfBoUbi0/f
 nZknlBe/Q7GsLWKnLGQJ0kDtulxaxEznfsmvVgm8=
Date: Sat, 29 Aug 2020 21:54:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [RFC/RFT PATCH 3/6] arm64, numa: Move pcibus_to_node definition
 to generic numa code
Message-ID: <20200830025438.GA9624@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULtHzQKJNE4OO_U2NMaW6pX38Pw7dLywGc9og1BuuAYNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_225444_395573_C85A5D13 
X-CRM114-Status: GOOD (  40.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, linux-pci@vger.kernel.org,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 06:11:50PM -0700, Atish Patra wrote:
> On Fri, Aug 28, 2020 at 9:15 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Aug 28, 2020 at 10:48:30AM +0100, Jonathan Cameron wrote:
> > > On Fri, 14 Aug 2020 14:47:22 -0700
> > > Atish Patra <atish.patra@wdc.com> wrote:
> > >
> > > > pcibus_to_node is used only when numa is enabled and does not depend
> > > > on ISA. Thus, it can be moved the generic numa implementation.
> > > >
> > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > >
> > > From a more general unification point of view, there seem to
> > > be two ways architectures implement this.
> > > Either
> > >
> > > bus->sysdata.node
> > >
> > > Or as here.
> > > There are weird other options, but let us ignore those :)
> > >
> > > That is going to take a bit of unwinding should we
> > > want to take this unification further and perhaps we want to think
> > > about doing this in pci generic code rather than here?
> > >
> > > Perhaps this is one we are better keeping architecture specific for
> > > now?
> > >
> > > +CC Bjorn and Linux-pci
> > >
> > >
> > > > ---
> > > >  arch/arm64/kernel/pci.c  | 10 ----------
> > > >  drivers/base/arch_numa.c | 11 +++++++++++
> > > >  2 files changed, 11 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > > > index 1006ed2d7c60..07c122946c11 100644
> > > > --- a/arch/arm64/kernel/pci.c
> > > > +++ b/arch/arm64/kernel/pci.c
> > > > @@ -54,16 +54,6 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
> > > >     return b->ops->write(b, devfn, reg, len, val);
> > > >  }
> > > >
> > > > -#ifdef CONFIG_NUMA
> > > > -
> > > > -int pcibus_to_node(struct pci_bus *bus)
> > > > -{
> > > > -   return dev_to_node(&bus->dev);
> > > > -}
> > > > -EXPORT_SYMBOL(pcibus_to_node);
> > > > -
> > > > -#endif
> > > > -
> > > >  #ifdef CONFIG_ACPI
> > > >
> > > >  struct acpi_pci_generic_root_info {
> > > > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > > > index 83341c807240..4ab1b20a615d 100644
> > > > --- a/drivers/base/arch_numa.c
> > > > +++ b/drivers/base/arch_numa.c
> > > > @@ -11,6 +11,7 @@
> > > >  #include <linux/acpi.h>
> > > >  #include <linux/memblock.h>
> > > >  #include <linux/module.h>
> > > > +#include <linux/pci.h>
> > > >  #include <linux/of.h>
> > > >
> > > >  #ifdef CONFIG_ARM64
> > > > @@ -60,6 +61,16 @@ EXPORT_SYMBOL(cpumask_of_node);
> > > >
> > > >  #endif
> > > >
> > > > +#ifdef CONFIG_PCI
> > > > +
> > > > +int pcibus_to_node(struct pci_bus *bus)
> > > > +{
> > > > +   return dev_to_node(&bus->dev);
> > > > +}
> > > > +EXPORT_SYMBOL(pcibus_to_node);
> > > > +
> > > > +#endif
> >
> > I certainly agree that this should not be arch-specific, but I'm not
> > really in favor of adding this PCI gunk in drivers/base.
> >
> > I think we can do better (eventually) by getting rid of
> > pcibus_to_node() completely.  It's not used very much except by
> > cpumask_of_pcibus(), which itself is hardly used at all.
> >
> I am a bit confused here. A quick grep suggested that pcibus_to_node()
> is also called from generic pci probe,
> controller and few drivers(block, infiniband) as well. Maybe I am
> missing something here ?

I didn't say it was *only* used by cpumask_of_pcibus().  13 of the 29
calls are from cpumask_of_pcibus().

As you point out, there are a few drivers that use it.  They typically
have a pci_dev, so they do the equivalent of pcibus_to_node(pdev->bus).
That seems silly; they should just do dev_to_node(&pdev->dev) instead.

I looked at this once, and it seems like there might have been a
wrinkle like the pdev->dev node not being set correctly or something.
If that's the case, I think it should be fixed.

> We can move the pcibus_to_node to arch specific code for now if that's
> what is preferred.

Now I'm the one who's confused :)  Most arches, including arm64,
already have arch-specific implementations of pcibus_to_node().  I
didn't look at the rest of the series to see if there's a reason you
need to move pcibus_to_node() from arch/arm64/kernel/pci.c to
drivers//base/arch_numa.c.  If you don't need to, I would just leave
it where it is.

> > > >  static void numa_update_cpu(unsigned int cpu, bool remove)
> > > >  {
> > > >     int nid = cpu_to_node(cpu);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
