Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84FAC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+MnDL1G/TEC0HSqgScfZY8dfk2mewuJ3E/ATxi1G2E=; b=Mmjoenkd/oE2gSqenRZbONE8iB
	I3XLLf60kIsTienyYfzaSmUlNtw+S0vdMjkGgHDl+/LiPdQgsrMKlUg4HAKm0SY0ytXLCUow2Vl0Y
	+ntHkMcX6/kpZbX82D6tucATFXDvAcDFjq0LS049xuLV4H9k4BRIkIEf06pgLwDAulR0sskjLfeBW
	0Ko4rvV3zeujw36Xdjdjrc3qdrZvCEPjO3yNdnm1RaC2lE8DYKUPV0NOxuvpHR9ajMVNVfzKsRz+V
	irXNySlRfrFLtrnVAZcs0t2D8h9kBRPicnVvZnAbzCUBXNd0g+l7gpsU8z/1zvAk9M7QRxJunlU0b
	5ehil3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mpn-000SwG-Dp; Mon, 27 Jun 2022 11:23:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mpk-000Srz-G8
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 11:23:13 +0000
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1o5mpc-0008NY-20; Mon, 27 Jun 2022 13:23:04 +0200
Received: from pengutronix.de (p200300ea0f22910007affeaf77f41373.dip0.t-ipconnect.de [IPv6:2003:ea:f22:9100:7af:feaf:77f4:1373])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 855B4A0269;
	Mon, 27 Jun 2022 11:23:01 +0000 (UTC)
Date: Mon, 27 Jun 2022 13:23:00 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor.Dooley@microchip.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	linux-can@vger.kernel.org, kernel@pengutronix.de,
	palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next 16/22] riscv: dts: microchip: add mpfs's CAN
 controllers
Message-ID: <20220627112300.sfohehohqynafpvm@pengutronix.de>
References: <20220625120335.324697-1-mkl@pengutronix.de>
 <20220625120335.324697-17-mkl@pengutronix.de>
 <ff40e50f-728d-dba3-6aa2-59db573d6f76@microchip.com>
 <20220627073001.2l6twpyt7fg252ul@pengutronix.de>
 <a1b84760-821f-a279-ca2c-b22d5f1a99fa@microchip.com>
MIME-Version: 1.0
In-Reply-To: <a1b84760-821f-a279-ca2c-b22d5f1a99fa@microchip.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_042312_578078_C3681D9C 
X-CRM114-Status: GOOD (  18.66  )
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
Content-Type: multipart/mixed; boundary="===============8973613555340214362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8973613555340214362==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cxa57jnpkpbd3uu"
Content-Disposition: inline


--2cxa57jnpkpbd3uu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.06.2022 11:17:39, Conor.Dooley@microchip.com wrote:
> On 27/06/2022 08:30, Marc Kleine-Budde wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > On 27.06.2022 07:12:47, Conor.Dooley@microchip.com wrote:
> >> On 25/06/2022 13:03, Marc Kleine-Budde wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
> >>>
> >>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>
> >>> PolarFire SoC has a pair of CAN controllers, but as they were
> >>> undocumented there were omitted from the device tree. Add them.
> >>>
> >>> Link: https://lore.kernel.org/all/20220607065459.2035746-3-conor.dool=
ey@microchip.com
> >>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> >>
> >> Hey Marc,
> >> Not entirely familiar with the process here.
> >> Do I apply this patch when the rest of the series gets taken,
> >> or will this patch go through the net tree?
> >
> > Both patches:
> >
> >  38a71fc04895 riscv: dts: microchip: add mpfs's CAN controllers
> >  c878d518d7b6 dt-bindings: can: mpfs: document the mpfs CAN controller
> >
> > are on they way to mainline via the net-next tree. No further actions
> > needed on your side.
>=20
> dts through the netdev tree rater than via the arch? Seems a little odd,
> but it'd be via my tree anyway and I don't mind & unless Palmer objects:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

It was just applied to net-next/master. Drop me a note if something
should be reverted.

regards,
Marc
--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--2cxa57jnpkpbd3uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmK5kxIACgkQrX5LkNig
011J0gf/S2BHtQ4rY897eeP6Vqh/oPwhzmwUpeHHRofCMiYqgoiLpD/DFeso8YSi
KtfsiE2Fxp+cUSFGI5EX5OIwRx2AZFplh34ZMNN5/3HykYTnf7cPTX6lYXXVDJdN
9mYYnf9GNQ8z8Est9rM4omJbKMWecQ4Cwu9aYTvKWWF/62tIqGoIDnit7qzsvDrL
fIHlrPccrHMp8fVMjJPW1nca6d64zDbv5NEIxp9UU1MnRZiDkvcbna11AhaElN1B
sZT3Z6vcnmRD4zEsT8QH9HL7Vh8m3mjTvidnwW5QAQODHG4xnkGBw4Irj4RWbp/H
cMtYA3tKGuSOOg3jjoBwowRx72Tp6g==
=R9Ry
-----END PGP SIGNATURE-----

--2cxa57jnpkpbd3uu--


--===============8973613555340214362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8973613555340214362==--

