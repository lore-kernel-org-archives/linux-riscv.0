Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB57C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+zeiOfuCU51BT1fdjojBkDVtBn8IdsjL9+yC2ZFDHc=; b=EVkfOXXODgtSVb
	nWCrNqeHEALFxYIOtl3Q7/o/iKsgrk83AOodNcB798gcJvnxDqUzd9WgiLMkYeYY7/0kLeFrvW1oA
	83mUpVt7uGBi2kiu9q8DSHoE15mi9ulpiVPZbW0zJObsdv4L8u/p0b8NJcCapR2gkXnSHICOj5hN2
	BWwwO2s0d12eUgVbFN0PEk6sFtvGW85aQGPBemFalCU+AyB5Gm+Z23bB2GfKsU+LpTWmotVbe48zM
	6vY4yMWpSJjYwojX1GnNt3FYiKYo8XY+rC/AO6kdj2kogicyRbm87+AsQyPHlMHFzasTTLPsAmVnO
	ijIu+SxXSOQS6hPKgGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpUm-00Coac-6B; Wed, 24 Aug 2022 12:28:32 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpUi-00CoWu-4J
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 12:28:30 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DDAA7240007;
	Wed, 24 Aug 2022 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661344102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGGUxyhpBHYWrYVzpVYQdGXdrmhCjvPEDesF5Cs2Axs=;
	b=JlIoQ9JGsa1FwzhkMDy0kCCChXFGuuAeh82yF3vgbo8DwkCxv5YXEN+fe9G+hpujM4zici
	Z609gtxI83AIA24JVK5ECVEB7PMUnyCde7o6oc4x7jOzIXjcIQbxgXKIrt9D/cKx5Vg7XS
	UbimayZTqMJdVDq7IVqpBwI07gX/6Ib3oM8c1vEuUwvak2FnlIuaD1tWgZLkhcsMEvhdAq
	syWCDe0TvgExJOGUEvO+0kBWw2B1oemIASi6xVKE9wtXGGvO9JeOqft/sToZvxGoB6xdob
	Q5HlL1K1s53l5PpsntTpc98YIBlomrD5XoXQk+CAB51IuSxYvfvQc+6PmbDQ/A==
Date: Wed, 24 Aug 2022 14:28:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Conor.Dooley@microchip.com, Daire.McNamara@microchip.com,
	a.zummo@towertech.it, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Message-ID: <YwYZZWu3gOBIPJeI@mail.local>
References: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
 <f76fb247-5160-61ed-a0a3-037d2f40d2f9@microchip.com>
 <c74a42f7-7d9a-6b52-85b2-d87dacd91be6@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c74a42f7-7d9a-6b52-85b2-d87dacd91be6@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_052828_660020_12A5A3F6 
X-CRM114-Status: GOOD (  47.05  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 24/08/2022 13:27:02+0200, Christophe JAILLET wrote:
> Le 24/08/2022 =E0 11:58, Conor.Dooley@microchip.com a =E9crit=A0:
> > Hey Christope,
> > Thanks for your patch.
> > =

> > On 24/08/2022 09:18, Christophe JAILLET wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
> > > =

> > > The devm_clk_get_enabled() helper:
> > >      - calls devm_clk_get()
> > >      - calls clk_prepare_enable() and registers what is needed in ord=
er to
> > >        call clk_disable_unprepare() when needed, as a managed resourc=
e.
> > > =

> > > This simplifies the code, the error handling paths and avoid the need=
 of
> > > a dedicated function used with devm_add_action_or_reset().
> > > =

> > > That said, mpfs_rtc_init_clk() is the same as devm_clk_get_enabled(),=
 so
> > > use this function directly instead.
> > =

> > Firstly, I think something is missing from the commit description here.
> > devm_clk_get_enabled() is not just a blanket "use this instead of get(),
> > prepare_enable()" & is only intended for cases where the clock would
> > be kept prepared or enabled for the whole lifetime of the driver. I thi=
nk
> > it is worth pointing that out to help people who do not keep up with
> > every helper that is added.
> =

> Ok, I'll update my commit log for other similar patches or should a v2 be
> needed.
> =

> > =

> > I had a bit of a look through the documentation to see if the block wou=
ld
> > keep track of time without the AHB clock enabled, but it does not seem =
to.
> > There is no reason to turn off the clock here (in fact it would seem
> > counter productive to disable it..) so it looks like the shoe fits in t=
hat
> > regard.
> > =

> > However...
> > =

> > > =

> > > This also fixes an (unlikely) unchecked devm_add_action_or_reset() er=
ror.
> > > =

> > > Based on my test with allyesconfig, this reduces the .o size from:
> > >      text    data     bss     dec     hex filename
> > >      5330    2208       0    7538    1d72 drivers/rtc/rtc-mpfs.o
> > > down to:
> > >      5074    2208       0    7282    1c72 drivers/rtc/rtc-mpfs.o
> > > =

> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > devm_clk_get_enabled() is new and is part of 6.0-rc1
> > > ---
> > >    drivers/rtc/rtc-mpfs.c | 19 +------------------
> > >    1 file changed, 1 insertion(+), 18 deletions(-)
> > > =

> > > diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> > > index 944ad1036516..2a479d44f198 100644
> > > --- a/drivers/rtc/rtc-mpfs.c
> > > +++ b/drivers/rtc/rtc-mpfs.c
> > > @@ -193,23 +193,6 @@ static int mpfs_rtc_alarm_irq_enable(struct devi=
ce *dev, unsigned int enabled)
> > >           return 0;
> > >    }
> > > =

> > > -static inline struct clk *mpfs_rtc_init_clk(struct device *dev)
> > > -{
> > > -       struct clk *clk;
> > > -       int ret;
> > > -
> > > -       clk =3D devm_clk_get(dev, "rtc");
> > > -       if (IS_ERR(clk))
> > > -               return clk;
> > > -
> > > -       ret =3D clk_prepare_enable(clk);
> > > -       if (ret)
> > > -               return ERR_PTR(ret);
> > > -
> > > -       devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_=
unprepare, clk);
> > =

> > ... this bit here concerns me a little. I don't think we should be
> > registering a callback here at all - if we power down Linux this is
> > going to end up stopping the RTC isn't it?
> > =

> > I think this is left over from the v1 driver submission that reset
> > the block during probe & should be removed.
> =

> My point is only that what is done must be undone at some point.
> =

> What if an error occurs in the probe after the clk_get("rtc")?
> Is there any point keeping it prepared and enabled?
> =

> =

> There is a .remove function in this driver, so, it looks that it is expec=
ted
> that it can be unloaded.
> =

> So undoing this clk operations via a managed resource looks the correct
> thing to do.
> =

> Just my 2c, you must know this driver and the expected behavior better th=
an
> me.
> =


BTW, I thought you actually tested your changes on the other patch I
took, not that you were doing a blanket conversion of the subsystem.
This is the kind of info that must appear in the commit log. I would
definitively not have taken the patch.


-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
