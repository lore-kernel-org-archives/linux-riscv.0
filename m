Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25082C001CC
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4sbpk2Ft60InHSRPyAYeM6NpsVTMhjdhEsVg1oXXcA=; b=ReySL9DdAuuBdO
	QdoTm7IKuXCiudkeB3wMm+7bPOSCbVH6+zvpO1zdrN2pG2jkzMutRdJ1i3EnTYvOxOF9s0rjBAv2W
	CCMeazDAq/1O33pMeRzCb8B7CXosf+zyXFQcq/OxxOjZxhkieKESZNT013GQOWBzLDvEBzCVSLBSG
	V1VGgT2mZIdg8Rke10y4BhvnDRiweXWXSwypjLhPz5l9kjZ7BK4l2W3pbuBCCjUhX/uM+I+tAP0Nl
	jLj+G3iJ+hkPHPCoCE6BFmItHqDmq799P35NvaSRzQrWXzElpJLaFmm/yLdGK2wkOZtGFiWFfmxOg
	qfdWQg85hO3D3ATEDKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7Hn-0000000Gbmq-1wZd;
	Wed, 17 Apr 2024 15:33:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7Hj-0000000Gbgs-1qkT
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 15:33:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e455b630acso27412015ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 08:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713367993; x=1713972793; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci0/H2jmcb2D55FJA4q2NJz7BMdC0uHP2xAuYH6nUsQ=;
        b=GvrHdOlf8JGxZ6C6YjSo9yFDx+1/W6QeuoMMZ2Qh1lCInqUGnqxf6dVkk2lj8p5Apf
         08bb+KBWpOFJhLu9iMtc4np2rvwxXDZ0HaJBhmIKlzR/6JVj7wzm93TZFzOiB/abdJyX
         CTWpg4bH+8M6YeTAP3rq1BsVWX30YeIeXl6k71bv4oECWiNki9hvEyBgmVpleAmZDoji
         Nye4LiM+exzJ1iF47Q26rvVxKGjUpfHULU3QZKPgl/Ebzpvc0nCgwWBlQqDMHv3JnMVd
         Co8kSjBQxsL1FnU91sdsIn3lxgu/x6KYW4OQNaZZKc2qT7O12X7vTg+2MvaaXd0ivPb/
         1gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713367993; x=1713972793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ci0/H2jmcb2D55FJA4q2NJz7BMdC0uHP2xAuYH6nUsQ=;
        b=CPEqbAfuSHC/Di4BXXuQLs1R4ypO71aJwHNseJufCAvvfCqwyVzAK8RCr24D1Sir9D
         NABwoQtqMSNNyzASG4pZrj3jFNMwXpnz1ZoY5D45zWBpCDLhZ/jZRWwIzw00xgZTMf8Y
         /Ot5tNUr8iFfnuBn+r8v9a8XSwV7bfZaedpnzye8IQaWR5U4pIamfBCvB8YqTLR5QBpV
         80lPyjBZjUdZaPvmp3xo/eKULRx4Ca3Ejar4Mo0pSmnawMO9DvGOKXrcGzoYOZ6Kl2sQ
         2TAbKJm9p9P/J+PMpvJRtKs1zuolVU0zyfgFNpdV52g6nls9Fy3NFkABAY1e2JU4XBc8
         bPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUTDOrXFfK+jph26KomWHwIcB200eO8nFx/D1Iu3o02D6mC30X9MMSJ6mkz1T3JlV95U1cZvPgFYyRu7xVQEQ7Doa/mAv414M8S26Z7CyJ
X-Gm-Message-State: AOJu0Yw3xkOe34Mlr3RGd35F36+eMXlg7CdxT9YKjt5z8GAqDJ/NlDVw
	NCy963mf5zMJkqKj23HgFMZoZvd7FAG1UIjFWzN4x9/bH+vTQ3ggKpIWL8oX4sg=
X-Google-Smtp-Source: AGHT+IHRZkCksWn0BOoecd+0pqZBwGMmL39xcXlgwLsVriOPR0oxo+w+nj8DW8s7r0j6AcJINnUn5A==
X-Received: by 2002:a17:902:e5c1:b0:1e4:35b9:f150 with SMTP id u1-20020a170902e5c100b001e435b9f150mr19787192plf.11.1713367993089;
        Wed, 17 Apr 2024 08:33:13 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id j9-20020a170903024900b001e83a718d87sm1102769plh.19.2024.04.17.08.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 08:33:12 -0700 (PDT)
Date: Wed, 17 Apr 2024 21:03:02 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Marc Zyngier <maz@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [RFC PATCH v4 03/20] PCI: Make pci_create_root_bus() declare its
 reliance on MSI domains
Message-ID: <Zh/rroBTGTq/Q/FN@sunil-laptop>
References: <Zh41pOmtAJ0EcbiN@sunil-laptop>
 <20240416204653.GA164172@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416204653.GA164172@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_083319_537232_AC6F60AF 
X-CRM114-Status: GOOD (  46.61  )
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

On Tue, Apr 16, 2024 at 03:46:53PM -0500, Bjorn Helgaas wrote:
> On Tue, Apr 16, 2024 at 01:54:04PM +0530, Sunil V L wrote:
> > Hi Bjorn,
> > 
> > On Mon, Apr 15, 2024 at 06:15:23PM -0500, Bjorn Helgaas wrote:
> > > On Mon, Apr 15, 2024 at 10:30:56PM +0530, Sunil V L wrote:
> > > > Similar to commit 9ec37efb8783 ("PCI/MSI: Make
> > > > pci_host_common_probe() declare its reliance on MSI domains"), declare
> > > > this dependency for PCI probe in ACPI based flow.
> > > > 
> > > > This is required especially for RISC-V platforms where MSI controller
> > > > can be absent. However, setting this for all architectures seem to cause
> > > > issues on non RISC-V architectures [1]. Hence, enabled this only for
> > > > RISC-V.
> > > > 
> > > > [1] - https://lore.kernel.org/oe-lkp/202403041047.791cb18e-oliver.sang@intel.com
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > ---
> > > >  drivers/pci/probe.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > > > index 1325fbae2f28..e09915bee2ee 100644
> > > > --- a/drivers/pci/probe.c
> > > > +++ b/drivers/pci/probe.c
> > > > @@ -3048,6 +3048,9 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
> > > >  	bridge->sysdata = sysdata;
> > > >  	bridge->busnr = bus;
> > > >  	bridge->ops = ops;
> > > > +#ifdef CONFIG_RISCV
> > > > +	bridge->msi_domain = true;
> > > > +#endif
> > > 
> > > Ugh.  I looked at [1], but that's not a very good justification for
> > > this #ifdef.  The fault mentioned in [1] would need to be fixed, but
> > > not this way.
> > 
> > Thank you again for the feedback!
> > 
> > I agree. This is due to my limitation with knowledge and resources to
> > debug the issue happening on non-UEFI x86 system with some particular
> > PCIe RC. Also, I was worried that we get into a rat hole of
> > assumptions/quirks with various architecture/PCIe RC combinations.
> 
> The problem is that adding #ifdefs like this leads to a rat hole
> itself.  We need to understand and fix the underlying issue instead.
> 
Agree. Ideally, from my reading of code, this change should have worked
across architectures.

> > For ex: I think the issue is, somehow MSI domain is not set at the time
> > of PCI host bridge registration in pci_register_host_bridge() causing
> > PCI_BUS_FLAGS_NO_MSI to be set. This causes pci_alloc_irq_vectors() to
> > fail. In portdrv.c, pcie_init_service_irqs() doesn't switch to INTx
> > handling if MSI can not be used. It switches only if pcie_pme_no_msi()
> > returns true. I couldn't find who actually sets up MSI domain bit late
> > on this platform so that it somehow worked when we didn't set this flag.
> > 
> > Unfortunately, I don't have system to root cause and fix this issue with
> > confidence. Also, I don't know if any other architectures have similar
> > issues which are not caught yet. Hence, I thought it may be better
> > just restrict the change to RISC-V.
> 
> It sounds like the above is a good start on analyzing the problem.
> 
> I don't quite understand your statement that pcie_init_service_irqs()
> doesn't fall back to INTx when MSI/MSI-X is not available.
> 
> I'm looking at this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pcie/portdrv.c?id=v6.8#n177
> pcie_port_enable_irq_vec() attempts
> pci_alloc_irq_vectors(PCI_IRQ_MSIX | PCI_IRQ_MSI) and returns 0 if
> successful.  If it returns failure, it looks like
> pcie_init_service_irqs() *does* fall through to trying INTx
> (PCI_IRQ_LEGACY).
> 
You are right. Not sure what I was looking at :-(.

I think fundamentally there are two issues here.

1) MSI domain should have been setup properly when
pci_register_host_bridge() is called. I see that pci_arch_init() which
is supposed to get called early calls x86_create_pci_msi_domain().
pci_register_host_bridge() also calls pci_set_bus_msi_domain() to setup
the MSI domain which can walk up to host bridge to find. So, not sure
why PCI_BUS_FLAGS_NO_MSI is getting set. Is there an issue in walking up
the tree?

2) When it switches to legacy interrupt since MSI domain is not found,
for some reason there is an interrupt enabled without a handler. I was
suspecting PME since it was matching the IRQ#16 but it looks like PME
handlers are present. I am unable to find anything suspicious from the
log alone.

I really don't know how to proceed further. With my limited
understanding, I don't get any hint what is happening from the log.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
