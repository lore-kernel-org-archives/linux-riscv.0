Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B022C5CFDB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wg0rZe1sILrhjejI6/eMaZ49PswpPboEM1smnX9uj7Y=; b=VIsdzQD8VHzC3e
	dXHzMCGb6ohkVBXkDfjExrspqAvMzqOCYUMknBiesFf1LgZ2VwVFzgTIQTf077yYrZauve3FdOccZ
	L+tbW4r1wyTqbIA6mk185N26uyq2z6fKRqa5SLkN+o56lGimbNDxwKKx4DRloNQ2RT7fPxwNJrUkw
	TKO2w8U234BNxG+qlMkfvU2oy9Yxf7BDv4BGHkWaYbL8ZRrYazUkADxW4oOsYCugkQPI/epI4Rkj3
	TClDaLGqbcWRJUa2ULuVcBJgXeziC8fUWJdv+bjesP7jw+9tXqZE+tLOMjtUF9wPMGIbY/BOWwRkJ
	JZXRXsHiIYBUcbjIfdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS9d-00000000O0m-3i9H;
	Thu, 13 Aug 2026 09:55:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS9c-00000000O0B-38Yl
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 09:55:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41EB243698;
	Thu, 13 Aug 2026 09:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658801F000E9;
	Thu, 13 Aug 2026 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786614916;
	bh=wpohbZ9rJj7yOAt868aIiXK/QrTmD5B7lw42yERMmg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QUMUsH6RD6OK9BEQ3uXYmS2OGApGrPSn1oDOu/T6hPnWKa5nH7BKz9ZcUr0eVEbaO
	 z6w9/qXy3LON7vp+tdnYkMckWCuqb2lR204xkpiKE8i6+BC3Cgt/QjAx7VxQ5/uCpc
	 7BaPu4Pcdw1g7zFrwYrzXQeV/IQ3k7v8RBO8TdYx13pkRkBMDEdB8h5omny2OAuO3s
	 7CCJEB7YQhAFhy7XOdjQLfswUoPDurr6zgLiJrRi0lQjkwoXWy4rt11SF29WnjLzZR
	 If10W4rSKPL3uXyOQV0QoEfqEXtWqWUcY1tlnNHPWh4gMI5T71S7FL0VEZhSrlYh5e
	 rGWogProO6p2w==
Date: Thu, 13 Aug 2026 02:55:13 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
Message-ID: <an2UgcS8cHDGwzsO@hu-petche-lv.qualcomm.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
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

On 26-08-12 17:26:13, Junzhong Pan wrote:
> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
> compatibility, add optional reset support.
> 
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> index 8ffa1e95d8e8..00d575cd2955 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -12,6 +12,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  #include <linux/usb/chipidea.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/usb/ulpi.h>
> @@ -21,6 +22,7 @@
>  struct ci_hdrc_usb2_priv {
>  	struct platform_device	*ci_pdev;
>  	struct clk		*clk;
> +	struct reset_control	*reset;
>  };
>  
>  static const struct ci_hdrc_platform_data ci_default_pdata = {
> @@ -80,6 +82,12 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	priv->reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		ret = PTR_ERR(priv->reset);
> +		goto clk_err;
> +	}
> +

You may update binding doc?

Acked-by: Peter Chen <peter.chen@kernel.com>

Peter
>  	ci_pdata->name = dev_name(dev);
>  
>  	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,
> 
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
