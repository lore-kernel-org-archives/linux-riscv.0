Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEF7C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+g0Abqk5mjV5uxArphXWavLbv1n0hQ8Vtmlzak7cwA=; b=tqoWW73NGPEqplL3YFr19dpgGE
	WM1AfMfdxa1qBa0ID0+uz7cdDYmwlA7UpDC1UGm2I4gX65HDJ2j/qygpWr4914gyDGUZpYVsvj+qK
	Qi9pu6s/YZioBMXYvHVlJVIesY60yg7YMhP2qYMYnkKemqB3y/P0J5vJukAaem3WusoZ3xC6Erx3I
	eKvLsL2Ic+SwaSeMNZtt6RhCOhOKbJiyhhXl33Y/Tyo+vJsYJPI/I+U0i4cAcLY52TUBiouvB5JjD
	ASUJgCjf3CXX+WKiePplFb8vVUzUAxR06m6HZzO3HLPjBCLoLRzUAdTsjdBeRn3JsBCeWsjs4a0bC
	rCD22/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s27Tj-000000097r1-3g37;
	Wed, 01 May 2024 10:46:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s27Te-000000097oN-27UU;
	Wed, 01 May 2024 10:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56E68CE1287;
	Wed,  1 May 2024 10:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D304BC113CC;
	Wed,  1 May 2024 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714560374;
	bh=bX0yFlagqPxL0dHVhtKj3sAKB8RRba8ErDXH4L/dIlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOQlLWewBQhULLcVzVr3hASRrCE4wgGiJ7futMijuDRrO24JY+JBhielx22xMrfiM
	 CXxWH8VktaCHkkyQgueekYdahaGDIr0L80H30Vt+7pU7vIRz5inSaRuaiDeZsgE8Ik
	 OfVh2Bsf/0eH4c2Fr5PFjPe4IW0+r3+YG0a97ectlPzyVsDTzMoMDq1nZVQXWL0Y3O
	 BCvWFWfZGIjFVI1u9XGgt1QQKEEAN+KkH6V3zaG6Wf/khOzkt0V8HcwdVQ/CW+9lRn
	 qXhbbK8qmKKaOG7Iw+pIqQXv3c0JBG5JvPpPhm2ZTVHRTsURmoQ4aSYFh9Jr0xfeOZ
	 sjzdEnGxpkUrg==
Date: Wed, 1 May 2024 11:46:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240501-chastise-gecko-342f2c35cfc1@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_034620_339518_8A54815A 
X-CRM114-Status: GOOD (  21.44  )
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
Content-Type: multipart/mixed; boundary="===============1791193203893592121=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1791193203893592121==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IU1h/zA/fxPmJmrU"
Content-Disposition: inline


--IU1h/zA/fxPmJmrU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> Separate vendor extensions out into one struct per vendor
> instead of adding vendor extensions onto riscv_isa_ext.
>=20
> Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> code.
>=20
> The xtheadvector vendor extension is added using these changes.

This mostly looks good to me, thanks for the updates. There's one thing
that I think is wrong, but I need to test and will get back to you on...

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig                               |  2 +
>  arch/riscv/Kconfig.vendor                        | 19 ++++++
>  arch/riscv/include/asm/cpufeature.h              | 18 ++++++
>  arch/riscv/include/asm/vendor_extensions.h       | 26 ++++++++
>  arch/riscv/include/asm/vendor_extensions/thead.h | 19 ++++++
>  arch/riscv/kernel/Makefile                       |  2 +
>  arch/riscv/kernel/cpufeature.c                   | 77 ++++++++++++++++++=
------
>  arch/riscv/kernel/vendor_extensions.c            | 18 ++++++
>  arch/riscv/kernel/vendor_extensions/Makefile     |  3 +
>  arch/riscv/kernel/vendor_extensions/thead.c      | 36 +++++++++++
>  10 files changed, 200 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index be09c8836d56..fec86fba3acd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -759,6 +759,8 @@ config RISCV_EFFICIENT_UNALIGNED_ACCESS
> =20
>  endchoice
> =20
> +source "arch/riscv/Kconfig.vendor"
> +
>  endmenu # "Platform type"
> =20
>  menu "Kernel features"
> diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
> new file mode 100644
> index 000000000000..4fc86810af1d
> --- /dev/null
> +++ b/arch/riscv/Kconfig.vendor
> @@ -0,0 +1,19 @@
> +menu "Vendor extensions"
> +
> +config RISCV_ISA_VENDOR_EXT
> +	bool
> +
> +menu "T-Head"
> +config RISCV_ISA_VENDOR_EXT_THEAD
> +	bool "T-Head vendor extension support"
> +	select RISCV_ISA_VENDOR_EXT
> +	default y
> +	help
> +	  Say N here if you want to disable all T-Head vendor extension
> +	  support. This will cause any T-Head vendor extensions that are
> +	  requested to be ignored.

What does "requested to be ignored" mean to a punter configuring a
kernel? I'd expect this to be something like:

"Say N here to disable detection of and support for all T-Head vendor
extensions. Without this option enabled, T-Head vendor extensions will
not be detected at boot and their presence not reported to userspace."

In general, I'd expect something that needs some support in the kernel
(like vector) to function to have a dedicated option, but the likes of
their Zba variant could be detected and reported via hwprobe et al
once RISCV_ISA_VENDOR_EXT_THEAD is enabled.

Cheers,
Conor.

--IU1h/zA/fxPmJmrU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIdbwAKCRB4tDGHoIJi
0h/4AQDbSwC+zSd2L4oMXZ62nZMJrbPWx5JE9S7nb98blCe6XwEAgXMzwjjp4Aq0
0/Nm2H/CfihseOibQXFgeXh59NryOgo=
=g7p2
-----END PGP SIGNATURE-----

--IU1h/zA/fxPmJmrU--


--===============1791193203893592121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1791193203893592121==--

