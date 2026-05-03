Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249DFCD3424
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GMRq+OODM1y6O2egbnw+QwkDHvzBrynCSCtrEDRuuo=; b=tZjFMrDAeo3etH8n/Mz/j51fGA
	JWI2LiG3h9Iog63As8jtua94TawK9AfT2L+qbm8wAEKpXvTGAOLTAdeuYM7ja3FC3h3dKEutqelMD
	NF6QcEYw1uBv5V5Ik9qtYsvzHdub+KcNdapbj1ZoAvWozn32kPn+yVz8KniZBAb1MOZnO+9DSYH1A
	XjUGbdsMkjEIj8sUKHxRZJuwr1mOA9DeK54j60nlQCibmVrFo6zOF/6yIjf+RtiTwvKPQxAhYYliN
	DCY8iX0tPvTDV08/uFIKOK6awcR+FbbMJU+GG1t2j+2JF1K4enYT4/rNYpu4N5+5KTL4c/NB/PRxu
	ks9/uEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJb2L-0000000BSDb-2i3d;
	Sun, 03 May 2026 17:55:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJb2K-0000000BSDE-0QvT
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 17:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 019AE60120;
	Sun,  3 May 2026 17:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B362EC2BCB9;
	Sun,  3 May 2026 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777830892;
	bh=3k8JMYK28+0JD33iVGypb27iCbTz09pFMZylp5apRAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0r7NfWSu9uHBJHrqiGKOIpX6YUZLKJDcnux/jrzNdRjjvDWI1FQV78CJkkbqApBT
	 zwW6hWyG5mVqYeXKzTCEJs+kIXEKsA17TYEn+mUxkgAsSVLAWTwCeGLoxCnhvGObVu
	 6XCeljE/aSIFsSbjE4lYkF0ilDRhMc953I/459JxZxcHMXa8SuFwDf7bXQQ1lzTOIN
	 VkmolR1cSwp6ANB5YO5G0NZ4HdDvPyPzao/1M3iz8sWEbNKehguJHh8IIfGW/JIuPW
	 uHACu53fCPoLhwsTC/0Ci+inusR1+Y3KmPk0bu+pzHH/mGGeZ0bW81/QQJ4lfFb8JR
	 LbpeZoICOu1sQ==
Date: Sun, 3 May 2026 18:54:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: cpuinfo: Fix NULL dereference and inconsistent
 error code
Message-ID: <20260503-duller-canyon-a2be827f9488@spud>
References: <20260502160301.453029-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260502160301.453029-1-mohamedaymanworkspace@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1763128746935905364=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1763128746935905364==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HdbG1zHGMyyrTmib"
Content-Disposition: inline


--HdbG1zHGMyyrTmib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sat, May 02, 2026 at 07:02:57PM +0300, Mohamed Ayman wrote:
> Fix a potential NULL pointer dereference in c_show() by ensuring
> the device tree node returned by of_get_cpu_node() is checked before use.
>=20
> Also replace a non-standard return value (-1) in
> riscv_of_parent_hartid() with -ENODEV to follow Linux kernel
> conventions for "not found" error returns.
>=20
> Both issues improve robustness and consistency with existing RISC-V CPU i=
nfo handling code.


These two things should be two different patches, since they're
completely unrelated.

Additionally, the patch is missing a signoff.

> ---
>  arch/riscv/kernel/cpu.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3dbc8cc557dd..e0bc7526861f 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -135,7 +135,7 @@ int riscv_of_parent_hartid(struct device_node *node, =
unsigned long *hartid)
>  		}
>  	}
> =20
> -	return -1;
> +	return -ENODEV;
>  }
> =20
>  unsigned long __init riscv_get_marchid(void)
> @@ -348,12 +348,13 @@ static int c_show(struct seq_file *m, void *v)
> =20
>  	if (acpi_disabled) {
>  		node =3D of_get_cpu_node(cpu_id, NULL);
> +		if (node) {

Is it actually possible for this to fail?

Cheers,
Conor.

> +			if (!of_property_read_string(node, "compatible", &compat) &&
> +				strcmp(compat, "riscv"))
> +				seq_printf(m, "uarch\t\t: %s\n", compat);
> =20
> -		if (!of_property_read_string(node, "compatible", &compat) &&
> -		    strcmp(compat, "riscv"))
> -			seq_printf(m, "uarch\t\t: %s\n", compat);
> -
> -		of_node_put(node);
> +			of_node_put(node);
> +		}
>  	}
> =20
>  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> --=20
> 2.34.1
>=20

--HdbG1zHGMyyrTmib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeL4wAKCRB4tDGHoIJi
0q5cAQDTI7ENUP1UJlKNOMSogtBE5TBGSI6ZdmTCUe7nZCdiNgEAkmRgQm4DkhT0
EvJPYDae4KB2l3m2VmeLnaaclZ96Hw8=
=Gl6a
-----END PGP SIGNATURE-----

--HdbG1zHGMyyrTmib--


--===============1763128746935905364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1763128746935905364==--

