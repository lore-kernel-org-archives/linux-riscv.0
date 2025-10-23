Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF2ECCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o3BEZ2u343aHqmRxk4lSfykMJSa1/5/rtJLtI+JHSg=; b=rcSf9V0fo1Iy+9UXYh2fYiLDI+
	n8LEUstGYBx9lexx2y568b//MTD/VeEjESDlUK40g/9Of4nIU7fJrz621aFHMeJaDDkbRV6tJ6Fas
	8ZQ/TfE2APTB4Sn4z/77HsyY97+W/gTswbNlQKHJ8r1HI629V1C6w8mokj62gCzW3W6N8mMakROwl
	uIoYby2wjFShIQqh13+R3O+vi54CUCnyrZh7Km7/lrBpR9REUr7NMKmIYOJWDkgilrvWcrEC6nw/g
	dC+0sa1qiCKFq5+GD1bwpAaiE0p4V4zQIOaFux0NhxCxiexP19M2E8Gt/MdNzYNA5FXiOWCI4/NJO
	iotRZwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsMZ-00000005qgB-3USO;
	Thu, 23 Oct 2025 10:16:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsMV-00000005qfa-2i36
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 10:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D5E643431;
	Thu, 23 Oct 2025 10:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D21C4CEE7;
	Thu, 23 Oct 2025 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761214563;
	bh=Qoq11BGqvkxVwMNEuM/bZS1B2O08L278ut2rS1S1fgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3FIR+EAQzLA9WMfD2hf8OIGX5DcFSBTy3HmkSFIw1cx+H2bG8i84ILlXPYujN3zX
	 GiMglKaOuxphgeI04VKuBvb8pYqp33ovmKkMzn+2zRH9jJH/sE84YZad5kVcVi11Q+
	 9q0Ee0YfADxwWXwo1XSNovV4DTmc80xN0bzgWTk4K5jOIk1RFQ8sTZUf0xkkfpBRLd
	 IrwBqEzi+v6S8Sq8UztXuwwvq9ISIsu0QnBUyZVVCV2Y7khdrNFgQLbFcy22lWkrx0
	 XP72QjzJJsEILrHGtZVepBzxXjUCdFv9AfrF07+t8Ur8Ux7bnjyRVZCIrxjx5m/Zhr
	 nvYQz8frZoFKw==
Date: Thu, 23 Oct 2025 11:15:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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
Subject: Re: [PATCH v5 2/9] soc: microchip: add mfd drivers for two syscon
 regions on PolarFire SoC
Message-ID: <20251023-nearest-degraded-3251be49a9f3@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-patient-matrimony-6162c8f92e2e@spud>
 <41dbea85-8aa1-4034-8106-e28c37e398b8@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <41dbea85-8aa1-4034-8106-e28c37e398b8@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_031603_704253_F4FCADC9 
X-CRM114-Status: GOOD (  17.08  )
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
Content-Type: multipart/mixed; boundary="===============3695082307170190419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3695082307170190419==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0UXaLwXf/3vG+/ZL"
Content-Disposition: inline


--0UXaLwXf/3vG+/ZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 07:04:33AM +0300, Claudiu Beznea wrote:
> On 10/13/25 20:45, Conor Dooley wrote:
> > +++ b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/array_size.h>
>=20
> Looks like this one can be dropped or maybe you want to use
> ARRAY_SIZE(mpfs_mss_top_sysreg_devs) as 4th argument of mfd_add_devices()
>=20
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
>=20
> Unused?
>=20
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of_platform.h>
>=20
> Unused?

This one is where devm_of_platform_populate comes from.

>=20
> > +#include <linux/platform_device.h>
> > +
> > +static const struct mfd_cell mpfs_mss_top_sysreg_devs[] =3D {
> > +	{ .name =3D "mpfs-reset", },
>=20
> MFD_CELL_NAME() ?
>=20
> > +};
> > +
> > +static int mpfs_mss_top_sysreg_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	int ret;
> > +
> > +	ret =3D mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_mss_top_sysreg=
_devs,
> > +			      1, NULL, 0, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (devm_of_platform_populate(dev))
> > +		dev_err(dev, "Error populating children\n");
>=20
> Is it OK return 0 above if there are failures here?

I think my rationale was that the mfd devices would be able to keep
working, but I think ultimately it doesn't matter much and I'll change
it.

--0UXaLwXf/3vG+/ZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPoAXQAKCRB4tDGHoIJi
0goxAQC+usQ0fI+QSsuzOsbPEYH8G0hqmNdvhMt5bJHkfhlrogD/bWGwXivOIj5O
KNK25WPStVbjDr7irJm+5ukdrJVMlA4=
=8/Q9
-----END PGP SIGNATURE-----

--0UXaLwXf/3vG+/ZL--


--===============3695082307170190419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3695082307170190419==--

