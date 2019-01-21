Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897A9FA372D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 11:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5957620663
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 11:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sw1XCP/p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVJ9IxM4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5957620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=teOyhhMj7Al8oQGX051X4WmWSALI3mKllyLiHFL2ZVc=; b=sw1XCP/pflxEDjewQC8HnOU0x
	B4ssABDngdLpqG+LW/ORbck8PScfIQCSFhsDEZO1xZby0FqMcMkEXMRc3Qid+3BuQJFP4gJFnjINg
	YHFSd7A3ygHdhcTZMznn3DlFCx2zODIqAK+ysI3xUue613y6QVIv5pYvRZ48t3iYOTE/cwMU+ZiqZ
	dHm5bObDx8z7Lp57vwEJk7gooivhVq/A1egZ1mcvNeuXzrqacwmOmLMmkxwmJtq6MnhDP8CII07Kq
	q3MirVoIwkYCi0gbII7syzZTfSuCVblOcYhZ6Ws/8HtfFTEFyNz/DqXglMd5v8xXTeHCL95JtAv8q
	+yaPcYMow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glXmx-00087j-64; Mon, 21 Jan 2019 11:30:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glXmt-00086m-Th
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 11:30:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id t27so22898542wra.6
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jan 2019 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mnTU2JyyziVhsFT/PUFFS0Dhiz+5OeVNk8iNBBaCWsA=;
 b=TVJ9IxM4egmGw/+ghHvZRmEQkAy1gS+CSuu5W0S1gEewV4DeIIKOMmI/ydOFiC4Ngj
 dOehenZMmJpym4OlGmSGiFJrYt/9BK82Xkb/Wdp2oPvOruQ1ujnmQYES/0Y+bBeTnTtg
 2sTACTaW2VtYDZDoBOI+Uw16VBRL85rkdNg/0qU/XQ97bORw9NH82pfuum4aL13oKWL5
 87/FsnEdnBwL2QNdcwj1rv1VvBCiNhanpyrpoXwkImlFKvDZDPLKm1FLWY4LF7GiVlgQ
 obLWUjO1BL70rjB9Pvs1EbB7JYVG0hEdl45c46FWN3tuwAtRL6SsjiHj1HTgM7eMu5qn
 9X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mnTU2JyyziVhsFT/PUFFS0Dhiz+5OeVNk8iNBBaCWsA=;
 b=k/ORFa1QmSZq1tMqKSQYz9vXGefk0p4oZKW0Vr+5eYRmM8xWtFJlDwrEhq55NzIKh8
 LWb8s07PrW5mhL+8wq+9nUQ+vbtXw3HvUOJh/XoFTOeAsyPtQyFlfLVBZ+H+GS1T0Mr4
 y96+uw98iA4vUhSWD1s6RRoLmz1zDSKGLJLefuQH3H3K1FxsRscQ+ReT7Y9Sx8Zy42Tw
 n3XbD4dswOC2UpOJChyJItLihxvPHqvTLvAZMYcRLSs4dvFFUIRTsQurhMRiepfEfDUQ
 dOLj3QUmvn5K54Zuzly79Jq6Jg9KLrF0kf3CMfr0ffeHnwqTBkDcnj4YDfEFA0AQftJw
 9dVQ==
X-Gm-Message-State: AJcUukfzhevoW0GDTOol8nAcbrYAnh0m8/QvPOUXhpfb1HypEEUEpq7m
 Tx4kAPjhWLF2G2PiAQGH2TM/DV9E+VU=
X-Google-Smtp-Source: ALg8bN7qlbRepS1CrYVIP8szHJ8UxXlCcXeDjtZpm0H8yhM7shfVRWRKVyVBah27d2nyE9FHibaABQ==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr29201871wrt.241.1548070241927; 
 Mon, 21 Jan 2019 03:30:41 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
 by smtp.gmail.com with ESMTPSA id v133sm40079446wmf.19.2019.01.21.03.30.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jan 2019 03:30:41 -0800 (PST)
Date: Mon, 21 Jan 2019 12:30:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190121113039.GI16756@ulmo>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
 <20190115220046.etgbno6ymsux75dk@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190115220046.etgbno6ymsux75dk@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_033043_982036_2DBE1928 
X-CRM114-Status: GOOD (  26.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============9152701985779224540=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9152701985779224540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Content-Disposition: inline


--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2019 at 11:00:46PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Fri, Jan 11, 2019 at 01:52:44PM +0530, Yash Shah wrote:
> > Adds a PWM driver for PWM chip present in SiFive's HiFive Unleashed SoC.
> >=20
> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > [Atish: Various fixes and code cleanup]
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  drivers/pwm/Kconfig      |  10 ++
> >  drivers/pwm/Makefile     |   1 +
> >  drivers/pwm/pwm-sifive.c | 246 +++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 257 insertions(+)
> >  create mode 100644 drivers/pwm/pwm-sifive.c
> >=20
> > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > index a8f47df..3bcaf6a 100644
> > --- a/drivers/pwm/Kconfig
> > +++ b/drivers/pwm/Kconfig
> > @@ -380,6 +380,16 @@ config PWM_SAMSUNG
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called pwm-samsung.
> > =20
> > +config PWM_SIFIVE
> > +	tristate "SiFive PWM support"
> > +	depends on OF
> > +	depends on COMMON_CLK
>=20
> I'd say add:
>=20
> 	depends on MACH_SIFIVE || COMPILE_TEST
>=20
> (I guess "MACH_SIFIVE" is wrong, but I assume you get what I mean.)
>=20
> > +	help
> > +	  Generic PWM framework driver for SiFive SoCs.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called pwm-sifive.
> > +
> >  config PWM_SPEAR
> >  	tristate "STMicroelectronics SPEAr PWM support"
> >  	depends on PLAT_SPEAR
> > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> > index 9c676a0..30089ca 100644
> > --- a/drivers/pwm/Makefile
> > +++ b/drivers/pwm/Makefile
> > @@ -37,6 +37,7 @@ obj-$(CONFIG_PWM_RCAR)		+=3D pwm-rcar.o
> >  obj-$(CONFIG_PWM_RENESAS_TPU)	+=3D pwm-renesas-tpu.o
> >  obj-$(CONFIG_PWM_ROCKCHIP)	+=3D pwm-rockchip.o
> >  obj-$(CONFIG_PWM_SAMSUNG)	+=3D pwm-samsung.o
> > +obj-$(CONFIG_PWM_SIFIVE)	+=3D pwm-sifive.o
> >  obj-$(CONFIG_PWM_SPEAR)		+=3D pwm-spear.o
> >  obj-$(CONFIG_PWM_STI)		+=3D pwm-sti.o
> >  obj-$(CONFIG_PWM_STM32)		+=3D pwm-stm32.o
> > diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> > new file mode 100644
> > index 0000000..7fee809
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-sifive.c
> > @@ -0,0 +1,246 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2017-2018 SiFive
> > + * For SiFive's PWM IP block documentation please refer Chapter 14 of
> > + * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
>=20
> I wonder if such an instance should be only a single PWM instead of
> four. Then you were more flexible with the period lengths (using
> pwmcfg.pwmzerocmp) and could do stuff like inverted and uninverted mode.

I thought this IP only allowed a single period for all PWM channels in
the IP. If so, splitting this into four different devices is going to
complicate things because you'd have to coordinate between all four as
to which period is currently set.

> > +struct sifive_pwm_device {
> > +	struct pwm_chip	chip;
> > +	struct notifier_block notifier;
> > +	struct clk *clk;
> > +	void __iomem *regs;
> > +	unsigned int approx_period;
> > +	unsigned int real_period;
> > +};
>=20
> I'd call this pwm_sifive_ddata. The prefix because the driver is called
> pwm-sifive and ddata because this is driver data and not a device.

I don't think there's a need to have an extra suffix. Just call this
sifive_pwm or pwm_sifive. There's no ambiguity in that name and it's
short and crisp.

> > +	if (state->enabled)
> > +		sifive_pwm_get_state(chip, dev, state);
>=20
> @Thierry: Should we bless this correction of state?

I'm not sure I understand why this correction is necessary. Is it okay
to request a state to be applied and when we're not able to set that
state we just set anything as close as possible? Sounds a bit risky to
me. What if somebody wants to use this in a case where precision
matters?

Now, if you're saying that there can't be such cases and we should
support this, then why restrict the state correction to when the PWM is
enabled? What's wrong with correcting it in either case?

Thierry

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxFrVwACgkQ3SOs138+
s6GDPhAAqq3K+XU1yZmkcnkI1Zx0WumCOVIx3+P1YxoZRny1aaps0RIVvR3FIoFv
1I0P/4cuDQ1nUHh8ejdmqE/0uT/+bpxxWg3srsjaKkaSM3TutdX4EPk929EP91oJ
QIXFTxGm3FBeKbd5wdgqC5zLhC3hDowCpH+vyOB+YiW9bn2EBOQwnCwkeRpOAIVG
q2Er9KwCuKd1wIT+jCvprKOCnwui7ycZ2ycLbxRiBNMwcRBUfSMy6J6dZ0CJKMdD
uoSS1XWSOmLymi1g5Ibdii+VGxhXssfR9+YKvgdqJ0kkNqUZ8zrbHinNn0zuPSZH
SJSNZ0QCAOkvgPFTwFR/QV0DnBu/i8pgybpPawLkwA10QAIe4D5vheHI9YgvTxE3
9GNuFbUR1r52guNBF00ht3Wvxzu8WaoYwIOMhIDUrQJ4QA8c8eq+1GIJwXhvnzOH
xW93VlukNv+TmgzE60/9a6JgelKFUw0Iu+yYWs7kFq4WAgPiz9E5TiwoitZq4j5/
81HxqupXIT1jqI0W3JI6ZdVFk6gYEKts2CLIJKu9IIll59T3R8bS+dRdzp3Zm+JY
xO3+m7Kt97Nnz+e0SakZ64dnQF50QR+hv+Pd5jNPiLFfeU9sVpULG03tph0vg/0Q
Qn472hhDUD0VP1zBZxBl8DX0H/yOMaqnKHYyzIKN+JwOrJ/HH3A=
=aoyh
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--


--===============9152701985779224540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9152701985779224540==--

