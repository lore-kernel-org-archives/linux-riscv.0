Return-Path: <SRS0=al3K=CH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57606C433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2020 01:12:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06EB8207BB
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2020 01:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EVvebO8P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="UgCNc6zV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06EB8207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=seh1Y//AGGrt4JN2Zr7jDfzw7OQPWzBwRDby9EBjCaQ=; b=EVvebO8PdF1H66wCkFbp/8Mpx
	jM5m59KXGWyBPD4ntb6FZTHVYy9sFWWckZ/v9KZOfFlawrZUqIAwk/FsxsuNBcjuVG/LMTk79BZ9N
	evKgxojKFrCIj6apy1flM61aLj3m7q8U2m1snvILoPNsTf3tmNDzI1I34UeEvh5wQLUhI30JsL8Wy
	WLKjyIfwgvRZaJukl+D1UttpMMPb92T3YwuDNcUDEkPYpoj346RVhWjXmu+LpM3/cV2BeJIXN/bN7
	eEs1rOT8CavK2WDggWa99mZzfr05vLNHQRBKKpGnUcWkmTonrmgV6ZlMZsHnXox/MFhFLHRRtGZZO
	DTSBx2nQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBpPl-0004Vy-NV; Sat, 29 Aug 2020 01:12:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBpPg-0004UO-Km
 for linux-riscv@lists.infradead.org; Sat, 29 Aug 2020 01:12:13 +0000
Received: by mail-wr1-x444.google.com with SMTP id y3so727046wrl.4
 for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2020 18:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=39XN9yo1hBG3Se1gfQYF3vziZZPdblGeQ4oQR1sH/O8=;
 b=UgCNc6zV3jHlrg/Fv8Pd/IrqWUk206ZSYfkd1Atuw6CbnwlSWhIo20Ev2bp0NzbxNE
 5+Oqahty8CR5kwHAXEbFaKD1X/femDV4haD3dBHW5mwpqzOGgAoCxqHujgVFfx1UHLfQ
 DbN1P+h/aae5Xy6kl9NPJkMdJU0rMyidTucdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39XN9yo1hBG3Se1gfQYF3vziZZPdblGeQ4oQR1sH/O8=;
 b=CZsT5DNE6+Vk5sNGhVrh7Klig/MyK5++A5N0JwnqDUM3Fk4uh+3cRei52nIvh2PS+B
 eXBXzokHiIH99Lgd+Fp/3dpSO1SjNjKozRaogHdRpvBp+xULG1vkPuRa3NHwvW2k4y9t
 hsLuTiz74bsqVquWvPBufLGm46Ibex9UtjZEJZSRorcKcRXUYn9NxM2nz5YsqJBedw7H
 jwf4H9v5YWDLHcF5Ue65htuwaT3zYPeQ5RqcE9/MV6mTC3r8cDHhNIGLU3eYEMzJYVlZ
 MkJ/7hWcfst9I34bRHYYseHkcoAhNtiqtqwnp65aflAsAKvmXXqOUZ0BII1ESMMLV055
 4m3g==
X-Gm-Message-State: AOAM5302PFu+NMrMJeYx8LLJ3xxob045YpwvzpQ2sAUR7BwfyZsbaA6f
 9acv1jq/TM6DoH73EaM45vFC0odqj4TGJfZr3kIW
X-Google-Smtp-Source: ABdhPJzw5EtgUVJ3RG403SG6FcBlDty/Ese8S3VaJefPy33FqMxh5pEHcZSuvxcoiYJMWxt5uOMYBnTEwf6FImhkxMA=
X-Received: by 2002:adf:e411:: with SMTP id g17mr1444394wrm.77.1598663531166; 
 Fri, 28 Aug 2020 18:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200828104830.000007bf@Huawei.com>
 <20200828161523.GA2158345@bjorn-Precision-5520>
In-Reply-To: <20200828161523.GA2158345@bjorn-Precision-5520>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 28 Aug 2020 18:11:50 -0700
Message-ID: <CAOnJCULtHzQKJNE4OO_U2NMaW6pX38Pw7dLywGc9og1BuuAYNQ@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 3/6] arm64, numa: Move pcibus_to_node definition
 to generic numa code
To: Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_211212_732449_026DB4E2 
X-CRM114-Status: GOOD (  30.73  )
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

On Fri, Aug 28, 2020 at 9:15 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Aug 28, 2020 at 10:48:30AM +0100, Jonathan Cameron wrote:
> > On Fri, 14 Aug 2020 14:47:22 -0700
> > Atish Patra <atish.patra@wdc.com> wrote:
> >
> > > pcibus_to_node is used only when numa is enabled and does not depend
> > > on ISA. Thus, it can be moved the generic numa implementation.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >
> > From a more general unification point of view, there seem to
> > be two ways architectures implement this.
> > Either
> >
> > bus->sysdata.node
> >
> > Or as here.
> > There are weird other options, but let us ignore those :)
> >
> > That is going to take a bit of unwinding should we
> > want to take this unification further and perhaps we want to think
> > about doing this in pci generic code rather than here?
> >
> > Perhaps this is one we are better keeping architecture specific for
> > now?
> >
> > +CC Bjorn and Linux-pci
> >
> >
> > > ---
> > >  arch/arm64/kernel/pci.c  | 10 ----------
> > >  drivers/base/arch_numa.c | 11 +++++++++++
> > >  2 files changed, 11 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > > index 1006ed2d7c60..07c122946c11 100644
> > > --- a/arch/arm64/kernel/pci.c
> > > +++ b/arch/arm64/kernel/pci.c
> > > @@ -54,16 +54,6 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
> > >     return b->ops->write(b, devfn, reg, len, val);
> > >  }
> > >
> > > -#ifdef CONFIG_NUMA
> > > -
> > > -int pcibus_to_node(struct pci_bus *bus)
> > > -{
> > > -   return dev_to_node(&bus->dev);
> > > -}
> > > -EXPORT_SYMBOL(pcibus_to_node);
> > > -
> > > -#endif
> > > -
> > >  #ifdef CONFIG_ACPI
> > >
> > >  struct acpi_pci_generic_root_info {
> > > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > > index 83341c807240..4ab1b20a615d 100644
> > > --- a/drivers/base/arch_numa.c
> > > +++ b/drivers/base/arch_numa.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/acpi.h>
> > >  #include <linux/memblock.h>
> > >  #include <linux/module.h>
> > > +#include <linux/pci.h>
> > >  #include <linux/of.h>
> > >
> > >  #ifdef CONFIG_ARM64
> > > @@ -60,6 +61,16 @@ EXPORT_SYMBOL(cpumask_of_node);
> > >
> > >  #endif
> > >
> > > +#ifdef CONFIG_PCI
> > > +
> > > +int pcibus_to_node(struct pci_bus *bus)
> > > +{
> > > +   return dev_to_node(&bus->dev);
> > > +}
> > > +EXPORT_SYMBOL(pcibus_to_node);
> > > +
> > > +#endif
>
> I certainly agree that this should not be arch-specific, but I'm not
> really in favor of adding this PCI gunk in drivers/base.
>
> I think we can do better (eventually) by getting rid of
> pcibus_to_node() completely.  It's not used very much except by
> cpumask_of_pcibus(), which itself is hardly used at all.
>
I am a bit confused here. A quick grep suggested that pcibus_to_node()
is also called from generic pci probe,
controller and few drivers(block, infiniband) as well. Maybe I am
missing something here ?

We can move the pcibus_to_node to arch specific code for now if that's
what is preferred.

> > >  static void numa_update_cpu(unsigned int cpu, bool remove)
> > >  {
> > >     int nid = cpu_to_node(cpu);
> >
> >
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
