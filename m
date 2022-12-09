Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84895C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cv57qbMdOQPvzQ2lrMisOPwgfSxtBa23TG4AbJITUBE=; b=GFgQnMUxV3FG6HvShM0L+Qzg1Q
	IkFaIkSG9DtBTTyrpQh8S6J009qVSENgzILAV2ttCK4OuF3rq8TRU7WuxJO90mOP8Wn57hKD1dLmQ
	r7BqDyeXCmJKEPw9vQs909W+1RpnqzKglvBQf46klarHLN8exZq5eubLkSP7RmIT53wMRwazu9BUC
	VfefSKSGY4cKQvMkqo3rIg9lQJkBSe5B5+R4nDQ+7AKERZnURNmWkq6q1/y5p7HIhR461iKTxzBHm
	CTk8v17TVXYf2SNQ9eV/JH4x48AvWQ7s1C9qWvyz+UX/luY9z0W5BTDSU6C9kWQLGdWfLpA7cbWsE
	9rVEXhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Sff-000aJ9-FK; Fri, 09 Dec 2022 01:59:27 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Sfc-000aA1-6l
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:59:25 +0000
Received: from [78.40.148.178] (helo=webmail.codethink.co.uk)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1p3SfQ-006rLO-U8; Fri, 09 Dec 2022 01:59:12 +0000
MIME-Version: 1.0
Date: Fri, 09 Dec 2022 01:59:08 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 2/7] net: stmmac: platform: Add snps,dwmac-5.20 IP
 compatible string
In-Reply-To: <20221201090242.2381-3-yanhong.wang@starfivetech.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-3-yanhong.wang@starfivetech.com>
Message-ID: <f6fd99d22a025377e176890cc7641ab9@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_175924_287239_486F3ACD 
X-CRM114-Status: GOOD (  12.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2022-12-01 09:02, Yanhong Wang wrote:
> Add "snps,dwmac-5.20" compatible string for 5.20 version that can avoid
> to define some platform data in the glue layer.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 50f6b4a14be4..cc3b701af802 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -519,7 +519,8 @@ stmmac_probe_config_dt(struct platform_device
> *pdev, u8 *mac)
>  	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
>  	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
>  	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-5.10a")) {
> +	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
> +	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
>  		plat->has_gmac4 = 1;
>  		plat->has_gmac = 0;
>  		plat->pmt = 1;

out of interest, is the version of the ip autodetectable yet?
also, we would be better off if having an if (version > 4) check if we 
use the standard snps ip block code headers


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
