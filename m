Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53060C43327
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWPs0c3Nj54HYe1sbiULtND5GkdhsM/g6x4HWfSUc2k=; b=Dnq9SF4W1cqyn9zBtHqa3EOPlJ
	a6MQ5VA9oyiVoTrDbn3sov7XzL2CgV8tTlwr73r/vJfCrPiKW8Ewy/FQmGDk4i50EW5pLVIMMtFek
	vpwEMVZpU3CWkKaMJ3AcZiumGsKDi3sbRfZfawUAs+sFHn0tQQC8d8tjWMUFUBBrXvMh2TRsJ1si+
	UZJYZFfBfqYFTGE1w7JKmuKKbdSBbr1hX/xcELpfK/r5GW3TGaMx85xd6yf498qlFS5Tlf8wxpV5v
	R5sqMflOAQm95sldDtUzQVvcnQjJ2oYSeHy6+GmEH12t+YYZJOwVeWmAnMFiS5BkP9AXsq0rr6BTl
	GUndFMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTY5-0000000CWlC-1Ra5;
	Sat, 27 Jun 2026 13:58:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTY3-0000000CWl6-0rpY
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 13:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 834E241F9C;
	Sat, 27 Jun 2026 13:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90CC1F000E9;
	Sat, 27 Jun 2026 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782568698;
	bh=qRq4Yqk9QyZyFi6D1apW03WWKkBHwqJ7Z/uOpmUoBOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=neAm6559bvdSerGvuogCG49l5JWZlm+IgrxXD1qX48w5LTVLhhliHTKNynj1Mz0NY
	 eZZrnGTK43y2WWsPVp0hKnwbl3KMkkjM6SiystPU3cLgojHpAqbQdJeSVlm7Ty/DdM
	 khY2PnLVmdvz9anrPYKAnJsWg4KQeZL6JAp9WYmZE/OjWzLUDed9wjxXEQeFKF78BP
	 EuKXgQv22OuRswwgs+5SzNYtHqBsFW7c1Dbsys0GtybwxxahQmqLF1Wd1+z9kKuRqE
	 m5Bm1tlrZbkkp87ZRm4wX8WLjdAIdXnaWv/9TGVLW5U3p/eSpN6qlZxbjiea1XZfoB
	 0XvbAhhwBt2lQ==
Date: Sat, 27 Jun 2026 14:58:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add "g" as an instruction alias
Message-ID: <20260627-spud-qualifier-9a0041fb655e@spud>
References: <20260626-g_ext-v1-1-a9aa7ab9d109@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260626-g_ext-v1-1-a9aa7ab9d109@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1106211521732091016=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1106211521732091016==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jRsmYOAUKL4V5nQS"
Content-Disposition: inline

--jRsmYOAUKL4V5nQS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 11:24:46PM -0700, Charlie Jenkins wrote:
> "G" is an official alias for "IMAFDZicsr_Zifencei" [1]. Many common

What does [1] reference?

> tools like LLVM, GCC, OpenSBI, QEMU support this alias so make Linux
> follow the status quo and allow users to pass it in the isa string. In
> the ISA string, "G" is expected to written lowercase as "g" like the
> other extensions. Since "g" is a simple alias, follow what OpenSBI does
> and expose "imafd_zicsr_zifencei" instead of "g".

What does OpenSBI do? Does it covert "g" in Kconfig etc into imafd... in
a devicetree?
Do you mean that your intention is for a dts with "g" in it to only show
the constituent parts in /proc/cpuinfo etc?

>=20
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
> This can be tested with a device tree that passes in "g" to the isa
> string like:
>=20
> riscv,isa-extensions =3D "gc";

Are you sure this is what you tried? It should not work.
The code dealing with this works on exact matches, so it should end up
comparing "gc" with "g" and "c", detecting neither.
Needs to be ... =3D "g", "c";

Also, you need to document this in the dt binding, along with the exact
meaning. Probably do what b has done and mandate filling in the
constituent parts, retrofitting something that permits the removal of
other extensions will create devicetrees that do not play nicely with
other OSes.

> or
>=20
> riscv,isa =3D "rv64gc";

And I think this definitely does not work properly, cos you only
modified the riscv,isa-extensions part of
riscv_early_of_processor_hartid(). I'm not convinced that this is worth
permitting at all though, riscv,isa should probably not get any
behavioural changes at this point. It's deprecated after all.
Sure ACPI uses the same format and parser etc, but that's obviously not
affected by what we do in riscv_early_of_processor_hartid()!

>=20
> Example test case using qemu:
> 	1. Run QEMU with the additional arg "-machine dumpdtb=3Dqemu.dtb"
> 	2. Decompile the dts "dtc -O dts -I dtb qemu.dtb -o qemu.dts"
> 	3. Set riscv,isa-extensions to "gc"
> 	4. Compile the dtb "dtc -O dtb -I dts qemu.dts -o qemu.dtb"
> 	5. Boot qemu with "-dtc qemu.dtb"
> 	6. Look at /proc/cpuinfo
> ---
>  arch/riscv/kernel/cpu.c        |  7 ++++---
>  arch/riscv/kernel/cpufeature.c | 11 +++++++++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3dbc8cc557dd..0a2df97a1fd6 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -81,9 +81,10 @@ int __init riscv_early_of_processor_hartid(struct devi=
ce_node *node, unsigned lo
>  	if (!of_property_present(node, "riscv,isa-extensions"))
>  		return -ENODEV;
> =20
> -	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
> +	if (of_property_match_string(node, "riscv,isa-extensions", "g") < 0 &&
> +	    (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> +	     of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> +	     of_property_match_string(node, "riscv,isa-extensions", "a") < 0)) {
>  		pr_warn("CPU with hartid=3D%lu does not support ima", *hart);
>  		return -ENODEV;
>  	}
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index f46aa5602d74..f78cbf5ade1e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -322,6 +322,16 @@ static const unsigned int riscv_a_exts[] =3D {
>  	RISCV_ISA_EXT_ZALRSC,
>  };
> =20
> +static const unsigned int riscv_g_bundled_exts[] =3D {
> +	RISCV_ISA_EXT_i,
> +	RISCV_ISA_EXT_m,
> +	RISCV_ISA_EXT_a,
> +	RISCV_ISA_EXT_f,
> +	RISCV_ISA_EXT_d,
> +	RISCV_ISA_EXT_ZICSR,
> +	RISCV_ISA_EXT_ZIFENCEI
> +};
> +
>  #define RISCV_ISA_EXT_ZKN	\
>  	RISCV_ISA_EXT_ZBKB,	\
>  	RISCV_ISA_EXT_ZBKC,	\
> @@ -495,6 +505,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_a, riscv_a_exts),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
> +	__RISCV_ISA_EXT_BUNDLE(g, riscv_g_bundled_exts),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, ris=
cv_ext_vector_float_validate),
>=20
> ---
> base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
> change-id: 20260626-g_ext-0ca7d6223ff8
>=20
> Best regards,
> -- =20
> - Charlie
>=20

--jRsmYOAUKL4V5nQS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj/W5wAKCRB4tDGHoIJi
0rgwAQCbbZgDdZoEIhEb+uyQ9XTx03Azh2KUDhkfS1ZeBydwPQEA+Qkusm9NOiOB
Ubg1DKjCbvAeeMycsiBmMEYYxumFyAQ=
=nbUE
-----END PGP SIGNATURE-----

--jRsmYOAUKL4V5nQS--


--===============1106211521732091016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1106211521732091016==--

