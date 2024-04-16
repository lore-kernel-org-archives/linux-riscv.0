Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A980C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afjmi61wfKqKpi8854iStXaNMJydnZCZjCQnUT+/ktY=; b=NHslUe72KQH1PN
	fApRpc3F7suQ7YJjCduzn08GCzpiXL6VpNwXKZ+IzbYOzemQ3wEc+/tWMsuSPjgnnsX6HZUppm0Q/
	RTvsWU/gM8obRt+1vFuyfwl3ujZHeszqTVXei0OcXLI6OPIylhAXjE+w8LmGOCRY5Y4mADgZD5tSW
	KgLwx2ME7DI6w7Gm7OADeUH6QkYOKx3EtFHmXmSz1iFwG/6d01SlC5kCJVSvEcCT2ylKoIgJaUPc0
	TOy/WZVQIan9tjdXBoIYgcyqtnjL1Gk2aTPyZw0UF1EXeSlzDeoTj8GUn2caJpfp2NkuU0M5w5eTl
	a3ULD2DNgnyCPBg3mycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwe7E-0000000BRHe-2W0A;
	Tue, 16 Apr 2024 08:24:32 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwe77-0000000BRBD-18Im
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 08:24:29 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso2461616a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713255854; x=1713860654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A8bGjiZPk9FOE86PWXYntaE4YFnpmEJwu/r5kYeeL8c=;
        b=DatQpTSgxxvduGEYFQTuoIJvJ3nQV8o3GeFvwUrcGv5B7aT0GhTlYX1mTW2Qv8OKgg
         ZHSEBVTyh+4Kv5FoJAYG/a5aj6rZOLCx3Hs+Z3KNS8DMiOiGFGoq7BEpAizZFe+Xvdw1
         GE+q1GqNJSFqJiahOCepK0CoQ0r4+oLShLOMvzju8IkHSbCj1jDXrKYC+wx+3rkpwUfj
         giRE/DgmxaXB/1cTluCWIySk0XoHCXNbi9D74RjcPS2dhGZdywJzvFiKLPyFAucZYib1
         hgGU3pblEbVsD78AlrKKTWN769N56wlEFC8ZUTtvoanbhzDSFZxLxFhNhsYy0qUgJZpw
         /DWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713255854; x=1713860654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8bGjiZPk9FOE86PWXYntaE4YFnpmEJwu/r5kYeeL8c=;
        b=VNSugP8+slSlrBCLTnB2rC1MzSAOkxpJmt4H/6pCZihVKILo05u3haE53AB6YsaRrI
         OZ7GyVFxeo2OQoJfY7iLcWKskfiFynFQTwA+erqE7V9wF4f8fCLRjLB98vIVJYgPdLfu
         cl8uDoIDqtog5II5M706B/nZV0NLKVt+lShBJfqEspFHK9i+IFALyLAXd27oDHP8Mogr
         6fUl6kwGmx7laY/c2xEpJiHPPd3mkdcDQHVvD5z+/dBgmWXpc/5ZkDr/PLGoeA1MDWiL
         9iZimF7zuilKodWm74JCiXh7BWalOZNa5HLNQkexVYUxdowCuZ6SnDDdO02KupBASuSM
         5OLA==
X-Forwarded-Encrypted: i=1; AJvYcCVFc7JmG8gxZbagQlHF1S1ZJbvBnu2dXnPs2ZQRv8rSxV6aqnrkgpEYfgIrVCNSCuUYvpz7FCpBGtKEGcJIOSBLbQEDXi875COx3qoY2w5g
X-Gm-Message-State: AOJu0Yzl7JZoHiBTFPpYejalM7+jsJUuHcCJ5+mWx0NzFYdQLbwPFcbx
	nBAEOaoxIMUc8hq2w9reANWZ7Av/JmfMct95a4JWLJUiwQvEp10fAT24Ynk3gbo=
X-Google-Smtp-Source: AGHT+IEtNrPBcSyqGZZnDLBEg+cxYbGo3RSOg3xz8lC9cOiauWkZaAkBaPfo4SIdnCTTCnH+XxMOOw==
X-Received: by 2002:a05:6a20:3c8e:b0:1a7:89bd:9e8d with SMTP id b14-20020a056a203c8e00b001a789bd9e8dmr12355925pzj.7.1713255854107;
        Tue, 16 Apr 2024 01:24:14 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id az21-20020a17090b029500b002a0187d84f0sm8458211pjb.20.2024.04.16.01.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 01:24:13 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:54:04 +0530
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
Message-ID: <Zh41pOmtAJ0EcbiN@sunil-laptop>
References: <20240415170113.662318-4-sunilvl@ventanamicro.com>
 <20240415231523.GA139682@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415231523.GA139682@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_012426_097807_1C2C3585 
X-CRM114-Status: GOOD (  27.25  )
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

Hi Bjorn,

On Mon, Apr 15, 2024 at 06:15:23PM -0500, Bjorn Helgaas wrote:
> On Mon, Apr 15, 2024 at 10:30:56PM +0530, Sunil V L wrote:
> > Similar to commit 9ec37efb8783 ("PCI/MSI: Make
> > pci_host_common_probe() declare its reliance on MSI domains"), declare
> > this dependency for PCI probe in ACPI based flow.
> > 
> > This is required especially for RISC-V platforms where MSI controller
> > can be absent. However, setting this for all architectures seem to cause
> > issues on non RISC-V architectures [1]. Hence, enabled this only for
> > RISC-V.
> > 
> > [1] - https://lore.kernel.org/oe-lkp/202403041047.791cb18e-oliver.sang@intel.com
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/pci/probe.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 1325fbae2f28..e09915bee2ee 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -3048,6 +3048,9 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
> >  	bridge->sysdata = sysdata;
> >  	bridge->busnr = bus;
> >  	bridge->ops = ops;
> > +#ifdef CONFIG_RISCV
> > +	bridge->msi_domain = true;
> > +#endif
> 
> Ugh.  I looked at [1], but that's not a very good justification for
> this #ifdef.  The fault mentioned in [1] would need to be fixed, but
> not this way.
> 

Thank you again for the feedback!

I agree. This is due to my limitation with knowledge and resources to
debug the issue happening on non-UEFI x86 system with some particular
PCIe RC. Also, I was worried that we get into a rat hole of
assumptions/quirks with various architecture/PCIe RC combinations.

For ex: I think the issue is, somehow MSI domain is not set at the time
of PCI host bridge registration in pci_register_host_bridge() causing
PCI_BUS_FLAGS_NO_MSI to be set. This causes pci_alloc_irq_vectors() to
fail. In portdrv.c, pcie_init_service_irqs() doesn't switch to INTx
handling if MSI can not be used. It switches only if pcie_pme_no_msi()
returns true. I couldn't find who actually sets up MSI domain bit late
on this platform so that it somehow worked when we didn't set this flag.

Unfortunately, I don't have system to root cause and fix this issue with
confidence. Also, I don't know if any other architectures have similar
issues which are not caught yet. Hence, I thought it may be better
just restrict the change to RISC-V.

Let me know your thoughts. If there are better ways, I will be happy to
update.

Thanks,
Sunil



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
