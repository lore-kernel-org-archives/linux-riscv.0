Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA5BC54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0z0+jy8HIj2B5egiLewjEruKrgPEBwzZ/H3lPFi0uSQ=; b=W+tYO/OvbEXm+tZMHbGb1aU7Rp
	RtwH6BkgSxIR1na17m0mHD+y+I53Syt5lpmNJ1x0hnSBdKPiQGuJgQ0W1ZeIvXs/0Pxq/1j9azXC1
	D1EKjQcbHFe/Xo9D7uNbpD5T2lIj98UOWRCxcQE+DPmoea/HC/urpyS3PcfCYHX+jaaNiaBd9AghB
	9PMhHMthlNuTPyFrSakMuJiF2LGLeXC6ujEQdrtnQGxm3M2RtNX0RJs76yQdcP1VyiX8ix9moM8GD
	N82jp+w8rp2Hfr809PTA/qEGaBSSF4bQv55XXMXghWCS2+8O7aXOXxbfIiC9pk2ZLyWxjrZEyUQto
	l8cmRuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFH1E-007hSf-EB; Tue, 10 Jan 2023 15:58:32 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFH10-007hMK-JH; Tue, 10 Jan 2023 15:58:20 +0000
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9DCC2100007;
	Tue, 10 Jan 2023 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673366291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ls2ZHhB4etdhWoWPPLqYUa/37vhJl28tR8qb5hvwZ/s=;
	b=Fm2cxqae7qTWtMWT0LqewzuhPawG7GgGOlqOXEaY6yzG5ygk09t/nSmIMN3jfeCOUA+Ubt
	/zddmJrMmKoYhcjsi4azTVvtDH1YviODyTOc0szzDibgkXbgp8b2NOgVIuhh1tUg1Zz0D4
	8cP3FU3Fi/UoxXvfB/oYdiQKYfnBlEUPVuPbLJNby5H+/l+AhxTdmz+ajjLoEuWMaFXExY
	xTuV4jurbPXEe8o1k0nt0mS/QKPugy73i2WjyPGA31V0yla1yWL+oh3Z4JXk3fok3rlIJM
	tMG8GMkr1VIoD2/JcH7XIBKkw8dMqnVCMnt5/IUjISFXg448Se0uPrHen3OnoA==
Date: Tue, 10 Jan 2023 16:58:06 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4 07/12] riscv: dts: allwinner: Add Sipeed Lichee RV
 devicetrees
Message-ID: <Y72LDlIOYo/I8dii@aptenodytes>
References: <20221231233851.24923-1-samuel@sholland.org>
 <20221231233851.24923-8-samuel@sholland.org>
 <Y7bW32i3EUmGHqSK@aptenodytes>
 <05c1ee07-0750-d40e-8498-55ea07b52ab1@sholland.org>
MIME-Version: 1.0
In-Reply-To: <05c1ee07-0750-d40e-8498-55ea07b52ab1@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_075818_935349_921454A1 
X-CRM114-Status: GOOD (  19.78  )
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
Content-Type: multipart/mixed; boundary="===============6434101456606403526=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6434101456606403526==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ARnt4yApiZMkzLk7"
Content-Disposition: inline


--ARnt4yApiZMkzLk7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sun 08 Jan 23, 12:42, Samuel Holland wrote:
> Hi Paul,
>=20
> On 1/5/23 07:55, Paul Kocialkowski wrote:
> > Hi Samuel,
> >=20
> > On Sat 31 Dec 22, 17:38, Samuel Holland wrote:
> >> Sipeed manufactures a "Lichee RV" system-on-module, which provides a
> >> minimal working system on its own, as well as a few carrier boards. The
> >> "Dock" board provides audio, USB, and WiFi. The "86 Panel" additionally
> >> provides 100M Ethernet and a built-in display panel.
> >>
> >> The 86 Panel repurposes the USB ID and VBUS detection GPIOs for its RGB
> >> panel interface, since the USB OTG port is inaccessible inside the cas=
e.
> >=20
> > Looks like the panel-enabled variants would better be described as devi=
ce-tree
> > overlays as they are not specific devices but are peripheral extensions.
> >=20
> > What do you think?
>=20
> I don't agree. The Lichee RV 86 Panel is sold as a complete unit, with
> the SoM+board and LCD pre-assembled inside a case. It is not possible to
> purchase the board without a panel, so the panel-enabled variants are
> the only variants.

Oh my bad, I didn't go as far as actually checking what it looks like.
So yeah if it's an individual device on its own I agree it deserves its
own dedicated device-tree.

Cheers,

Paul


--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ARnt4yApiZMkzLk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmO9iw0ACgkQ3cLmz3+f
v9Gixwf/bUuAN5mWXtPd6SPwUdDiuGj3HtcGDNKL8Buq00SJTlZQyMbyz3F3TYcm
bQ0/KlisJFv5fPbJW8aRI2TqOpFDnGtAGSkQ5JgyeJhiQbYjKBtHjvesPiDMsBxV
ri99hwxNmZuFw+AswqPtGC4mbau4lnRJFC34lvZL02vlzxHYTapOsbPR1CtWb+Ww
xL6bPOYB1pRzRHpR5i8fxDcxbW0/l36BwJf1UivHjFtxvYZcjI79Lr/1E33ZAbGg
VJekuVkb7+v78TVIiN7YBYuZdYEydq62ARy8WP/VnExZLpWXvv6vNMSgfCSIPu9u
Psc6c5fjpitNLgprsqst0bobNwUoWQ==
=/4VV
-----END PGP SIGNATURE-----

--ARnt4yApiZMkzLk7--


--===============6434101456606403526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6434101456606403526==--

