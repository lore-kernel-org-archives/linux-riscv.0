Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B579C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZdQ7k7vKOvu+e2jtV7C/CJgjEd7MgzgOpRbnzm68/4=; b=q/CeE/sgAh1LHgXJGkTLOk2Asv
	7V1rEFWo5L3HnyZh3hwaFaPde3PDOm5dcRLGnY1O6dUqeuBCrPt2Agin+TdIu5K5ACUkMCwRWsjzD
	YyMmbHsVuGcGeK8Qh/S+/Uf5Hl2vM9cG0g9nDyzwv+NK4OrkojlTIVH4Q5im4aU2iDVwQVXMVlgAU
	+tL1COh4YrEkpz29XeLvbWC5FXWG9OnRQCqYXQfpvBxPBB+TgLdEeO+nQqr6kmeTjnhr1zBcDCZxE
	GD6LNHWxUiw7csfNZ7CVDX4P2joiplj1S80Q1HcaDddQ2t+j8HIf4cfAd8dpddu+aFGPMNs1L36HA
	sH5YaDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNp7-002lI9-39;
	Tue, 08 Aug 2023 14:36:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNp4-002lHN-2E
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 14:36:36 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qTNon-0005h7-To; Tue, 08 Aug 2023 16:36:17 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 825AC206CE6;
	Tue,  8 Aug 2023 14:36:11 +0000 (UTC)
Date: Tue, 8 Aug 2023 16:36:10 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <20230808-outgoing-trifocals-ee5d44aea113-mkl@pengutronix.de>
References: <20230807191952.2019208-1-contact@jookia.org>
 <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
MIME-Version: 1.0
In-Reply-To: <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_073634_749602_64D4F439 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, John Watts <contact@jookia.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5962809228958693041=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5962809228958693041==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4nwq7phqlae7mco3"
Content-Disposition: inline


--4nwq7phqlae7mco3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08.08.2023 16:26:17, Markus Elfring wrote:
> =E2=80=A6
> > Both of these fully support both CAN controllers.
>=20
> Please choose a corresponding imperative change suggestion.
>=20
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.5-rc5#n94
>=20
>=20
> > Signed-off-by: John Watts <contact@jookia.org>
>=20
> I find the local-part of this email address suspicious according to the D=
eveloper's Certificate of Origin.
> Should it usually indicate an unique person instead of the shown key word?

FYI: https://lore.kernel.org/all/20230718221504.GA2015343-robh@kernel.org

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--4nwq7phqlae7mco3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTSUtgACgkQvlAcSiqK
BOhQSgf/Yqmf0f7tupRc/JJY1XEaKV/WZHCse/ijc2E8sbJdhF4F8eilfyDriOxt
6TRqL9fD0DcjKx9WR719GJm7CgigzwOJk0vj56seoQGtzqkVZg3qjARMOiHTlILS
UvIh6ZgNdGP0WmdAiB1ZO7p1imugZGua7gGihHobLLVOT4Ipa8AD/I9TQLo7LudX
zAhTYepqt3nxf0fxvTgqQc3I2lmtV/LuOViF2NxE2BiSNjPzpQxGyIAMElRaQg4D
RJdamfDLYuJletg5OFI6QMb0JmASUZlz7889cgGx+UGtSp+JWNviXxDq4bvoF8KC
MbYMhncSKCPdpTJYRLMLCxaaXGCF4w==
=4/vk
-----END PGP SIGNATURE-----

--4nwq7phqlae7mco3--


--===============5962809228958693041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5962809228958693041==--

