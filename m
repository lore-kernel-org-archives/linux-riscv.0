Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618C2C433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 08:52:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B2E206F0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 08:52:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4bc7QD5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="f6Bmje31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B2E206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wSngZcgxotnGG1dRAWl41dTEOQlHqw/PMkB9ysW8GLU=; b=M4bc7QD5TjSpZoc5dO3OtGMu9
	149/S8t/jQVe8jG645gPJbcfgP2vczPtJEWMTgzTVDM7NkXUc7RNDIkIou+Gbe8QyXbDXpnhUanxk
	ohSbDZ8fjFXZ8eyo/SI4eIbWg/ejxCPqAkimwxi+n85uOpF3r1I57/B4x/WTvW5K0mv1cIPr6se4h
	kkIQGisL0jCHt2vc4a5INVLUxBFA3UPrLFXYFBkjx6ccMUM5I5tdWBfi7s+aoaCHAOthphD9ASncd
	CNmtZyQJHqsSga9X1SAJAcnYpEczZ6tmPuzMwuAHZ+H8+mzV/r4i+WFZOZHBB50bo/ACw5FyLolIq
	AdN8O8lyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCfXy-0000gg-Va; Mon, 31 Aug 2020 08:52:15 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCfXw-0000fI-Bk
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 08:52:14 +0000
Received: from zn.tnic (p200300ec2f085000813a34d1eba5207f.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:5000:813a:34d1:eba5:207f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C27221EC02F2;
 Mon, 31 Aug 2020 10:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1598863927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=2FzP/LvkqUgFGgtj8Jdm6U/F975hJtQOcYmgKmxdTew=;
 b=f6Bmje31otGkvraw5KTpsx4FRsRfwx8yvp2U8CfixJu6w2daX7PKI70wy6ktlQJakpMJGE
 SvPG660bCO0X5LAxbQHfEbYbcui6cRng5yj3PCltWtTga0uSzRY1A0PeIF+S1pJdm3DA7r
 zFeYYwTxuxv+SJat3BZg1DoX4Ct+aK8=
Date: Mon, 31 Aug 2020 10:52:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 3/3] edac: sifive: Add EDAC support for Memory Controller
 in SiFive SoCs
Message-ID: <20200831085203.GB27517@zn.tnic>
References: <1598357182-4226-1-git-send-email-yash.shah@sifive.com>
 <1598357182-4226-4-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598357182-4226-4-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_045212_577462_ED9F799A 
X-CRM114-Status: GOOD (  20.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 james.morse@arm.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 aou@eecs.berkeley.edu, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> Subject: Re: [PATCH 3/3] edac: sifive: Add EDAC support for Memory Controller in SiFive SoCs

Fix subject prefix: "EDAC/sifive: ..."

On Tue, Aug 25, 2020 at 05:36:22PM +0530, Yash Shah wrote:
> Add Memory controller EDAC support in exisiting SiFive platform EDAC

s/in exisiting/to the/

> driver. It registers for notifier events from the SiFive DDR controller
> driver for DDR ECC events.

Simplify:

"It registers for ECC notifier events from the memory controller."

> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/edac/Kconfig       |   2 +-
>  drivers/edac/sifive_edac.c | 117 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 7b6ec30..f8b3b53 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -462,7 +462,7 @@ config EDAC_ALTERA_SDMMC
>  
>  config EDAC_SIFIVE
>  	bool "Sifive platform EDAC driver"
> -	depends on EDAC=y && SIFIVE_L2
> +	depends on EDAC=y && (SIFIVE_L2 || SIFIVE_DDR)
>  	help
>  	  Support for error detection and correction on the SiFive SoCs.
>  
> diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
> index 3a3dcb1..cf032685 100644
> --- a/drivers/edac/sifive_edac.c
> +++ b/drivers/edac/sifive_edac.c
> @@ -11,14 +11,120 @@
>  #include <linux/platform_device.h>
>  #include "edac_module.h"
>  #include <soc/sifive/sifive_l2_cache.h>
> +#include <soc/sifive/sifive_ddr.h>
>  
>  #define DRVNAME "sifive_edac"
> +#define SIFIVE_EDAC_MOD_NAME "Sifive ECC Manager"

s/SIFIVE_EDAC_MOD_NAME/EDAC_MOD_NAME/g

like the other EDAC drivers.

...

> +static int ecc_mc_register(struct platform_device *pdev)
> +{
> +	struct sifive_edac_mc_priv *p;
> +	struct edac_mc_layer layers[1];
> +	int ret;
> +
> +	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	p->notifier.notifier_call = ecc_mc_err_event;
> +	platform_set_drvdata(pdev, p);
> +
> +	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
> +	layers[0].size = 1;
> +	layers[0].is_virt_csrow = true;
> +
> +	p->mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, 0);
> +	if (!p->mci) {
> +		dev_err(&pdev->dev, "Failed mem allocation for mc instance\n");
> +		return -ENOMEM;
> +	}
> +
> +	p->mci->pdev = &pdev->dev;
> +	/* Initialize controller capabilities */
> +	p->mci->mtype_cap = MEM_FLAG_DDR4;
> +	p->mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
> +	p->mci->edac_cap = EDAC_FLAG_SECDED;
> +	p->mci->scrub_cap = SCRUB_UNKNOWN;
> +	p->mci->scrub_mode = SCRUB_HW_PROG;
> +	p->mci->ctl_name = dev_name(&pdev->dev);
> +	p->mci->dev_name = dev_name(&pdev->dev);
> +	p->mci->mod_name = SIFIVE_EDAC_MOD_NAME;
> +	p->mci->ctl_page_to_phys = NULL;
> +
> +	/* Interrupt feature is supported by cadence mc */
> +	edac_op_state = EDAC_OPSTATE_INT;
> +
> +	ret = edac_mc_add_mc(p->mci);
> +	if (ret) {
> +		edac_printk(KERN_ERR, SIFIVE_EDAC_MOD_NAME,
> +			    "Failed to register with EDAC core\n");
> +		goto err;
> +	}
> +
> +#ifdef CONFIG_SIFIVE_DDR

It seems all that ifdeffery can be replaced with

	if (IS_ENABLED(CONFIG_...))

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
