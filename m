Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F997E9B365
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5/ouf8gtCbSjfWQd8pOpK0AsCAg7fOqWSnqPfRpsbs=; b=IKYMY+PklgNGzap36DZGolmGaN
	EMOlinno2/Xx1ekKWkWtOmTFcT2uhcaRrrc5uiHaeFAS5KNa3st1luzkpYI1CPT9IknI4WZK6GjtW
	uNKDwZnfe9zG1ZVKVee55cCKnAboCluEcKxjUJqCXw6A3yld4Ml3bwWkWbGku657hDAHaw9yvpHaZ
	y7xGpA9sl3WaTUoh1G7+LdrGTTnXIOMizDADOpcw3BVCbq45Ws9ZVTttRkPIxi7FyB3hsmrJ0hTLS
	5KCdM7hQQGlJ3Z1feuBCwN89mKfNRuH5MbwryKBF8xzNL22G6x1USEeK/eKfd3jJjiW/J2SPCVfQG
	P5Mz2reA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1MU-0000000Cocg-0PJ5;
	Mon, 02 Mar 2026 11:22:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1MT-0000000Coc1-2IfZ
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9421160051;
	Mon,  2 Mar 2026 11:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41594C19423;
	Mon,  2 Mar 2026 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772450572;
	bh=F0RpYt/xYTOulkmg02m2V9erbUhS84/fAQaXNHW+3g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CR72+dybgJuzcXVs9t6MsaU3kgYio0aW4iyiq+8DDBa4Hp0xPahs91KnZzNlJi+39
	 q+1F19YAAddZapkFrbdppsoi/fWeqctM2ZSRDpbPyoAEkvbFCVdWlhLMpPceTE9RyT
	 p4PRJzG2AuS98u3GcUGem0WxKdf1DPdf6lij4dIlPizzG+bBiEWWwhoaEIc4eQiz6p
	 +WbdF3pEke1x6IZS53RH4XiiR86KAi2PiShsMHesUgX1WW3n92NHjwHwHFeFdU3KcQ
	 rXhs7Mb+oePBHvBR5NiUCVb2hb3SZrF41baleICzesAHEBzRyoKuEszi/e/b7tZPvT
	 H+1N1uDeoatBg==
Date: Mon, 2 Mar 2026 11:22:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v11 3/4] soc: microchip: add mpfs gpio interrupt mux driver
Message-ID: <20260302-spoiling-bullring-9b7fcdd805ee@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
 <20260227-flashing-overcast-85ff59b2e82c@spud>
 <20260302105824.21b5c7d6@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260302105824.21b5c7d6@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============4324254611489508842=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4324254611489508842==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaZPhkjkO4quy2lU"
Content-Disposition: inline


--jaZPhkjkO4quy2lU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2026 at 10:58:24AM +0100, Herve Codina wrote:
> Hi Conor,
>=20
> On Fri, 27 Feb 2026 14:52:29 +0000
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On PolarFire SoC there are more GPIO interrupts than there are interrupt
> > lines available on the PLIC, and a runtime configurable mux is used to
> > decide which interrupts are assigned direct connections to the PLIC &
> > which are relegated to sharing a line.
> >=20
> > Add a driver so that Linux can set the mux based on the interrupt
> > mapping in the devicetree.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> ...
>=20
> > --- a/drivers/soc/microchip/Kconfig
> > +++ b/drivers/soc/microchip/Kconfig
> > @@ -1,3 +1,14 @@
> > +config POLARFIRE_SOC_IRQ_MUX
> > +	bool "Microchip PolarFire SoC's GPIO IRQ Mux"
> > +	depends on ARCH_MICROCHIP
> > +	select REGMAP
> > +	select REGMAP_MMIO
> > +	default y
> > +	help
> > +	  Support for the interrupt mux on Polarfire SoC. It sits between
> > +	  the GPIO controllers and the PLIC, as only 35 interrupts are shared
> > +	  between 3 GPIO controllers with 32 interrupts each.
>=20
> 35 interrupts ?

I copy-pasted this from Kconfig text for the other mux implementation
that's been floating around since 6.10. I should have double checked
it. I think the 35 came from 32 + 3, not realising that there are 6
lines on GPIO controller 1 that are always in "direct" mode. When I
wrote that description I must have thought those 6 were always in
"non-direct" mode.

> Previously (other patches) you mentionned 41 (38 + 3).
>=20
> Also 32 interrutps on each (3 * 32 =3D 96) but you talked about 70 on pre=
vious
> patches.
>=20
> Can you double check or clarify those numbers ?

Yeah, this whole description is not good, 70 and 38 + 3 are correct.
The controllers have 14, 24 and 32 lines.

> ...
> > +++ b/drivers/soc/microchip/mpfs-irqmux.c
> > @@ -0,0 +1,167 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Largely copied from rzn1_irqmux.c
> > + */
> > +
> > +#include <linux/bitmap.h>
> > +#include <linux/bitops.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MPFS_IRQMUX_CR		0x54
> > +#define MPFS_IRQMUX_NUM_OUTPUTS	70
>=20
> Is 70 really the outputs ?
>=20
> According to previous patches, I would say 41 (38+3).

I guess in my head the direction was PLIC -> MUX -> GPIO, cos that's the
way the software follows the chain, so the mux would have 41 inputs and
70 outputs.

> ...
> > +static int mpfs_irqmux_probe(struct platform_device *pdev)
> > +{
> > +	DECLARE_BITMAP(line_done, MPFS_IRQMUX_NUM_OUTPUTS) =3D {};
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *np =3D dev->of_node;
> > +	struct of_imap_parser imap_parser;
> > +	struct of_imap_item imap_item;
> > +	struct regmap *regmap;
> > +	int ret, direct_mode, line, controller, gpio;
>=20
> Reverse Xmas tree.
>=20
> > +	u32 tmp, val =3D 0, old;
>=20
> ...
> > +	for_each_of_imap_item(&imap_parser, &imap_item) {
> > +
> > +		direct_mode =3D mpfs_irqmux_is_direct_mode(dev, &imap_item.parent_ar=
gs);
> > +		if (direct_mode < 0) {
> > +			of_node_put(imap_item.parent_args.np);
> > +			return direct_mode;
> > +		}
> > +
> > +		line =3D imap_item.child_imap[0];
> > +		gpio =3D line % 32;
> > +		controller =3D line / 32;
> > +
> > +		if (controller > 2) {
> > +			of_node_put(imap_item.parent_args.np);
> > +			dev_err(dev, "child interrupt number too large: %d\n", line);
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (test_and_set_bit(line, line_done)) {
>=20
> Your bitmap size is MPFS_IRQMUX_NUM_OUTPUTS but you your line variable can
> have values from 0 to 95.

I think this is one of the things that kinda made sense when I started
copying your work, but by the time I was done I had diverged enough that
it didn't really make sense any more. Probably I should keep the check,
but increase the bitmap to 96, not as if packing is going to make a
worthwhile saving.

> Maybe some checks on imap_item.child_imap[0] or line could be added in
> order to be be sure that line value will fit in the bitmap.
>=20
>=20
> > +			of_node_put(imap_item.parent_args.np);
> > +			dev_err(dev, "Mux output line %d already defined in interrupt-map\n=
",
> > +				line);
>=20
> line is computed from imap_item.child_imap[0]. It is the input and not the
> output.

That's the starting point being the PLIC versus the GPIO controller. I
should probably swap that stuff around I guess?

>=20
> In rzn1-irqmux.c, the bitmap is used to avoid multiple input lines using =
the same
> output line. Bitmap bits represent outputs.

I considered checking the other side too, but excluding the 3 shared
interrupts. Do you think that is worthwhile here? Reuse of what you call
"output lines" is obviously something that I allow, I wanted to make
sure that, as I mandated 70 entries in the property, that they were all
unique.

> > +			return -EINVAL;
> > +		}
> > +
> > +		/*
> > +		 * There are 41 interrupts assigned to GPIOs, of which 38 are "direc=
t". Since the
> > +		 * mux has 32 bits only, 6 of these exclusive/"direct" interrupts re=
main. These
> > +		 * are used by GPIO controller 1's lines 18 to 23. Nothing needs to =
be done
> > +		 * for these interrupts.
> > +		 */
> > +		if (controller =3D=3D 1 && gpio >=3D 18)
> > +			continue;
> > +
> > +		/*
> > +		 * The mux has a single register, where bits 0 to 13 mux between GPI=
O controller
> > +		 * 1's 14 GPIOs and GPIO controller 2's first 14 GPIOs. The remainin=
g bits mux
> > +		 * between the first 18 GPIOs of controller 1 and the last 18 GPIOS =
of
> > +		 * controller 2. If a bit in the mux's control register is set, the
> > +		 * corresponding interrupt line for GPIO controller 0 or 1 will be p=
ut in
> > +		 * "non-direct" mode. If cleared, the "fabric" controller's will.
> > +		 *
> > +		 * Register layout:
> > +		 *    GPIO 1 interrupt line 17 | mux bit 31 | GPIO 2 interrupt line =
31
> > +		 *    ...                      | ...        | ...
> > +		 *    ...                      | ...        | ...
> > +		 *    GPIO 1 interrupt line  0 | mux bit 14 | GPIO 2 interrupt line =
14
> > +		 *    GPIO 0 interrupt line 13 | mux bit 13 | GPIO 2 interrupt line =
13
> > +		 *    ...                      | ...        | ...
> > +		 *    ...                      | ...        | ...
> > +		 *    GPIO 0 interrupt line  0 | mux bit  0 | GPIO 2 interrupt line =
 0
> > +		 *
> > +		 * As the binding mandates 70 items, one for each GPIO line, there's=
 no need to
> > +		 * handle anything for GPIO controller 2, since the bit will be set =
for the
> > +		 * corresponding line in GPIO controller 0 or 1.
>=20
> Hum, what happen if the interrupts property is set in the GPIO controller=
 2 and not
> GPIO controllers 0 or 1.
>=20
> Is it legit ?
>=20
> If so, should lines coming from GPIO controller 2 be took into account ?
>=20
> Maybe my comment is not relevant due to some misunderstanding in the not
> so obvious mapping.

My logic here was that what is done in the controller nodes doesn't
matter, because I will always mandate that if the map property is
provided in the mux node that it has 70 items. Even if controller 0 and
1 are not used, this driver will still be able to read the mappings for
them and set the mux correctly. Whether or not there's an interrupts
property in any of the controllers shouldn't matter here at all, when it
comes to writing the mux, right?

Thanks for taking a look at the series :+1:

Cheers,
Conor.

>=20
> > +		 */
> > +		if (controller =3D=3D 2)
> > +			continue;
> > +
> > +		/*
> > +		 * If in direct mode, the bit is cleared, nothing needs to be done a=
s val is zero
> > +		 * initialised and that's the direct mode setting for GPIO controlle=
r 0 and 1.
> > +		 */
> > +		if (direct_mode)
> > +			continue;
> > +
> > +		if (controller =3D=3D 0)
> > +			val |=3D 1U << gpio;
> > +		else
> > +			val |=3D 1U << (gpio + 14);
> > +	}
> > +
> > +	regmap_read(regmap, MPFS_IRQMUX_CR, &old);
> > +	regmap_write(regmap, MPFS_IRQMUX_CR, val);
> > +
> > +	if (val !=3D old)
> > +		dev_info(dev, "firmware mux setting of 0x%x overwritten to 0x%x\n", =
old, val);
> > +
> > +	return 0;
> > +}
> > +


--jaZPhkjkO4quy2lU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaVzBgAKCRB4tDGHoIJi
0guBAP4vIUOOxg9ScxoguhFsRG4Y9tA56aRMtey847+h1+MqmAEAjoxupnv3mR5g
9yUWvt9idB6qe/LPGkLbHgqN+rzfpAg=
=WPAE
-----END PGP SIGNATURE-----

--jaZPhkjkO4quy2lU--


--===============4324254611489508842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4324254611489508842==--

