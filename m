Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3971DD59F6C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+55W0oZ/fddtkknEAQuG6WkYcTbIttelOlrd/kh/+k=; b=sRf6FgJ4x5D4Hi
	H9kaMkfPGHAjLV6oFlQtWHPG6svnGSP/ElGJGoXXcel949KN1yuU769Om45ldVc2qIU1e8jCI4SXm
	k+twOkRiWqaewMEoYcr5IjGrR80xYshL3nyX+H/AElfHxmTXG3XKx3mWvwEAkzOs9eovjAVsIoAye
	QT/a5VbmoBTVadj0cB9DM5yCCz+3Yzmjd3PYmiVo+966u370Rr/XW3TfnWDYz/JCipdSh1sfLWHJ3
	4oTESjXJ3HFPpzsrD08XMXbCI4W2lVIQJv03iPF+V033qP93cmRzjuV7FbsB5xdQcgVzpCEB5mHoe
	MOcGj3dCGRhghaafPliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8m0i-00000004aq8-0kQ7;
	Wed, 06 Nov 2024 19:48:12 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ly3-00000004a5s-0lnL
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 19:45:28 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-83abe4524ccso7542439f.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 11:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730922325; x=1731527125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+a2o7Ai/OLZodimKUqsQYFRlYX3rzr6bNlDYl2/9c4=;
        b=P1R1tCDiOvQyn73dXYah5ZqZEQRh8yg7USedXcvNNtNufGPIQ4stO+jxFHf+rCsxRN
         efkchbHlfNNL9wLnaMRuTIKhkgSQo9D1t01bksIt4sCzPK0OLvGtiXGRdwnulRk8sRFq
         GJj8t6+gdpc0DCdUs8ZyzC7eqxz1O1WAHe7UlCh0WU1Yj5LBIDZOMmMYWF1HPA/UVsUX
         oUkbTBPhIp99rZBENoClrr1qkQFYFuaaHgUAJG9c7JdnCvzHcYJvMqPEETIC3f/gtFBe
         +RtFLFAxJ6dRHO9xZADPVnV+0eTYx5DdtpY0iBiQe3abmrNg1cQo/wNpTtrl9Ne6QWCd
         qfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730922325; x=1731527125;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+a2o7Ai/OLZodimKUqsQYFRlYX3rzr6bNlDYl2/9c4=;
        b=YvnGSfkInpU7yA+qm5fnqMJDa5x+i+ilZfo76fMh0NAeszrIZrE4kFpiPNK58lfQwS
         zKC3YXTDl8JXBZ2eeXBuC+Ed8ksfHL7gOjEvEQeo3dfHNosdIFA/Hw/GNXVX/crOEjMZ
         bKP/p3YDtwXD+F3BKgjITlkkE3nkyFkxYL8OT45WRxvgTXviQ0qTLUXynpIBmMUDxLrO
         e8LAZJoOwL+qt/rkgO4VtSCc6tARQskkMxy6cJMZiFrrw6+Bsj8Tacm1j0SspedQZrUt
         zapk556DQTOMo0esiRU7BINOkc/SoV9zNoCjcsLjojJ5cWCRrGLD+qtoZAUhZ+ht3zD/
         rc0A==
X-Forwarded-Encrypted: i=1; AJvYcCWvXAGsG9WNa4cRr8Uc5wPF1oS/WtJwgki1/pWmrNv5DWUa6GzM+PD6Jd/9T4yWhDfr0ZoRJFlj+hYalA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydvvrYfSK29s/d6i8Y5peLPxamg76rF8OFfQ0urhmZajtqzNMH
	5OUapsbCLo7bzAVCjyX4visvDP6Y1v0TNdffQnDcavAxsvXDWZ33fWRn3eMcae0=
X-Google-Smtp-Source: AGHT+IFFkPdTuW3O6B5Kfs6P93ZzsRHCf7tesqNJ7oxewkCWmsZQaCiwBqj8i0a19PKZV/2UTcPUCQ==
X-Received: by 2002:a05:6602:6c17:b0:83b:4c:5f70 with SMTP id ca18e2360f4ac-83b650372a9mr2467672639f.12.1730922325433;
        Wed, 06 Nov 2024 11:45:25 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b67ba907esm329811139f.25.2024.11.06.11.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 11:45:24 -0800 (PST)
Message-ID: <d92ab280-bd1f-4145-8164-cebab1980f20@sifive.com>
Date: Wed, 6 Nov 2024 13:45:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/riscv: Add support for platform msi
To: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
References: <20241106175102.219923-4-ajones@ventanamicro.com>
 <20241106175102.219923-6-ajones@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241106175102.219923-6-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_114527_331273_608FD880 
X-CRM114-Status: GOOD (  28.39  )
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

On 2024-11-06 11:51 AM, Andrew Jones wrote:
> Apply platform_device_msi_init_and_alloc_irqs() to add support for
> MSIs when the IOMMU is a platform device.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/iommu/riscv/iommu-platform.c | 102 ++++++++++++++++++++++-----
>  1 file changed, 84 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> index da336863f152..89aa622bcbde 100644
> --- a/drivers/iommu/riscv/iommu-platform.c
> +++ b/drivers/iommu/riscv/iommu-platform.c
> @@ -11,18 +11,41 @@
>   */
>  
>  #include <linux/kernel.h>
> +#include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/msi.h>

If you respin, please keep these sorted.

>  
>  #include "iommu-bits.h"
>  #include "iommu.h"
>  
> +static void riscv_iommu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> +{
> +	struct device *dev = msi_desc_to_dev(desc);
> +	struct riscv_iommu_device *iommu = dev_get_drvdata(dev);
> +	u16 idx = desc->msi_index;
> +	u64 addr;
> +
> +	addr = ((u64)msg->address_hi << 32) | msg->address_lo;
> +
> +	if (addr != (addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR))
> +		pr_warn_once("uh oh, the IOMMU can't send MSIs to 0x%llx, sending to 0x%llx instead\n",
> +			     addr, addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR);

Can this use dev_warn_once()? And should it really be only a warning?
Configuring the IOMMU to write to some other address seems dangerous. I guess
there's no clean way to handle this error, since this function cannot fail, and
irq_chip_compose_msi_msg() isn't supposed to fail either.

> +
> +	addr &= RISCV_IOMMU_MSI_CFG_TBL_ADDR;
> +
> +	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_ADDR(idx), addr);
> +	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_DATA(idx), msg->data);
> +	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_CTRL(idx), 0);
> +}
> +
>  static int riscv_iommu_platform_probe(struct platform_device *pdev)
>  {
> +	enum riscv_iommu_igs_settings igs;
>  	struct device *dev = &pdev->dev;
>  	struct riscv_iommu_device *iommu = NULL;
>  	struct resource *res = NULL;
> -	int vec;
> +	int vec, ret;
>  
>  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
>  	if (!iommu)
> @@ -40,16 +63,6 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>  	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
>  	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
>  
> -	/* For now we only support WSI */
> -	switch (FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps)) {
> -	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
> -	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
> -		break;
> -	default:
> -		return dev_err_probe(dev, -ENODEV,
> -				     "unable to use wire-signaled interrupts\n");
> -	}
> -
>  	iommu->irqs_count = platform_irq_count(pdev);
>  	if (iommu->irqs_count <= 0)
>  		return dev_err_probe(dev, -ENODEV,
> @@ -57,13 +70,60 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>  	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
>  		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
>  
> -	for (vec = 0; vec < iommu->irqs_count; vec++)
> -		iommu->irqs[vec] = platform_get_irq(pdev, vec);
> +	igs = FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps);
> +	switch (igs) {
> +	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
> +	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
> +		if (is_of_node(dev->fwnode))
> +			of_msi_configure(dev, to_of_node(dev->fwnode));
> +
> +		if (!dev_get_msi_domain(dev)) {
> +			dev_warn(dev, "failed to find an MSI domain");
> +			goto msi_fail;
> +		}
> +
> +		ret = platform_device_msi_init_and_alloc_irqs(dev, iommu->irqs_count,
> +							      riscv_iommu_write_msi_msg);
> +		if (ret) {
> +			dev_warn(dev, "failed to allocate MSIs");
> +			goto msi_fail;
> +		}
> +
> +		for (vec = 0; vec < iommu->irqs_count; vec++)
> +			iommu->irqs[vec] = msi_get_virq(dev, vec);
> +
> +		/* Enable message-signaled interrupts, fctl.WSI */
> +		if (iommu->fctl & RISCV_IOMMU_FCTL_WSI) {
> +			iommu->fctl ^= RISCV_IOMMU_FCTL_WSI;
> +			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
> +		}
> +
> +		dev_info(dev, "using MSIs\n");
> +		break;
> +
> +msi_fail:
> +		if (igs != RISCV_IOMMU_CAPABILITIES_IGS_BOTH) {
> +			dev_warn(dev, "\n");
> +			return dev_err_probe(dev, -ENODEV,
> +					     "unable to use wire-signaled interrupts\n");

Is the dev_warn() just to call attention to the following error? There's no
guarantee that these two messages will be printed adjacently.

> +		}
> +
> +		dev_warn(dev, " - falling back to wired irqs\n");

No need for the extra hyphen here.

Regards,
Samuel

> +		fallthrough;
>  
> -	/* Enable wire-signaled interrupts, fctl.WSI */
> -	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
> -		iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
> -		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
> +	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
> +		for (vec = 0; vec < iommu->irqs_count; vec++)
> +			iommu->irqs[vec] = platform_get_irq(pdev, vec);
> +
> +		/* Enable wire-signaled interrupts, fctl.WSI */
> +		if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
> +			iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
> +			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
> +		}
> +		dev_info(dev, "using wire-signaled interrupts\n");
> +		break;
> +	default:
> +		return dev_err_probe(dev, -ENODEV, "invalid IGS\n");
>  	}
>  
>  	return riscv_iommu_init(iommu);
> @@ -71,7 +131,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
>  
>  static void riscv_iommu_platform_remove(struct platform_device *pdev)
>  {
> -	riscv_iommu_remove(dev_get_drvdata(&pdev->dev));
> +	struct riscv_iommu_device *iommu = dev_get_drvdata(&pdev->dev);
> +	bool msi = !(iommu->fctl & RISCV_IOMMU_FCTL_WSI);
> +
> +	riscv_iommu_remove(iommu);
> +
> +	if (msi)
> +		platform_device_msi_free_irqs_all(&pdev->dev);
>  };
>  
>  static const struct of_device_id riscv_iommu_of_match[] = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
