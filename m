Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D626E81A3B
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKf0gCLuNoaSDLSFFL2nvRZftWVn0FjvP7Bfzji8u+g=; b=pgvWjAWC7jpLCz
	Bjd4UsAtGMhPLVB9zX1KPr8WAUdn4pHCnN9vMtWjS4MQB4asb2dGdEeEToCy+LoW7PyF8AHwKtfYf
	hXdQlsBzdgKW/QKzfX4w7IzbXT0cAobzvkMovZMcQDRfVglvC3vAjiUufoPaWLFzJJCU8gyn/TIx2
	6K1hRhgwm3uV3YHLZHaftTMHPA3slF3aQJA0Wof0gc1eaVfFgbh5uc/x5fg+sHvBrZFJwpUaUp0JC
	0BDZlYqpOGdPBEyJio2UklCAbemPX1nEbSrQ9FtYkXY4lpYa8bHzKk97N1FOXfxOjJxf9Z+cMQmIK
	6g6A1aQTFLVfbVVqwdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0YC-00000006tzk-3evm;
	Mon, 16 Feb 2026 15:30:16 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0Y9-00000006tyd-2jNy;
	Mon, 16 Feb 2026 15:30:15 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 25219342558;
	Mon, 16 Feb 2026 15:30:05 +0000 (UTC)
Date: Mon, 16 Feb 2026 23:29:54 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: k1-usb: add disconnect function support
Message-ID: <20260216152954-GYA183788@gentoo.org>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-2-6ed31e031ab4@kernel.org>
 <20260216090112.n5jjpui3luqsybb5@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216090112.n5jjpui3luqsybb5@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_073013_722656_EFB208ED 
X-CRM114-Status: GOOD (  23.84  )
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

On 11:01 Mon 16 Feb     , Vladimir Oltean wrote:
> Hello Yixun,
> 
> On Sat, Feb 14, 2026 at 08:29:15PM +0800, Yixun Lan wrote:
> > A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> > it will fail to work properly during next connection when devices
> > connect to roothub directly.
> > 
> > Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> > index 342061380012..959bf79c7a72 100644
> > --- a/drivers/phy/spacemit/phy-k1-usb2.c
> > +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> > @@ -48,6 +48,9 @@
> >  #define  PHY_CLK_HSTXP_EN		BIT(3)		/* clock hstxp enable */
> >  #define  PHY_HSTXP_MODE			BIT(4)		/* 0: force en_txp to be 1; 1: no force */
> >  
> > +#define PHY_K1_HS_HOST_DISC		0x40
> > +#define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
> > +
> >  #define PHY_PLL_DIV_CFG			0x98
> >  #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
> >  #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> > @@ -142,9 +145,20 @@ static int spacemit_usb2phy_exit(struct phy *phy)
> >  	return 0;
> >  }
> >  
> > +static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> > +{
> > +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> > +
> > +	regmap_update_bits(sphy->regmap_base, PHY_K1_HS_HOST_DISC,
> > +					   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);
> 
> Please align function arguments to the open parenthesis.
> 
Ok

> Since we are in the merge window, it is likely that new features will
> not be picked up at this stage.
> 
Sure, no problem and I expect this is normal..

> But this seems to be a fix for existing SpacemiT K1 support, currently
> in the linux-phy/next branch. The linux-phy pull request hasn't been
> sent yet, so if you can resend just this patch and we can get an ACK for
> it in time, perhaps it can be included for v7.0.
> 
Ok, done
http://lore.kernel.org/r/20260216152653.25244-1-dlan@kernel.org

> The K3 support should be resent after the merge window.
> 
will do once new -rc1 is tagged

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
