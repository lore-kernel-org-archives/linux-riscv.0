Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633C1CAC5AE
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7py+goNPEloJnOx0oGeGiUcjdipzKiOixJl6s3VA7aY=; b=CYclfDguPiMGhw
	rn73U7T6xOTgoG/M91ix+U2BuSVRjsQhFYki1YESkEVnIXtSyEtqjmjX/N+r7Dqwg9tbDZ4JIbhN/
	rMXOkpbprm0Qw/+V1uN1TI1KTgGvLa6OKFc2njsC/7JdrQeh79cX6+I6ErxWxaO3wtPyDS0pMkOps
	8Iy8KotGouj9Xh1Li9FjOTHFeywceAosxfykZot561/4xm9VAZ8vio8NRPIUL9gHTNeNW815tu2m0
	4/sYOHukwbnr/68pKG2sT24Muh5D/eeujXEGPTSng1jh3aC4JnabBXgrBBis+nLfPCAlLV+kIzlDt
	ciz0DBUzvtszmw3EH5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PbB-00000000EdY-21zx;
	Wed, 24 Sep 2025 13:31:57 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pb8-00000000EaS-0mM3
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 13:31:55 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-88776dcac7aso223686739f.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758720713; x=1759325513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjr8/7QWc40wBIvcq7xbnNiZ+KKEhi3m1vUvdK7Sd/0=;
        b=cE5PAxGMFessfbp8MvxS+hKwIT3VyPOrGmM5RmOLB8KMDJ8umsaG5e4RBajkgMwz/o
         Jimk7xASfx2lTTHY1Qk9KZyYLiXPIpzxuJe8w9HA6Ilw+hXZ5S124nrARcmsuc0YeyEt
         18Bp8N/vva32C1xuTx7M1gAGbC9jKoxFryPbLlnsXE/wfNyBmhYTKiupxRu4B8GG0Zd4
         K2ylP4h36FIjnDuDGGbI2Quz64xj4PkrBGj6mhIOp5xa8qOZOUBrOsqponL8CLY7trTS
         IHSalThgdd1ZoCb+CEiwwpRdLRG3pxjM9geBhjsbqNjR35jxBp660S6JEQ4H9JgeweAZ
         sTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758720713; x=1759325513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sjr8/7QWc40wBIvcq7xbnNiZ+KKEhi3m1vUvdK7Sd/0=;
        b=tyOQD78g3HshGSYHb4WYaGrawRoKwwEHgPY6p6AwyEKjZXU0mxHkI23ujuZ29QvP2c
         JWpsxmXTwRAH4QpF9r25G11tdHzkItTLMJnFmw/1W4mA4FXeZMiORZ8TAKRpejNCoMWk
         XDU+I+TmG6NEpHvQO9s5UOAKm0VWqUdU7zv4PhFAWVbyME7yRaWP7Hi3YB1hoCUO1Eog
         iEd8qx8yM0JVReCMdeECgIdIKlJLQl4QzQ/cR+XOUa09YuuNVHuI4aGZYIgRVj8DOg1v
         XNjFg2U/LT7y6s0xVXcG7VJt6VSc7LnHA3JByT3u/Gx5dUAuh85rmcLto67K7P5JMGeq
         VEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXicqCjly/CPG5NfEF/Uz7BPlPJYG7tPwUtoD8TkxoeM2beSczo+wpskZZDFuMFIgPDoOZca7IzvCNrPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMJb2bEOGpho/EiM1qgU1wGSYdsK711z8Ad4/hPvZkMjQ66qOb
	cVYjDfT3s48Cih0H7eBZL07DeM1RioTSAFFLOecThpESU1BWIuyIdMAX45H3jha9SNY=
X-Gm-Gg: ASbGncsuShul8lqylHOh5SX8SeyUs8aswUQt6Tm07Wvug6YdK+9UZ7apOxN5ZhWuO5/
	UlwPQlq7Kj99WcPMcrfD83Y1QAoVzP2L2rCE0TaaOA+QV8NWgJ7qoi+XzHR5Bp7iyTwPfeESMHl
	B4g/z8J8070BkTnXNKm+n4dHxwwpXlU7XN3NyDXcdz/l8C6u675kMSElz2bpRsuEfPBPRPtwpTf
	Id9yNelfLhEfSKLm3pKMZpp8itAhvYpTxQARcOMidbYVTX9awRmFy9yFCS2LN9kwDXLDmATl5CE
	Ch18PBaK7iWWWPqjVXlFgdYxqe9s5YNqOoK0wRAfOlRAYixBhbJ7z23pf6NQ5b10GF/JhiHcaPT
	au6OooKL4pl4/trrky7tXjtm6I34ExBN5vl0=
X-Google-Smtp-Source: AGHT+IGomox+b2UDBxIjrLVdwH3ZQg0MBial2WDQuoPjUzT0cQ/7OM+jfwuVUQxS7ZLef0sIJoY2Og==
X-Received: by 2002:a6b:6a04:0:b0:893:2ff0:162c with SMTP id ca18e2360f4ac-8e1fd6f67b8mr883021539f.9.1758720712618;
        Wed, 24 Sep 2025 06:31:52 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46b2f3405sm646365839f.1.2025.09.24.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:31:51 -0700 (PDT)
Date: Wed, 24 Sep 2025 08:31:50 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: "Nutty.Liu" <nutty.liu@hotmail.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jgg@nvidia.com, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	tglx@linutronix.de, alex.williamson@redhat.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 03/18] iommu/riscv: Use data structure instead of
 individual values
Message-ID: <20250924-01f9a5207f8865555c839abd@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-23-ajones@ventanamicro.com>
 <TY1PPFCDFFFA68A794163FFB7BFAAAC22BEF31CA@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY1PPFCDFFFA68A794163FFB7BFAAAC22BEF31CA@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_063154_234191_DD7080D6 
X-CRM114-Status: GOOD (  26.44  )
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

On Wed, Sep 24, 2025 at 11:25:59AM +0800, Nutty.Liu wrote:
> On 9/21/2025 4:38 AM, Andrew Jones wrote:
> > From: Zong Li <zong.li@sifive.com>
> > 
> > The parameter will be increased when we need to set up more fields
> > in the device context. Use a data structure to wrap them up.
> > 
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >   drivers/iommu/riscv/iommu.c | 31 +++++++++++++++++++------------
> >   1 file changed, 19 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > index 901d02529a26..a44c67a848fa 100644
> > --- a/drivers/iommu/riscv/iommu.c
> > +++ b/drivers/iommu/riscv/iommu.c
> > @@ -988,7 +988,7 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
> >    * interim translation faults.
> >    */
> >   static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> > -				     struct device *dev, u64 fsc, u64 ta)
> > +				     struct device *dev, struct riscv_iommu_dc *new_dc)
> >   {
> >   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >   	struct riscv_iommu_dc *dc;
> > @@ -1022,10 +1022,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> >   	for (i = 0; i < fwspec->num_ids; i++) {
> >   		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
> >   		tc = READ_ONCE(dc->tc);
> > -		tc |= ta & RISCV_IOMMU_DC_TC_V;
> > +		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
> > -		WRITE_ONCE(dc->fsc, fsc);
> > -		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
> > +		WRITE_ONCE(dc->fsc, new_dc->fsc);
> > +		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
> Seems it will override all other fields in 'TA' except for the field of
> 'PSCID'.
> Should the other fields remain unchanged ?

The short answer is that the current implementation is doing the right
thing. The long answer is that riscv_iommu_iodir_update() and how it's
called from riscv_iommu_attach_paging_domain() could use some cleanup.

A more logical interface would be that new_dc would be completely written,
which means any fields left zero when creating new_dc will result in zeros
being written -- it doesn't do that right now. Also, rather than passing
DC_TC_V through new_dc->ta (as PC_TA_V, even though DC_TC_PDTV = 0), we
should probably just set it directly in new_dc->tc.

We can clean this up separately though, probably as work for adding SVA
support.

> Otherwise,
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
drew

> 
> Thanks,
> Nutty
> >   		/* Update device context, write TC.V as the last step. */
> >   		dma_wmb();
> >   		WRITE_ONCE(dc->tc, tc);
> > @@ -1304,20 +1304,20 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
> >   	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> >   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> >   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> > -	u64 fsc, ta;
> > +	struct riscv_iommu_dc dc = {0};
> >   	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
> >   		return -ENODEV;
> > -	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
> > -	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
> > -	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
> > -	     RISCV_IOMMU_PC_TA_V;
> > +	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
> > +		 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
> > +	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
> > +			   RISCV_IOMMU_PC_TA_V;
> >   	if (riscv_iommu_bond_link(domain, dev))
> >   		return -ENOMEM;
> > -	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
> > +	riscv_iommu_iodir_update(iommu, dev, &dc);
> >   	riscv_iommu_bond_unlink(info->domain, dev);
> >   	info->domain = domain;
> > @@ -1408,9 +1408,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
> >   {
> >   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> >   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> > +	struct riscv_iommu_dc dc = {0};
> > +
> > +	dc.fsc = RISCV_IOMMU_FSC_BARE;
> >   	/* Make device context invalid, translation requests will fault w/ #258 */
> > -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
> > +	riscv_iommu_iodir_update(iommu, dev, &dc);
> >   	riscv_iommu_bond_unlink(info->domain, dev);
> >   	info->domain = NULL;
> > @@ -1429,8 +1432,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
> >   {
> >   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> >   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> > +	struct riscv_iommu_dc dc = {0};
> > +
> > +	dc.fsc = RISCV_IOMMU_FSC_BARE;
> > +	dc.ta = RISCV_IOMMU_PC_TA_V;
> > -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
> > +	riscv_iommu_iodir_update(iommu, dev, &dc);
> >   	riscv_iommu_bond_unlink(info->domain, dev);
> >   	info->domain = NULL;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
