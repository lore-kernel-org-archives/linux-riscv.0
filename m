Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB2BD39418
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPsCzv2QRuj0wmoaQIj3aEaTSaHM6SkMPHvlQ5v30OE=; b=nfbFg7+0hKye+dt6G3xA5IGsM7
	RpmpMhxnqOcV5Z43IYyN3S9j5FvzR0kcW8zGlSIp2Cg4KhaLLO7YrfQacStfTPuPvyDcNEaK+0KIW
	ILXx0QXsoScVGT7chTRItmqmd0Wv1hKqjbi5mSm8EPIwlZWio6dhHgfL2eYByTEb2nxMc9r358NvZ
	YYc6vosLpr01mfN2QyhLMhIst4hWdo79PwNBw6gt2qKioXqP2NY0t41QCfdop6ImrLCbreebig9Gn
	9gedinhuKT1StJyJfNZNXps2xDK6t6mX713XWZiQa388SzeJBpUZfBDyxOEoiYumaYok8/9E9rDVE
	6iV+IhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gwo-0000000HZNN-1Oqs;
	Thu, 02 Apr 2026 12:14:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gwm-0000000HZNC-3PVL
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 12:14:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E723361879;
	Thu,  2 Apr 2026 12:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59337C19423;
	Thu,  2 Apr 2026 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775132091;
	bh=EqYl1q6OHzj9GF2+s+7JBq9ShRG/TNsV61jcIPYVR9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqIp9oK/CmPGFtTrYHBXVTt3YRR7hvL/Lj8X/qA4v6UR4032SX75xrawsWktC3F/k
	 DqXrln9xWd7/rAYk5YlSaKL2NorONWEC7QstrmLMww5lHQv+fYRj3rw39v7b2uk+e4
	 hZ/8+zV6pf/uLAXgGLuW5mJg5Oz2wRmYs/UUPF+oy/TETpwV0KVuo1s9+dj9fiQ9Ed
	 YiojNiERmlBXh/fSNwIqZpk5tnX5IUGwLeIFo4P+8wtPr09MIGImnfaWcEmEbPj++/
	 +ftgRIUYnchCsI2dhmx3SiJ4kcLBqa/DyTzBJpSAxvDX44c38LX0eexi21Fs/Wuu0+
	 GQrx7liM/DJ8w==
Date: Thu, 2 Apr 2026 13:14:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 22/22] riscv: dts: starfive: jhb100: Add clocks and
 resets nodes
Message-ID: <20260402-fox-overhand-9a45ec670bce@spud>
References: <20260402105523.447523-1-changhuang.liang@starfivetech.com>
 <20260402105523.447523-23-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260402105523.447523-23-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============2440561849228280803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2440561849228280803==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i9/X0Hs31jPOYl+N"
Content-Disposition: inline


--i9/X0Hs31jPOYl+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 03:55:23AM -0700, Changhuang Liang wrote:
> Add clocks and resets nodes for JHB100 RISC-V BMC SoC. They contain
> sys0crg/sys1crg/sys2crg/per0crg/per1crg/per2crg/per3crg.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jhb100.dtsi | 198 ++++++++++++++++++++++-
>  1 file changed, 195 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/d=
ts/starfive/jhb100.dtsi
> index 4d03470f78ab..700d00f800bc 100644
> --- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> @@ -4,6 +4,8 @@
>   */
> =20
>  /dts-v1/;
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <dt-bindings/reset/starfive,jhb100-crg.h>
> =20
>  / {
>  	compatible =3D "starfive,jhb100";
> @@ -268,12 +270,96 @@ pmu {
>  			<0x00 0x22 0xFFFFFFFF 0xFFFFFF22 0x00007FF8>;	/* Event ID 34 */
>  	};
> =20
> -	clk_uart: clk-uart {
> -		compatible =3D "fixed-clock"; /* Initial clock handler for UART */
> +	osc: osc {
> +		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
>  		clock-frequency =3D <25000000>;
>  	};

Is this really on the SoC?

> =20
> +	pll0: pll0 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <2400000000>;
> +	};

What's providing all of these PLLs? Are they all fixed-frequency on-chip
PLLs without an off-chip reference? I find that somewhat unlikely.

Since devicetrees are now being imported into U-Boot, it's important to
make sure that I'm not merging fixed-clocks that later get replaced by
dedicated drivers that U-Boot won't have.

To that end, I won't apply the series this depends on without this patch
being applied at the same time.

> +
> +	pll1: pll1 {

Also, none of these follow the preferred naming scheme for
fixed-frequency clocks. Go look at the binding for how they should be,
if they are too be kept.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <1000000000>;
> +	};

Cheers,
Conor.

--i9/X0Hs31jPOYl+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCac5dtAAKCRB4tDGHoIJi
0uQHAP0WzBeqVfuYIxoQ5RQ7zJEaN6Xi9MLvyjrUg80WfHDtYwEAlx6dQ13WnFUI
p3u5nsP2s7rO8KPeaaFAN2sMynSwWg4=
=1yvc
-----END PGP SIGNATURE-----

--i9/X0Hs31jPOYl+N--


--===============2440561849228280803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2440561849228280803==--

