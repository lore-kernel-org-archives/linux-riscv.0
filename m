Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C829CC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 19:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8f+H6g1mfGUS5p8UAkwOTgGE8fg0fULXRK0OcDrBj4=; b=O4be2IOqAaIuvqZnHelgc+roSj
	1gyHF/7rNsYqTzkxqB0xQRDOxCEyEY0iZMDNYbcYtBu6WXba60768aAGz3G0sSr8uZwgevRDcHgHV
	xJR5p7pZz4AGU8jgReX+QLZaRkrXQQJL5rAy6YkkDRCNOJezZDs5uKzSUu6d33AgZly+EEABXAYfr
	jnTK5BQ016oe6GlEmqfMpaMuHia/5Gtqx/Zg+zWc8yYKm0tISyt8KzK33398meTww3TF4XUknCIsS
	XtUdUL2i/YKQ0tRcfX9AQtFuo9QS/oQ7Q/xcmVGLFN4yZV71dq3fimtC+E3iOl+GgmHBBUJ0heYYA
	sZUKph1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41ww-0000000A7PT-0iMo;
	Tue, 08 Sep 2026 19:57:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41wv-0000000A7PH-0iJl
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 19:57:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B66A601DE;
	Tue,  8 Sep 2026 19:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5D61F00A3A;
	Tue,  8 Sep 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897464;
	bh=XxjewhJfqVpvWK6lHZafiM2N3F3gmrUHu3yO9NDfuVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ibk2TJ6AbCxCsNWmuVZMcTtt6wy6QTlt3liWJWEP4L3QXPPMIE+9dFMtvkZpghZCs
	 bLmZu9TI38oA/GHd6FJYaIlPILyWBpnZcXTDkEWjOCZzh79A40Pgo/9hJkBSjfw+8x
	 AVDSFoiga0rQqQpdV9qZP9zAy5XmoSQ+jbD/4OXPJGiMl4Pcak2EUdYKJ3W3k8P5eQ
	 rN4GTGN2/EqohEFv2erx0mSwRWxx8/NXzWsI55FZ1cmdd39FcKJioimQJNSSOKpcV7
	 MDVJB55itJxTCSzoN4kXDgWYfzccyudPWHjZJlVZTxfxROFeDma5YK23FSFR2MU1AR
	 m6w8l/BtTNXtw==
Date: Tue, 8 Sep 2026 20:57:39 +0100
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
Subject: Re: [PATCH v7 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260908-annually-catfight-39e3a1543274@spud>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
 <20260831113514.66382-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260831113514.66382-4-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============5301543811189186148=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5301543811189186148==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aKnMEl9aGObXvGYC"
Content-Disposition: inline

--aKnMEl9aGObXvGYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2026 at 04:34:56AM -0700, Changhuang Liang wrote:
> diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> new file mode 100644
> index 000000000000..6d8f5516a178
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> +
> +/* sys0 pad numbers */
> +#define PADNUM_SYS0_GPIO_A0				0
> +#define PADNUM_SYS0_GPIO_A1				1
> +#define PADNUM_SYS0_GPIO_A2				2
> +#define PADNUM_SYS0_GPIO_A3				3

Krzysztof's point [1] about these still stands. Pad indices aren't bindings.
Sure, your driver and your dts both might want to use these but that
doesn't make them a binding. For that to be the case, they need to
effectively be made up numbers - like how clocks are often listed with
numbers from 0 into the dozens or hundreds, when that may or may not
correlate with actual bits in registers, e.g. indices 0-31 in a clock
binding might be in register 1 and then 32-63 are in register 2. There's
no need for a binding here to assign meanings to numbers, because the
meanings are assigned by the hardware itself - index 0 for SYS0 *is* A0,
because that's how the hardware is designed.

Were the numbers to run continuously, so that we had

#define JHB100_PADNUM_A0	0
#define JHB100_PADNUM_A1	1
#define JHB100_PADNUM_A2	2
#define JHB100_PADNUM_A3	3
#define JHB100_PADNUM_A4	4
and so on down to
#define JHB100_PADNUM__D0	1234

then it would be a binding, because we're assigning a meaning to 1234
that's not something determined by the hardware.

FWIW, I'm happy to have the unchanged starfive,jhb100-pinctrl.h sit in
arch/riscv/boot/dts/starfive, because the defines are helpful - but as
things stand I think Krzysztof is right.

Cheers,
Conor.

1 - https://lore.kernel.org/all/ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn/

--aKnMEl9aGObXvGYC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBosgAKCRB4tDGHoIJi
0vUdAQDJk08iDuO2c5CqqTqe3Bbt2Jm+La/0mzM38iV/S+1uSQEAsuTsnqzv5q51
I8rlyu+04nDW1cZlwp1+dPzjMdDQAAY=
=GoqV
-----END PGP SIGNATURE-----

--aKnMEl9aGObXvGYC--


--===============5301543811189186148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5301543811189186148==--

