Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF5ACD5BB1
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXQdCiZzxXCmbOmlLax/KFEPwqNBbeiUCuySuyamMyw=; b=qhvatHNrxg0tvP
	gwOTxENUwvYDmE9Cc2PDLUbIS7YSrJ2MruIrTLMcvZyQYu9eOYL4bXY46CgFRBe6poe8sR7eegOBa
	Lx+Of9BlytnMvoUc74mdaXkIQ5mkrj9arCh3MwqyPFwsfAiAHsm8EeCFPUpPdHWN3QCC3lLT8lvEx
	8MG/CbuLnlrOkBM2bagLmYdM30bl6U+4Ku0BFjs2OQpE3UiGjtc6EVy5gw0+9FmjNSFHiFwnssEVr
	XrQhw1FJ9YFWK9lNHdSAK9zXzvHDZa0M+lIdXpUpmAwVxVEsLVybTIhG2rqlZ8VONCDFlCf+GPO1S
	e9fGhQ8/mttGyCVTUrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrl0-000000023Af-1Mdi;
	Tue, 26 May 2026 13:23:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrkx-0000000239e-0r6D
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 13:23:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BF21443ED;
	Tue, 26 May 2026 13:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A441F00A3F;
	Tue, 26 May 2026 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779801818;
	bh=9fv80VV3utaUxsA1KkGnOso3BBAIoOuR6H5XCcuVXds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTi/aKLTZSU5m++odfVsqV0tvdnglLJGcUt1yQXeOcWjp16HnZX3gEzUPYFIJyFR4
	 5/5PpS8OOhURwqtbi2RTL4jyoITqoLKMuxjr80SLTrhUA8WY0MZsz9IhlwLP6GD9bj
	 AOfI255lVQnHYLngP29jtv7+RuCo60LxAK5xLpf9h+CZTZRl0rfKQ+xIZzaRRJyIyV
	 4HnJJCthLDeZOZ8l4+rneOLIcfPjblzCIZ3dNWANSGt5vdgv8BZtdh/FV4ITlphWil
	 Dj9bRVrDBoT0RmyGdvDdl5PhyWbv6pVGkYui+1c2kkXlSVpM6CkUdoidB9VaayVWJ/
	 /99rRGxhRac7A==
Date: Tue, 26 May 2026 13:23:35 +0000
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH 2/2] reset: spacemit: k3: fix USB2 ahb reset
Message-ID: <20260526132335-GKB3748271@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
 <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_062339_264246_21357B6A 
X-CRM114-Status: GOOD (  15.44  )
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

Hi Philipp Zabel,

On 02:58 Mon 18 May     , Yixun Lan wrote:
> According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
> clock enable bit was wrongly swapped, the correct one should be:
> 
> Register : APMU_USB_CLK_RES_CTRL
> bit[1]   : usb2_port_bus_clk_en
> bit[0]   : usb2_port_ahb_rstn
> 
> Fixes: a0e0c2f8c5f3 ("reset: spacemit: k3: Decouple composite reset lines")
> Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Would be it ok from your side to queue this patch for v7.2 cycle?
or do you want me to combine it and go via clk tree when sending PR to
Stephen? I think as long as they are accepted in same cycle, then should
be no problem, otherwise will result a broken USB2 driver.

P.S, we will activate USB2 driver for K3 in v7.2, so kicking this in
same cycle should be a good reason, no necessary to rush for v7.1 fix..

> ---
>  drivers/reset/spacemit/reset-spacemit-k3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
> index 9841f5e057b2..2e87f320cf11 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k3.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k3.c
> @@ -112,7 +112,7 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
>  	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> -	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
>  	[RESET_APMU_USB2_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(2)),
>  	[RESET_APMU_USB2_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(3)),
>  	[RESET_APMU_USB3_A_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(5)),
> 
> -- 
> 2.54.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
