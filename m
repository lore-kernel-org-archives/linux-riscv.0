Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E90CF9C69
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 12:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWtIpvinfzKrv6VNvNslEGLc26SWHEGdD/hea1g7XEo=; b=5C5mi/VztNqJtU
	GI6QLFGlJlgPHeVfPd0gUBGHFr/AL9umLI/y1N2MqASU+RIwgqp+NrG/qfcd22NbwC5wrXqpEFoHo
	y36ti76tCnSN9qL2sUoNBSlBEP1QJYwexntAXbQhjmiP6cUnpk8Xi0I2dRsJj4NUpopYYzwvLtlKa
	dUNT8jWbveZfvBw7bshLIL9QHq+NcOki6kxGfDVl/z4ZYeuzBS2Fyoi8NiTXV4OPy5SlhGWHCK0i5
	oCVYS4GOt3G8R4j8gb2fYPWMLyrBh0S482u/UoPBoiKpmwb5tBom21bXDLmT86e1zb1dK2tvzo5kA
	3rsBwrJoBKDa9W4HMrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sshw5-0000000H9Xh-1jdt;
	Mon, 23 Sep 2024 12:13:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sshw1-0000000H9XD-3jVL
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 12:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Eq1Kj2dvKOSMfRsPuAE8w645hcxyoP4nvyUZ3L3dadU=; b=szWKbCKcaTKaRdtijfzBwrt+0g
	nzZYalFp99LmsUhBcVHcE368+GrOSM7Pu5kpVlK+LttedoxNLPMLv6udFAkPD0vOqhNNhTJ+Y2qN+
	oRfGZE5NsaLP2yGEZgxOHEEXuABvcyN2CVi3lqJiKW1O78IAiz3wmyYYCkw102QSS6PA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sshvj-0087dk-SM; Mon, 23 Sep 2024 14:12:39 +0200
Date: Mon, 23 Sep 2024 14:12:39 +0200
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
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
Message-ID: <9cf40a68-a07f-46d5-bc2c-302ae0e99ab0@lunn.ch>
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-4-hal.feng@starfivetech.com>
 <cf17f15b-cbd7-4692-b3b2-065e549cb21e@lunn.ch>
 <ZQ2PR01MB13071A093EB33F48340F753EE66F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQ2PR01MB13071A093EB33F48340F753EE66F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_051257_950828_3A95629D 
X-CRM114-Status: GOOD (  17.79  )
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

> > > +	reset_test = ccan_read_reg_8bit(priv, CCAN_CFG_STAT);
> > > +
> > > +	if (!(reset_test & CCAN_RST_MASK)) {
> > > +		netdev_alert(ndev, "Not in reset mode, cannot set bit
> > timing\n");
> > > +		return -EPERM;
> > > +	}
> > 
> > 
> > You don't see nedev_alert() used very often. If this is fatal then netdev_err().
> > 
> > Also, EPERM? man 3 errno say:
> > 
> >        EPERM           Operation not permitted (POSIX.1-2001).
> > 
> > Why is this a permission issue?
> 
> Will use netdev_err() and return -EWOULDBLOCK instead.

I'm not sure that is any better.

       EAGAIN          Resource  temporarily unavailable (may be the same value
                       as EWOULDBLOCK) (POSIX.1-2001).

This is generally used when the kernel expects user space to try a
system call again, and it might then work. Is that what you expect
here?

> > > +static irqreturn_t ccan_interrupt(int irq, void *dev_id) {
> > > +	struct net_device *ndev = (struct net_device *)dev_id;
> > 
> > dev_id is a void *, so you don't need the cast.
> 
> OK, drop it.

Please look at the whole patch. There might be other instances where a
void * is used with a cast, which can be removed. This was just the
first i spotted.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
