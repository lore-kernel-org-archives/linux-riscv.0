Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71681C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uadIWm4jciYIescRpmzdUMrrUJ65JsRA6zb1seWKPs0=; b=tGwrh43dmYtSpPW/57ZsY2sOpe
	ar3sNn8aEQJPR9OdyevKrYJHOQImh8CG0vIbTr68JIwoE3JxySzGu8FmUcMM428SNGP5t6LLuZAnS
	f2lcyBdd4oNyyYb2oAK2M8gbmD5i7wHidVlY5f+hAz8/7DANUIukoYuoNIxpzlb/oDgBxZ7aWyPsZ
	JilPjQeuJG5MIPEp9pBJmN+Zu7Wuu2kkIoMnku6L+qHNm8lpGaoNfUHv+gBOtSPd/ueB+IXJcWnCw
	77j/uf3BK0MRCNP42XucrCv0vMCxU65qfGO2v9u/nW++b8kUgtfmIDwsothbYLa02xuUUbTQFhXK1
	YFrPzTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDkt-0000000F2mk-1Xgo;
	Mon, 29 Jun 2026 15:18:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDks-0000000F2mM-2zhn
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 15:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B142460008;
	Mon, 29 Jun 2026 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247E71F000E9;
	Mon, 29 Jun 2026 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746317;
	bh=GSZ+TxGWNaG2niAtaaVMtzAEg9tVw7OTbpIMtW0jxZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h1DmZ6sCFe4mQhY1uJ65b4y0c3Ar8ciANgguGMq5fNewXL6XjMLoaTRLrZYzho7+/
	 0K2AFyC1ymLC2r+dpZpag+dfNvvnF+c0fOsH0qrmlT2icZuvwJhiR1qPax+23c/vm0
	 1tq00PBGk2aSlXl6Bg/rL33BdcDo5K/qe0p/CZezDofVF3/It1/SasiTTUzYg0EiMJ
	 YLfA01x+n7HqD3M3bIsHz2CHo70Vg1vlUlPamGBEAb7CdOwy6ilWxYEAAQCvb/eOd2
	 96z92SWkbgbv3bnISjj+UuagIZGHG4yrS9ujLmHVfbkTttGcP+QNfTFtdaAfLmVH/g
	 NqXVbQayv8SIw==
Date: Mon, 29 Jun 2026 16:18:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Yulin Lu <luyulin@eswincomputing.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: Re: Re: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl
 support
Message-ID: <20260629-dubiously-hexagon-696813d11478@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
 <20260615-that-scarf-e048ef152676@spud>
 <55962658.7bea.19f02850fe2.Coremail.luyulin@eswincomputing.com>
 <20260626-headway-rewind-93c9239bd865@wendy>
 <5d44c6d7.7c1d.19f03184fa9.Coremail.luyulin@eswincomputing.com>
 <20260626-spring-moocher-7db000f7bcc6@spud>
 <71b4dfcf.7cef.19f12bfffa7.Coremail.luyulin@eswincomputing.com>
MIME-Version: 1.0
In-Reply-To: <71b4dfcf.7cef.19f12bfffa7.Coremail.luyulin@eswincomputing.com>
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
Content-Type: multipart/mixed; boundary="===============4055749285317765003=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4055749285317765003==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EPuWmTfIlTlJXRQL"
Content-Disposition: inline

--EPuWmTfIlTlJXRQL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 05:40:00PM +0800, Yulin Lu wrote:
> &gpio1_pins {=A0 =A0 =A0 =A0/* jtag0_tck repurposed as GPIO input */
> 	bias-disable;
> 	input-enable;
> };
>=20
> &gpio2_pins {=A0 =A0 =A0 =A0/* jtag0_tms repurposed as GPIO output */
> 	bias-disable;
> 	input-disable;
> };
>=20
> If we merge them into a single node, a board DTS can only apply one
> configuration to all 4 pins simultaneously:
>=20
> &gpio_jtag_pins {
> 	bias-disable;
> 	input-enable;=A0 =A0/* forced onto all 4 pins - no per-pin control */
> };=A0=A0

Okay, I didn't notice this, sorry.

>=20
> This removes the ability for board DTS files to independently configure
> the electrical properties of each pin when they are used as GPIO for
> different purposes.
>=20
> We will send a v2 that also fixes two bugs introduced in this patch:
> rgmii0_pins and rgmii1_pins incorrectly specify function =3D "hdmi"
> instead of "rgmii", and i2s0_pins, i2s1_pins, i2s2_pins specify
> function =3D "hdmi" instead of "i2s". These would cause the mux
> requests to fail at runtime.=A0

Sure.

--EPuWmTfIlTlJXRQL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKMyAAKCRB4tDGHoIJi
0q2hAP9wIsJpbThZbGbC8hh1AMF7gHwZvsE+fNdmsWB0uQXcuQD+Kc8OZemgjkq8
3hDgHgS5KCnJU/TJBmpi3IVkbv/x0Qk=
=4xjV
-----END PGP SIGNATURE-----

--EPuWmTfIlTlJXRQL--


--===============4055749285317765003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4055749285317765003==--

