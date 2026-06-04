Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0145CD6E77
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flW9tWoHu18bA//K4SjEYEvggPbqw/np683lkmYHe1c=; b=s8bU7JX+B+mDMqUmRRVDVJS5IR
	xjw21+uMH1DQwUtYswuBSV5P3Qdd8nFP+79XG0RW/jMJFl9+RY6NPGcZaqHDQG+QXif1kumaYuIpT
	N8YPzc09bEAslSgSQ8xXBkCknv67BfY+zoA5H7taYllMGO4S5OkYblbYmLbk5hj1VpQ9+qr5bF/m7
	fS+sdX1zxqTou43JiDGxgEtY2NUXkMf9t6JMiIay0GZC5giyMdy6sl0w1aHBw+/6zD9rLcFSI/UO0
	2zIXhr7desMu4wv6+SgUf2FcqKfPraatxdx2lRFlgQD8z3jIsjalTy2sBJLIKO47uo8Bxbw4iPdvE
	nO9YMnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBEb-0000000H6D8-0yAx;
	Thu, 04 Jun 2026 16:47:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBEZ-0000000H6Cf-2X2l
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 16:47:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EFD460052;
	Thu,  4 Jun 2026 16:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976151F00893;
	Thu,  4 Jun 2026 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591674;
	bh=nasvWE4HN6FoYWPjRuasq47sL/PqP5x+XqWIasfwnkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HgWfs5EtBRK3Zvzs3hNPbxFaPrdIqthSWJg27cbrhryRmcLyxQ07Trc46m973UL9h
	 MeBnnHcPgMdWGdfRjgVJQImhLInOl+8PE96XrEHLQpKLKlUR5Y4cWDf9ma2tNjXUwi
	 NehfmOM4cKVdZzPG5isbSZ2OzgX/mEIg6LpX3moOBFNZa/pKjZlxU/8LOYHXF+Akap
	 HX8yy0XE5pCfypTZ80wtSuzQRJ0z68WL6h77gR5BP4fUrC/rpXhseLibj7IK+58KwC
	 62PLLswizXoGdarT6JuXzTTiWUZuL/i+ODBXqf5bK2ltqHzae9PttvwLfMDTYFksum
	 036BEUSDCZrWQ==
Date: Thu, 4 Jun 2026 17:47:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Message-ID: <20260604-pacifier-sludge-196f47ab3c11@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-8-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260604143957.668047-8-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============2138886191601745225=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2138886191601745225==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7nOzAiGyNegD+Wr6"
Content-Disposition: inline


--7nOzAiGyNegD+Wr6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 12:09:53AM +0930, Joel Stanley wrote:
> Add initial support for the Tenstorrent Atlantis platform, based on the
> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>=20
> The evb machine represents an internal bringup vehicle with just the
> interrupt controllers and a UART. This will be replaced in time with a
> full featured machine once details are available.
>=20
> Co-developed-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Update mtimer compatible
>  - Add Drew's co-developed-by
>  - Correct aplic num-sources count
> ---
>  arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
>  .../boot/dts/tenstorrent/atlantis-evb.dts     |  33 ++
>  .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 471 ++++++++++++++++++
>  3 files changed, 505 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
>  create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/tenstorrent/Makefile b/arch/riscv/boot/d=
ts/tenstorrent/Makefile
> index 2c81faaba462..92d8bb1a683f 100644
> --- a/arch/riscv/boot/dts/tenstorrent/Makefile
> +++ b/arch/riscv/boot/dts/tenstorrent/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_TENSTORRENT) +=3D blackhole-card.dtb
> +dtb-$(CONFIG_ARCH_TENSTORRENT) +=3D atlantis-evb.dtb
> diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/risc=
v/boot/dts/tenstorrent/atlantis-evb.dts
> new file mode 100644
> index 000000000000..06259cca8357
> --- /dev/null
> +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/dts-v1/;
> +
> +#include "atlantis-soc.dtsi"
> +
> +/ {
> +	model =3D "Tenstorrent Atlantis development platform";
> +	compatible =3D "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
> +
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x00000000 0x0 0x80000000>,
> +		      <0x1 0x80000000 0x0 0x80000000>;
> +	};
> +
> +	aliases {
> +		serial0 =3D &uart1;
> +	};
> +
> +	chosen {
> +		bootargs =3D "earlycon console=3DttyS0";

FYI, this should not be in here.

> +		stdout-path =3D "serial0";
> +	};
> +};
> +
> +&uart1 {
> +	/delete-property/ clocks;

Why are you doing this? Looks kinda suspect!

> +	clock-frequency =3D <5000000>;
> +	status =3D "okay";
> +};

--7nOzAiGyNegD+Wr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGsNQAKCRB4tDGHoIJi
0k11APoC9uyXuvUKHUahGQCA8rahOvHmjS5NyUcgIE0C3qEMzQEAh+rjnggmJGjZ
X3am5MjUhIm+dr8M92IwCqWuPfr+7gA=
=PLbm
-----END PGP SIGNATURE-----

--7nOzAiGyNegD+Wr6--


--===============2138886191601745225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2138886191601745225==--

