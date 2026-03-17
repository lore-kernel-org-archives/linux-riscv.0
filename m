Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B2FB5EAF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zym1BmrSOqQyJ5JTJ7uyomtffsklp+6QjhVH2x5LLbo=; b=kN49IxCRMzhQqv
	DGgql7/8YRnsdpo2sP4Sevkuy1UuTou9DHvvI2PgkG6n7kQNgXp5qOa170c/6ml41kookmCrOLFAw
	+fgRrRs82ckHM5SY8ltKgCmjMshrzMFuJze6PNeD4NzRvh2yc1kGfzO1SRumUerQYdl8KXB1c7iJ0
	vcRnNjlx1bDoNSHLMZj+H1fQ+qKQHvsk5dKtpWjGgk5jn0ojcHmPcqcYiZVnDzKWhUQewRZPYLYBO
	8KwTxJ5Fe02wZd3eGhDUiXgLJUn7oSpj/CYDAhY3QLtfDCrPc3vVUTk1xMY1eeTkpiurY0/ZcjfIa
	6n157hx01nQiXDk0o8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Lqk-00000005O0d-0MFa;
	Tue, 17 Mar 2026 04:16:10 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Lqe-00000005Nvu-3pFI
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 04:16:08 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773720950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsfrICEAiF/QAe2USeGCcUz3O4end0xEuayixaEUc2o=;
	b=qSHJnnWA1z4yQ791SI42jydSs85/p/pHYyjQ+bwrVSkzyWzeEBe79Y7MkjkHaK1Z3zo+o1
	vApaRtahOPedpcuys2wFm3B4HQGQ7GcTa/4RwqC0fBtjJ3piDg1174tYGPelBUaSz2ZAV7
	Lbbsoh7JnXBp2k4xhYZGWHBfOgyrCOE=
Date: Tue, 17 Mar 2026 12:15:02 +0800
Message-Id: <DH4RL1NROT5O.2BN4PC3IH3DV2@linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Ze Huang"
 <huang.ze@linux.dev>, "Yixun Lan" <dlan@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Thinh Nguyen"
 <Thinh.Nguyen@synopsys.com>
References: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_211605_380287_5A978C3A 
X-CRM114-Status: GOOD (  15.02  )
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

On Mon Mar 16, 2026 at 4:00 PM CST, Chukun Pan wrote:
> Some boards provide USB VBUS through a controllable regulator. Add
> support for the optional vbus-supply property so the regulator can
> be properly managed instead of left always-on. Note that this does
> not apply to USB Hub downstream ports with different VBUS supplies.
>
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/spacemit%2Ck1-dwc3.yaml#L71
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index e846844e0023..83b4e4d69ba9 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -12,6 +12,7 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/regulator/consumer.h>
>  #include "glue.h"
>  
>  #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
> @@ -113,6 +114,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to get clocks\n");
>  
> +	ret = devm_regulator_get_enable_optional(dev, "vbus");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to enable VBUS\n");
> +
>  	dwc3g->num_clocks = ret;
>  	dwc3g->dwc.dev = dev;
>  	probe_data.dwc = &dwc3g->dwc;

This could be useful for boards with direct-attached VBUS.

Just to clarify, the vbus-supply binding is for potential direct-attached
designs. For current boards (like K1 BPI-F3 and Jupiter) with the VL817 hub,
we'll use onboard_usb_dev instead.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
