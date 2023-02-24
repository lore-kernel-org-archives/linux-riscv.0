Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41336C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwEpPZ/JKfoOon+FKdHuqzrkkbsHbYUgdpZB+xK5TYk=; b=vZhW+YiVabMYzJp2pqbfHQicCl
	GJi6K2DSy3rKQHAtzq2bBSPKXvnex5vcSt8VZD1b3ZuNEI3kD7c9UIc4I4cCjPS8H6Z0myf1D6fiz
	+lFbEli6XW2GcpUMpOqOKcb70fJ0Dcy8VsJVuZsMqeUMS5RMpFIAjTKAIf43DH84B3s2V/j1CTsHl
	3PPfmZzQyj3ntjCEHvwAcYDoBnK/sNmaZ3AjrXSB4E/tEVrxPeo5TTKtGO8yjTVpsQF1RhFDz59Y7
	CL98E6/Z600AkKDaJkuMq46Z0QuiYZQD1dRy/5MkY7OdNDxhhgJRvbNU7AnDVWcMJ6/aNzfGZh8Cv
	ofZtQbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYJH-002dgd-LE; Fri, 24 Feb 2023 13:40:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYJE-002dft-Dv
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246024; x=1708782024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XP7sUysKpIWN1ZBMDIpd2cOzWR/rPmIE7Bskk5pLg9A=;
  b=vPNXG9wY4+sJJY5PfAyisqBw2AFdq5QEsHzZicMmex9VVQ7sUYg1GTOQ
   HNqMsWOLTDMwakyAnPioYwXdBtX+/J0BUE6KUbiAibYYeP5DXwcxNIHnv
   gAVOC2VXHvHty4zKQJwvp21wCKi3tCEKgAl5Ewt1hikBYdokKiXbPJd7j
   pGMnIAE7F3OQ1tlxLTpIqeoDCQMD4AAXM4uI8oaXVizN3dzohT9ey7Or6
   sRNfZ7mhBC0P2Ncyp6S5DKsT6PpWg3XEffItSJw9Ho/77nnApWCKCkpuX
   E3i9Vs8bYt/A7lDcQZRyyfkKpZ2xRea8bk2wjPOE9un3xfzlrah3I5kBZ
   w==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="asc'?scan'208";a="202102691"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:40:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:40:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:40:21 -0700
Date: Fri, 24 Feb 2023 13:39:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Miguel Ojeda <ojeda@kernel.org>, <conor@kernel.org>
Subject: Re: [RFC 2/2] RISC-V: enable building the 64-bit kernels with rust
 support
Message-ID: <Y/i+KkhJbTl1bchW@wendy>
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <20230224133609.2877396-3-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230224133609.2877396-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_054024_542143_49AA7AD0 
X-CRM114-Status: GOOD (  18.84  )
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
Content-Type: multipart/mixed; boundary="===============3458547096776422825=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3458547096776422825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LTXEO+rHSkjv3YUb"
Content-Disposition: inline

--LTXEO+rHSkjv3YUb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 01:36:10PM +0000, Conor Dooley wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
>=20
> The rust modules work on 64-bit RISC-V, with no twiddling required.
> Select HAS_RUST and provide the required flags to kbuild so that the
> modules can be used.
> 32-bit is broken in core rust code, so support is limited to 64-bit
> only: ld.lld: error: undefined symbol: __udivdi3
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/rust/arch-support.rst | 2 ++
>  arch/riscv/Kconfig                  | 1 +
>  arch/riscv/Makefile                 | 3 ++-
>  3 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arc=
h-support.rst
> index 6982b63775da..197919158596 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINER=
S`` file.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  Architecture  Level of support  Constraints
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +``riscv``     Maintained        ``rv64`` only.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  ``x86``       Maintained        ``x86_64`` only.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 81eb031887d2..73174157212d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -115,6 +115,7 @@ config RISCV
>  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RSEQ
> +	select HAVE_RUST if 64BIT
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select IRQ_DOMAIN
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 76989561566b..f8b3f58f2e40 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -29,7 +29,7 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
> =20
>  	KBUILD_CFLAGS +=3D -mabi=3Dlp64
>  	KBUILD_AFLAGS +=3D -mabi=3Dlp64
> -
> +	KBUILD_RUSTFLAGS +=3D -Ctarget-cpu=3Dgeneric-rv64

Obviously it was only *after* sending this that I realised I had added
these asymmetrically. Ah well, it's only an RFC that needs resubmission
before acceptance anyway...

>  	KBUILD_LDFLAGS +=3D -melf64lriscv
>  else
>  	BITS :=3D 32
> @@ -38,6 +38,7 @@ else
>  	KBUILD_CFLAGS +=3D -mabi=3Dilp32
>  	KBUILD_AFLAGS +=3D -mabi=3Dilp32
>  	KBUILD_LDFLAGS +=3D -melf32lriscv
> +	KBUILD_RUSTFLAGS +=3D -Ctarget-cpu=3Dgeneric-rv32
>  endif
> =20
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--LTXEO+rHSkjv3YUb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/i+KgAKCRB4tDGHoIJi
0lm4AQCjBM3YwRni0Pisu02w9eJKggVdUy/QYD+Gu7hyFiyTgwEAqR87Paka8EDq
dJQwYkT1M7DG5/yv/HZ2HKOE8NLjPgQ=
=Eya7
-----END PGP SIGNATURE-----

--LTXEO+rHSkjv3YUb--


--===============3458547096776422825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3458547096776422825==--

