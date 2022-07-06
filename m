Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E31C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRpN+EaTTGDWHbFku7nHfr9bBz55Zw0sh5dPONvmsd0=; b=uLbQBtdtRPGMiI3YO9jWYWr0qu
	B4wVc6ug8uKsSPQry+NC8f2l46RI86vYwU2mas5nLnmjdK314SV9uXY6Cojr+nGZWe1HbKFXBfr75
	BEeAEFHcB9v5p76r7aRvze63r7P7JZzOug9M6BXCTCwonc34xxBbuGjbW0Z2VmYBT8TxtAHu8Gd9z
	hFdH8O6g0/T/je4HfED38p5vyKldTcA+Vu5yrVzpzEIV0ch0DlyciQzQ9whHtVQdP0iVKT4ufaslo
	fscaahF7AhjGJ37NKDkzSqiqXz8N6sNc7rTyrHJDPXzGdkLHp92R7z7/DtuigPXhNwSwxmqrZoLc+
	qGGBBx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zJt-0073Qm-Jx; Wed, 06 Jul 2022 07:19:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zJq-0073OU-DR
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:19:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BDF07B81B33;
	Wed,  6 Jul 2022 07:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941B5C3411C;
	Wed,  6 Jul 2022 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657091967;
	bh=FB2gZ5iWwU/2a567MT026YYSUHCSk5tzPNywBL8SsB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gulmZnpLXpwkVNG1h2iqjiRdlj+KzXD4IWAE8z8c7ef356hRD3AbS6b0Pjo/174UC
	 jq16jN9qYaqz/biFvuhK0hrBachfGHCD4LvJ875cZhn92tSkZPn+QvTiB9WYx4pBTJ
	 0bwX6VEtilDMmhFNue5bPo/P81T21At1swZYmj7SQzUFkSfdIK1Sq2kEQez7LVE6Ec
	 wWIBrOWcxwWqIlGQ+MyfgWecnUZNXscInBq2bp25NKY12ISM9GTobPvoTa0zTdCidL
	 4uaiSyq48mSOcUpjrWP67nTZ/z5nSF2LHuaoP1Nwa2nteuJYh6U52yVvnHxZwZRvTL
	 mpgsnx2xYv1uQ==
Date: Wed, 6 Jul 2022 09:19:20 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com
Subject: Re: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsU3eLA3PrceFS65@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com
References: <20220621074238.957177-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220621074238.957177-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_001930_809295_F258D16B 
X-CRM114-Status: GOOD (  17.24  )
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
Content-Type: multipart/mixed; boundary="===============1191595512436002615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1191595512436002615==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OmL4pllIGSAYh4OI"
Content-Disposition: inline


--OmL4pllIGSAYh4OI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Conor,

thank you for sending this driver.

On Tue, Jun 21, 2022 at 08:42:38AM +0100, Conor Dooley wrote:
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
>=20
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Where are the bindings? Are they already on the way upstream?

>  drivers/i2c/busses/i2c-microchip-core.c | 486 ++++++++++++++++++++++++

The biggest remark I have is to rename the driver a little. Usually a
"-core" suffix means that there are other drivers like "-platform" or
"-pci" use this core. Would "i2c-microchip-fpga" or
"i2c-microchip-corei2c" work for you?

> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>

Do you really need that?

=2E..

> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +	u32 status =3D idev->isr_status;
> +	u8 ctrl;
> +	bool last_byte =3D false, finished =3D false;
> +
> +	if (!idev->buf)
> +		return IRQ_NONE;
> +
> +	switch (status) {
> +	case STATUS_M_START_SENT:
> +	case STATUS_M_REPEATED_START_SENT:
> +		ctrl =3D readb(idev->base + CORE_I2C_CTRL);
> +		ctrl &=3D ~CTRL_STA;
> +		writeb(idev->addr, idev->base + CORE_I2C_DATA);
> +		writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len <=3D 0)
> +			finished =3D true;

How can it happen that len is < 0? Wouldn't that be an error case?

=2E..

> +static u32 mchp_corei2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;

Have you testes SMBUS_QUICK as well?

=2E..

> +	idev->dev =3D &pdev->dev;
> +	init_completion(&idev->msg_complete);
> +	spin_lock_init(&idev->lock);

You never use this lock.

=2E..

> +	idev->adapter.owner =3D THIS_MODULE;
> +	idev->adapter.algo =3D &mchp_corei2c_algo;
> +	idev->adapter.dev.parent =3D &pdev->dev;
> +	idev->adapter.dev.of_node =3D pdev->dev.of_node;
> +	idev->adapter.timeout =3D MICROCHIP_I2C_TIMEOUT;

Simply use HZ here?

All in all, only minor stuff. Driver looks really good in general.

Thanks and happy hacking,

   Wolfram


--OmL4pllIGSAYh4OI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFN3MACgkQFA3kzBSg
Kba8NRAAqyqEH6g74uljPcXWAkLi3roPje6JaNcEUiOq3uuDxx9YV5NA5iGAB5Tr
kxGim4tON8th0+soWiJDwimGPBE5Qjpe6sbn5gWT5AVp/3yPeo4eJTId/ck8siSu
ocINGQuQrSNY3obDX+t6gkWPbl8i4/DKwuGZf1/O3zTBS+HdlFuiWQHUAEmyQe5d
aBEg2+zXHiU4F317yDZaZSHWpbljfqlFYzF4KiLL9tuQjY2Hfk1Zp0eQYbj00Eke
4h0khf3y0smBvb2LDPL/BqDBxBK+1iZ1pmuFbmIdEvj77dUcfWvobZDcl1H/CefE
UhMET1HczdIw4K/RpUugCzyKQmTs7Z9TOB59U8pI+xZqr1XUq8qGawtrbZbVw1fV
BGIDShROfHS3sYd6yEDAg4fQJo2VHxSvqqeBk01Js2JMnB2iTB/LgUw45DqgViAU
8q5f77M+DGHOlxbjCCwr04Xf8iE8rZUl3pBAjC4rBN0LUoBT/BdkGf/xwGvaU3eg
DId0nedud9Zb+dMwHa9OcJBdrpI6xy7Wsg0PWa3xseB0TokNws+1HzPEHNU6jVJR
ej+IrfqaKPbyuaAH0QO/82qdwgW80uBuL9qp+/XcsK6yKdXH5r/a3FOwRCar6cil
W8eS6gjbP79w47yTAFJFEwae/wDZM0/EyEWF4YxWSe89sFjYJw4=
=R64A
-----END PGP SIGNATURE-----

--OmL4pllIGSAYh4OI--


--===============1191595512436002615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1191595512436002615==--

