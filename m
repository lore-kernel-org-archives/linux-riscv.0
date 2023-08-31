Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011EDC83F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j64tb6UMOAGoIKnEPuYNqJ6XTFHtvNxciH4VGjYnEfA=; b=qiHcBEc4tJhPadcCbRBaCZRI7q
	Nz9hOEyjhhSuswzoxaMgwBHmtZgiEKGminqX9GTbt8pmuYfcHujja+6az4mAcgNYmITrKoET54LGV
	Sa/oOlhXRVz1hUNF9SIQzzBEbfTTYSukDBkjbMfHllOU45P0W8eUl8e8cNg1zS6NA23vyxeX9udhi
	1byvTitAobyGzpV7N7A+z+LFmHd7Ir2UipBbY+1DUYmkClvESYmjExHD4TJYoQz1R7RuIWZii407C
	SWNmQbad8vp0uN8ogKNDGHbDHJcAgUF9gmuY33oNP17gh9FPuZOKu8RNLOb4eODZ6B2VfB9iEaEmS
	yHHZasvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkOr-00FZ2T-06;
	Thu, 31 Aug 2023 16:20:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkOn-00FZ1t-2A
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:20:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40556B8226C;
	Thu, 31 Aug 2023 16:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5730AC433C7;
	Thu, 31 Aug 2023 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693498799;
	bh=rxnFEM/L8l07ceJb7HBf4yge6cAnKF0YNv3FsogbVRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IT2D0+kR1XCag5cN+xV/Y9FqKUFadBpHKlh/cwcB2/hnO7r+rfbhhQwD9tGZCenlG
	 s8OPyjb845C/k2rYnsUOpRNJWd9fPylHagqKOmwPqSQo6H/N3ChRfD2FDtdKh6Z95b
	 6BexOaT8wyF+S4G5RZTUzZhRZqegdkbVqZvwG3h9+EGPgzAUx25lhslKFeYMf5mJFb
	 RLN4+236kQDqYJ5JFJXI7ZuN+FJqNikSynfJv2we8+MjRhxYkeq53HC3mj2YxZY0iZ
	 /NjR70n2NUz0+8hPB7sMgNN/oLeVDbANb502sfhUmUul5K6KOJP0KA5ZdTZXcRskCH
	 WuvHBwMyIucqw==
Date: Thu, 31 Aug 2023 17:19:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v2 3/6] RISC-V: hwprobe: Expose Zicboz extension and its
 block size
Message-ID: <20230831-scorebook-pastime-db6ff15f5dbe@spud>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
 <20230830164954.91987-11-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230830164954.91987-11-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_092002_003351_798296C9 
X-CRM114-Status: GOOD (  33.24  )
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
Content-Type: multipart/mixed; boundary="===============3016561331468181592=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3016561331468181592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ee6eWof+USBKWtad"
Content-Disposition: inline


--ee6eWof+USBKWtad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 06:49:58PM +0200, Andrew Jones wrote:
> Expose Zicboz through hwprobe and also provide a key to extract its
> respective block size. Opportunistically add a macro and apply it to
> current extensions in order to avoid duplicating code.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> ---
>  Documentation/riscv/hwprobe.rst       |  6 ++++
>  arch/riscv/include/asm/hwprobe.h      |  2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
>  arch/riscv/kernel/sys_riscv.c         | 46 +++++++++++++++++++--------
>  4 files changed, 41 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index 933c715065d6..6a17c2872660 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -77,6 +77,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as=
 defined
>         in version 1.0 of the Bit-Manipulation ISA extensions.
> =20
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is support=
ed, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-C=
MOs.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perfor=
mance
>    information about the selected set of processors.
> =20
> @@ -97,3 +100,6 @@ The following keys are defined:
> =20
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses=
 are
>      not supported at all and will generate a misaligned address fault.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicboz block in bytes.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 78936f4ff513..39df8604fea1 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,6 +8,6 @@
> =20
>  #include <uapi/asm/hwprobe.h>
> =20
> -#define RISCV_HWPROBE_MAX_KEY 5
> +#define RISCV_HWPROBE_MAX_KEY 6
> =20
>  #endif
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 006bfb48343d..86d08a0e617b 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -29,6 +29,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
>  #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
>  #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
> +#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -36,6 +37,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
> +#define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> =20
>  #endif
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 26ef5526bfb4..d17cb5b4945b 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -145,26 +145,38 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
>  	for_each_cpu(cpu, cpus) {
>  		struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> =20
> -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBA;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBB;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBS;
> +#define EXT_KEY(ext)									\
> +	do {										\
> +		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext)=
)	\
> +			pair->value |=3D RISCV_HWPROBE_EXT_##ext;				\
> +		else									\
> +			missing |=3D RISCV_HWPROBE_EXT_##ext;				\
> +	} while (false)
> +
> +		/*
> +		 * Only use EXT_KEY() for extensions which can be exposed to userspace,
> +		 * regardless of the kernel's configuration, as no other checks, besid=
es
> +		 * presence in the hart_isa bitmap, are made.

Thanks for adding the comment.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +		 */
> +		EXT_KEY(ZBA);
> +		EXT_KEY(ZBB);
> +		EXT_KEY(ZBS);
> +		EXT_KEY(ZICBOZ);
> +#undef EXT_KEY
>  	}
> =20
>  	/* Now turn off reporting features if any CPU is missing it. */
>  	pair->value &=3D ~missing;
>  }
> =20
> +static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long e=
xt)
> +{
> +	struct riscv_hwprobe pair;
> +
> +	hwprobe_isa_ext0(&pair, cpus);
> +	return (pair.value & ext);
> +}
> +
>  static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  {
>  	int cpu;
> @@ -215,6 +227,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>  		pair->value =3D hwprobe_misaligned(cpus);
>  		break;
> =20
> +	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
> +		pair->value =3D 0;
> +		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
> +			pair->value =3D riscv_cboz_block_size;
> +		break;
> +
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
>  	 * call, but get their element key set to -1 and value set to 0
> --=20
> 2.41.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ee6eWof+USBKWtad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPC9qgAKCRB4tDGHoIJi
0uJUAP4+9u/DKqxOifrzaPC61zQWNcEaQFQ5IFy2S99BVv8TBAD/c0KLomXQToL8
KBQnKiCHpguz7lFQNvYjG5gSqgDJDww=
=zzD6
-----END PGP SIGNATURE-----

--ee6eWof+USBKWtad--


--===============3016561331468181592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3016561331468181592==--

