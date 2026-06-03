Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D8CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7C21LJ7LPjqcQUk2IOxjUEQ/izYNi2THgCImdc4prY=; b=TkhlNuv94QeKQ7qQg+PN5RMfzD
	dhrp8AhlmBbk5jfiMrZdY8LGJbeUozAVCG/UDbB605mCpSuH+1beUb9GFatGfQ90BTjKMbK/OglEQ
	pponhTryoc3PCR0lF4HBYh12GqQmr+/llWyBLTlDEsrXYGLMIa3Epf9X+K+Cw571/aWUGIR1ySwyp
	CqYisMPfQo8rDVv2kq43HeQ9kFjdUrYgtR81lb8Vo6qNT5veavQLNiVWVzzpqh3Qs69URV/G45tPO
	BfecUZp+coLZ02AXvGNJU6Lw8wifqLCunsLlVbPRCtJxy8LUZoa/a8mr6KMR7IDZ/mHAMl6sVb+oD
	J9UatVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMX-0000000FMRw-3Ycw;
	Wed, 03 Jun 2026 15:18:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMX-0000000FMRW-02JM
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 15:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 762E0601DD;
	Wed,  3 Jun 2026 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138891F00893;
	Wed,  3 Jun 2026 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499912;
	bh=gqLubRzDZskEA9R3dJXzcbqYgA5a+l8atiBeOr7IMyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GRiwEnU0BcFdjpGIldWYYQNw1LEa2mwix99tP6yfOXlV79rEJOB706J70/mTY05WO
	 Fz1N4FnNxlXkC8iT00hRocwYuYiQ5TdCqPT2sydp/zX7/EtIjkEamLOgG9Uf6fdbpb
	 oGi23KdbA4opEgs1lk7n5Jsa/6NUpOWTCPx9yFQxztl221UC/bIjG7AsWjvK/b7p03
	 c0KELW386SW/8QhA+/m2JjqAXvzwZN1LOmyw6K7ZLMi6AZwX2CAimlJaxAS1Rs5ilf
	 z+BLZBYg6nT7r0qb+eKhvwVVyI/Tcz5OsTOaLIn0fMWIWeofmdWBCvnXIsEfctLaEW
	 VftYIXSfp4npQ==
Date: Wed, 3 Jun 2026 16:18:27 +0100
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
Subject: Re: [PATCH v3 02/21] pinctrl: pinconf-generic: Add property
 'input-debounce-ns'
Message-ID: <20260603-sinless-mooing-48a37d3d05ea@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-3-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260603055347.66845-3-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============2177844032985643479=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2177844032985643479==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UxFbr67Tboxoi01J"
Content-Disposition: inline


--UxFbr67Tboxoi01J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

On Tue, Jun 02, 2026 at 10:53:28PM -0700, Changhuang Liang wrote:
> Add 'input-debounce-ns' to the generic parameters used for parsing DT
> files, along with the corresponding configuration parameter
> PIN_CONFIG_INPUT_DEBOUNCE_NS. This allows debounce time to be specified
> in nanoseconds as an alternative to the existing 'input-debounce'
> property which uses microseconds
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/pinctrl/pinconf-generic.c       | 2 ++
>  include/linux/pinctrl/pinconf-generic.h | 5 +++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-=
generic.c
> index 64ed28309788..9d67e2d26e28 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -43,6 +43,7 @@ static const struct pin_config_item conf_items[] =3D {
>  	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", tru=
e),
>  	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", =
true),
>  	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
> +	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE_NS, "input debounce", "nsec", true),
>  	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
>  	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, fals=
e),
>  	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_UV, "input schmitt threshold", "uV",=
 true),
> @@ -185,6 +186,7 @@ static const struct pinconf_generic_params dt_params[=
] =3D {
>  	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
>  	{ "drive-strength-microamp", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
>  	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
> +	{ "input-debounce-ns", PIN_CONFIG_INPUT_DEBOUNCE_NS, 0 },
>  	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
>  	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
>  	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinc=
trl/pinconf-generic.h
> index a5d4b2d8633a..1df63c732b99 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -71,6 +71,10 @@ struct pinctrl_map;
>   *	which means it will wait for signals to settle when reading inputs. T=
he
>   *	argument gives the debounce time in usecs. Setting the
>   *	argument to zero turns debouncing off.
> + * @PIN_CONFIG_INPUT_DEBOUNCE_NS: this will configure the pin to debounc=
e mode,
> + *	which means it will wait for signals to settle when reading inputs. T=
he
> + *	argument gives the debounce time in nsecs. Setting the
> + *	argument to zero turns debouncing off.
>   * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this doe=
s not
>   *	affect the pin's ability to drive output.  1 enables input, 0 disables
>   *	input.
> @@ -143,6 +147,7 @@ enum pin_config_param {
>  	PIN_CONFIG_DRIVE_STRENGTH,
>  	PIN_CONFIG_DRIVE_STRENGTH_UA,
>  	PIN_CONFIG_INPUT_DEBOUNCE,
> +	PIN_CONFIG_INPUT_DEBOUNCE_NS,
>  	PIN_CONFIG_INPUT_ENABLE,
>  	PIN_CONFIG_INPUT_SCHMITT,
>  	PIN_CONFIG_INPUT_SCHMITT_ENABLE,

Should this grow a mutual exclusion check in parse_fw_cfg()?
Part of me says yes for consistency, but also as this is a new property
that's going to have had exclusion in the binding from the start part of
me says that it is unnecessary to add that.



--UxFbr67Tboxoi01J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBFwgAKCRB4tDGHoIJi
0shdAQDVn1y7zJ5GetjXm2OW2sQdptXIBXriOfUWzTJBsBzXhAEAqbwd03uZvPIu
EdG/j/Pj6pCWlzrc4wAopEkRvGV20gs=
=uhlk
-----END PGP SIGNATURE-----

--UxFbr67Tboxoi01J--


--===============2177844032985643479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2177844032985643479==--

