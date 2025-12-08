Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62262D3B7EA
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TC0+hEg+B0TG0Dhb2RZE//i/cU5z6n2XQIvYK0c4MKc=; b=Tf7WVfoamG+RL7kUSs8Byffxrh
	+Ty7OHunrZFhTUBdp8DAgqCFPdSsV+HnCC9nYGhu//oXCwTO6VZwjjYY0t8kFIvykomJEbcxf+MrB
	NOU2c6FwbGDRh5XQ2YzJg/cWc3VhoiaMhUXH2iIYDF/cGWR7kzgUo22EKL3oN2CPnqw1RnhgPUl3u
	y6U/u4yn2ksgC4zi4W2IkrqedpWvNfdm8WMqbmq0BmgR9WNwLIuejoh2pLmUJuTIy3fPcyUjFlx9c
	LskJpaOrCjyXxjhRlVWadt6bFIXkmJw+Ja1F8Qr5E5ZbsKq9omjl8GT94XmxzaCwQGIS0M+jGbCV1
	HIbJ47TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSe7Y-0000000DJ1e-3vqJ;
	Mon, 08 Dec 2025 16:29:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSe7W-0000000DJ08-0mKO
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 16:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5696060153;
	Mon,  8 Dec 2025 16:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE62C4CEF1;
	Mon,  8 Dec 2025 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765211393;
	bh=u9/V6FO6d0rm9qZyiiTMyVquQKST3H4QQ0D6A/qqc+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTWOR8XBk8PRSyJtXmVlAeQbiK5G1P0UP2JqnYfGjc3F+G5Z4H2ykjk7I0uCe7PzP
	 85SK5BH2fPt4UCcV1v3jLmrZ54ZovyY7FcUURybT9QAs4xXxYBJDbevjXVm2iCTb0I
	 CMLbIIVri6eCqpzFxDirb5vPHxzsa7Jvhb7rNMRmyCFuuYt/nYuvVKzHZB3WMykPAS
	 +qaagc0G5nGRQubEMOUivMoopgz9WltrB3miUbOhTGVt//2L4t/py+uAvb/yOJM3UX
	 wsW2pJ+HJZAD5wGqhlh06tko1x6AbcULmAitSBMIPQ4MMWDlH4HJzg0yZq4nbFGJ3N
	 6DcdGYQpzMT9w==
Date: Mon, 8 Dec 2025 16:29:47 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: Append starfive,jh7110
 compatible to VisionFive 2 Lite
Message-ID: <20251208-jogging-morally-9b787b7ab1b8@spud>
References: <20251206204540.112614-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20251206204540.112614-1-e@freeshell.de>
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
Content-Type: multipart/mixed; boundary="===============4064736687601217723=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4064736687601217723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S/9N8GZdPnvmudqA"
Content-Disposition: inline


--S/9N8GZdPnvmudqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 06, 2025 at 12:45:30PM -0800, E Shattow wrote:
> Append starfive,jh7110 compatible to VisionFive 2 Lite and VisionFive 2
> Lite eMMC in the "least compatible" end of the list. JH7110S on these
> boards is the same tape-out as JH7110 however rated for thermal, voltage,
> and frequency characteristics for a maximum of 1.25GHz operation.
>=20
> Link to previous discussion suggesting this change:
> https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonic=
al.com/
>=20
> Fixes: 900b32fd601b ("riscv: dts: starfive: Add VisionFive 2 Lite board d=
evice tree")
> Fixes: ae264ae12442 ("riscv: dts: starfive: Add VisionFive 2 Lite eMMC bo=
ard device tree")
> Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: E Shattow <e@freeshell.de>

You can't do this without modifying the binding too, as this doesn't
pass dtbs_check.

However, is this actually correct? The frequency of operation and the
temperature range aren't a superset of what the jh7110 can do, what is
the actual advantage of having it? If there's some software that this
would make a difference for, please mention it in the commit message.

Cheers,
Conor.

> ---
>  .../dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts     | 2 +-
>  .../boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-li=
te-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lit=
e-emmc.dts
> index e27a662d4022..7544efa95de4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc=
=2Edts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc=
=2Edts
> @@ -9,7 +9,7 @@
> =20
>  / {
>  	model =3D "StarFive VisionFive 2 Lite eMMC";
> -	compatible =3D "starfive,visionfive-2-lite-emmc", "starfive,jh7110s";
> +	compatible =3D "starfive,visionfive-2-lite-emmc", "starfive,jh7110s", "=
starfive,jh7110";
>  };
> =20
>  &mmc0 {
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-li=
te.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
> index b96eea4fa7d5..b9913991a1b7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
> @@ -9,7 +9,7 @@
> =20
>  / {
>  	model =3D "StarFive VisionFive 2 Lite";
> -	compatible =3D "starfive,visionfive-2-lite", "starfive,jh7110s";
> +	compatible =3D "starfive,visionfive-2-lite", "starfive,jh7110s", "starf=
ive,jh7110";
>  };
> =20
>  &mmc0 {
>=20
> base-commit: 5e5ea7f61610239fca058011e7d4f342b34d1558
> --=20
> 2.50.0
>=20

--S/9N8GZdPnvmudqA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTb8+wAKCRB4tDGHoIJi
0uetAP9cMQDvAr0AAp4fRxgA7OURrPcNt9GY00FOTAltOETTCQEAujHQ4cW/R5jp
1OiO+b1i5Yq6FHDPK6W9KdLrsNN47w8=
=PClC
-----END PGP SIGNATURE-----

--S/9N8GZdPnvmudqA--


--===============4064736687601217723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4064736687601217723==--

