Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9CBC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ysvs9rHp7RAVWDITnmpJq0rETlCVaJbWbCMULM60//4=; b=uDNHtMU9m+NRuJ5b+OpuQUwV+S
	g7+32/DqCJNnuv7aqj5iw46WHqKELY1KXOgqaFIp8HbGoiGpjUINpgCa1eNwdVm+X+fY4mvvnsKS7
	06tnW1agfbwjbF1EhPlvtEWwk931eNzweZ+U/VoBXGaf6tzSoC0C75EYDqSfco3RlduLL7rtUAQhE
	k1a76Xr+2iYJJbYds9PbHqL+LFcJ9IsiPzzAcoz1334AQSP7xVxYZu8Dc0sU/5NEtafAhyO10jl++
	uIMchelMyiv76r3fvvn4rc+6py2zYuN1txq2GXND8bK1S3Gao7EbJe57wok4ug7ABt5T4dGvGH1sY
	QH59fqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB1G-000000047eV-0LWl;
	Tue, 25 Jun 2024 18:35:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB1D-000000047du-1Rwi
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 18:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C053616AA;
	Tue, 25 Jun 2024 18:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E27C32781;
	Tue, 25 Jun 2024 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719340549;
	bh=l0WDgJdQoXMijhrq6fonjspQO/P2TLZ/SbjePmkgZH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqhA4ev27AmaMlZdJBVrYysZR+Q94TbDe8sGlRTkUJyFIPHmyN6yeVNjMAv64QWR8
	 bNkztc+g+BlTJ8ouS9aG8pOhJt/00W0rFC0Ik+hbs9Np7Zx6385OSQFpqaz35Lbl2N
	 wTbcSwFdjQ/UF4N1IqMsNfYEJgy3oZdpaWySM0aeysNWeIjK/4qdZTp66Vp6q6w/Sy
	 P47y29ROkupliXrZvCN45i0H+/sf8rEY9Zki/J0xmOuFqfD86h6Mbli36fYauZfj1W
	 +AxkVXCn+gq304VoBnNm82MPrLa9+EVCBxvGdNftcfFYf4JmcV4C+KBgSSzYVdnvWW
	 QUIpaSsDuNdgw==
Date: Tue, 25 Jun 2024 19:35:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf
 defines
Message-ID: <20240625-kindle-sanitizer-c52b48ed9b86@spud>
References: <20240625165121.2160354-1-evan@rivosinc.com>
 <20240625165121.2160354-3-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625165121.2160354-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_113551_504250_B1B5AB38 
X-CRM114-Status: GOOD (  23.41  )
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
Content-Type: multipart/mixed; boundary="===============7007785367190290041=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7007785367190290041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZZH6LLfFi09hTxrP"
Content-Disposition: inline


--ZZH6LLfFi09hTxrP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 09:51:21AM -0700, Evan Green wrote:
> In preparation for misaligned vector performance hwprobe keys, rename
> the hwprobe key values associated with misaligned scalar accesses to
> include the term SCALAR.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> ---
>=20
> Changes in v2:
>  - Added patch to rename misaligned perf key values (Palmer)
>=20
>  Documentation/arch/riscv/hwprobe.rst       | 20 ++++++++++----------
>  arch/riscv/include/uapi/asm/hwprobe.h      | 10 +++++-----
>  arch/riscv/kernel/sys_hwprobe.c            | 10 +++++-----
>  arch/riscv/kernel/traps_misaligned.c       |  6 +++---
>  arch/riscv/kernel/unaligned_access_speed.c | 12 ++++++------
>  5 files changed, 29 insertions(+), 29 deletions(-)
>=20
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index c9f570b1ab60..83f7f3c1347f 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -215,22 +215,22 @@ The following keys are defined:
>    the performance of misaligned scalar word accesses on the selected set=
 of
>    processors.
> =20
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misa=
ligned
> -    accesses is unknown.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performance =
of
> +    misaligned accesses is unknown.
> =20
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned acce=
sses are
>      emulated via software, either in or below the kernel.  These accesse=
s are
>      always extremely slow.
> =20
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned word accesses a=
re
> -    slower than equivalent byte accesses.  Misaligned accesses may be su=
pported
> -    directly in hardware, or trapped and emulated by software.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned word acc=
esses
> +    are slower than equivalent byte accesses.  Misaligned accesses may be
> +    supported directly in hardware, or trapped and emulated by software.
> =20
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned word accesses a=
re
> -    faster than equivalent byte accesses.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned word acc=
esses
> +    are faster than equivalent byte accesses.
> =20
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses=
 are
> -    not supported at all and will generate a misaligned address fault.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misaligned a=
ccesses
> +    are not supported at all and will generate a misaligned address faul=
t.
> =20
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 22073533cea8..e11684d8ae1c 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -66,11 +66,11 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
>  #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> -#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	0
> -#define		RISCV_HWPROBE_MISALIGNED_EMULATED	1
> -#define		RISCV_HWPROBE_MISALIGNED_SLOW		2
> -#define		RISCV_HWPROBE_MISALIGNED_FAST		3
> -#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	4
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN		0
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED	1
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW		2
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		7

How come the "old" names do not need to be preserved for userspace?

--ZZH6LLfFi09hTxrP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnsN/wAKCRB4tDGHoIJi
0mCIAP45kkBKZVWh1CZwcjCzHtER6BIcgkEsztsAijyWLjO70gEAz3aubrqFJKJc
0ed6Th6eRSAz67vRw/czOG4GD8rPRgo=
=bO/m
-----END PGP SIGNATURE-----

--ZZH6LLfFi09hTxrP--


--===============7007785367190290041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7007785367190290041==--

