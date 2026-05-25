Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE63CCD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35JOjsT8x+3lB3K5QAyg13T5NoNBxFx6g0ji6bgxAtU=; b=lQeTTVm41B4bVFMfB5HUZkdoig
	b8nnwY3VMgWEt2yx1makpg3Ym+do6m3C9es4uCzgzutnPh/tiFnMmW+rw38fCN/mXTe6XpuYalmUB
	6KK3oI1Ul9TFnXI2ns+BvyZBNqyDIk4YP2/gB7Lu/gFe7QiR2dYRaoaRdaITDb2amJ1cgCsaWt7Dw
	Jx9XkRi74rfOK4ysrJw9Mi6jOGuv+1IuqXijsSnfu7uVUcfNRgAl8SC2iH2VcMBRY8z8mlct507Ho
	BfUwD+yeWQYnURHoW4szYKbEDntvBJZlMU9t+BbC8ac0Zu2KWPwh3/NWzevL9kVhhHpVc4qeDdwj2
	oDhsBBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSGL-0000000Gumr-3C1q;
	Mon, 25 May 2026 10:10:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSGK-0000000Gumd-1lvY
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 10:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C815600FF;
	Mon, 25 May 2026 10:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1547B1F000E9;
	Mon, 25 May 2026 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779703819;
	bh=xepSjUPRIqLRRJ/OWlpwXBGT3LoLJe7x1ZHwasvLII8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1n1s8ybHiFmpE/jDM9SMgg/VBdiJyOVb7mFUtWuXU2JpOYXzDsKxTgMsGx7yhZEt
	 ASVlrZirZ25NJ7EHV2xowvHE/0QZFZjHgi29otVHBraLzGy2KddQWmrgg2ai57Eccz
	 eI2LqNliXg/xYvHzVlSrPgrShAPQc/x6CeKc7zMzZqcw3q+dyRrUfXG+LitbGYhE5c
	 PGlm79UPAF3bAWKpvLhFWzhuhZCeLBcnrkEWi4OlUjWSVb3kBmlZzYbj4kxUdDeGD/
	 y6KiUFyhEqbJmk7D4mvJ5it69E/sfnbXDDmSyg9WCd9aK8ygRs2RMzscg6Sxq+39vO
	 AE4TDsOMrioZQ==
Date: Mon, 25 May 2026 11:10:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Message-ID: <20260525-turbojet-theorize-3a7b49f41af0@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7119648199044942897=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7119648199044942897==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H2L51F3zrIwPda2w"
Content-Disposition: inline


--H2L51F3zrIwPda2w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 11:28:51AM +0200, Linus Walleij wrote:
> On Fri, May 15, 2026 at 3:18=E2=80=AFAM Jia Wang via B4 Relay
> <devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> > +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> > +                               struct device_node *np,
> > +                               const char *propname,
> > +                               struct ur_legacy_prop_data *prop)
> > +static const char *ur_legacy_get_function_name(const struct ur_pinctrl=
_match_data *match_data,
> > +                                              u32 mode)
> > +static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, u32 =
conf,
> > +                                    unsigned long **configs,
> > +                                    unsigned int *num_configs)
> > +static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
> > +                                     struct pinctrl_map **map,
> > +                                     unsigned int *reserved_maps,
> > +                                     unsigned int *num_maps,
> > +                                     const struct ur_legacy_prop_data =
*prop)
> > +static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                                   struct device_node *np,
> > +                                   struct pinctrl_map **map,
> > +                                   unsigned int *num_maps)
>=20
> What's up with all this legacy stuff?
>=20
> What is this a legacy of?
>=20
> I thought this was a *new* driver so how can it be "legacy"?

Jia already agreed to drop this stuff :)

>=20
> > +static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                                    struct device_node *np_config,
> > +                                    struct pinctrl_map **map,
> > +                                    unsigned int *num_maps)
> > +{
> > +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map, =
num_maps,
> > +                                             PIN_MAP_TYPE_INVALID);
> > +}
>=20
> Hm I think Conor has new helpers for this so you don't need to wrap
> it like this.

Yeah, although "more importantly" the new helpers mean that drivers
shouldn't need to do things like calling these home-rolled functions in
probe, just so that they can try to use pinconf_generic_dt_node_to_map():
| static int ur_add_pin_groups(struct ur_pinctrl *pctldata)
| {
| 	for (u32 i =3D 0; i < pctldata->match_data->npins; i++) {
| 		int ret;
|=20
| 		pctldata->group_names[i] =3D pctldata->match_data->pins[i].name;
| 		pctldata->group_pins[i] =3D pctldata->match_data->pins[i].number;
|=20
| 		ret =3D pinctrl_generic_add_group(pctldata->pctl_dev, pctldata->group_n=
ames[i],
| 						&pctldata->group_pins[i], 1, NULL);
| 		if (ret < 0)
| 			return dev_err_probe(pctldata->dev, ret,
| 					     "failed to add pin group %s\n",
| 					     pctldata->group_names[i]);
| 	}
|=20
| 	return 0;
| }
|=20
| static int ur_add_functions(struct ur_pinctrl *pctldata)
| {
| 	for (u32 i =3D 0; i < pctldata->match_data->num_functions; i++) {
| 		const struct ur_function_desc *desc =3D &pctldata->match_data->function=
s[i];
| 		struct pinfunction func =3D desc->gpio ?
| 			PINCTRL_GPIO_PINFUNCTION(desc->name, pctldata->group_names,
| 						 pctldata->match_data->npins) :
| 			PINCTRL_PINFUNCTION(desc->name, pctldata->group_names,
| 					    pctldata->match_data->npins);
| 		int ret;
|=20
| 		ret =3D pinmux_generic_add_pinfunction(pctldata->pctl_dev, &func, (void=
 *)desc);
| 		if (ret < 0)
| 			return dev_err_probe(pctldata->dev, ret,
| 					     "failed to add function %s\n",
| 					     desc->name);
| 	}
|=20
| 	return 0;
| }
(If I had more time, I would probably go looking to see if there are
more candidates for conversion)

Jia, the helper in question is pinctrl_generic_pins_functions_dt_node_to_ma=
p().

Cheers,
Conor.

Also worth pointing out that this driver has match data but only one
supported device:
+static const struct of_device_id ur_pinctrl_of_match[] =3D {
+	{ .compatible =3D "ultrarisc,dp1000-pinctrl", .data =3D &ur_dp1000_match_=
data, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ur_pinctrl_of_match);


--H2L51F3zrIwPda2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahQgBQAKCRB4tDGHoIJi
0s10AP9DTgDQcti5DfRcBrsfVAhmbyZJcFpxIALZVJmWqj3/+QEA3os5UcG4ag4v
A3KeBR7PJTVp79ebj+O8iH6oCK3i2wE=
=UpOj
-----END PGP SIGNATURE-----

--H2L51F3zrIwPda2w--


--===============7119648199044942897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7119648199044942897==--

