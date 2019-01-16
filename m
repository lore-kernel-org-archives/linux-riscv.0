Return-Path: <SRS0=8WcR=PY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7410CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 17:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42FC220578
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 17:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uDrJoOqQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IwHR6ITw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42FC220578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5sxAppLhFqwvs01j47yM+LsvtYpI8Tgvk7Ezsz0yWmA=; b=uDrJoOqQncTwtUr2FilRGWvrB
	zKg2TQOFRYZemGo/dy26pvgi2T/08BCugOMvo5zvff6Zs2i5j+FiMmI+8mdhmYlpcDEPGtTwvGAh4
	oRoYMbQ5IzdXbWcbLc9wR8MRBrZ6QZG5ScDMW8ovb0xZotz+qTQb39rkLOdWBkH4Oma9Q9suW3cq9
	Qwb+tzZ1Yd2LPVyw/iTbm7n05fWx8k9JMpDWIMezJ5robxWaJJs4/h7JEHF6hL5BKle6Ml0nCEXyX
	MObPKYpFt1uSdyp90vF2fehnTsEpPV+KSsIR8R8kawxTl0vjOZFAX4FQCDGpZF0uvfWBss3ImskzT
	sY6Ljalxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjoq3-0003rk-T9; Wed, 16 Jan 2019 17:18:51 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjoq0-0003rB-S2
 for linux-riscv@lists.infradead.org; Wed, 16 Jan 2019 17:18:50 +0000
Received: by mail-pl1-x641.google.com with SMTP id 101so3307405pld.6
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jan 2019 09:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ZTiHF3dL+2srsmvssgd9ObZTL3s29JwNyOk6wAQF10Y=;
 b=IwHR6ITwxyt3b2CWTgmNjHANS4gmQledAxOXiMHswCHz/xLfPVxbU8BBevwVaAfpdx
 2iAOsl6omCigjzyzO9eKUtexe7lhU/Q7jZd0LWapEgsaGEQryfV2u7VmwBcgKlsYoWcp
 bMOVuF6rlAZNKp5vzPcafNDiILF7H6ehsrhv5cdS98NzLslHpclX4oeCZHZJdQgL0hpp
 DSOvvQHdShbMwk+X9meaONPOoRsDq7NjV7DIdgdybuPdpq6yeXEWmHYZbF9X2vDtBuo3
 2P3AROnEeI2gkl014SZgWzeeIPt0Dfdc4DhWqK5XxntQnHU4+uJ443WK43MXOA8RGCtm
 dE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ZTiHF3dL+2srsmvssgd9ObZTL3s29JwNyOk6wAQF10Y=;
 b=Kju+zYBf2vfyB+e//OLS+q3dHOgL6GOxKWA4iI3qx9IdsjkRhBwP/iPEY1lOJFNqxi
 ecd7v/wZclWRr61ZsQxcZuFzgRxyIkQgryJAKdzydtpP+QxuIxHFr386FV2qN2l3OAyi
 sCwmO5CwIQzPLyIzZ67VurEPe7i8es8DIJWnae1e5DCaeSbiimbdvXPGSdrhCm68WDZD
 hMLpd2ziRuFwt28s5ObSBMPMdT/10PxlqPBDg8AKiqKr+vobYkHuumftBeJLbh2Up0wC
 Q6a03fU/oTKV6JkP2PQbsLK7nD+iAgy5uEEilXrTUs/4/paoY+Rqqn7btpNrNBfXW4wj
 Kk3A==
X-Gm-Message-State: AJcUukdcya1WNgbiC7cibdIfRsCvdoolcIyrrcqdL4vYsXpXNIzQeNGK
 x/25QwBZ27r3E7jkleS5z10XXQ==
X-Google-Smtp-Source: ALg8bN75ZlXgeuf3XWu6SSZjOj9NOU9HLQ37HC38cXDiHArS8zTJukwiUl2PXmBP/rZaDiLrUFlACg==
X-Received: by 2002:a17:902:925:: with SMTP id
 34mr10638623plm.14.1547659127552; 
 Wed, 16 Jan 2019 09:18:47 -0800 (PST)
Received: from localhost ([2607:f598:b382:d300::14ef])
 by smtp.gmail.com with ESMTPSA id q199sm12601950pfc.97.2019.01.16.09.18.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 09:18:46 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Wed, 16 Jan 2019 09:18:45 -0800 (PST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
In-Reply-To: <20190116164640.mi3zjbhbhc6k5v7p@pengutronix.de>
Message-ID: <alpine.DEB.2.21.9999.1901160909540.19681@viisi.sifive.com>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
 <20190115220046.etgbno6ymsux75dk@pengutronix.de>
 <CAJ2_jOEuU_=bpbVmdsq7FFEKEm_wHza-h7Hu8QmZ3BgsGgi-ng@mail.gmail.com>
 <20190116164640.mi3zjbhbhc6k5v7p@pengutronix.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-800223328-1547659125=:19681"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_091849_032290_A57B0C60 
X-CRM114-Status: GOOD (  18.20  )
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
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Yash Shah <yash.shah@sifive.com>, Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-800223328-1547659125=:19681
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 16 Jan 2019, Uwe Kleine-K=F6nig wrote:

> On Wed, Jan 16, 2019 at 04:40:42PM +0530, Yash Shah wrote:
> > On Wed, Jan 16, 2019 at 3:30 AM Uwe Kleine-K=F6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Fri, Jan 11, 2019 at 01:52:44PM +0530, Yash Shah wrote:
> > > > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > > > index a8f47df..3bcaf6a 100644
> > > > --- a/drivers/pwm/Kconfig
> > > > +++ b/drivers/pwm/Kconfig
> > > > @@ -380,6 +380,16 @@ config PWM_SAMSUNG
> > > >         To compile this driver as a module, choose M here: the modu=
le
> > > >         will be called pwm-samsung.
> > > >
> > > > +config PWM_SIFIVE
> > > > +     tristate "SiFive PWM support"
> > > > +     depends on OF
> > > > +     depends on COMMON_CLK
> > >
> > > I'd say add:
> > >
> > >         depends on MACH_SIFIVE || COMPILE_TEST
> > >
> > > (I guess "MACH_SIFIVE" is wrong, but I assume you get what I mean.)
> >=20
> > As of now, MACH_SIFIVE/ARCH_SIFIVE isn't available.
> > @Paul, Do you have any comments on this?
>=20
> If this is not going to be available at least protect it by
>=20
> =09depends RISCV || COMPILE_TEST

There's nothing RISC-V or SiFive SoC-specific about this driver or IP=20
block.  The HDL for this IP block is open-source and posted on Github. =20
The IP block and driver would work unchanged on an ARM or MIPS SoC, and in=
=20
fact, SiFive does design ARM-based SoCs as well.  Likewise, any other SoC=
=20
vendor could take the HDL for this IP block from the git tree and=20
implement it on their own SoC.

More generally: it's a basic principle of Linux device drivers that they=20
should be buildable for any architecture.  The idea here is to prevent=20
developers from burying architecture or SoC-specific hacks into the=20
driver.  So there shouldn't be any architecture or SoC-specific code in=20
any device driver, unless it's abstracted in some way - ideally through a=
=20
common framework.

So from this point of view, neither "depends MACH_SIFIVE" nor "depends=20
RISCV" would be appropriate.  Similarly, the equivalents for other=20
architectures (e.g. "ARCH_ARM") or SoC manufacturers (e.g.,=20
"MACH_SAMSUNG") wouldn't be appropriate for any generic IP block device=20
driver like this one.


- Paul
--8323329-800223328-1547659125=:19681
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-800223328-1547659125=:19681--

