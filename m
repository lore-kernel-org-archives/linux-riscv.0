Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C30C433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 16:15:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C86BC2098B
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 16:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yGxwODUi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXzEkWMb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C86BC2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=E4xXbHqGr+JPq6tCygqZDNkZ/oDFNAehh/HMKgYE5JE=; b=yGxwODUigNgrhFU9p4h26ZP3B
	/mXAoQsyMp7AkWx9dz/yuhOG9kOrS+QCUaImSk+cD01J5CXBoJBwcXg3loJZeUpnQCJdFdwzYD3Ko
	cb0nzzq8zjTLRSLXLQUA77T4T+7Pbzp+F9vFV/qj/XAq8cxu+Tuha9mbVrvCKQCvMrssoWVFDBRgc
	pZWV9mdvIeCcefSBfl9JJ+kMy2vx0ddqy0aXeCYJ3WB7T9BzQz1E4lFIwJqH21JIMPOAtxSVBT9y0
	rSJXiwA7W5+osmwvCHFrvaqOFv4z3fPQq2A7uRfV8+8ookabKyslWW1thQhM9CcbyvEMzqjqmaoPy
	0hDeBxNRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBh2I-0001wJ-Mj; Fri, 28 Aug 2020 16:15:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBh2E-0001vL-8S; Fri, 28 Aug 2020 16:15:27 +0000
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7DFA208D5;
 Fri, 28 Aug 2020 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598631325;
 bh=WDy36I6Z4orTZPoGujoAX7lI0c2B80UVvjLy+uuLcNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=XXzEkWMbwa7hJsKl3WWxYs9ZIzvl4XBfLjgS8Mijz+ElFIFxllHByPMzK3VHEqITH
 1D4I/umOYAh/U5wOHQaoIwJATfekh83VfUHN8EJZaCCfchYknTM4ZCIMFUd0DL6dnq
 F9ieOAP4skNybw+ZwBfOKkffDedrwcNXg5u8hBDU=
Date: Fri, 28 Aug 2020 11:15:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: Re: [RFC/RFT PATCH 3/6] arm64, numa: Move pcibus_to_node definition
 to generic numa code
Message-ID: <20200828161523.GA2158345@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828104830.000007bf@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_121526_446307_8777F54C 
X-CRM114-Status: GOOD (  27.86  )
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
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, linux-pci@vger.kernel.org,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 10:48:30AM +0100, Jonathan Cameron wrote:
> On Fri, 14 Aug 2020 14:47:22 -0700
> Atish Patra <atish.patra@wdc.com> wrote:
> 
> > pcibus_to_node is used only when numa is enabled and does not depend
> > on ISA. Thus, it can be moved the generic numa implementation.
> > 
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> 
> From a more general unification point of view, there seem to
> be two ways architectures implement this.
> Either
> 
> bus->sysdata.node
> 
> Or as here.
> There are weird other options, but let us ignore those :)
> 
> That is going to take a bit of unwinding should we
> want to take this unification further and perhaps we want to think
> about doing this in pci generic code rather than here?
> 
> Perhaps this is one we are better keeping architecture specific for
> now?
> 
> +CC Bjorn and Linux-pci
> 
> 
> > ---
> >  arch/arm64/kernel/pci.c  | 10 ----------
> >  drivers/base/arch_numa.c | 11 +++++++++++
> >  2 files changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > index 1006ed2d7c60..07c122946c11 100644
> > --- a/arch/arm64/kernel/pci.c
> > +++ b/arch/arm64/kernel/pci.c
> > @@ -54,16 +54,6 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
> >  	return b->ops->write(b, devfn, reg, len, val);
> >  }
> >  
> > -#ifdef CONFIG_NUMA
> > -
> > -int pcibus_to_node(struct pci_bus *bus)
> > -{
> > -	return dev_to_node(&bus->dev);
> > -}
> > -EXPORT_SYMBOL(pcibus_to_node);
> > -
> > -#endif
> > -
> >  #ifdef CONFIG_ACPI
> >  
> >  struct acpi_pci_generic_root_info {
> > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > index 83341c807240..4ab1b20a615d 100644
> > --- a/drivers/base/arch_numa.c
> > +++ b/drivers/base/arch_numa.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/acpi.h>
> >  #include <linux/memblock.h>
> >  #include <linux/module.h>
> > +#include <linux/pci.h>
> >  #include <linux/of.h>
> >  
> >  #ifdef CONFIG_ARM64
> > @@ -60,6 +61,16 @@ EXPORT_SYMBOL(cpumask_of_node);
> >  
> >  #endif
> >  
> > +#ifdef CONFIG_PCI
> > +
> > +int pcibus_to_node(struct pci_bus *bus)
> > +{
> > +	return dev_to_node(&bus->dev);
> > +}
> > +EXPORT_SYMBOL(pcibus_to_node);
> > +
> > +#endif

I certainly agree that this should not be arch-specific, but I'm not
really in favor of adding this PCI gunk in drivers/base.

I think we can do better (eventually) by getting rid of
pcibus_to_node() completely.  It's not used very much except by
cpumask_of_pcibus(), which itself is hardly used at all.

> >  static void numa_update_cpu(unsigned int cpu, bool remove)
> >  {
> >  	int nid = cpu_to_node(cpu);
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
