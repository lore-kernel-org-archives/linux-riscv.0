Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6021AC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAJqI+hEOz5X5zH9cXsovMGfxL/sdpkXGJTVP099Dkg=; b=1h4zhXnT/Y4el+bTb6AZKZDYIM
	03SepFAilPfp02m8IYbHThq83QmmlfFUqN8sKwTzgBFJMVR/Yu3/E82kIgobvuZWPy45sXQkAbhN/
	gN9sDCBPEWzSfQUrw545p4bTERyjw7u5fARnOTQMH2TiRJWT0e4vM3VjrYaa5x999cQjz6t5smJ5T
	rNHCz8vdUG7hj2yW7G+wI34TowaZ7eNa5bWx3v8ajXFevSq70z7VqQCJrE0jWKUF/v4bANMWEXLmE
	PoZGq9QUQHBWmnUAeiiwBJTwBlmUqEgIGsu874gzox5aonM6+IL1aMXopRIpCn3AjZUF3Xnk4+VcG
	e3v0eDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMWn-0000000Bgox-2n5r;
	Mon, 29 Jan 2024 07:58:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMWk-0000000Bgo9-1aRR
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 07:58:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUMWW-0005l1-Ih; Mon, 29 Jan 2024 08:57:44 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUMWT-0037Px-CT; Mon, 29 Jan 2024 08:57:41 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id F04C02806DB;
	Mon, 29 Jan 2024 07:57:40 +0000 (UTC)
Date: Mon, 29 Jan 2024 08:57:40 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-can@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 0/4] CAST Controller Area Network driver support
Message-ID: <20240129-gills-excitable-01213b5b28eb-mkl@pengutronix.de>
References: <20240129031239.17037-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240129031239.17037-1-william.qiu@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_235758_458198_D75D75C5 
X-CRM114-Status: GOOD (  17.30  )
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
Content-Type: multipart/mixed; boundary="===============6937977719129417346=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6937977719129417346==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tikucubn3q4pl4l6"
Content-Disposition: inline


--tikucubn3q4pl4l6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 29.01.2024 11:12:35, William Qiu wrote:
> Hi,
>=20
> This patchset adds initial rudimentary support for the CAST Controller
> Area Network driver. And we registered cast in kernel as well. This
> driver will be applied in JH7110 SoC first, so add relevant
> compatibility support.

Is there a public available data sheet for the IP core?

Marc

>=20
> William Qiu (4):
>   dt-bindings: vendor-prefixes: Add cast vendor prefix
>   dt-bindings: can: Add bindings for CAST CAN Controller
>   can: cast: add driver for CAST CAN controller
>   riscv: dts: starfive: jh7110: Add CAN node
>=20
>  .../devicetree/bindings/net/can/cast,can.yaml |   95 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  MAINTAINERS                                   |    7 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |   32 +
>  drivers/net/can/Kconfig                       |    7 +
>  drivers/net/can/Makefile                      |    1 +
>  drivers/net/can/cast_can.c                    | 1215 +++++++++++++++++
>  7 files changed, 1359 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/cast,can.ya=
ml
>  create mode 100644 drivers/net/can/cast_can.c
>=20
> --
> 2.34.1
>=20
>=20
>=20

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tikucubn3q4pl4l6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmW3WnEACgkQvlAcSiqK
BOjlzQf/UD7WTrwznL8zamHmMbaReSd0vVpfMLVv2e28fbSycVxa2OEhI1pfZfne
xuQsMea7kfXw3QVeMBAxNdozGG44rHBwDm6CJrnWOQxE8NcUCZpmfh8XdMecbNAU
1NE+gGxVoQOwSJinA7JfXB3EvM9ab+U3FEYYZIY/oRV5YmMLei+trVrlqwRfjM5J
FIfsDRi1maagiZXgHFsK/3u4bFb53KUyXOPHJn8+XUQ2NNcixRXnOkrSBcd567A0
gt8QR2eEyDwCwFSwcjM3ExvkOG3QsU/BJ6KEyqha4MBJ/7ltLzC+YhQLscMF0pPo
y+aScUf3mPvdsoWNL3hioAk8GPnvmQ==
=8SPb
-----END PGP SIGNATURE-----

--tikucubn3q4pl4l6--


--===============6937977719129417346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6937977719129417346==--

