Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8951FCA600A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7eJ+bgTx44S/NRIEOGYUMUQ77sfmyC0kQEJMoNVDOM=; b=pq/h/6ICIDBDsP2VaU0RNIMBs8
	VDnMDfc89WOb8j+60PEBYz2oyYnKn6Gd+pN9cuJHQp/tpHUInmi00QU5JkBoh0aKI9mIhk/8uTVbf
	qeFIE/rAkVJsO6vH8i3QEuZpqwDliV676NRBB8rqsvwJMCq0WHTSnr6Zr6icWmnn3v27fl/pHzoLx
	ywpU7Lswv1P2O/0dEUdkPoSHBmeIjfRZw+l+H3KzAMFkcIkL6g37f4gXI8BlizpX04BGFT5NMYKfy
	8KQ+GsFkL7u1j9YdVmBeSfWPWxaZpw8Ywh4MtaXKRMxAK8Zj/X6DTblCx9IfTdiyFVk8oAb+3n06g
	RuUENiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiXe-00000003k6R-0l7j;
	Thu, 08 Oct 2026 07:27:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiXc-00000003k6D-2g19
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:27:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D9194393F;
	Thu,  8 Oct 2026 07:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1401F000FF;
	Thu,  8 Oct 2026 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444468;
	bh=TnWYILSYeeTCHANrL+mdG4bCULRUtRx6phf8U1pqrAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sz5Pr9IpNZ2oxDSwgeJyVdnoueFC6fMFIZuXkig6321BumIL+lyXhWe7IpIbCVPx4
	 hxghuhA79t+opuAqWp6u196b0ApYEe74znghzpHSTMzsui7GSQwnVxmzjOcGAS2OoQ
	 KXm6C0kcwFbT/fXhBRiOCIckzv2BtkBZnPw5n0HvdAlmhlddw/bMyenjEBGQ1PaUuW
	 +cucY0K3kbU1RcapsGd/bguA/N1mezNrArMjL+8sCGC61KHGKfthb6AjtcQrfZMbHI
	 K4Lmjb2LiAeGrL8s+d7Emka621IX9dldTKwhnurerBxYu0ICYWtYyVikSNheMx8it0
	 FXrFTFOjOx8Vw==
Date: Thu, 8 Oct 2026 08:27:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
Message-ID: <20261008-df80c21d73b287d09b6baa78@squawk>
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: multipart/mixed; boundary="===============3168345935306866732=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3168345935306866732==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TnlMawwbesYq3LTv"
Content-Disposition: inline

--TnlMawwbesYq3LTv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
> Domain Controller is SoC internal module which is part of APMU (Advanced
> Power Management Unit), it is responsible for managing power across multi
> power domains, which includes power on/off, isolation, power-on sequence.

You should prob mention that this APMU is already documented elsewhere.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Thanks,
Conor.

>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  include/dt-bindings/power/spacemit,k1-power.h | 14 ++++++++++++++
>  include/dt-bindings/power/spacemit,k3-power.h | 12 ++++++++++++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/include/dt-bindings/power/spacemit,k1-power.h b/include/dt-b=
indings/power/spacemit,k1-power.h
> new file mode 100644
> index 000000000000..41ef540b5c44
> --- /dev/null
> +++ b/include/dt-bindings/power/spacemit,k1-power.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> +#define _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> +
> +#define K1_PMDOMAIN_VPU		0
> +#define K1_PMDOMAIN_GPU		1
> +#define K1_PMDOMAIN_LCD		2
> +#define K1_PMDOMAIN_ISP		3
> +#define K1_PMDOMAIN_AUDIO	4
> +#define K1_PMDOMAIN_GNSS	5
> +#define K1_PMDOMAIN_HDMI	6
> +
> +#endif
> diff --git a/include/dt-bindings/power/spacemit,k3-power.h b/include/dt-b=
indings/power/spacemit,k3-power.h
> new file mode 100644
> index 000000000000..519fbf946312
> --- /dev/null
> +++ b/include/dt-bindings/power/spacemit,k3-power.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> +#define _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> +
> +#define K3_PMDOMAIN_VPU		0
> +#define K3_PMDOMAIN_GPU		1
> +#define K3_PMDOMAIN_AUDIO	2
> +#define K3_PMDOMAIN_LCD0	3
> +#define K3_PMDOMAIN_LCD1	4
> +
> +#endif
>=20
> --=20
> 2.56.0
>=20

--TnlMawwbesYq3LTv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasdF7QAKCRB4tDGHoIJi
0jpNAP436/C+jaTVphmOQBd7copLZX6MLYpjIeqQmN+rslqWtQEAnlyGn3BU55iI
w5/yDEpgYQ5j2UoKnH4u/SydQRDfCQA=
=7Zs5
-----END PGP SIGNATURE-----

--TnlMawwbesYq3LTv--


--===============3168345935306866732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3168345935306866732==--

