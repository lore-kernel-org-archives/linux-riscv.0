Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CAFC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa0hsrCxpepuMfUkWEDf1SjnrfdbkGbR8meKSMmXNI0=; b=rrU28QX7Zttcwjy1RoLbxnPl5B
	v5Ok+8Wpzh0ho8qVKd9JWku84rvkP6IUnB1Uo4J/Nop41390Ek7h+QwOGRA6N8+c/1ELtr6eWmoKn
	O8vkkC9M9UZ5kBrw/LdK1iKY7nVgvGFQVL5KAhdSBcfQSTkTZGyTdGNPdx3z3lm6luZOHGJdYcEka
	PsOepmNcXK4F72AEN854RigXBWzxmyZFs8iaIoPtBc6Vwj/4GIFuz6vcQYAB7nGKdDGySvPL9Sf6v
	GzvCzqUwiqq4iuktoVlpLTfWLOzELKf3mN2h5T1DzI9ndw1E9cfVQ9prHei4Dxc1tun7RusRrX3dL
	/juVCHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByqq-00000001Fzu-1DK6;
	Tue, 28 May 2024 15:35:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByqm-00000001Fxo-0dYY
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33155CE12D0;
	Tue, 28 May 2024 15:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826BAC32789;
	Tue, 28 May 2024 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716910493;
	bh=Y8FneghY/F4qg3k//k5iTQvpIK9AhJXd3ejvwp4sfg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNXJaHrKc6uzl5of2judQay4AKFy9V0Lxi2Lse5n5azczhWHvYAdX+BEmGaywnHor
	 2rAaTepYaQiBcJgA0u9wNAM07oJ8FbPBCqx+vWi90DmwXhCrUSw+SegF0wazGKsH8o
	 jaG9QgJ2BxbFq6RBeIKQfJzmLRhbkQeerqUqiBtMxAfKLuei9gks0Qg0CvKD3PZpwl
	 Cp1heThgVvCAj96K7A3OqmXhtbZONUXKYG8rV1HTXvpwoc6uiYDjTUfH1b30mkxUOY
	 ub6jrEwj+0SEtQNLXcAQYiIX+amL/r8+wcKj1un5RH0KAErnEHEUjDbjZ7DaqDRKFu
	 cLC0+mvMPD1/A==
Date: Tue, 28 May 2024 16:34:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 1/7] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <20240528-repaint-graffiti-ec4f0e038e5a@spud>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240528151052.313031-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_083456_615279_A0BBEABA 
X-CRM114-Status: GOOD (  23.79  )
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
Content-Type: multipart/mixed; boundary="===============2104510290011756337=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2104510290011756337==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NeJreBi+Wntza5KK"
Content-Disposition: inline


--NeJreBi+Wntza5KK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 05:10:46PM +0200, Alexandre Ghiti wrote:
> This adds runtime support for Zacas in cmpxchg operations.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 17 +++++++++++++++++
>  arch/riscv/Makefile              | 11 +++++++++++
>  arch/riscv/include/asm/cmpxchg.h | 23 ++++++++++++++++++++---
>  3 files changed, 48 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8a0f403432e8..b443def70139 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -579,6 +579,23 @@ config RISCV_ISA_V_PREEMPTIVE
>  	  preemption. Enabling this config will result in higher memory
>  	  consumption due to the allocation of per-task's kernel Vector context.
> =20
> +config TOOLCHAIN_HAS_ZACAS
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zacas)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zacas)
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_ZACAS
> +	bool "Zacas extension support for atomic CAS"
> +	depends on TOOLCHAIN_HAS_ZACAS
> +	default y
> +	help
> +	  Adds support to use atomic CAS instead of LR/SC to implement kernel
> +	  atomic cmpxchg operation.

If you were a person compiling a kernel, would you be able to read this
and realise that this is safe to enable when their system does not
support atomic CAS? Please take a look at other how other extensions
handle this, or the patch that I have been sending that tries to make
things clearer:
https://patchwork.kernel.org/project/linux-riscv/patch/20240528-varnish-sta=
tus-9c22973093a0@spud/

> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 5b3115a19852..d5b60b87998c 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -78,6 +78,17 @@ endif
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y)_zi=
hintpause
> =20
> +# Check if the toolchain supports Zacas
> +ifdef CONFIG_AS_IS_LLVM
> +# Support for experimental Zacas was merged in LLVM 17, but the removal =
of
> +# the "experimental" was merged in LLVM 19.
> +KBUILD_CFLAGS +=3D -menable-experimental-extensions
> +KBUILD_AFLAGS +=3D -menable-experimental-extensions
> +riscv-march-y :=3D $(riscv-march-y)_zacas1p0
> +else
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) :=3D $(riscv-march-y)_zacas
> +endif

I'm almost certain that we discussed this before for vector and it was
decided to not enable experimental extensions (particularly as it is a
global option), and instead require the non-experimental versions.
This isn't even consistent with your TOOLCHAIN_HAS_ZACAS checks, that
will only enable the option for the ratified version. I think we should
continue to avoid enabling experimental extensions, even if that imposes
a requirement of having a bleeding edge toolchain to actually use the
extension.

Thanks,
Conor.

--NeJreBi+Wntza5KK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlX5mAAKCRB4tDGHoIJi
0t2PAP9Q9RDTWJECIVJQNiS2KS4k5svrPYctaW5tBkJNyH24aQD+KGIH/FYhPYH0
hA4/1t59deBmh2eK/putul6XEIEytAA=
=zNv0
-----END PGP SIGNATURE-----

--NeJreBi+Wntza5KK--


--===============2104510290011756337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2104510290011756337==--

