Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D49BC4167D
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXDGsgM3FkSiwHIXbaR+yqfjumfkV2i65RIZ0qjw8rI=; b=En17StKEwOcIAc
	ORaQfR91xmI/Dkymg2eGyldIsFvE1H3wDlejYHW0jXxrFT5Y5qSwzF4KVpNuQ3ehTgQsNXGAY0r9O
	1UAoAb1qZ6+DNGyH0yl+NiRkWk3srRRGplJgwNKDox9X9ytyUbXyZmBk64/5r39eXrliSDu0CY6MG
	+wGQvjcHXwtwYa1fGShi/Fg1LBymOlqK16MxaRABOohI3vOovAO7QWTfc7hbBKWEFwl9Wd+3DsG8C
	cbbwYc7BDX8S5hOPUx7xhYrC3lRjk8fjgBa/qHEifbt/t+lh8gAB/vpAAN0sQVn+7/rczl+Z+r8jT
	yH2hDbFI+iLgSEjifd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fFe-003OYg-2L;
	Wed, 08 Nov 2023 09:53:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fFb-003OXR-0o
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 09:53:32 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6c398717726so3597089b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 01:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1699437206; x=1700042006; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=juZI1n0aMz+KCog5r3XPutHhgq5o1lm8dusNtuYCGmE=;
        b=SgZe+8pIgfO7cI85U+TC0y6B8aEMd5sYlEFFYjOID+HjO2/bIWsp2/H5bh9BHdkVP+
         +sVMTioGiRcpVQQmFvRxnyu8LOhumPHStI2lQE/4T165ziuBMf3H5kIZguN6E8krU1hF
         NaHNaY/LQyVpjV1T9wPVT73UI5sr+Ia6NFC9C4yKPoASxzyQ00NjiTsfLwvasN+6JeEk
         ijD9PA1P9d81/54KSPuq6nRfk/S9W/mqr69mwSSxAAmo0HWhP2E/zo331+huz+Po8dqR
         rGm9kTROBziiyVgMRVNFs6nJ9sr1Flzp7tBEV7vwxKFNCu3i64yi0WE14mMhG5SNah0g
         DWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699437206; x=1700042006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juZI1n0aMz+KCog5r3XPutHhgq5o1lm8dusNtuYCGmE=;
        b=OUgErVmKjxGYZfxS8epZpUXHilhLoWJm5hv0uiVAEJUuy9JKNP9aMWQ07vkyAVkAoz
         cCRLv7pbDDfbwEZ6v55qMgdvhJ0p4AjNScuZGfIS2k2IwnBHdFpuXwfKKcdlVf001Nfk
         nXdx9/r8Kqo35SgKtd7AdC1CoMoVo83bpyDmnxja76rJgTuvzC0QalzAEU7H8zWbiblP
         24jsd677oLXZJ90dqiiWUt3ogyRcL1ax5rrnOkVPcvaG4ouFIj3s27jIUN5TYU0+GJSF
         9xD/sT3DFJCAt60euuF0yT2kIgCKoDJj97mwoOrreUBJ4V5sW+Xku7oAR4Ck3U/1X62g
         AgkQ==
X-Gm-Message-State: AOJu0Yz25AzTQ0uz7a4fBlE5QRQjJvxA8Osmcv4akxdG3K+oy4EUU8k3
	A+79CDSqZi+foVFrKD71bz/bOY+EGBZ1BjeEB/qgmw==
X-Google-Smtp-Source: AGHT+IEEgxtG4vAOOXAzU0cQ43q+y/GuzULUrpgSTtLmSEOIhXbF+HzsEiLo0Th7PmwROQ6HsMZIlg==
X-Received: by 2002:a05:6a20:7495:b0:14e:43b0:5f99 with SMTP id p21-20020a056a20749500b0014e43b05f99mr1462760pzd.52.1699437206593;
        Wed, 08 Nov 2023 01:53:26 -0800 (PST)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902d91800b001c728609574sm1346631plz.6.2023.11.08.01.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 01:53:25 -0800 (PST)
Date: Wed, 8 Nov 2023 15:23:14 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Haibo Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v2 06/21] RISC-V: Kconfig: Select deferred GSI probe
 for ACPI systems
Message-ID: <ZUtailOcozI9xIou@sunil-laptop>
References: <ZTuzJ1nsicZYp+uh@sunil-laptop>
 <20231106221606.GA264641@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231106221606.GA264641@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_015331_289889_1CD9C160 
X-CRM114-Status: GOOD (  51.65  )
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

On Mon, Nov 06, 2023 at 04:16:06PM -0600, Bjorn Helgaas wrote:
> On Fri, Oct 27, 2023 at 06:25:03PM +0530, Sunil V L wrote:
> > On Thu, Oct 26, 2023 at 12:04:08PM -0500, Bjorn Helgaas wrote:
> > > On Thu, Oct 26, 2023 at 01:53:29AM +0530, Sunil V L wrote:
> > > > On RISC-V platforms, apart from root interrupt controllers (which
> > > > provide local interrupts and IPI), other interrupt controllers in the
> > > > hierarchy are probed late. Enable this select this CONFIG option for
> > > > RISC-V platforms so that device drivers which connect to deferred
> > > > interrupt controllers can take appropriate action.
> > > 
> > > Quite a bit of this series seems related to the question of interrupt
> > > controllers being probed "late".
> > > 
> > > I don't see anything specific about *how* late this might be, but from
> > > the use of -EPROBE_DEFER in individual drivers (8250_pnp explicitly,
> > > and acpi_register_gsi() and pnp_irq() and acpi_pci_irq_enable(), which
> > > are called from driver .probe() paths) it seems like interrupt
> > > controllers might be detected even after devices that use them.
> > > 
> > > That seems like a fairly invasive change to the driver probe flow.
> > > If we really need to do that, I think it might merit a little more
> > > background as justification since we haven't had to do it for any
> > > other arch yet.
> > 
> > In RISC-V, the APLIC can be a converter from wired (GSI) to MSI interrupts.
> > Hence, especially in this mode, it has to be a platform device to use
> > device MSI domain. Also, according to Marc Zyngier there is no reason to
> > probe interrupt controllers early apart from root controller. So, the
> > device drivers which use wired interrupts need to be probed after APLIC.
> > 
> > The PNP devices and PCI INTx GSI links use either
> > acpi_dev_resource_interrupt() (PNP) or acpi_register_gsi() directly
> > (PCI). The approach taken here is to follow the example of
> > acpi_irq_get() which is enhanced to return EPROBE_DEFER and several
> > platform device drivers which use platform_get_irq() seem to be handling
> > this already.
> 
> This series (patch 04/21 "ACPI: irq: Add support for deferred probe in
> acpi_register_gsi()" [1]) makes acpi_register_gsi() return
> -EPROBE_DEFER, which percolates up through pci_enable_device().
> 
> Maybe that's ok, but this affects *all* PCI drivers, and it's a new
> case that did not occur before.  Many drivers emit warning or error
> messages for any pci_enable_device() failure, which you probably don't
> want in this case, since -EPROBE_DEFER is not really a "failure";
> IIUC, it just means "probe again later."
>
Yeah, I think all the drivers which need to be supported on RISC-V
ACPI based systems will have to support deferred probe with this scheme.

> > Using ResourceSource dependency (mbigen uses) in the namespace as part of
> > Extended Interrupt Descriptor will not ensure the order since PNP/INTx
> > GSI devices don't work with that.
> 
> Are these PNP/INTx GSI devices described in ACPI?  In the namespace?
> Or in a static table?
> 
Yes, these are standard devices in the namespace. For ex: PNP0501(16550)
or PNP0C0F (PCI interrupt link devices) are in the namespace.

> > Is there any other better way to create dependency between IO devices
> > and the interrupt controllers when interrupt controller itself is a
> > platform device? While using core_initcall() for interrupt controllers
> > seem to work which forces the interrupt controller to be probed first,
> > Marc is not in favor of that approach since it is fragile.
> 
> I guess PCI interrupts from the PCI host bridges (PNP0A03 devices)
> feed into the APLIC?  And APLIC is described via MADT?  Based on this
> series, it looks like this:
> 
>     acpi_init
>   +   acpi_riscv_init
>   +     riscv_acpi_aplic_platform_init
>   +       acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0)
>       acpi_scan_init
>         acpi_pci_root_init
>         acpi_pci_link_init
> 	acpi_bus_scan             # add PCI host bridges, etc
> 
> If that's the sequence, it looks like aplic_parse_madt() should be
> called before the PCI host bridges are added.
> 
> Or maybe this isn't how the APLICs are enumerated?
> 
That's partly correct. APLIC platform devices are created prior to PCI
host bridges added. But the actual APLIC driver which creates the
irqdomain will be probed as a regular platform driver for the APLIC
device. The platform driver probe will happen using DD framework and
devices don't have any dependency on APLIC which can cause device probe
prior to APLIC driver probe.

DT supports fw_devlink framework which makes it easier for IRQ devices
to use regular platform drivers and produces-consumers are probed in the
order without requiring drivers to do deferred probe. But I don't see
that supported for ACPI framework.  Also, the way PNP devices get added
there is an assumption that interrupt controller is already setup fully.

With this new use case in RISC-V, here are the alternatives I am aware of.

1) Use core_initcall() in the APLIC drivers which makes APLIC driver to
be probed prior to PNP or PCI INTx devices. But this was ruled out in
the context of DT from Marc.

2) Like the approach tried in this series, add support for deferred
probe in drivers. This will be invasive change requiring many drivers to
change like you pointed.

I don't know which is less evil or if there is any other alternative
which I am not aware of.

Thomas/Marc, could you allow APLIC (and PLIC) irqchip drivers to use
core_initcall() for ACPI?

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
