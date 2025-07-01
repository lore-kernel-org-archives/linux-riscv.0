Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711F0C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 03:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYsIWdrNVFCVjkxL+3dO2xGR9NWhTqvi86IHi/li6zk=; b=NhLlUcy+jd6yzI
	97Fl6VgvvQ4TCm1FO7A7ScHB5Rfzxvaem0B407djTXJKp9OE7X8CcLy6wZn/Z3JHp47VhtW5i+uM/
	woYJivYbqi41siaDHdGorANiznjMNHD/beOBfPoiRLCMbDXuc6O8UmLi0WlYjDyzOEi3PNysWUyL+
	YESsQN3phjoA1Qhpv/c05cOFiLQoEiG/GKYSFd+v3hWe7P4gq4Aq2b4+c+Rnf5H+Cl5P9kfMCMEbs
	N1tEN10E79TxZu5/7fG9FBTWGofaSQJ6vfL3S8NHy/6JqMruiW247/JDD3+dQG7KTG2HO8+Igova9
	FZH9b2HjUYXXLLB3570A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWRyG-00000003xmN-0e9i;
	Tue, 01 Jul 2025 03:47:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWRyD-00000003xlV-1KjW
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 03:47:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-234fcadde3eso35268415ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 20:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751341664; x=1751946464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q70BTMXv+elr6mx+h6qORt+5RlAkLGyM2dZSnSb4WnM=;
        b=m4JYnn7P/TSe705frI8tANVek6NAu5G5m1yCUoBPPhdbejh35oVI3TJN6TZPcEf92L
         6OO2IJFBwsSd5nZG5lr2r/c5TAea2AILRuOhZJdoU5tJ8GRH927l5ibDXMWLEG2qiBFi
         f0O7eZ/D3uDZ2TOUs12Wk8vZJ/nQGlntSqCqgpCmOqtzRw8Fgr53PPvNPP8GOGLqPwpw
         +dpwjh13p72f/5TA+QPexKsPt1oFiJ5Fehp+cou3BwkQGtiDH1Lha7oRO2E34ItzvELn
         /lINDOSOmo+AQKeb7ropMoLvbUBjN3Y5tmuQ0CMa2OTNPu1PZRO81iMweB3u1Zdtf8Cn
         sOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751341664; x=1751946464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q70BTMXv+elr6mx+h6qORt+5RlAkLGyM2dZSnSb4WnM=;
        b=YzLSGdNcxVceEnj+5/8Cx08fwAROSYTX2ieNgvOM2XPtzbZg9wEOLEnJtjT0Bc/cq3
         0KA/1GIo8R04UhXpJz94ELWMyJ1vPdcN+RtA73D0l6MnBWSHKP7EhC5+oRIeypgy1vLQ
         gLGMFe5K0iFLzv5QOwr515JRjDhprqigoqNogcXIl6e+2GyLewQb5q2o98ZX+y/1qoMR
         Ct+2xoAxCruJjMJOBmZ1moGWTAGmZj5aDZY7HTd1OuIXMjE0GpZ8u02BZZy0Os8Bicrd
         L3H4/UHTBwUFWG/U8iL64jL5PAgUEu5E9tXOJwtS7ueV9AhriCjv/c382YIuonUyyuNU
         hFAw==
X-Forwarded-Encrypted: i=1; AJvYcCUZyoPIHUM4+hNdwkcw6kzzitv0bc5n+aUb5KmTZ/vE245G+X2eaccM9FxAVa/35Je1u1SJffM/EmAjjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTSe3owBk08r5q0jKK+5GYag/9CBWZRj//tr0HLuttTs95ity1
	ESLN6YnWLIqB32mIB/hfH+UHjiSsnZmaFflCCknhikdzsfk+KpWIKEP21A2/4JF749s=
X-Gm-Gg: ASbGncvdbmAVQ5dQUXKH/pvQTsM1F1QnWKcOMXOtipWGX4FykuCkggarMan6H6rXtOB
	j/pVx+JO0YkmTZmvy+Msx9sB6ZjCaKS7iUVBSYIegoKZHtnMmguFP7UqNxJCJIeDSRPGU6ksF7f
	EA57pMtfRIx/9xkZsX9ABwlTdlITWscJBUA8g7lLwfV89whpc/qjn0PwqLaPTA00AyFRCJ5N+Sw
	ieP7u/ObsFmb+CVvGneDJfyb3iZPydbkFQkuJQL3Den334S2+k3juYuKjEyxeyI7ofef5+01A7b
	Z+rkZPPVwXmIknqB5DkiEc2WjC6m6FbHUH42Szmm2+f2cCX2DNkqDPIJ1cLgIRSQ0J3D0w==
X-Google-Smtp-Source: AGHT+IGN1GMdTqZAPJCguumolenY1Wtb8nB6QKle+VjMdicMJz56dOOYCipT836/9qVM3LRjuPHcgA==
X-Received: by 2002:a17:903:fa3:b0:235:779:ede3 with SMTP id d9443c01a7336-23ac4680a0fmr213846545ad.41.1751341664573;
        Mon, 30 Jun 2025 20:47:44 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1c40sm95714045ad.67.2025.06.30.20.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 20:47:44 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:17:33 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 1/3] ACPI: RISC-V: Add support for RIMT
Message-ID: <aGNaVQEsZX7vmrFv@sunil-laptop>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-2-sunilvl@ventanamicro.com>
 <20250630-4a94187c794980bb830c539a@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630-4a94187c794980bb830c539a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_204745_403309_7BD22810 
X-CRM114-Status: GOOD (  30.82  )
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

Hi Drew,

Thank you very much for the review!.

On Mon, Jun 30, 2025 at 09:55:09AM +0200, Andrew Jones wrote:
> Hi Sunil,
> 
> I found a few nits while skimming this.
> 
> On Mon, Jun 30, 2025 at 09:18:01AM +0530, Sunil V L wrote:
> > RISC-V IO Mapping Table (RIMT) is a static ACPI table to communicate
> > IOMMU information to the OS. The spec is available at [1].
> > 
> > The changes at high level are,
> > 	a) Initialize data structures required for IOMMU/device
> > 	   configuration using the data from RIMT. Provide APIs required
> > 	   for device configuration.
> > 	b) Provide an API for IOMMU drivers to register the
> > 	   fwnode with RIMT data structures. This API will create a
> > 	   fwnode for PCIe IOMMU.
> > 
> > [1] - https://github.com/riscv-non-isa/riscv-acpi-rimt
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  MAINTAINERS                 |   1 +
> >  arch/riscv/Kconfig          |   1 +
> >  drivers/acpi/Kconfig        |   4 +
> >  drivers/acpi/riscv/Kconfig  |   7 +
> >  drivers/acpi/riscv/Makefile |   1 +
> >  drivers/acpi/riscv/init.c   |   2 +
> >  drivers/acpi/riscv/init.h   |   1 +
> >  drivers/acpi/riscv/rimt.c   | 523 ++++++++++++++++++++++++++++++++++++
> >  include/linux/acpi_rimt.h   |  26 ++
> >  9 files changed, 566 insertions(+)
> >  create mode 100644 drivers/acpi/riscv/Kconfig
> >  create mode 100644 drivers/acpi/riscv/rimt.c
> >  create mode 100644 include/linux/acpi_rimt.h
> > 
[...]
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 36061f4732b7..96d64e0a7b97 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -16,6 +16,7 @@ config RISCV
> >  	select ACPI_MCFG if (ACPI && PCI)
> >  	select ACPI_PPTT if ACPI
> >  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> > +        select ACPI_RIMT if ACPI
> 
> Should use tab here.
> 
Okay.
> >  	select ACPI_SPCR_TABLE if ACPI
> >  	select ARCH_DMA_DEFAULT_COHERENT
> >  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
[...]
> > +static inline int rimt_set_fwnode(struct acpi_rimt_node *rimt_node,
> > +				  struct fwnode_handle *fwnode)
> 
> I see this is a faithful port of arm's iort functions, but using
> 'inline' in source files is pretty pointless, so we could drop
> that.
> 
Sure.

> > +{
> > +	struct rimt_fwnode *np;
> > +
> > +	np = kzalloc(sizeof(*np), GFP_ATOMIC);
>
[...]
> > +	map = ACPI_ADD_PTR(struct acpi_rimt_id_mapping, node,
> > +			   id_mapping_offset + index * sizeof(*map));
> > +
> > +	/* Firmware bug! */
> > +	if (!map->dest_offset) {
> > +		pr_err(FW_BUG "[node %p type %d] ID map has NULL parent reference\n",
> > +		       node, node->type);
> 
> Should we have a pr_fmt() definition at the top of this source file for
> this pr_err?
> 
Oh yeah. Will add.

> > +		return NULL;
> > +	}
> > +
>
[...]
> > +	return err;
> > +}
> > +
> > +#else
> > +int rimt_iommu_configure_id(struct device *dev, const u32 *id_in)
> > +{
> > +	return -ENODEV;
> > +}
> 
> This is unnecessary since we have the stub in the header file.
> 
Right.

> > +#endif
> > +
>
[...]
> > +int rimt_iommu_configure_id(struct device *dev, const u32 *id_in);
> > +
> 
> ubernit: no need for this blank line
> 
Sure.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
