Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8781DCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gx0QTcAe8fxx3j1kNkyK/NN6rATcFc0ym1/2+zU7ZNQ=; b=cVvAHDG6TerUOuGQ6I5secxF0b
	n50wybArUzsNNf1Wz1SKU88NTvnHF9AN9uLxgPA4lQCsJLKCN6iriNKpyjgZc7Ia8YcB5uh0WIHjl
	+6i6YE2TwlfmWLgKGLu/ZebmbqWoRMvSfYxiboO6YCIB1q1waKNMHdi5syeuCZqY9OY3zeIGEGrIZ
	HRo2Ff472CQIUI5tNol9T5b+K1Q6pMIyaRDeOGQ6wYX1OBdzpv+pvwDys8y3bRvMF9EOs2Nhs6Ga8
	mWhpt+hnnC1vnj8+6G/EpTNULQOuRpa89vy5wMsDRBw3NwSKxGlHxtd7+1tk92byXfaaVeXh6jgdr
	ZFM6wXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmq5-00000005yH1-0oNY;
	Fri, 31 Oct 2025 10:58:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmq2-00000005yGY-47tS
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 10:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 676D044204;
	Fri, 31 Oct 2025 10:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997A4C4CEFD;
	Fri, 31 Oct 2025 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761908314;
	bh=LpJlMhIspbUx/F0UxN1zmCEQJYnhFqHunkuXu4FDahw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USDSA+cGrJsbV4SfrArJT9UeuUOBBAM7kuSDKgISSb3ZnEgJGLXh8TkjAvXKVk7xr
	 6Da2tW9iYt/uCbZYRfsDzpuukpW99fukSAJ6lfBo/o0EJF2EGHYag/6C8hwxdQAdVL
	 0TiRBVZ8A2q6/Pt2BTSsldapIL7vtul06kMM077jeUstGgEJvESewl7+/HsD7GvTD4
	 Bx2DOKQ07GV6bq5qFI6sCXgfZ6jfgsZiNrLhqNQgKYPyTwmHGqVRgoDVif7wZ9ZB+o
	 YqVbvd9AtKIejRvD6oUtQwxtQsceAmRqM7mE95aerQr+NKX0Gw6gyWmXIPfzLzRiQf
	 n5C3XWgBXCcgw==
Date: Fri, 31 Oct 2025 10:58:29 +0000
From: Conor Dooley <conor@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] reset: mpfs: add non-auxiliary bus probing
Message-ID: <20251031-mosaic-trimness-d683527a6866@spud>
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
 <20251029-macarena-neglector-318431fec367@spud>
 <a996e76e-8201-4b72-b4fa-0ea9ac62e6b1@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <a996e76e-8201-4b72-b4fa-0ea9ac62e6b1@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_035835_049906_B0494B48 
X-CRM114-Status: GOOD (  11.98  )
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
Content-Type: multipart/mixed; boundary="===============7763319941182087326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7763319941182087326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2eMSdNOwjosdKxAa"
Content-Disposition: inline


--2eMSdNOwjosdKxAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 09:20:17AM +0200, claudiu beznea wrote:
> On 10/29/25 18:11, Conor Dooley wrote:
> > -static int mpfs_reset_probe(struct auxiliary_device *adev,
> > -			    const struct auxiliary_device_id *id)
> > +static int mpfs_reset_mfd_probe(struct platform_device *pdev)
> >   {
> > -	struct device *dev =3D &adev->dev;
> >   	struct reset_controller_dev *rcdev;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct mpfs_reset *rst;
> > +
> > +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> > +	if (!rst)
> > +		return -ENOMEM;
> > +
> > +	rcdev =3D &rst->rcdev;
> > +	rcdev->dev =3D dev;
> > +	rcdev->ops =3D &mpfs_reset_ops;
> > +
> > +	rcdev->of_node =3D pdev->dev.parent->of_node;
> > +	rcdev->of_reset_n_cells =3D 1;
> > +	rcdev->of_xlate =3D mpfs_reset_xlate;
> > +	rcdev->nr_resets =3D MPFS_NUM_RESETS;
> > +
> > +	rst->regmap =3D device_node_to_regmap(pdev->dev.parent->of_node);
> > +	if (IS_ERR(rst->regmap))
> > +		dev_err_probe(dev, PTR_ERR(rst->regmap), "Failed to find syscon regm=
ap\n");
>=20
> Do you want to continue registering the reset controller here? rcdev->base
> is NULL, thus the reset controller ops will fail, if I'm not wrong.


Oh, good point. That line is missing a return.

--2eMSdNOwjosdKxAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQSWVQAKCRB4tDGHoIJi
0kU4AP0auWGgL7fvd2ZpPml/M7wJExlNMK6dDbH0jluNcknvYAD+MyFTGGUMPK0D
94ntVM/k3LljGZVFZDJ9Lovn1G4vFQw=
=xnj6
-----END PGP SIGNATURE-----

--2eMSdNOwjosdKxAa--


--===============7763319941182087326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7763319941182087326==--

