Return-Path: <SRS0=+nUN=CI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7D9C433E2
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 07:22:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96D38206FA
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 07:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkf9Wzip";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="ev41B5EF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96D38206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kwwiGp1zgggkiL0IojPNug4Ub0Y++0TBanLJ54XYPCs=; b=nkf9WzipcvQ2vpA/AtQkp3vhx
	Bf/57QPSoCwLFZsRx/RG2j/NEwfKE6sDoPn48hetj1OhBlCMssNJeZ7QDpDsU7XDNqsc9LB3T/7QY
	2nNCvvGFCp3R84F26qXlDk8ZhlFailEskOVRC/6QxFfgbjU75uu9NaJ/gYPtDBXTR6qzCT3HM5X/g
	88lVcVnANJwc9W8Qnuax67tIVcbI+QTKN1H46k2mmZCYwpsTTw06Kx77pW+Bij6eeO34hD94XNRLm
	Steb+kRv/5yU9BUF74tRzjV9d3eNHDOyVWjssvXjAeyn1XGdoohbQ5yRFJXhG2KTWF/3Pb0/8JK7y
	LZrLCS+gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCHfl-0005rn-PQ; Sun, 30 Aug 2020 07:22:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCHfi-0005qn-76
 for linux-riscv@lists.infradead.org; Sun, 30 Aug 2020 07:22:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id a65so2627219wme.5
 for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2020 00:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4opMeD0irkmL+H/7a2xU8cjZEUDcxPJmk8YZgecU11U=;
 b=ev41B5EFXjL0HxofoOjttHQ6QGEn6veUb6kOs0Ns242BN1OiMhySf9H/hh07Qnpbkg
 MMpLIVSS65ZDgDHIx7PElFL0cBpwbRgELXBC7jdMB0bsznVUrSRYgX1ja2svjiYa/Pf/
 oxnXESGpn2lQhS8u6tRI8ir0+iNweFG5aY838=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4opMeD0irkmL+H/7a2xU8cjZEUDcxPJmk8YZgecU11U=;
 b=PTqfSGN6W7tZYs39XtEZ4/Z6irSqySgph/rbmVwFvDlOGMzD9gd1CCypnaVYRRchSX
 0/leUHNU/dPZFvDTMQEYasDQ+ItoeT1xkdzjT62ta27vimBkPLj8MPHzeVVDcO2fYsuI
 ASTTpKzMVHXHe7LX+NO0CoAYvS73wizVEwmH1/QLqAeFXX4ZvQSRkkdWwVAr2ITGrXnY
 91k/jnQ9x91/f6GCEzQZGVik6xk3AUMSYUxHzuKjKJD9JgRWLBuVYmtwAlv30Du0qWVG
 Pizt4HljNv+7H9O1jwkrvMbUc/hEWMP/S48NwQUMVBDy2GS8Ch7ClsHewuVCBC7xdNrG
 q2HQ==
X-Gm-Message-State: AOAM532P6jpbtf8EWIfMNYger5k9zUtsvhb1MXImkyT7J7Sjb5T2N1Gx
 EnORY4Kcd0o5X91MQ/rsVQ5P2Io/t4Jk4BwYjsDX
X-Google-Smtp-Source: ABdhPJzQzOQBHc1leDOQrEXNb0qMTYMct/i4koF+5cCOM/9s3foq/y8nV/Q1mKIYmeHaHIuX7z9qqfUoyU2G3WRZDWc=
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr5945544wmo.186.1598772155263; 
 Sun, 30 Aug 2020 00:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCULtHzQKJNE4OO_U2NMaW6pX38Pw7dLywGc9og1BuuAYNQ@mail.gmail.com>
 <20200830025438.GA9624@bjorn-Precision-5520>
In-Reply-To: <20200830025438.GA9624@bjorn-Precision-5520>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 30 Aug 2020 00:22:24 -0700
Message-ID: <CAOnJCU+-=_Tjm1Wc8se1moTa7fJxzJJafiw=My7mPLBmszwccQ@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 3/6] arm64, numa: Move pcibus_to_node definition
 to generic numa code
To: Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_032238_444461_67DFE597 
X-CRM114-Status: GOOD (  46.17  )
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

On Sat, Aug 29, 2020 at 7:54 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Aug 28, 2020 at 06:11:50PM -0700, Atish Patra wrote:
> > On Fri, Aug 28, 2020 at 9:15 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Aug 28, 2020 at 10:48:30AM +0100, Jonathan Cameron wrote:
> > > > On Fri, 14 Aug 2020 14:47:22 -0700
> > > > Atish Patra <atish.patra@wdc.com> wrote:
> > > >
> > > > > pcibus_to_node is used only when numa is enabled and does not depend
> > > > > on ISA. Thus, it can be moved the generic numa implementation.
> > > > >
> > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > >
> > > > From a more general unification point of view, there seem to
> > > > be two ways architectures implement this.
> > > > Either
> > > >
> > > > bus->sysdata.node
> > > >
> > > > Or as here.
> > > > There are weird other options, but let us ignore those :)
> > > >
> > > > That is going to take a bit of unwinding should we
> > > > want to take this unification further and perhaps we want to think
> > > > about doing this in pci generic code rather than here?
> > > >
> > > > Perhaps this is one we are better keeping architecture specific for
> > > > now?
> > > >
> > > > +CC Bjorn and Linux-pci
> > > >
> > > >
> > > > > ---
> > > > >  arch/arm64/kernel/pci.c  | 10 ----------
> > > > >  drivers/base/arch_numa.c | 11 +++++++++++
> > > > >  2 files changed, 11 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > > > > index 1006ed2d7c60..07c122946c11 100644
> > > > > --- a/arch/arm64/kernel/pci.c
> > > > > +++ b/arch/arm64/kernel/pci.c
> > > > > @@ -54,16 +54,6 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
> > > > >     return b->ops->write(b, devfn, reg, len, val);
> > > > >  }
> > > > >
> > > > > -#ifdef CONFIG_NUMA
> > > > > -
> > > > > -int pcibus_to_node(struct pci_bus *bus)
> > > > > -{
> > > > > -   return dev_to_node(&bus->dev);
> > > > > -}
> > > > > -EXPORT_SYMBOL(pcibus_to_node);
> > > > > -
> > > > > -#endif
> > > > > -
> > > > >  #ifdef CONFIG_ACPI
> > > > >
> > > > >  struct acpi_pci_generic_root_info {
> > > > > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > > > > index 83341c807240..4ab1b20a615d 100644
> > > > > --- a/drivers/base/arch_numa.c
> > > > > +++ b/drivers/base/arch_numa.c
> > > > > @@ -11,6 +11,7 @@
> > > > >  #include <linux/acpi.h>
> > > > >  #include <linux/memblock.h>
> > > > >  #include <linux/module.h>
> > > > > +#include <linux/pci.h>
> > > > >  #include <linux/of.h>
> > > > >
> > > > >  #ifdef CONFIG_ARM64
> > > > > @@ -60,6 +61,16 @@ EXPORT_SYMBOL(cpumask_of_node);
> > > > >
> > > > >  #endif
> > > > >
> > > > > +#ifdef CONFIG_PCI
> > > > > +
> > > > > +int pcibus_to_node(struct pci_bus *bus)
> > > > > +{
> > > > > +   return dev_to_node(&bus->dev);
> > > > > +}
> > > > > +EXPORT_SYMBOL(pcibus_to_node);
> > > > > +
> > > > > +#endif
> > >
> > > I certainly agree that this should not be arch-specific, but I'm not
> > > really in favor of adding this PCI gunk in drivers/base.
> > >
> > > I think we can do better (eventually) by getting rid of
> > > pcibus_to_node() completely.  It's not used very much except by
> > > cpumask_of_pcibus(), which itself is hardly used at all.
> > >
> > I am a bit confused here. A quick grep suggested that pcibus_to_node()
> > is also called from generic pci probe,
> > controller and few drivers(block, infiniband) as well. Maybe I am
> > missing something here ?
>
> I didn't say it was *only* used by cpumask_of_pcibus().  13 of the 29
> calls are from cpumask_of_pcibus().
>
Ahh okay. Sorry I misunderstood that.

> As you point out, there are a few drivers that use it.  They typically
> have a pci_dev, so they do the equivalent of pcibus_to_node(pdev->bus).
> That seems silly; they should just do dev_to_node(&pdev->dev) instead.
>

That covers the use case for ARM64. There are other arch implementations
as well which retrieve node information from sysdata which seems to be
type casted to different structures on different arch.
What should be done for those ?

> I looked at this once, and it seems like there might have been a
> wrinkle like the pdev->dev node not being set correctly or something.
> If that's the case, I think it should be fixed.
>
> > We can move the pcibus_to_node to arch specific code for now if that's
> > what is preferred.
>
> Now I'm the one who's confused :)  Most arches, including arm64,
> already have arch-specific implementations of pcibus_to_node().  I
> didn't look at the rest of the series to see if there's a reason you
> need to move pcibus_to_node() from arch/arm64/kernel/pci.c to
> drivers//base/arch_numa.c.  If you don't need to, I would just leave
> it where it is.
>

The reason I moved it from arch/arm64/kernel/pci.c to drivers//base/arch_numa.c.
so that we don't have to define it for RISC-V. But it's just a single
line function and
we can define it in RISC-V as well. I will try that in v2.

> > > > >  static void numa_update_cpu(unsigned int cpu, bool remove)
> > > > >  {
> > > > >     int nid = cpu_to_node(cpu);



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
