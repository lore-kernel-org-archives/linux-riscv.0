Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890C0CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 18:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33AXgcfhWYuRaWgtp/818bT1bnfUP8x8FUHN7fo88i4=; b=wiJ0j7nZLCHRJ5WvkV3zShF3Zt
	CQmeGluIGmU/1TcigtbKBY0E7/tMxMDxIpXnCHzNltqOehADMuHyfJaj0WTlE32POufDMqVEbNANd
	BcHhxj9FstP4Ix0J2AJDrPM2EEvvkRw6KEI8pCqS7AO/Pi0AG6zY1eUvXgA7VZVYDVRCLIjZgYEJz
	+q7nc1a/BVqUuB5jLXYvLLo++4AofPz/zXuUlnbyacSScEun9emUE9vIgXFgbhChQbxn6oaeqk0zf
	x2M6aVjWzRMos6Mkk3/p2UsfAeRR1c2MJe5fA8cULfZDD5wgmRfH51Ofiwf1Xa0do7bVD/4CerNXh
	z0vhCnWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNb5R-00000006MBZ-17Uc;
	Thu, 14 May 2026 18:47:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNb5P-00000006MB4-14Zg
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 18:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9C1B43554;
	Thu, 14 May 2026 18:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9836DC2BCB3;
	Thu, 14 May 2026 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784426;
	bh=LgMT4CcOhIPMNDBrIhvh+QoNATSdDWWfIBMKk1lJvE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJqnCIKHMhvg2QwBcakW6aQj4SjaqHFLXfzEwAYYFCecXW5Gw9Vc9dmwXXW9rTIGC
	 GXQhoqHik34o17bUkbXzourie1B+GYuuUuhQIm3OdgI476LKh9xYM0W7DygcUofwp4
	 X+N+ZbM4ACT7DYO3lEAiQIGYXoGY6gJ4Mn9lCT1b97V9uKL6zvhmsMeCqQJwzUvqqW
	 sid66kaSgDbr705ClxLYvHILvuIO2Vse70MCWRcUe5mrMmCT3Hw6Oe00KQxYjZDdg+
	 oDuXuIxTsibemrhgnI4J9Nj0XRhjOckZq3SeS2LzEL4PX5o9C1PpG7GWb4k0AR7l3S
	 fkqBBVHeg7XXw==
Date: Thu, 14 May 2026 19:46:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Message-ID: <20260514-operation-remix-9f9fcf9a6102@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260514111218.94519-4-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_114707_338222_B37EE5DF 
X-CRM114-Status: GOOD (  24.20  )
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
Content-Type: multipart/mixed; boundary="===============8655619712622054460=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8655619712622054460==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N4d21H8lXERvyDiB"
Content-Disposition: inline


--N4d21H8lXERvyDiB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> Some pinctrl subnodes only need to configure pin properties (e.g.,
> power-source, bias, drive strength) without assigning any mux function.
>=20
> Currently, the driver requires a valid "function" property for all
> pinctrl subnodes. This forces the addition of dummy or redundant
> "function" entries when only pin configuration is needed.
>=20
> Example use case:
> gpios-configs {
>     config {
>         pins =3D <0 1 2 3>;
>         power-source =3D <0>;
>     };
> };
>=20
> Make the "function" property optional. If it is missing, skip adding
> the mux map and only process the pin configuration.

I looked through the series though and all controllers appear
to have pins and functions, is it the case that gpio is the default for
these pins, so you are omitting the functions property when you are
using the pin in gpio mode? Saying that the functions property is
"redudant" makes it seem like this might be the case?

I've got some feedback here, but I can't really provide it without
knowing the answer to that question.

Cheers,
Conor.

>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/pinctrl/pinctrl-generic.c | 37 ++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-=
generic.c
> index efb39c6a6703..c7dd0924aa0e 100644
> --- a/drivers/pinctrl/pinctrl-generic.c
> +++ b/drivers/pinctrl/pinctrl-generic.c
> @@ -62,19 +62,36 @@ static int pinctrl_generic_pins_function_dt_subnode_t=
o_map(struct pinctrl_dev *p
> =20
>  		pins[i] =3D pin;
> =20
> -		ret =3D of_property_read_string(np, "function", &functions[i]);
> -		if (ret)
> -			return ret;
> +		if (functions) {
> +			ret =3D of_property_read_string(np, "function", &functions[i]);
> +			if (ret < 0) {
> +				/* EINVAL =3D missing, which is fine since it's optional */
> +				if (ret !=3D -EINVAL) {
> +					dev_err(dev, "%pOF: could not parse property function\n",
> +						np);
> +					return ret;
> +				}
> +
> +				devm_kfree(dev, functions);
> +				functions =3D NULL;
> +
> +				/* Continue parsing all pins */
> +				continue;
> +			}
> +		}
>  	}
> =20
> -	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num=
_maps, reserve);
> -	if (ret)
> -		return ret;
> +	if (functions) {
> +		ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps,
> +						num_maps, reserve);
> +		if (ret)
> +			return ret;
> =20
> -	ret =3D pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num=
_maps, group_name,
> -					parent->name);
> -	if (ret < 0)
> -		return ret;
> +		ret =3D pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps,
> +						num_maps, group_name, parent->name);
> +		if (ret < 0)
> +			return ret;
> +	}
> =20
>  	ret =3D pinctrl_generic_add_group(pctldev, group_name, pins, npins, fun=
ctions);
>  	if (ret < 0)
> --=20
> 2.25.1
>=20

--N4d21H8lXERvyDiB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYYowAKCRB4tDGHoIJi
0lupAP44+sqEGJcZ4IQoQFmHzo3V4YaE/+Efls8GNyFGogQXFwEAzWJOqn3FfOwO
iEh4PEa0suI90JQY87A+0saMqWV64gw=
=3zW6
-----END PGP SIGNATURE-----

--N4d21H8lXERvyDiB--


--===============8655619712622054460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8655619712622054460==--

