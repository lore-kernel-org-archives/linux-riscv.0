Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB907C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GSwwhLXA/ouowUCkvbqauj/vr+iQeZgxzXLx9qhR/4=; b=1bidWkI4zBoX3WjohzLOitRja6
	g9cRYrPh3j016wOdQPU0OiqrYoyRzOKL7YxqttDhWZhYXMhdBESDHLBGGSdSaa25TUQyQkHflYDXv
	Cyakp2SbPBtZrWIbQl554zsjACHzr5wRvHWjwtvcOTjXehePsRqEV9z0WiQ47gxI8AxgtCEha7VUJ
	0CpDavr5DmZJtC45vejCKO3ulOM6S0yiwHO2u0NnSXjdPaYP4d0AVACVZGZX3drEcD6U3sVX3Upl+
	QD3hQ0Q6ZUegjt2ogAZAQP9ozb/wSS7JtGCX0DqpFd0AyUhBzrCm4kVqQbNpamkPfFihnI6l/Ty+d
	Jxx4jQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pskp1-00Cm7z-38;
	Sat, 29 Apr 2023 13:41:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pskoz-00Cm74-1P
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 13:41:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3B4760A16;
	Sat, 29 Apr 2023 13:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC39C433EF;
	Sat, 29 Apr 2023 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682775657;
	bh=TynLopTcb8di6ibyHhf1tgDO6WehYIBtAquyYxiAUq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peZz0opZ/qSonIT40w/rOKy2WlYQqUaa70QwLzgK75PW4Wpl11vg1QjD4Crr5UP1g
	 xS0A+yuexgVOEG6rKfU+1Lz9r4OtJdL1w3hXCIdiJkxLgGkq3KnRK3GaBUhkTgzRxf
	 6wPMWLI0ao8rpT4bQk/2y8xpY31zMf/qTcDZa+vzS2pEzi/6QDTiJbhrWMYD7d0xUu
	 575oums0ukMnia5OEzYHd7WS6B0Ji4NBfdSFr8DHTaMJPv6Nngz6K+joEYZ3SIGx81
	 T6J2YcmRgsXPI/uSaR9a4GtMRjboZaJS4jiBjMc2egULHnazMhKAURaryMJgIWymPr
	 jVUSbCBr5WRlQ==
Date: Sat, 29 Apr 2023 14:40:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] RISC-V: hwprobe: Expose Zba and Zbb
Message-ID: <20230429-gruffly-chrome-fd94628cc5ff@spud>
References: <20230428190609.3239486-1-evan@rivosinc.com>
 <20230428190609.3239486-4-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230428190609.3239486-4-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_064105_557841_5C6DCA4A 
X-CRM114-Status: GOOD (  26.43  )
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
Content-Type: multipart/mixed; boundary="===============8714191912630931080=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8714191912630931080==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HFnFzu3h5zI+4bvt"
Content-Disposition: inline


--HFnFzu3h5zI+4bvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 12:06:08PM -0700, Evan Green wrote:
> Add two new bits to the IMA_EXT_0 key for ZBA and ZBB extensions. These
> are accurately reported per CPU.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> ---
>=20
>  Documentation/riscv/hwprobe.rst       |  7 +++++
>  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
>  arch/riscv/kernel/sys_riscv.c         | 43 ++++++++++++++++++++++-----
>  3 files changed, 45 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index 9f0dd62dcb5d..21f444a38359 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -64,6 +64,13 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as def=
ined
>      by version 2.2 of the RISC-V ISA manual.
> =20
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extensi=
on is
> +       supported, as defined in version 1.0 of the Bit-Manipulation ISA
> +       extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_IMA_ZBB`: The Zbb extension is supporte, as =
defined

Why is one EXT_ZBA and the other is IMA_ZBB? You do not use IMA below,
so I assume this is a copy-paste mistake.

Also, s/supporte/supported.

Otherwise, looks fine.
Cheers,
Conor.

> +       in version 1.0 of the Bit-Manipulation ISA extensions.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perfor=
mance
>    information about the selected set of processors.
> =20
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 8d745a4ad8a2..ef3b060d4e8d 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -25,6 +25,8 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>  #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>  #define		RISCV_HWPROBE_IMA_C		(1 << 1)
> +#define		RISCV_HWPROBE_EXT_ZBA		(1 << 2)
> +#define		RISCV_HWPROBE_EXT_ZBB		(1 << 3)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 5db29683ebee..adfcb6b64db7 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -121,6 +121,41 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pa=
ir,
>  	pair->value =3D id;
>  }
> =20
> +static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> +			     const struct cpumask *cpus)
> +{
> +	int cpu;
> +	u64 missing =3D 0;
> +
> +	pair->value =3D 0;
> +	if (has_fpu())
> +		pair->value |=3D RISCV_HWPROBE_IMA_FD;
> +
> +	if (riscv_isa_extension_available(NULL, c))
> +		pair->value |=3D RISCV_HWPROBE_IMA_C;
> +
> +	/*
> +	 * Loop through and record extensions that 1) anyone has, and 2) anyone
> +	 * doesn't have.
> +	 */
> +	for_each_cpu(cpu, cpus) {
> +		struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> +
> +		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> +			pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> +		else
> +			missing |=3D RISCV_HWPROBE_EXT_ZBA;
> +
> +		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> +			pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> +		else
> +			missing |=3D RISCV_HWPROBE_EXT_ZBB;
> +	}
> +
> +	/* Now turn off reporting features if any CPU is missing it. */
> +	pair->value &=3D ~missing;
> +}
> +
>  static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  {
>  	int cpu;
> @@ -164,13 +199,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>  		break;
> =20
>  	case RISCV_HWPROBE_KEY_IMA_EXT_0:
> -		pair->value =3D 0;
> -		if (has_fpu())
> -			pair->value |=3D RISCV_HWPROBE_IMA_FD;
> -
> -		if (riscv_isa_extension_available(NULL, c))
> -			pair->value |=3D RISCV_HWPROBE_IMA_C;
> -
> +		hwprobe_isa_ext0(pair, cpus);
>  		break;
> =20
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> --=20
> 2.25.1
>=20

--HFnFzu3h5zI+4bvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE0eYwAKCRB4tDGHoIJi
0koSAP9bP1fzFIGsPCX0j+PX7ftZF2eVkUU0UDTEFyAJZIf93wEAzlQ1crbGpXtZ
ijYEkDiku4jfnhlzX1T7sXY/VtDj5Q0=
=yGMa
-----END PGP SIGNATURE-----

--HFnFzu3h5zI+4bvt--


--===============8714191912630931080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8714191912630931080==--

