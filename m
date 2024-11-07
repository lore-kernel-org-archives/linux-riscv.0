Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8978ED5D67D
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ag8epdbK5vdMBnBMV11XiDvJYTGIQN7YVMDRckp2eq4=; b=k9Hf3/UZoRYcGl
	yXRFnzc5R0GDpyGLkNilprSeEw0Awd3t5dMmQsuOCIWJcJqCYpn+kGsG6UDhR04zvLCC4mKvZreO9
	6HMvNC7hnRSYOSWQZeSMK8USpbofuPwdoKkT5rUAGpzyM2emcUNdCd0k4AAMYOB5EtZkxnv160iXe
	CVuOZUUaz2J4twkTcswz9VkfmfJT8R/VdEex60pQDM0JeCOAnwZYY34wD1CTsFN+XJwHuaL48tXuf
	12GblkK4piTjNeMyMs/kXl3aO/lWU6epoiD8GeFjAWzk0J5WjEutuCd1Cb8QM2+2DWBr2L2s8CGli
	iLaUQWonZ+NNq0F5xvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96pD-00000007t1a-1PKw;
	Thu, 07 Nov 2024 18:01:43 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Zn-00000007gLs-0nBc
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:41:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so165624666b.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 08:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730997701; x=1731602501; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9XrMMh3/6jKfxgBvb9B39K7/szH3g2Df3ueLyIXWGk=;
        b=B7f8gf8Vy5HTY7Laj0Kfs1a6GqU+zL0+V/ZL2Zol55WlPtMhsAgASe4/R+w3eHR6dn
         cGXcvdegU/soEADzu9dt6SQ1FDGF1uHP6MSlKg6rHrmTgVOKvzSS0CaXooC/mGhykf//
         2HzGb8zztGjD4KBxfI0Qq/wkgpVzzORZz3DRThTbZtf8SRAOkNv2gnjQA2vY3s+RSLFC
         TBbr2fJTauYcWkoooaTYW1AL9ettSiocMZPITC89OQ4po3NN/YUa3BzDBZICoN0AfOOQ
         QbCtBLp2tbBGLkMBULhipBT3ldQZNwTlIQQ1484XrwOITSQWq422udpmRQJ7i1rpQQLD
         F4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997701; x=1731602501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9XrMMh3/6jKfxgBvb9B39K7/szH3g2Df3ueLyIXWGk=;
        b=hR6nP+c+IQ3XJshLmcAdGCNnAlj0CueBUcj8EiQEt6llHrXMtpCmvRuzehzjqrr9hj
         8teLzIpqT926iduaSOQ3nQQbn0Tv7RvoNeeVg5tu4z2Vyo25bR1O392dFHFRDesc/19c
         cUA8meCL03lDFjXKpaRI5YgFKYnbNcfzTiUm4MHaOOVH9k7EGyQdjDfLEm37LGDNt5tL
         ImkJNu8o8Xe/YECvqVUWtev1tdhCpHpE1fU+h0Ix5lanYZyVhA6AHY+gB6z1kjJp26N5
         ykreGll91P6lZ3iBBOhQZlRc35tZubSONQ+8AuecTzDlQ560grhha9q6rpEWzkCqw78x
         CCqA==
X-Forwarded-Encrypted: i=1; AJvYcCU0FVo0SEJaVxUydyU7RObbtuxthNqgEw5CaO+RlQp5x6xVT0qb0Db2Acxu+3zyuj/iaM8aCO02Qh40vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZgNX30AJr2Q0pLXMITSE/IbLIJIJWVyvHxgHwBBtL1neepNxD
	FoOTwUTVcCoum9l1cCWyHC/Vxkg63GXuIIgP0oW0DYIF7b2YR2XC/1vszH91z6ShpIMtpeZOtjx
	Y
X-Google-Smtp-Source: AGHT+IGoYjUPTOzrAY5e5EufOknt6N62gHZK+veE80C7chcu3um68ZWUrZfZEthLlSgMmBUVcmxInQ==
X-Received: by 2002:a17:907:9604:b0:a9a:7f84:940b with SMTP id a640c23a62f3a-a9eeae9b3eemr80229166b.10.1730997700859;
        Thu, 07 Nov 2024 08:41:40 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17635sm113837466b.17.2024.11.07.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 08:41:40 -0800 (PST)
Date: Thu, 7 Nov 2024 17:41:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [PATCH 2/2] iommu/riscv: Add support for platform msi
Message-ID: <20241107-dcdcb332d980a7120e9518ac@orel>
References: <20241106175102.219923-4-ajones@ventanamicro.com>
 <20241106175102.219923-6-ajones@ventanamicro.com>
 <d92ab280-bd1f-4145-8164-cebab1980f20@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d92ab280-bd1f-4145-8164-cebab1980f20@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_084143_257650_D4C37E64 
X-CRM114-Status: GOOD (  34.79  )
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

On Wed, Nov 06, 2024 at 01:45:23PM -0600, Samuel Holland wrote:
> Hi Drew,
> 
> On 2024-11-06 11:51 AM, Andrew Jones wrote:
> > Apply platform_device_msi_init_and_alloc_irqs() to add support for
> > MSIs when the IOMMU is a platform device.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  drivers/iommu/riscv/iommu-platform.c | 102 ++++++++++++++++++++++-----
> >  1 file changed, 84 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> > index da336863f152..89aa622bcbde 100644
> > --- a/drivers/iommu/riscv/iommu-platform.c
> > +++ b/drivers/iommu/riscv/iommu-platform.c
> > @@ -11,18 +11,41 @@
> >   */
> >  
> >  #include <linux/kernel.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/msi.h>
> 
> If you respin, please keep these sorted.

Sure

> 
> >  
> >  #include "iommu-bits.h"
> >  #include "iommu.h"
> >  
> > +static void riscv_iommu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> > +{
> > +	struct device *dev = msi_desc_to_dev(desc);
> > +	struct riscv_iommu_device *iommu = dev_get_drvdata(dev);
> > +	u16 idx = desc->msi_index;
> > +	u64 addr;
> > +
> > +	addr = ((u64)msg->address_hi << 32) | msg->address_lo;
> > +
> > +	if (addr != (addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR))
> > +		pr_warn_once("uh oh, the IOMMU can't send MSIs to 0x%llx, sending to 0x%llx instead\n",
> > +			     addr, addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR);
> 
> Can this use dev_warn_once()? And should it really be only a warning?
> Configuring the IOMMU to write to some other address seems dangerous. I guess
> there's no clean way to handle this error, since this function cannot fail, and
> irq_chip_compose_msi_msg() isn't supposed to fail either.

I'll change it to a dev_err_once().

> 
> > +
> > +	addr &= RISCV_IOMMU_MSI_CFG_TBL_ADDR;
> > +
> > +	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_ADDR(idx), addr);
> > +	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_DATA(idx), msg->data);
> > +	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_CTRL(idx), 0);
> > +}
> > +
> >  static int riscv_iommu_platform_probe(struct platform_device *pdev)
> >  {
> > +	enum riscv_iommu_igs_settings igs;
> >  	struct device *dev = &pdev->dev;
> >  	struct riscv_iommu_device *iommu = NULL;
> >  	struct resource *res = NULL;
> > -	int vec;
> > +	int vec, ret;
> >  
> >  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> >  	if (!iommu)
> > @@ -40,16 +63,6 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
> >  	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
> >  	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
> >  
> > -	/* For now we only support WSI */
> > -	switch (FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps)) {
> > -	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
> > -	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
> > -		break;
> > -	default:
> > -		return dev_err_probe(dev, -ENODEV,
> > -				     "unable to use wire-signaled interrupts\n");
> > -	}
> > -
> >  	iommu->irqs_count = platform_irq_count(pdev);
> >  	if (iommu->irqs_count <= 0)
> >  		return dev_err_probe(dev, -ENODEV,
> > @@ -57,13 +70,60 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
> >  	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
> >  		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
> >  
> > -	for (vec = 0; vec < iommu->irqs_count; vec++)
> > -		iommu->irqs[vec] = platform_get_irq(pdev, vec);
> > +	igs = FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps);
> > +	switch (igs) {
> > +	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
> > +	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
> > +		if (is_of_node(dev->fwnode))
> > +			of_msi_configure(dev, to_of_node(dev->fwnode));
> > +
> > +		if (!dev_get_msi_domain(dev)) {
> > +			dev_warn(dev, "failed to find an MSI domain");
> > +			goto msi_fail;
> > +		}
> > +
> > +		ret = platform_device_msi_init_and_alloc_irqs(dev, iommu->irqs_count,
> > +							      riscv_iommu_write_msi_msg);
> > +		if (ret) {
> > +			dev_warn(dev, "failed to allocate MSIs");
> > +			goto msi_fail;
> > +		}
> > +
> > +		for (vec = 0; vec < iommu->irqs_count; vec++)
> > +			iommu->irqs[vec] = msi_get_virq(dev, vec);
> > +
> > +		/* Enable message-signaled interrupts, fctl.WSI */
> > +		if (iommu->fctl & RISCV_IOMMU_FCTL_WSI) {
> > +			iommu->fctl ^= RISCV_IOMMU_FCTL_WSI;
> > +			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
> > +		}
> > +
> > +		dev_info(dev, "using MSIs\n");
> > +		break;
> > +
> > +msi_fail:
> > +		if (igs != RISCV_IOMMU_CAPABILITIES_IGS_BOTH) {
> > +			dev_warn(dev, "\n");
> > +			return dev_err_probe(dev, -ENODEV,
> > +					     "unable to use wire-signaled interrupts\n");
> 
> Is the dev_warn() just to call attention to the following error? There's no
> guarantee that these two messages will be printed adjacently.

I'll drop the dev_warn since it was supposed to tie in with the dev_warn
above which was missing its endline on purpose, but your statement about
avoiding split logs means I should probably just do a complete log above
and complete logs here and...

> 
> > +		}
> > +
> > +		dev_warn(dev, " - falling back to wired irqs\n");
> 
> No need for the extra hyphen here.

...here, which also means the hyphen should be dropped.
> 
> Regards,
> Samuel

Thanks,
drew

> 
> > +		fallthrough;
> >  
> > -	/* Enable wire-signaled interrupts, fctl.WSI */
> > -	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
> > -		iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
> > -		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
> > +	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
> > +		for (vec = 0; vec < iommu->irqs_count; vec++)
> > +			iommu->irqs[vec] = platform_get_irq(pdev, vec);
> > +
> > +		/* Enable wire-signaled interrupts, fctl.WSI */
> > +		if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
> > +			iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
> > +			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
> > +		}
> > +		dev_info(dev, "using wire-signaled interrupts\n");
> > +		break;
> > +	default:
> > +		return dev_err_probe(dev, -ENODEV, "invalid IGS\n");
> >  	}
> >  
> >  	return riscv_iommu_init(iommu);
> > @@ -71,7 +131,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
> >  
> >  static void riscv_iommu_platform_remove(struct platform_device *pdev)
> >  {
> > -	riscv_iommu_remove(dev_get_drvdata(&pdev->dev));
> > +	struct riscv_iommu_device *iommu = dev_get_drvdata(&pdev->dev);
> > +	bool msi = !(iommu->fctl & RISCV_IOMMU_FCTL_WSI);
> > +
> > +	riscv_iommu_remove(iommu);
> > +
> > +	if (msi)
> > +		platform_device_msi_free_irqs_all(&pdev->dev);
> >  };
> >  
> >  static const struct of_device_id riscv_iommu_of_match[] = {
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
