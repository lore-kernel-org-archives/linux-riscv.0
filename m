Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E086106F307
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpRFp8sbJiU094KeHPI2EeQdo/5MRsJehBPLOMueooM=; b=vDw0NaKQmmblTz
	v7lsE7Lw5iBWwNjwqK0uPfxHkpRHoLOw9+pH/MCTNDByIVbGnob5DEBuiJwZQQaCD2P5rRNV4zRbG
	V3azW80bKvu/2V6O7sr9HeMkFnGA0p1L7llpAJlArNTfnN+qR9gG8pQboYdasNhxPByg7CeYIAaTz
	qsEvWmXPkVe3MQXg+fAMYpPqxWTXFrmG1k8f3giJUusv2URgPsBRv36OQh9CJQePINGBiyFqpQ9jL
	67b/LTGBjFaG+maYMOQlffD4a8praG2w5YWYp/Z7k3IZuqw2Kedpkc3k8qnzL7OAUTh3a68neMNKx
	zj/LXQb1P19CQb3/WNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXH-0000000559o-2WDW;
	Thu, 26 Mar 2026 08:57:51 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXF-0000000556x-0wmm
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:57:50 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774515456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeMHr0vQhEqNCiIKwsjdNZuAZi/ehFggVflJyU2swJM=;
	b=oymjH/VJae0r8yWcQwTxer+tBfPHSqNf+gIzDk0yXoYH5lcNkO0Vg8qvcUcjsXrjoHqD+F
	8GFTSup1x5vIqCLYxdt4IIY82haWJmX1XZXytWYyZLHALrJzvph/hTIDlUi1BkGilaYGwF
	4RVcFbq9nf/9fyq6EYl0DdatxeU0xH0=
Date: Thu, 26 Mar 2026 16:56:20 +0800
Message-Id: <DHCL7BLD4KP9.2W648STZ3YV7E@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Felix Gu" <ustc.gu@gmail.com>, "Vinod Koul" <vkoul@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Yixun Lan" <dlan@kernel.org>, "Ze
 Huang" <huang.ze@linux.dev>
Cc: <linux-phy@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] phy: spacemit: Remove incorrect clk_disable() in
 spacemit_usb2phy_init()
References: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
In-Reply-To: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015749_418019_B33B3394 
X-CRM114-Status: GOOD (  13.46  )
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

On Thu Mar 26, 2026 at 12:23 AM CST, Felix Gu wrote:
> When clk_enable() fails, the clock was never enabled. Calling
> clk_disable() in this error path is incorrect.
>
> Remove the spurious clk_disable() call from the error handling
> in spacemit_usb2phy_init().
>
> Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/spacemit/phy-k1-usb2.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 9215d0b223b2..e8c1e26428a9 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -97,7 +97,6 @@ static int spacemit_usb2phy_init(struct phy *phy)
>  	ret = clk_enable(sphy->clk);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to enable clock\n");
> -		clk_disable(sphy->clk);
>  		return ret;
>  	}
>  
>
> ---
> base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
> change-id: 20260326-k1-usb3-f6a52f413616
>
> Best regards,

Indeed, thanks for catching this.

Reviewed-by: Ze Huang <huang.ze@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
