Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8BDCF9C6F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyRBGeORn1vJFtneM79lE9RX2w3eK4VM1LnwEjO9TD8=; b=pqJydukUxDbXM8ASWcyVs1b3Ma
	5z+bVxz1Uy317RUNJRsL26s+wfLsYigSJlLMX3ZeSGXJMSKblEeFsv530wPK2h8z7BqpjXy+KtezP
	XzoitbrKfLxhYaT6D4MMSkloBUq0jhP+BU7sboWs3TRjCy93M7PoxxvoKcUwKSA8h5dI0pEx4Z8t0
	PqXFYWkkUO4GoMrgEZBBZH/okenGgU1jvfv+DCUkjQWNL73D8f4tgJYmHDvQ81Oop4nYVj7pODThD
	kgWuyUKCWusn6gzmSBiCUbVpAErTr1WoWsdf1i4Re7etmts+wf8k+/wp9XrNffLxkWXu6bWvhLzVE
	WmJqS/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfVn-0000000Gqt9-2mur;
	Mon, 23 Sep 2024 09:37:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfVk-0000000Gqsn-3Nxp
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 09:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DBEE5C009C;
	Mon, 23 Sep 2024 09:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CAEC4CEC4;
	Mon, 23 Sep 2024 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727084259;
	bh=w3AXe7Q7QQ2NbwO91Ot+VgUMJcArPUctZY4zNwKUOLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aY3GGgTUzXPqD0IvOVjLBC+pCX5A2+Wp0O1iTfphzGduzGxqjZiiJtQjnQ2MI6/TV
	 Gg0GuVNGAOpkKcsEbzaUsGgwkDereXbpeHH2OYIc4c4rMR3hbrGrbwW30W85CJYGTR
	 11/MtlSOovKbKzbChcuEJSwp3mkbOM+dGt8s50Vi+wQhxOH//Z/9xkw0jmCtnZYGOW
	 WLD5/V/B0LFrW55hmItPr3oq4wUqJq90ZVBM8hHspbixOzN2pYVv0d2XI0CmxpAofX
	 UJotxLa6WZ7RtXkIl9xGcwCagBgB8a+wDN9+6173DGkvX1PZFz0aa0gRbh/sBaFNnH
	 AB0DYIfw3O1oA==
Date: Mon, 23 Sep 2024 10:37:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv:dts:starfive:add framework dts
Message-ID: <20240923-rehydrate-daintily-1199bce1456c@spud>
References: <20240923053621.1585972-2-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
In-Reply-To: <20240923053621.1585972-2-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_023741_003136_268E4D05 
X-CRM114-Status: GOOD (  22.40  )
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
Content-Type: multipart/mixed; boundary="===============1397783923476072239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1397783923476072239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vaw+pNIvYxNDsg5l"
Content-Disposition: inline


--vaw+pNIvYxNDsg5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Firstly your $subject should have a space after each :

On Mon, Sep 23, 2024 at 01:36:20PM +0800, Sandie Cao wrote:
> Add dts to support RISC-V Framework Laptop 13 Mainboard.=20
>=20
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../boot/dts/starfive/jh7110-framework.dts    | 35 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts
>=20
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/=
starfive/Makefile
> index 7a163a7d6ba3..ebc8966fde0c 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -12,3 +12,4 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-mars.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-framework.dtb

Can you add this in alphanumerical order please?

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-framework.dts b/arch/ris=
cv/boot/dts/starfive/jh7110-framework.dts
> new file mode 100644
> index 000000000000..4da7ade5c8e7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-framework.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +	model =3D "jh7110 framework";
> +	compatible =3D "jh7110 framework", "starfive,jh7110";

"jh7110 framework" is not a real compatible (you need a vendor prefix
and no spaces) nor is it documented - which produces warnings:
arch/riscv/boot/dts/starfive/jh7110-framework.dtb: /: compatible: 'oneOf' c=
onditional failed, one must be fixed:
        'jh7110 framework' is not one of ['beagle,beaglev-starlight-jh7100-=
r0', 'starfive,visionfive-v1']
        'jh7110 framework' is not one of ['milkv,mars', 'pine64,star64', 's=
tarfive,visionfive-2-v1.2a', 'starfive,visionfive-2-v1.3b']
        'starfive,jh7100' was expected
        from schema $id: http://devicetree.org/schemas/riscv/starfive.yaml#
arch/riscv/boot/dts/starfive/jh7110-framework.dtb: /: compatible:0: 'jh7110=
 framework' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
        from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/riscv/boot/dts/starfive/jh7110-framework.dtb: /: failed to match any s=
chema with compatible: ['jh7110 framework', 'starfive,jh7110']

Please run dtbs_check on future versions and fix reported warnings
by documenting things in dt-bindings.
"jh7110 framework" isn't very specific, so if there's a model number
attached to the mainboard that'd be good to have. The vendor in the
vendor prefix should be deepcomputing, so you'll likely have to add a
new vendor prefix for that.

The model field could also be improved, check out the visionfive 2 and
see how that property was written there.


> +};
> +
> +&gmac0 {
> +	status =3D "disabled";
> +};
> +
> +&gmac1 {
> +	status =3D "disabled";
> +};
> +
> +&usb0 {
> +	dr_mode =3D "host"; /*host or peripheral*/

What does the comment here mean?

Cheers,
Conor.

> +	status =3D "okay";
> +};
> +
> +&pwmdac {
> +	status =3D "disabled";
> +};
> +
> +
> +&pcie0 {
> +	status =3D "disabled";
> +};
> --=20
> 2.34.1
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--vaw+pNIvYxNDsg5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvE23wAKCRB4tDGHoIJi
0gyvAQDz1vZH2TIvBpTQC58kuTqgGDt/GaaUbL8JEK34HqmPngEAkbAv7lmlYVTe
qxriIGgNgbxTqp7ZIFQHEzAcLKDa6Ak=
=sUq6
-----END PGP SIGNATURE-----

--vaw+pNIvYxNDsg5l--


--===============1397783923476072239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1397783923476072239==--

