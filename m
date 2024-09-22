Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D027CF9C64
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Sep 2024 16:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAB1UckmL60AQjBVCp/iinjqlIVsFAlQwPGFm4s6aoY=; b=LVw8HRz0IhAXqg
	vys1pmIz5dSZJxi/Rnag7oiwqPuOgSv+a7AwmSEAr9jboWnsaYd6UPeMixxgpJrJvHrcJ0kQMp/Ug
	jfbir7Qzm4CDvGOXiR5XLU21xjUXKBcs5+OmfHEIUOw36nfvdc3P37PR7K+806ZEVJAHHOxte6uh9
	OjwcXglsapftgtanl4vXGXqqRFduC9B0Ew0N17gqoQN32f8YxSeeru9rI5UgajNZ4OedPXQHeh3Z/
	YIgj6dnxrXEu3lIFDK8CoHOU8riwWjCipQq6Q0kZVouhJ+K46lemJRD1WYm6mbIM1L0weG6HoWtXF
	mJEWYFgL2jbUxdpHeNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssPXS-0000000FQdS-3Us5;
	Sun, 22 Sep 2024 16:34:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssPXQ-0000000FQd0-0jjt
	for linux-riscv@lists.infradead.org;
	Sun, 22 Sep 2024 16:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xGmipcPUvSFvCq++6VT9S82wVCnPIsh0kZdD2tTzbJM=; b=jm9nwVxcMCmtyeT6Oyx1bwlk5b
	QIt2JFKDn8FmrZFoi10orj33aeO2dLGY8ksjWgFZyWxgHm2j5wid8ZzC7QJ6anDx2t82kwpN088uc
	UjC91LJRO9zSM2MqYEf+s8dMNGJvEaYn9PgvYMghtzhOHXHeEou9YBad//2eQ5BdVrek=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ssPX3-0084MO-6x; Sun, 22 Sep 2024 18:33:57 +0200
Date: Sun, 22 Sep 2024 18:33:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
Message-ID: <cf17f15b-cbd7-4692-b3b2-065e549cb21e@lunn.ch>
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922145151.130999-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_093420_237609_0F0B61DD 
X-CRM114-Status: GOOD (  15.33  )
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

> +static inline u32 ccan_read_reg(const struct ccan_priv *priv, u8 reg)
> +{
> +	return ioread32(priv->reg_base + reg);
> +}
> +
> +static inline void ccan_write_reg(const struct ccan_priv *priv, u8 reg, u32 value)
> +{
> +	iowrite32(value, priv->reg_base + reg);
> +}

No inline functions in .c files please. Let the compiler decide.

> +static inline u8 ccan_read_reg_8bit(const struct ccan_priv *priv,
> +				    enum ccan_reg reg)
> +{
> +	u8 reg_down;
> +	union val {
> +		u8 val_8[4];
> +		u32 val_32;
> +	} val;
> +
> +	reg_down = ALIGN_DOWN(reg, 4);
> +	val.val_32 = ccan_read_reg(priv, reg_down);
> +	return val.val_8[reg - reg_down];

There is an ioread8(). Is it invalid to do a byte read for this
hardware? If so, it is probably worth a comment.

> +static int ccan_bittime_configuration(struct net_device *ndev)
> +{
> +	struct ccan_priv *priv = netdev_priv(ndev);
> +	struct can_bittiming *bt = &priv->can.bittiming;
> +	struct can_bittiming *dbt = &priv->can.data_bittiming;
> +	u32 bittiming, data_bittiming;
> +	u8 reset_test;
> +
> +	reset_test = ccan_read_reg_8bit(priv, CCAN_CFG_STAT);
> +
> +	if (!(reset_test & CCAN_RST_MASK)) {
> +		netdev_alert(ndev, "Not in reset mode, cannot set bit timing\n");
> +		return -EPERM;
> +	}


You don't see nedev_alert() used very often. If this is fatal then
netdev_err().

Also, EPERM? man 3 errno say:

       EPERM           Operation not permitted (POSIX.1-2001).

Why is this a permission issue?

> +static void ccan_tx_interrupt(struct net_device *ndev, u8 isr)
> +{
> +	struct ccan_priv *priv = netdev_priv(ndev);
> +
> +	/* wait till transmission of the PTB or STB finished */
> +	while (isr & (CCAN_TPIF_MASK | CCAN_TSIF_MASK)) {
> +		if (isr & CCAN_TPIF_MASK)
> +			ccan_reg_set_bits(priv, CCAN_RTIF, CCAN_TPIF_MASK);
> +
> +		if (isr & CCAN_TSIF_MASK)
> +			ccan_reg_set_bits(priv, CCAN_RTIF, CCAN_TSIF_MASK);
> +
> +		isr = ccan_read_reg_8bit(priv, CCAN_RTIF);
> +	}

Potentially endless loops like this are a bad idea. If the firmware
crashes, you are never getting out of here. Please use one of the
macros from iopoll.h

> +static irqreturn_t ccan_interrupt(int irq, void *dev_id)
> +{
> +	struct net_device *ndev = (struct net_device *)dev_id;

dev_id is a void *, so you don't need the cast.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
