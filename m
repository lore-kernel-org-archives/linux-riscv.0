Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2745AC77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukqIDP0MtKqb8+3134+qgVdYx3OjycAROLhl/zpAUQk=; b=tSZWSv+9XIUUGP0IqdvTlh4Nm9
	eef+o2aywJdMLl/HDgWgb5d2QyuVQXNc1FQ3fnzsZAKgHErHwMMk61DRNQ0o9o0v1ppuVGS8DcMLQ
	1vuhB0BkgM79Goy2/KVNvrzBzwsucJNA49uy6LSxxHGeHs3tbo7mkc8N2jBXL4ei99HSLC7k8qAIb
	k3nn6MUanJrVEkyofUY5gVTWlNZC5xMEcxEA3XeNijn23fzo4GRhO3Ybi536RwPkKMZVJPqXBzGDU
	mv/xqF84WstWlZxg90GKp1F3fgXdfDwDB415t3oBa/9ZQ9sV2KPFzj2ct51aBtdufoiGY5xELdX7A
	ccpd91kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prkHw-004efX-0U;
	Wed, 26 Apr 2023 18:54:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prkHt-004ef0-0D
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 18:54:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37B06617DA;
	Wed, 26 Apr 2023 18:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910F8C433EF;
	Wed, 26 Apr 2023 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682535283;
	bh=1244+LblrFizCZDlgmbjafyhpDTt7m0+WhrVmHZ7ZB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1x7p9cFrElu7gHJdkxP2gQg77whBQsmRYjRwXnWsXu1dFFJRYJF7hT+jkyL7+VCR
	 5expmSLYcS2mbQuSVod/Cp6WfJl0Nmdk7Bl6jcewVVFYQK38WxNDcpNCX6ETwAuKgp
	 V/kMx6QADJ5skoTK+eSKGKV2x4P0vvMv03GIUw/UY8N2SkosSVKitHfDUQDEmUFpYv
	 OnuSlWcLysi0SgrWgQrRXw5ayB6VmiO3Lu8BAa81We6rzJac2AJIS59OPGnlyqZMbT
	 KjM7yXiXDrp8m3y7tH3eEVnySWiHW5MHK9WNEpexXmFzL+HTbzUa3XXr9MKWsZB5nE
	 JmRfTa5rMXnNQ==
Date: Wed, 26 Apr 2023 19:54:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>, Hongren Zheng <i@zenithal.me>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <20230426-porthole-wronged-d5a6a3b89596@spud>
References: <20230425120016.187010-1-cyy@cyyself.name>
 <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_115445_187622_90FE66C4 
X-CRM114-Status: GOOD (  36.11  )
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
Content-Type: multipart/mixed; boundary="===============6264851238866710268=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6264851238866710268==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o5UhWic4q0tLxtVM"
Content-Disposition: inline


--o5UhWic4q0tLxtVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(+CC Drew)

Hey Yangyu,

One meta-level comment - can you submit this patch + my dt-bindings
patch as a v2?
Some comments below.

On Tue, Apr 25, 2023 at 08:00:15PM +0800, Yangyu Chen wrote:
> According to RISC-V ISA specification, the ISA naming strings are case
> insensitive. The kernel docs require the riscv,isa string must be all
> lowercase to simplify parsing currently. However, this limitation is not
> consistent with RISC-V ISA Spec.

Please remove the above and cite ACPI's case-insensitivity as the
rationale for this change.

> This patch modifies the ISA string parser in the kernel to support
> case-insensitive ISA string parsing. It replaces `strncmp` with
> `strncasecmp`, replaces `islower` with `isalpha`, and wraps the
> dereferenced char in the parser with `tolower`.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/kernel/cpu.c        |  6 ++++--
>  arch/riscv/kernel/cpufeature.c | 20 ++++++++++----------
>  2 files changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 8400f0cc9704..531c76079b73 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -4,6 +4,7 @@
>   */
> =20
>  #include <linux/cpu.h>
> +#include <linux/ctype.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> @@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *node,=
 unsigned long *hart)
>  		pr_warn("CPU with hartid=3D%lu has no \"riscv,isa\" property\n", *hart=
);
>  		return -ENODEV;
>  	}
> -	if (isa[0] !=3D 'r' || isa[1] !=3D 'v') {
> +	if (tolower(isa[0]) !=3D 'r' || tolower(isa[1]) !=3D 'v') {
>  		pr_warn("CPU with hartid=3D%lu has an invalid ISA of \"%s\"\n", *hart,=
 isa);
>  		return -ENODEV;

I don't understand why this is even here in the first place. I'd be
inclined to advocate for it's entire removal. Checking *only* that there
is an "rv" in that string seems pointless to me. If you're on a 64-bit
kernel and the node has riscv,isa =3D "rv32ima" it's gonna say it is okay?
Drew what do you think?

>  	}
> @@ -228,7 +229,8 @@ static void print_isa(struct seq_file *f, const char =
*isa)
> =20
>  	seq_puts(f, "isa\t\t: ");
>  	/* Print the rv[64/32] part */
> -	seq_write(f, isa, 4);
> +	for (i =3D 0; i < 4; i++)
> +		seq_putc(f, tolower(isa[i]));

As was pointed out elsewhere, we shouldn't parse the dt to construct
this in the first place. We know what kernel we are running on, so we
should instead do write "rv" into the string & do:
	string =3D "rv"
	if IS_ENABLED(32-bit):
		isa.append("32")
	else
		isa.append("64")

See the link below, and Drew's comment on that:
https://lore.kernel.org/all/20230424194911.264850-3-heiko.stuebner@vrull.eu/
I'm fine with this change for now in isolation, but it ideally will be
replaced with something that doesn't touch the DT/ACPI for this
information.

>  	for (i =3D 0; i < sizeof(base_riscv_exts); i++) {
>  		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
>  			/* Print only enabled the base ISA extensions */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 59d58ee0f68d..c01dd144addc 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -120,10 +120,10 @@ void __init riscv_fill_hwcap(void)
> =20
>  		temp =3D isa;
>  #if IS_ENABLED(CONFIG_32BIT)
> -		if (!strncmp(isa, "rv32", 4))
> +		if (!strncasecmp(isa, "rv32", 4))
>  			isa +=3D 4;
>  #elif IS_ENABLED(CONFIG_64BIT)
> -		if (!strncmp(isa, "rv64", 4))
> +		if (!strncasecmp(isa, "rv64", 4))
>  			isa +=3D 4;
>  #endif

If you're already modifying these lines, why not convert the ifdeffery
into something like
		if (IS_ENABLED(CONFIG_32BIT) && !strncasecmp(isa, "rv32", 4))
				isa +=3D 4;
		else if (!strncasecmp(isa, "rv64", 4))
				isa +=3D 4;

>  		/* The riscv,isa DT property must start with rv64 or rv32 */
> @@ -135,7 +135,7 @@ void __init riscv_fill_hwcap(void)
>  			const char *ext_end =3D isa;
>  			bool ext_long =3D false, ext_err =3D false;
> =20
> -			switch (*ext) {
> +			switch (tolower(*ext)) {

Is there merit in just converting the entire string to lower-case in the
first place rather than having to fiddle with every single time we want
to do a comparison here?

>  			case 's':
>  				/**
>  				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
> @@ -143,7 +143,7 @@ void __init riscv_fill_hwcap(void)
>  				 * not valid ISA extensions. It works until multi-letter
>  				 * extension starting with "Su" appears.
>  				 */
> -				if (ext[-1] !=3D '_' && ext[1] =3D=3D 'u') {
> +				if (ext[-1] !=3D '_' && tolower(ext[1]) =3D=3D 'u') {
>  					++isa;
>  					ext_err =3D true;
>  					break;
> @@ -154,7 +154,7 @@ void __init riscv_fill_hwcap(void)
>  				ext_long =3D true;
>  				/* Multi-letter extension must be delimited */
>  				for (; *isa && *isa !=3D '_'; ++isa)
> -					if (unlikely(!islower(*isa)
> +					if (unlikely(!isalpha(*isa)
>  						     && !isdigit(*isa)))

This collapses to isalnum() I think, no?

Cheers,
Conor.

>  						ext_err =3D true;
>  				/* Parse backwards */
> @@ -166,7 +166,7 @@ void __init riscv_fill_hwcap(void)
>  				/* Skip the minor version */
>  				while (isdigit(*--ext_end))
>  					;
> -				if (ext_end[0] !=3D 'p'
> +				if (tolower(ext_end[0]) !=3D 'p'
>  				    || !isdigit(ext_end[-1])) {
>  					/* Advance it to offset the pre-decrement */
>  					++ext_end;
> @@ -178,7 +178,7 @@ void __init riscv_fill_hwcap(void)
>  				++ext_end;
>  				break;
>  			default:
> -				if (unlikely(!islower(*ext))) {
> +				if (unlikely(!isalpha(*ext))) {
>  					ext_err =3D true;
>  					break;
>  				}
> @@ -188,7 +188,7 @@ void __init riscv_fill_hwcap(void)
>  				/* Skip the minor version */
>  				while (isdigit(*++isa))
>  					;
> -				if (*isa !=3D 'p')
> +				if (tolower(*isa) !=3D 'p')
>  					break;
>  				if (!isdigit(*++isa)) {
>  					--isa;
> @@ -205,7 +205,7 @@ void __init riscv_fill_hwcap(void)
>  #define SET_ISA_EXT_MAP(name, bit)						\
>  			do {							\
>  				if ((ext_end - ext =3D=3D sizeof(name) - 1) &&	\
> -				     !memcmp(ext, name, sizeof(name) - 1) &&	\
> +				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
>  				     riscv_isa_extension_check(bit))		\
>  					set_bit(bit, this_isa);			\
>  			} while (false)						\
> @@ -213,7 +213,7 @@ void __init riscv_fill_hwcap(void)
>  			if (unlikely(ext_err))
>  				continue;
>  			if (!ext_long) {
> -				int nr =3D *ext - 'a';
> +				int nr =3D tolower(*ext) - 'a';
> =20
>  				if (riscv_isa_extension_check(nr)) {
>  					this_hwcap |=3D isa2hwcap[nr];
> --=20
> 2.40.0
>=20

--o5UhWic4q0tLxtVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZElzbwAKCRB4tDGHoIJi
0nzaAQDEva9BVfC2SzKp3X/RtwCVr6+CG0NopyF1TtzCC7L5BgEAqpd9cX3Mn8Jt
lbHPdu/0Z1TmUtmoLrUTKLy9Wcuj4Qg=
=socc
-----END PGP SIGNATURE-----

--o5UhWic4q0tLxtVM--


--===============6264851238866710268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6264851238866710268==--

