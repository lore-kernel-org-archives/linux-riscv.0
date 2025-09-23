Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF705CAC5AA
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 00:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2qeyYnseBDYK4Cv5Rni65DZrkrAeyjvT7zkLe6uUU8=; b=2U4gX6OffnfvFE
	qW2PCQZvpqpvi6wBYg55QPa53x20EMOe0Hq8/rbeDqQqHuCLhPtYRvs5t8kcsbEmWo7bfG37jazE9
	ygwtWvTqR3U9c7ZsYiE7yWTXYcJ11j5GUPgFYqsabL6aF/0LbYZHyrsxrE19GU5puj4xoXZmGqD0L
	6Q7jGseGnj8hFudY+/Lk6TTnVON5Zk7uMhQyT/YK9DZdEjEfhGgOQxYoj1OgAhAl2oArHFEY3Rk+2
	Jeb6ZTk8JVatittPUBmjjNQ1HEbnVv70cCnXWr5D6e0zIWcF8FrR+7TKlNbngwgSsI467fgIlOeb4
	GZPCxLadZS/LwG+nBnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rAG-0000000BvcY-2L77;
	Tue, 23 Sep 2025 00:45:52 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rA9-0000000BvZq-0QwZ
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 00:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758588284;
	bh=WsrPFKT04JwF/+NN0X0jvo2IhQv1F3c1l7SfYl9HJAQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ggG6wci5flHFgvVvYbgZkYiHC2XKJYl9Wrf3J0/DbKDe3Toa/aV+2E5KxyrYf0zuO
	 VrxoNl7jHQh363U1s01vvZ7m13hOIcnRTLnnY8vAMuD0ObgkISN6f59m3jgGYLs8+5
	 g3F9jRC/4OFNrD2oDY3s+TeJn3Y/dFz1XQ65xMjU=
X-QQ-mid: esmtpsz16t1758588276tf8687cc5
X-QQ-Originating-IP: Fi93deYHvDT9F2DLXXCFuKniautpASWuu4Wvavpt5nA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 08:44:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3523208988026414668
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 08:44:34 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/6] i2c: spacemit: remove stop function to avoid bus
 error
Message-ID: <B8E4D8DD9B16E81B+aNHtcoS_a4sGChZ7@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-2-e59bea02d680@linux.spacemit.com>
 <aNG33WyGENMWI3Wl@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNG33WyGENMWI3Wl@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MBoHLcWngaPNeg4qUvPHAc3DnZnF12hMCOQ96OqtUywXlIhZ4A+K6hbB
	HhawCKZLDeDmDp9DFU/dAuAbvyKHCgPLIK0AnIwcg2bDhvngq8h24czjco74QyCh+NF/ISw
	yGlgOuw0Nd+Fc2dRHJJOJqHm7Jik0D4hKE9PxKs7xuNbQAq4q4TI0rGvDCSohECewUQOL2a
	+t1vDZ6+X4BTXvUPqw9iAcDe5howEOVMtR1JAJgisKIv72QNK3ku59TljUMRlzc+LciW+rG
	TYIyzm1703DPwwe88xkCQUgU2Yb5crc89wR56jlKLW79WifJqHal48MZeCD32IMHewdTvbj
	VzE98VFlsl7KiE2GJ7Zeo3mqYiJdgN1bk0xsGl8Zwn+wOIg1kGHi+TYEFO2O+syuvyQ0owE
	l1WRCp2IYwvI9wOYpD8PIWzDYuL6zjt7u7XafHIxDjZp2BZux8iQ1eDbjcyHNBi85Esm3FV
	/0gz3pnk3QU0s1RZ2z+Xb4EYmr84qszTrHPk7rEPZJYVYq0kCr1gWHqOQjeDoLjorQOgvOs
	kS1PM2wojBSISS1WPPOJ/6HE246HaDkYuJJXiI18EZbQly0SLta65B80kWAk85/ydclhPjr
	flDDK3IH+22tq4ISDV2MmvdF6qGIAUgiH394btU0TSIuW0BLO6pzrn6hg2Jr1mWMc+L1aAi
	pNGrw54DKl8lvHyTPlXG9dQ0+CQorUwhmAm21qBTMx+jPhbN9C2WTg/n5H44A4NsVkUqzUb
	I2sWHCuP6xYiiMJPdCOGg4KftMaMVM+6seMAIsz/59b+q2p50t0LauGiIeO9zK0z9dyb/3f
	61uOmKoorKAB2j+IeCgKWuEP57+F3K6SgYBXCmmS+wis9QihXqSjZYvJNhwlY+su6mjdAfp
	qlK6bjaf9I/plipNXppXalyF95Z9eFKzDEGnvPec4ZbDCpqJ/tg/ZHXtuRUIytzfHXpeH3A
	+lT0iM33eVuhvZ6BIYGsOntAvl4dUt19Rv7dlyZaChMQJwraU3naaO1CFT+bCO87JWcUVsV
	0L2ZR6b56t6yCTINum2IlAM//upgQUydVqZCvBbTMYVk+iZvoiysteGurf5DI=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_174546_093710_20E4A451 
X-CRM114-Status: GOOD (  22.11  )
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

On Mon, Sep 22, 2025 at 10:55:57PM +0200, Aurelien Jarno wrote:
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > Previously, STOP handling was split into two separate steps:
> >   1) clear TB/STOP/START/ACK bits
> >   2) issue STOP by calling spacemit_i2c_stop()
> > 
> > This left a small window where the control register was updated
> > twice, which can confuse the controller. While this race has not
> > been observed with interrupt-driven transfers, it reliably causes
> > bus errors in PIO mode.
> > 
> > Inline the STOP sequence into the IRQ handler and ensure that
> > control register bits are updated atomically in a single writel().
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 28 +++++++++-------------------
> >  1 file changed, 9 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index ee08811f4087c8e709d25dd314854ed643cc5a47..d342752030d077953adf84a2886211de96e843c4 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -429,14 +415,18 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> >  	}
> >  
> >  	if (i2c->state != SPACEMIT_STATE_IDLE) {
> > +		val |= SPACEMIT_CR_TB;
> > +		if (i2c->is_pio)
> > +			val |= SPACEMIT_CR_ALDIE;
> > +
> 
> This needs to be moved to the last patch introducing PIO support.
Nice catch!
I'll fix it and send v2 today.
> 
> >  		if (spacemit_i2c_is_last_msg(i2c)) {
> >  			/* trigger next byte with stop */
> > -			spacemit_i2c_stop(i2c);
> > -		} else {
> > -			/* trigger next byte */
> > -			val |= SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
> > -			writel(val, i2c->base + SPACEMIT_ICR);
> > +			val |= SPACEMIT_CR_STOP;
> > +
> > +			if (i2c->read)
> > +				val |= SPACEMIT_CR_ACKNAK;
> >  		}
> > +		writel(val, i2c->base + SPACEMIT_ICR);
> >  	}
> >  
> >  err_out:
> 
> Otherwise sounds good.
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
