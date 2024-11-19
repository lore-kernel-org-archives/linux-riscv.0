Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AABDD6004C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 07:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1116LK5HahYLej9whaZ/IdYkaw3NwAlBS6Undgek4Q=; b=GNLWb7rI+QcsnV
	V1UdZ8GsPRSpCDEkBOgzJf2/AhKiK7d6Z+vOZwGa1vl8Dnh8K+69XJhkROPvBKVMxutLTmtD4luL6
	4KmBLj0VlAU6O8tEgggxgTgrDO+mB+8qNNHDTlT2WoVN5LzYzWWZyJa+1GYpfUEI1K3TQfmrD/q5B
	4Td69bAlfS2YD5GRFmfQvP+2NhQTmMrgU7nGHTorhSxrPalxpezPFPcxRBekfHULHYavYXC7THds2
	x3F/NIhxntvMYDlTvIqkB7jqW0VTbIdPW2hI4CD2KWIdxq+cxV9SuWYNosFlSl2OZnt5XffKLhaxD
	T/+Gnz5ds7HbHYT4Vb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDIzX-0000000BfrD-2vQ3;
	Tue, 19 Nov 2024 07:49:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDIzU-0000000BfpQ-2RVX
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 07:49:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-382456c6597so359124f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 23:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732002578; x=1732607378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYBbT7qYRsGmfiJkt6bNI0oAoiQc6F6a4Czuh6tR0Qw=;
        b=S33YUEI9Y04Fn45hm66zZnxVL2zr+KGHjKK3E5T3HvtIU9gypILuZKjUuE0Mu0XFkY
         iTCV/M5GcpgEa3PWjjzrRm7HlXOi/p4voEiGpCj2PaLCgZ+LwmOwYjJBSgXQ6WOchoms
         ACxxgPy5jOtyq8rNRhmPO+v8cWCdX5QM0KG4d+a7qqIHGWHka8SOYJIcqq9PKImtCv9t
         vaD0L7IXgRNf0QUIl54xNOFBoil0Plkpwp/Qhr3wFCPbP+U7EMnEQocfe68w5rwamAUq
         iRWiN0SJg5shESuGIcjHkfpvIRqDDKKGv46wPO2qs4PNu8MY07nTnJZANCb1u+RnQZwc
         X/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732002578; x=1732607378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYBbT7qYRsGmfiJkt6bNI0oAoiQc6F6a4Czuh6tR0Qw=;
        b=JVCCi6UkS7yI2C2hSuain3kHOZu/aLvhyVjE/XJjsO6dN+aKsVMfJ/0fcRFiQb2uRE
         6VCxsKuBXVvwZvkS5vk8XdLuiK6v3vBZQSwJ9fISe3c43m3HrkwhXhlxNA8HmO4+uWXJ
         HfwMrXt6SSLUiZkEhh+rJkG62ir+E41Hsn9TEZqsLQQ9sF0TjllLgwYp5bzJcDtFXTdV
         h+koIiaYXW1GpNcvDeEmAqpc1kjDKV2DLjh8yfFSb26RQv7CK/ZKzZu2P3Pke+hz238O
         Dy6XJqmPopsnWT8RpBqv59dNjk4/kXfXd6YrQpAlLIQOeUahhoV19k135WLSLKL9CuVN
         0UZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxvE5JgAKX9KX2m0nqavr1aYjfpEfviS/rR8b/u7rRgY+FSttF1nukx9BM+BsOUI3rLYbKrNbI5j7wJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGWjqPyZrg+EnQCctwNyJDnjWQc57vattN4H4FNkDZ2SaseoXL
	CqF3tz2qVokIentLEkfouDgQzorR+55rv1fiDq8uCH/aH4Ucd8N/W+PBoTsbheQ=
X-Google-Smtp-Source: AGHT+IFe5ZmtjhLXYqttDHgdk3C4AFgFbxG7y2tLe4XO1qVtRECgKa8Bx3LhB6YxSZPNMfHR5Z6PNw==
X-Received: by 2002:a05:6000:2d01:b0:382:5030:7b94 with SMTP id ffacd0b85a97d-38250307d48mr353908f8f.13.1732002578369;
        Mon, 18 Nov 2024 23:49:38 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382462dbb5esm5733966f8f.52.2024.11.18.23.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 23:49:37 -0800 (PST)
Date: Tue, 19 Nov 2024 08:49:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org, tglx@linutronix.de, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <20241119-62ff49fc1eedba051838dba2@orel>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118184336.GB559636@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_234940_624583_CCDE2EB1 
X-CRM114-Status: GOOD (  20.72  )
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

On Mon, Nov 18, 2024 at 02:43:36PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 14, 2024 at 05:18:53PM +0100, Andrew Jones wrote:
> > @@ -1276,10 +1279,30 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
> >  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> >  	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> >  	struct riscv_iommu_dc dc = {0};
> > +	int ret;
> >  
> >  	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
> >  		return -ENODEV;
> >  
> > +	if (riscv_iommu_bond_link(domain, dev))
> > +		return -ENOMEM;
> > +
> > +	if (iommu_domain->type == IOMMU_DOMAIN_UNMANAGED) {
> 
> Drivers should not be making tests like this.
> 
> > +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
> > +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
> > +		if (domain->gscid < 0) {
> > +			riscv_iommu_bond_unlink(domain, dev);
> > +			return -ENOMEM;
> > +		}
> > +
> > +		ret = riscv_iommu_irq_domain_create(domain, dev);
> > +		if (ret) {
> > +			riscv_iommu_bond_unlink(domain, dev);
> > +			ida_free(&riscv_iommu_gscids, domain->gscid);
> > +			return ret;
> > +		}
> > +	}
> 
> What are you trying to do? Make something behave different for VFIO?
> That isn't OK, we are trying to remove all the hacky VFIO special
> cases in drivers.
> 
> What is the HW issue here? It is very very strange (and probably not
> going to work right) that the irq domains change when domain
> attachment changes.
> 
> The IRQ setup should really be fixed before any device drivers probe
> onto the device.

I can't disagree with the statement that this looks hacky, but considering
a VFIO domain needs to use the g-stage for its single-stage translation
and a paging domain for the host would use s-stage, then it seems we need
to identify the VFIO domains for their special treatment. Is there an
example of converting VFIO special casing in other drivers to something
cleaner that you can point me at?

The IRQ domain will only be useful for device assignment, as that's when
an MSI translation will be needed. I can't think of any problems that
could arise from only creating the IRQ domain when probing assigned
devices, but I could certainly be missing something. Do you have some
potential problems in mind?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
