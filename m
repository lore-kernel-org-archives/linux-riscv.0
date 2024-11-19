Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824E8D4415E
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPs6ZmaW+xM/iRnxIBqTjsjXaW31Cp41g+mqKCwqUjg=; b=gH8wppmju9vdqH
	5iWvkbIVmlVeSqKj3HVxbKrjH6QBTcgbbcvGEg2sO2DWQtZip/oQc1mFs8CZAUUh/Zydihc0wENAy
	Y1Z6J1Lmo9VMG5tMDRct7UdMTu0xTGaGYMp5Z15I9ilsR1TV8GLqlx1qg38ddCpKFRHj7URZW/xi+
	IY3ZAEFnLJap00hmGEyaELU+vV0qBfeGF0ZL2xKRQalTdKWpxt3kUt80DK1CIFGjmZ1W6/ZqW9R3T
	T0DtOkQO2cop6AKSDAXOBIQLpNqXFZWm+qTi/XpausO1qlYuap8A9Uol6CP9OTWOX4wdVO+WaaV6N
	IxXHH+4UkyZXlBY76XcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOmj-0000000CcFf-2dvx;
	Tue, 19 Nov 2024 14:00:53 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOmg-0000000CcEX-374M
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 14:00:52 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-460b16d4534so5638981cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 06:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1732024849; x=1732629649; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utcZjeJ4axtWtuvENXsYE5WdR2pTF/ksB5rq4r17jag=;
        b=apd4Q8MNMQMfrU+1yKGXjYBh6jFLKa4jezwEYy6yVzQy65YWKHuZPIrTWFmk7JYe2B
         F0uBGbpjkWkPsKQQWN5Ye5NuDQDqep6/vcMX77sEYwH3IJPYmFKcwKD14uxpWePKlBpz
         gEPYWEOug08IwGwgrkliWJ4NVypIU1va/tVLp86C7LcWxyvPOIU0D+e6qoWG3wisUOLb
         wyTPueaTa/OLRGaaJzzGyaqiM5kHOke/DDGR+aNAWR80F4j69kq6g38eRL9O7fX9dOB0
         BwbXockLieSrCX6jtmlzIgIRyXBzyzlnCP2+GZ0vYDfmHqGPjKzBZp2tewrjJprq71b3
         oVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732024849; x=1732629649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utcZjeJ4axtWtuvENXsYE5WdR2pTF/ksB5rq4r17jag=;
        b=TNv6q10PfGBu75H8DJUqS+f6Qb0nl1z+TtpspbjPtW7haSdfDnaEsVVS2LhzM6uj09
         1m5aeZvpe6pC3pUSN5lsAgU6GAt8HjCB4qovLkemr1yr1fUFDJeXoH1ncBoNONFBid8F
         mB8w4DCpkpUSvK/2l5fVHLSQa5Pi5NxoQ8kP0UYWLRNtrD4kxKSvTpo+NhGiEiYRMPjA
         4NviqYf3RI4j9Mwx3L4MPW6YKYoIddm4NPKEjl7zFNhrelwoRCXIFTnK1OW31wHZI9ro
         U1EhYX6x4zTanGrfyGSEJRWvJn/7o1oRZ+6eTXcjOZYOL+LWO9MwWn3QQGcafVwefvx3
         cryg==
X-Forwarded-Encrypted: i=1; AJvYcCVFOlDTLXJKxh98LJJiTuzBmjBg3iDzsLG4dvc9LeEKDJvo5zs32L6P8r3e9Tb8Q3w7LU7Eas3/uuTLUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ18CPc1Y9+edUBP5rrBr8BuwpXe0PEVBZtAyXiKoqsQDe7wzR
	ZnGYrkZOICaWMclO4xlXIFkIbS/iuLfN6O1fwrlgC1e9PdHGksGdOOPtKH9NxdA=
X-Google-Smtp-Source: AGHT+IHKbzbz2zzGHIA7vNzQrKdrVbH22etzYZttFKms0g8ZJKuTulmGaSp4Zqq0m5k19nTsP7U0iw==
X-Received: by 2002:a05:622a:10f:b0:45f:788:b1b1 with SMTP id d75a77b69052e-46363e2f7d2mr196949061cf.25.1732024849064;
        Tue, 19 Nov 2024 06:00:49 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46392c3c22fsm11239771cf.86.2024.11.19.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 06:00:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tDOmd-00000003DsE-272U;
	Tue, 19 Nov 2024 10:00:47 -0400
Date: Tue, 19 Nov 2024 10:00:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tjeznach@rivosinc.com,
	zong.li@sifive.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org,
	tglx@linutronix.de, alex.williamson@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <20241119140047.GC559636@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241119-62ff49fc1eedba051838dba2@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_060050_886443_70835E7A 
X-CRM114-Status: GOOD (  36.06  )
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

On Tue, Nov 19, 2024 at 08:49:37AM +0100, Andrew Jones wrote:
> On Mon, Nov 18, 2024 at 02:43:36PM -0400, Jason Gunthorpe wrote:
> > On Thu, Nov 14, 2024 at 05:18:53PM +0100, Andrew Jones wrote:
> > > @@ -1276,10 +1279,30 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
> > >  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> > >  	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> > >  	struct riscv_iommu_dc dc = {0};
> > > +	int ret;
> > >  
> > >  	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
> > >  		return -ENODEV;
> > >  
> > > +	if (riscv_iommu_bond_link(domain, dev))
> > > +		return -ENOMEM;
> > > +
> > > +	if (iommu_domain->type == IOMMU_DOMAIN_UNMANAGED) {
> > 
> > Drivers should not be making tests like this.
> > 
> > > +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
> > > +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
> > > +		if (domain->gscid < 0) {
> > > +			riscv_iommu_bond_unlink(domain, dev);
> > > +			return -ENOMEM;
> > > +		}
> > > +
> > > +		ret = riscv_iommu_irq_domain_create(domain, dev);
> > > +		if (ret) {
> > > +			riscv_iommu_bond_unlink(domain, dev);
> > > +			ida_free(&riscv_iommu_gscids, domain->gscid);
> > > +			return ret;
> > > +		}
> > > +	}
> > 
> > What are you trying to do? Make something behave different for VFIO?
> > That isn't OK, we are trying to remove all the hacky VFIO special
> > cases in drivers.
> > 
> > What is the HW issue here? It is very very strange (and probably not
> > going to work right) that the irq domains change when domain
> > attachment changes.
> > 
> > The IRQ setup should really be fixed before any device drivers probe
> > onto the device.
> 
> I can't disagree with the statement that this looks hacky, but considering
> a VFIO domain needs to use the g-stage for its single-stage translation
> and a paging domain for the host would use s-stage, then it seems we need
> to identify the VFIO domains for their special treatment.

This is the wrong thinking entirely. There is no such thing as a "VFIO
domain".

Default VFIO created domains should act excatly the same as a DMA API
domain.

If you want your system to have irq remapping, then it should be on by
default and DMA API gets remapping too. There would need to be a very
strong reason not to do that in order to make something special for
riscv. If so you'd need to add some kind of flag to select it.

Until you reach nested translation there is no "need" for VFIO to use
any particular stage. The design is that default VFIO uses the same
stage as the DMA API because it is doing the same basic default
translation function.

Nested translation has a control to select the stage, and you can
then force the g-stage for VFIO users at that point.

Regardless, you must not use UNMANAGED as some indication of VFIO,
that is not what it means, that is not what it is for.

> Is there an example of converting VFIO special casing in other
> drivers to something cleaner that you can point me at?

Nobody has had an issue where they want interrupt remapping on/off
depending on VFIO. I think that is inherently wrong.

> The IRQ domain will only be useful for device assignment, as that's when
> an MSI translation will be needed. I can't think of any problems that
> could arise from only creating the IRQ domain when probing assigned
> devices, but I could certainly be missing something. Do you have some
> potential problems in mind?

I'm not an expert in the interrupt subsystem, but my understanding was
we expect the interrupt domains/etc to be static once a device driver
is probed. Changing things during iommu domain attach is after drivers
are probed. I don't really expect it to work correctly in all corner
cases.

VFIO is allowed to change the translation as it operates and we expect
that interrupts are not disturbed.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
