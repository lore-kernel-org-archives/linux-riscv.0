Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1A2C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5wcGGZHI3M4ur4DueUFRTi663U5bPgZ86DvmRfKrtg=; b=whXPU5cDAsJNVPc2jfvvNlO5ak
	KBlGb5Q9+2lQvmqFgOHXqZsgJw5u5Rn/hdfrZ+qwXYWfKHsNifQ/rxCRap3Ulo3V4dYYwCjCrmLAF
	T9EJx1ySlvU9LQFv5MygECPUan3d89apYU1PnBVRxUUnIPn0McuwYzapGvEQHDNJtTi1tgG/rvdzO
	n7XkgaeMkw1lMW+3dpB27q+MMMwuBOFRrKoIIJCFWL2iLX/tqRUtVgd9O9OxsPDZDeCSRkgbgHDXI
	q1hCKU8HhBb2RnBvlEJ3ovW34NYngtouEZ8JgEsRupLFfZVtmaicog3I3rfCONoPcXHkfVYJxz+5q
	g1ePygQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15Qs-009Po8-2n; Tue, 14 Jun 2022 12:14:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15Qp-009PjU-Fa
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 12:14:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o15Q9-0004yC-MR; Tue, 14 Jun 2022 14:13:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o15Q0-000U8f-Kk; Tue, 14 Jun 2022 14:13:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o15Q1-00GFDm-5P; Tue, 14 Jun 2022 14:13:13 +0200
Date: Tue, 14 Jun 2022 14:13:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor.Dooley@microchip.com
Cc: lkp@intel.com, thierry.reding@gmail.com, lee.jones@linaro.org,
	kbuild-all@lists.01.org, Daire.McNamara@microchip.com,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20220614121312.hfotzvx76i4fda6e@pengutronix.de>
References: <20220613111759.1550578-2-conor.dooley@microchip.com>
 <202206141813.qgogbMAN-lkp@intel.com>
 <63334bed-17ba-fed5-9463-9fd52fd57351@microchip.com>
MIME-Version: 1.0
In-Reply-To: <63334bed-17ba-fed5-9463-9fd52fd57351@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_051403_561539_20AEFD38 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: multipart/mixed; boundary="===============6475981992561063913=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6475981992561063913==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cqte3h4y34ec6lw"
Content-Disposition: inline


--2cqte3h4y34ec6lw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 10:34:00AM +0000, Conor.Dooley@microchip.com wrote:
> >     xtensa-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mch=
p_core_pwm_enable.isra.0':
> >>> pwm-microchip-core.c:(.text+0x380): undefined reference to `__udivdi3'
> >     xtensa-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mch=
p_core_pwm_apply':
> >     pwm-microchip-core.c:(.text+0x586): undefined reference to `__udivd=
i3'
>=20
> I assume this is me using functions that are only defined for 64 bit...

This is usually a division with variables > int.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2cqte3h4y34ec6lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKoe1YACgkQwfwUeK3K
7Amj+Qf+Lx8YJijRTh3pxwVyz/2Fng8mmXJyOtwyQc5Ms8eZ4StZTQkQ7uWPbhOi
XLF3+gCNa1zhsNVHcGZN8ZHMXJrQDSY4OIgAnWqeCivbOKBTphBATvTmWeV4JRz0
9Yl6PkbHIWE3Vj7p29Ic3z/7CZ5tsa7Qa63GyFGEee/XnALZO93emZY6ffKq23is
ifZtH2YBki7cO8mZoORQdFuQyaduLLaU5Rp2qlPk0G6ubfxwZAdh7xV8TvT4wlX+
K4sSaLk68hA2w9mHJVJcGkXOxl+g5tn7SsLk56Wds8fr/GWb0GEc8Oz68+MwQ6Uz
ODW+LRCs1U5tThiYfdVNsJe7HN6tuA==
=VeKf
-----END PGP SIGNATURE-----

--2cqte3h4y34ec6lw--


--===============6475981992561063913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6475981992561063913==--

