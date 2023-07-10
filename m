Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F2EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbOrNcAlnoeEBWfvnwpZC+L/Xmvjfr5cgiz+1WbFZ88=; b=juzd5BgA7dulYfhpyARYcXySkW
	y9mTGHG4cRkHjTy0CRWZvBrnw7O38T3AYwbgU+Jx7aj3VU5g6hOmVGlewQrB47Az2GqgIYiqK/8RF
	HOf/rNTofvKhaLP2NUhf36no1BF3Fvkc+v/eoDNLNLwXWIwWdKXM2i2L+K7ggDTpCD0mmEBISQBaV
	M7+3dzexutfLalMRoAqLJKAxVVhzFbynwei1fGtmbzWU/sn5HOwcmOOvStDCiHAgFwqBMEzLfJVfG
	3ffph6Xm8i70qHAKFAfUL3cznIXS61xLJQvpLXoM5Zxsml4+B71+aSbiy+Y7eRXc03Y/6YKznKLzx
	cZw2pqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvcL-00CSZV-1K;
	Mon, 10 Jul 2023 18:28:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvcJ-00CSZ8-1C
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 18:28:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8B2261157;
	Mon, 10 Jul 2023 18:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5C7C433C7;
	Mon, 10 Jul 2023 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689013690;
	bh=3cEI8jFkOTOGNVblYnm1wjEjkydkAdSYYTHa2XVe8Wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTIuZKQ0i0CbTrehTO/hSAjxqwZ3XRhJ8CA6d0KpZYOHPHXRx3FY8YN7CSleZoGp9
	 EkbA7WDC7RFPfvJ4jdunfb/iG7H4x3UOWoWQneljSv5d9UxKJgndk7ROTXhv7EHn/4
	 LqOyGC2u/M2q687yk0vgYpfeY3yc2maJ2mWYeQrWYVeeh/SnjfNON9ebPDjUtK2wSm
	 mjSYptWK9yxolE0/hGM94B7AaBwn+m9dAygDoMB5zKT4mI+Cvv/Z8m2XwLUy3oB7QX
	 98Wb/4Y4bzzdFh2Md1BYu8fSGib9rZuQSLKE+KOpA0M+rTQ8F6b6xZojpnMyXixF5Y
	 H2dvKg1IbG5/Q==
Date: Mon, 10 Jul 2023 19:28:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Moessbauer <felix.moessbauer@siemens.com>,
	Walker Chen <walker.chen@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Daniel Bovensiepen <daniel.bovensiepen@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for
 starfive devices
Message-ID: <20230710-villain-dainty-d1a90ce57a27@spud>
References: <20230627080620.329873-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
In-Reply-To: <20230627080620.329873-1-felix.moessbauer@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_112811_518247_90DD13A7 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Type: multipart/mixed; boundary="===============3831915044420180378=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3831915044420180378==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MTGoKLMunEpeFoDx"
Content-Disposition: inline


--MTGoKLMunEpeFoDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Emil, Walker,

On Tue, Jun 27, 2023 at 04:06:20PM +0800, Felix Moessbauer wrote:
> Add the '-@' DTC option for the starfive devices. This option
> populates the '__symbols__' node that contains all the necessary symbols
> for supporting device-tree overlays (for instance from the firmware or
> the bootloader) on these devices.
>=20
> The starfive devices allow various modules to be connected and this
> enables users to create out-of-tree device-tree overlays for these module=
s.
>=20
> Please note that this change does increase the size of the resulting DTB
> by ~20%. For example, with v6.4 increase in size is as follows:

Whatcha think?

> jh7100-beaglev-starlight.dtb 6192 -> 7339
> jh7100-starfive-visionfive-v1.dtb 6281 -> 7428
> jh7110-starfive-visionfive-2-v1.2a.dtb 11101 -> 13447
> jh7110-starfive-visionfive-2-v1.3b.dtb 11101 -> 13447
>=20
> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/=
starfive/Makefile
> index 170956846d49..0141504c0f5c 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,4 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
> +# Enables support for device-tree overlays
> +DTC_FLAGS_jh7100-beaglev-starlight :=3D -@
> +DTC_FLAGS_jh7100-starfive-visionfive-v1 :=3D -@
> +DTC_FLAGS_jh7110-starfive-visionfive-2-v1.2a :=3D -@
> +DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b :=3D -@
> +
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7100-beaglev-starlight.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7100-starfive-visionfive-v1.dtb
> =20
> --=20
> 2.39.2
>=20

--MTGoKLMunEpeFoDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKxNtgAKCRB4tDGHoIJi
0l9xAQCftFaO6Lwn6sxOnIF0Vd1kVEIz5wi5s9sxgRd8EYtkoQEAxJt7CLfD3oNi
SRAhiqUnDeuBQpFLNILY+tXRQVKE4A0=
=GH7D
-----END PGP SIGNATURE-----

--MTGoKLMunEpeFoDx--


--===============3831915044420180378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3831915044420180378==--

