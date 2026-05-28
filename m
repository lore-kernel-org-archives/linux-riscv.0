Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2514DCD5BD5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9t/soBedqeAgh2EeGUYhbnqsyLfNLLbEyLX/2vBCnc=; b=TyEaelE/3KS4UimoeLzkaksBZ/
	JcLjwaGwQJ0WCU/d9KhKWCV7oQgvIZ824cfFHIpO5jdf6kshF/+7MYNgwMMeHQZoZU7je0qSXfgzn
	At1sqpxSLYhQ2FMxGFnF5L/nHhiSZZVqhG2mMWuYCjpBA4SxgMU5wwsJQuKEzo6v4+duGbsQdTQj1
	EnJNf4QJBDUbEvAcgrgUhkzt0IjRBfeErlrx1yOFZomSjW9r3tc+Oi53u3ZFKsRVbwiUP4N1Sg0N/
	9apB1rmj8dTUW4OumQJgN0YTaMBnBpz3qEo8umpNbAeE6hFGX57PDxXoHaHlzcZAIrj+n/qpkvQom
	u93ID1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeIL-000000064a1-1vaz;
	Thu, 28 May 2026 17:13:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeIK-000000064Zu-43zK
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 17:13:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3655D601E4;
	Thu, 28 May 2026 17:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD941F000E9;
	Thu, 28 May 2026 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779988399;
	bh=DmoXDah3jQ5Ng6Yl64alLuZTaHi/bH6kVvRmL4WSci4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XT2xQqiM794hRpZH3R37eidRSs2hUFcz2AGrGhnknWAeNsuKxBKl6TnwI4suQ3Gyn
	 qQi1sKK8lATJ0FkPkZxxyeneVNzzVf1/NPCk0K+wjrUyzG9U3p37UgQc0qNhn/eB6S
	 DmdnmrRUV1wNPSRssdqG7PRoIl6rOtaRwy8KhxJqEyI2JHYULk60Uj/y93hLndKSol
	 KSnGNCjibIMSaYo4gY547F5+b54lszhondeuuEqo52sOzD3sDVByUtBocHd05oTzkd
	 sKyXRivPy4CR3qXYBqYNFqwW1trgMyzrET2dXFDm2tqKR7TCOEKnzmdW/+RObzSggZ
	 Z23FXmVkKAR8Q==
Date: Thu, 28 May 2026 18:13:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Message-ID: <20260528-mushily-suffrage-5162d4ffdaf2@spud>
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
 <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============4305621866531201797=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4305621866531201797==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yHMIcsRoTx1oZIkR"
Content-Disposition: inline


--yHMIcsRoTx1oZIkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 01:22:48PM +0800, Junhui Liu wrote:
> The gmac_clk_ref signal is optional for the GMAC controller and is not
> strictly required for all hardware designs. The pins for gmac0_clk_ref
> (GPIO 45) and gmac1_clk_ref (GPIO 46) may also be used as GPIOs for
> other functions even when the Ethernet controller is active.
>=20
> Split the refclk pins into independent pinctrl groups so boards can
> request them only when the reference clock path is actually needed.
>=20
> Among the already mainlined boards, BPI-F3, Jupiter and MusePi Pro have
> optional hardware paths for the GMAC refclk pins. BPI-F3 and Jupiter
> route both GMAC refclk pins to the PHYs through NC/0R option resistors,
> while MusePi Pro only does so for GMAC0. Keep referencing the new
> clk-ref pinctrl groups on these boards so the optional hardware paths
> remain usable if the option resistors are populated.
>=20
> OrangePi R2S has no publicly available schematic, so also keep the
> clk-ref groups there to preserve the previous pinmux behavior.
>=20
> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k1-pinctrl.dtsi
> index 4e9a62d0e85b..8c57ca05dabd 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -27,8 +27,16 @@ gmac0-pins {
>  				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
>  				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
>  				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
> -				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
> -				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */

The point sashiko made here seems valid, odd that these aren't added to
another group.

> +				 <K1_PADCONF(14, 1)>;	/* gmac0_int_n */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <21>;
> +		};
> +	};
> +
> +	gmac0_clk_ref_cfg: gmac0-clk-ref-cfg {
> +		gmac0-clk-ref-pins {
> +			pinmux =3D <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
> =20
>  			bias-pull-up =3D <0>;
>  			drive-strength =3D <21>;
> @@ -51,8 +59,16 @@ gmac1-pins {
>  				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
>  				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
>  				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
> -				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
> -				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
> +				 <K1_PADCONF(43, 1)>;	/* gmac1_int_n */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <21>;
> +		};
> +	};
> +
> +	gmac1_clk_ref_cfg: gmac1-clk-ref-cfg {
> +		gmac1-clk-ref-pins {
> +			pinmux =3D <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
> =20
>  			bias-pull-up =3D <0>;
>  			drive-strength =3D <21>;
>=20
> --=20
> 2.54.0
>=20

--yHMIcsRoTx1oZIkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahh3qgAKCRB4tDGHoIJi
0ighAQCCYCHn/Z8Nx1S8V5gzBhLAaraiQ7AmOK+smylXr8jDiwEAp3sY1yAA84Wh
XOHUcBadiG0vpUZHYLRkhwjSFZEjHgk=
=FbJc
-----END PGP SIGNATURE-----

--yHMIcsRoTx1oZIkR--


--===============4305621866531201797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4305621866531201797==--

