Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30941CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 07:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cR41TmrTW0DNMEulzY1xilHv48T1Aia3zREBCsEhZVk=; b=W5OCAybThELC5J
	AXczLtglGmPGLMyDyFPyAyum7KArRC1BdvcoLGwyPicOFeIJp67rdEu0/P9NbUuR5Kx11gyuIDhDE
	qWI5My4M6gC/f2FjZJGnSTDOdszNFn3pZW0GYczXdnpC/pbhnBI+FIt4BbqGRSYzLe5UyGjRdoXR7
	0qmGOAMDm0S04mcYuJn7Nfv8ModUdjiPpZ5X3n14vgtI1yz0k7LccmpUpQd9a5PTNUJnK09Ywsdn7
	0n4VbfXr0c4oyu/m3q+5nU7Jsjd5KEiE1nfHkD+0G6JSqJ7rC4ER0Gwly4LMkjANzV1sT2uAwp0QP
	WQ7ctlMnNzIvhPyrjtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6w4-00000000kUD-1p38;
	Thu, 18 Jun 2026 07:13:12 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6w1-00000000kTB-2Bxd
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 07:13:11 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c891d27b10eso406874a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781766789; x=1782371589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
        b=aM5rl+7Qe2wmSCkVDUjPnR7l6qOhJOU5K5nc0fxTceOsVY1FFp0tPP2jY1xC1Gs8aN
         SXd0Y4XtVOkgQGxP0iRL8EVCy2o1HL6zzzgnY7tKAQZ8R/C5BgfD82p7HtXrBWZCp+z6
         vCn6Xy0SQZtry5eE8WjmoL2KTzf+ftekDsVf8WJ0cpDrktvOSw3n8bIogKfPB3UW19zQ
         tf2hiS7u3Nyr/yYDnWVWZAPgTSOLSzJIxzQAgIMnZQ2AuizL4n2a/8xPGI/MV09hlqOC
         bSVCSocXCUKOEBseD9Lg9IRsSj+9qBc1TDJYAk1hez4lkjk5puiszbvl14lwAPCjXd/W
         VPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766789; x=1782371589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
        b=a7Nss9K5uNradwv2cNlBx3xyIStUGdaQRng+apKefQqsKGkonGkKBHfao47a7SWwth
         lFMSPMR2yMIAYsd2PY6ohEbHe1HEUTNBKB3XENahBDlPv8DYJDd5dsUr/zZ54Gr/sjWv
         C4naat2PBahpB1g5oqmOj/BkA3ufQ+MCnyHSTWOhHyEMmGmzWv60/IjuY8ahMFzBiQNS
         VskbEOd1QQrhhnC7ri6zi4kLu+ZSDhwADcuMTwKTU0N2Tyl1Km5A3/g7VkggwNcO7ywR
         nEqMhlcnoFQE1JXorCwqE4bBTERBP4jO1zigEB+19POzwSsHcgy+tZx4I2NQHtHMAsO4
         4NXg==
X-Forwarded-Encrypted: i=1; AFNElJ/SrLnBXgl3/yyWbhlWnC6ePgJB1gYcZNQpwG/EkJ3TdSRljSrASzm8XHdgpaTbzU4lfzG5qX5G8JUwQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz96EqK6lYMAo/3WrK5LKVc+4WOiBSKkR5EiA9erHgxqjtANy5K
	32CnAwCB0rKXw3Jxr6CVX8UtlWE5xX1tdFIeghO2f6FJxN8OqDu2ABgEGPoIUk/T
X-Gm-Gg: Acq92OG5askAWthhXaLQzAmgPJmf+9RRGMlfA3xdwk7FpD66VhVvfPUmxZhVHC9s0Ll
	/PPy7XCfQkqazPf/4SaNg0khlU++ua6NS0H3Y9Zhw9P8MrszOeo+Pxuxu8pN8jTFDYhu+ANR4zZ
	+eR+a7B7SgO7RT09feu7U0hNUp3vUvqZqbyR2p9oVwHo0G5LVn8fAQqYkGYgT5DGc/FDG319fjG
	0TfTRv8CROJQVAAufVT9u7qpDY1aiogdxUk9XNYXa2qWfvtm9MSsCeSQcM+UN2bnSiLZr+XjgTP
	0BkGiIvZKy2hKCRIXBC+YEvm07o5eygYF38liSQkvjEcZSDmJZiC3iae4F+LfpgXT9N1z1So9K0
	cRamUqkcplfMzppW5/4iriYWnaavgmTp5cywIcen5bZo1N9ZEQ8UiCsqBM8XoZn2/
X-Received: by 2002:a05:6a20:c991:b0:3b4:65ac:e2e3 with SMTP id adf61e73a8af0-3b9e5b2381dmr3247768637.5.1781766788479;
        Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c889356266dsm3221211a12.6.2026.06.18.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Date: Thu, 18 Jun 2026 15:12:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yixun Lan <dlan@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-spacemit: Fix wrong ctrl register
 definition
Message-ID: <ajOZnO_dFg20VnEc@inochi.infowork>
References: <20260618064143.1102179-1-inochiama@gmail.com>
 <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_001309_566299_7753BF38 
X-CRM114-Status: GOOD (  22.37  )
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

On Thu, Jun 18, 2026 at 09:03:21AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 6/18/26 08:41, Inochi Amaoto wrote:
> > There register layout of the phy ctrl register has something wrong,
> > fix it to match the right layout
> > 
> > Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > index 223754cc5c79..6feffaa3ef3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > @@ -18,10 +18,12 @@
> >  #include "stmmac_platform.h"
> >  
> >  /* ctrl register bits */
> > -#define CTRL_PHY_INTF_RGMII		BIT(3)
> > -#define CTRL_PHY_INTF_MII		BIT(4)
> > -#define CTRL_WAKE_IRQ_EN		BIT(9)
> > -#define CTRL_PHY_IRQ_EN			BIT(12)
> > +#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
> > +#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
> > +#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
> > +#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
> > +#define CTRL_PHY_IRQ_EN			BIT(9)
> > +#define CTRL_WAKE_IRQ_EN		BIT(12)
> 
> Looks like you're fixing 2 things there :
> 
>  -> Wake on Lan probably didn't work before, as the wake irq was apparently wrong.

I guess the vendor firmware and uboot may do something for it, 
but the irq is wrong actually.

>  -> The MII mode selection apparently also changes, but maybe you don't have a
>     MII board around to test this ?
> 

Actually, the only board of the K3 is the pico-itx board, and it only has
a RGMII phy. I even doube the spacemit vendor has not tested the MII phy
well....

> Is it possible you address these issues independently (i.e. split this in 2 patches) ?
> That way, if we ever revert one, we won't re-break the other thing that was broken.
> 
> 

Yes, it is fine for me to split it. I will send it in a few days.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
