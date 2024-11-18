Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB23D591A9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 18:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q06E/6lOjoxFSARicys2IOT8lJ+EUGxsnrGnCe1iyJk=; b=oKmjzGrSFY6mbF
	UPM6L8vs/7EvMd5Dmr/j3HT6gUJ/n77Ca3xNvbCBtIcUfe9rVLLTK1oQAGYttraC1RWWAxrIlpf3/
	9IiuAccgK9DNDLXFO+OB74/dztRoyeuzFxLhlDV68yGDqCKdEh3aWhUMNsTpk4EOt0a+o6GlAdY2L
	6/x37jhIt9Vi28xD9rhI8OwMLYETrsSD/TkuSew0mNNVr7zqgiJtKOxsayKyxEwkpLs89gb/YR0TL
	i4QzcCMqUc8RRB7vKCUm00yiRKIFPPCWaVAYc8JTvYHWKcNSVOh/W3GOvpzMiBfH6XW+Y3WkeeU8+
	XscNCR+7/op0FnRRyIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD6ir-0000000ANDi-2Zc0;
	Mon, 18 Nov 2024 18:43:41 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD6ip-0000000ANCA-1Thg
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 18:43:40 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7b152a23e9aso5400885a.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1731955417; x=1732560217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aiGoxS9y5bO8WAr6g5LjnG9Zf3/IZMgtxFJaSmFRzL8=;
        b=FYyH1PVHQcCScGXnsQcZ/ppumJTrp04m8TirSM0FTu6wy6JsM6z4XjitiaurQtdNHX
         +dZOfVbKikKXMC0XYxoEgSIWXlE78XDQIWx0afMWTwM79sVo8kRhYFbrrQEVYSGWRJAc
         EA/EVLbFeiRykkBph0eoWUZauIvtDztblf3K1WMuUj8//cje0gPRG/Jnq/3vXWbASsnr
         SOOf/8qAEzIC6iZ1/G7SPBikxe4tpncLmfamn7gOXA48qRZDGUgjaHvZx43+D3dRemd9
         DBIp5ha9Ued/BQ99WL5E4TCrDbekVZZrjBmgqpSwMJyOrA2/uDIva76rOERSQRRsHeWj
         D91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731955417; x=1732560217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiGoxS9y5bO8WAr6g5LjnG9Zf3/IZMgtxFJaSmFRzL8=;
        b=s55ctcnEIlA8gyIYNSFvxz7mTcByAZ65XlQfLhcdvBRZAH0jPnFM7Glyl20giimwQS
         m4w5VAPvJrmCQEr6h+ww1qrxlLJOEbON090rii/TW0hSP3+ngkbkyr2ryqhHSOEcMR5P
         XVGF01jbIQ52Sp9s1k9/SdLLNiLCyyHOJYiwEyPtfYIQJEVejGeKJuW/sou6kMp4y5vj
         4lY2JQqrx3y89aphifJUEjOBRKbOeNY0qE+3JUF4Wqy5uNbpyzEvsUJIb8Qc4n3aUKTT
         EBls7YoJtE6m5ZbuYHTIKykvlZvK2m6CdVVHfNShrYjnVLrnyYlbV3LlKkmHT/359gJK
         +BWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsnJE1n5FjVSxnNAJq4CRaCTi54I4/eOH1Fcvd6lqficiRI65k0FX8SK4YXcf0tqf12A+lDzpzt0jIPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoooeabkFSsyNH7Le7bU0/ImAV9Lf7DUiC3E9kKrBvHkw65Xug
	W2yRecy9InzQQT75ElIKMPKEE/ELs+p55XAB5KzRwyaGfyhvnb78rPUBKiwWB3w=
X-Google-Smtp-Source: AGHT+IGAvD7jve9I99GoT/BKI80P6y8fMglPCbeBoUgHhPAkZfkRJUQQV//W1VAPjwl3J6cuHo9G2g==
X-Received: by 2002:ad4:5cef:0:b0:6d4:12c:c6cc with SMTP id 6a1803df08f44-6d4012ccda3mr213242956d6.25.1731955417599;
        Mon, 18 Nov 2024 10:43:37 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dc41b4fsm38829916d6.59.2024.11.18.10.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 10:43:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tD6im-000000037qC-1a8F;
	Mon, 18 Nov 2024 14:43:36 -0400
Date: Mon, 18 Nov 2024 14:43:36 -0400
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
Message-ID: <20241118184336.GB559636@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241114161845.502027-25-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_104339_497007_4867A7F8 
X-CRM114-Status: GOOD (  13.44  )
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

On Thu, Nov 14, 2024 at 05:18:53PM +0100, Andrew Jones wrote:
> @@ -1276,10 +1279,30 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>  	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>  	struct riscv_iommu_dc dc = {0};
> +	int ret;
>  
>  	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
>  		return -ENODEV;
>  
> +	if (riscv_iommu_bond_link(domain, dev))
> +		return -ENOMEM;
> +
> +	if (iommu_domain->type == IOMMU_DOMAIN_UNMANAGED) {

Drivers should not be making tests like this.

> +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
> +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
> +		if (domain->gscid < 0) {
> +			riscv_iommu_bond_unlink(domain, dev);
> +			return -ENOMEM;
> +		}
> +
> +		ret = riscv_iommu_irq_domain_create(domain, dev);
> +		if (ret) {
> +			riscv_iommu_bond_unlink(domain, dev);
> +			ida_free(&riscv_iommu_gscids, domain->gscid);
> +			return ret;
> +		}
> +	}

What are you trying to do? Make something behave different for VFIO?
That isn't OK, we are trying to remove all the hacky VFIO special
cases in drivers.

What is the HW issue here? It is very very strange (and probably not
going to work right) that the irq domains change when domain
attachment changes.

The IRQ setup should really be fixed before any device drivers probe
onto the device.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
