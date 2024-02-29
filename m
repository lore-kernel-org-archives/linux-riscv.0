Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CC2C54E41
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70BYUE+mwlDpWpO7Ux0B2eq9qQSfGaOqzVZ5rm7BnXQ=; b=i/yQcReg9mef54N5s/2TMa7Op7
	HDsEmtJvUX5/VWrbGluvlShz3WGR3XIoxAcbPktMwovcqbfdSZiOhSH0mxKJWG+LqK5vO2Rn+Ux2f
	SSDk00BSbocGBq+1y2mZwoYhEYQ13moHVaRGFvZrzPlh8+KLwsRV+fFNnJCO/aJ/Obk3jk1A6+TBl
	6HgrGrUJPHevjV7hgLPGzZ+SDeeLsYPUG5jiN/uB1WLG3B7GSxpwdDuK8NneZa8lNPBqJ/pOxtYlb
	jAeFunkQ6nMgX2TZHL58FG5KKaGdLNCjzvpWbnPZnUCFFjrmZnFDbajj6s0k94E6f/27IiU9ghuDu
	txi+V35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffUv-0000000DVjc-0Lfd;
	Thu, 29 Feb 2024 12:26:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffUr-0000000DVi5-3ya1
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 12:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A82BFCE0F21;
	Thu, 29 Feb 2024 12:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A29C433F1;
	Thu, 29 Feb 2024 12:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709209602;
	bh=5/3uPBOcY5rJEApzc+p02UJmQYNeWZPNj8gs0eiCVXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPKlB/il0u1UgsIHATn8hoHw6lzczHFWG8UzlYDy7sjr4EvXa4UXWpcOp6AsQLyN8
	 qZ4vyTq3UXiyIGQd4HLlPvT/U2I3L73l8A3DE3XaaD6H2X4TMBh+10d1mzQmgEAQMb
	 07IL/NSuvy5M0ukakf+/X4ngmv6EZQ7nZYwzlyN8u8569h/RljMFhFs3ytMwCaW9gr
	 2ZRCK+IM+Ntjn/BmTQlfLpMAMlzS68ls1ozy7WOuaRn8pxMCJM9XJGcQ6yDymH+zp7
	 qY1esEwEFzvO8MT3JTP8VpQ2wKIIsWSnXoNsHjG4bUZSRJPZrL04/mQ+SDEFiyWQHe
	 C5Fn+5gtqDQTQ==
Date: Thu, 29 Feb 2024 12:26:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Set unaligned access speed at compile time
Message-ID: <20240229-company-taste-daa305961e3a@spud>
References: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
 <20240227-disable_misaligned_probe_config-v5-2-b6853846e27a@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240227-disable_misaligned_probe_config-v5-2-b6853846e27a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_042647_458097_ED5C7CAF 
X-CRM114-Status: GOOD (  35.94  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============3081629985981348406=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3081629985981348406==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hvrHtvBp2XXICoup"
Content-Disposition: inline


--hvrHtvBp2XXICoup
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 03:13:14PM -0800, Charlie Jenkins wrote:

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bffbd869a068..ad0a9c1f8802 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -690,25 +690,58 @@ config THREAD_SIZE_ORDER
>  config RISCV_MISALIGNED
>  	bool "Support misaligned load/store traps for kernel and userspace"
>  	select SYSCTL_ARCH_UNALIGN_ALLOW
> +	depends on RISCV_PROBE_UNALIGNED_ACCESS || RISCV_EMULATED_UNALIGNED_ACC=
ESS
>  	default y
>  	help
>  	  Say Y here if you want the kernel to embed support for misaligned
>  	  load/store for both kernel and userspace. When disable, misaligned
>  	  accesses will generate SIGBUS in userspace and panic in kernel.
> =20
> +choice
> +	prompt "Unaligned Accesses Support"
> +	default RISCV_PROBE_UNALIGNED_ACCESS
> +	help
> +	  This selects the hardware support for unaligned accesses. This
> +	  information is used by the kernel to perform optimizations. It is also
> +	  exposed to user space via the hwprobe syscall. The hardware will be
> +	  probed at boot by default.
> +
> +config RISCV_PROBE_UNALIGNED_ACCESS
> +	bool "Probe for hardware unaligned access support"
> +	help
> +	  During boot, the kernel will run a series of tests to determine the
> +	  speed of unaligned accesses. This probing will dynamically determine
> +	  the speed of unaligned accesses on the boot hardware.
> +
> +config RISCV_EMULATED_UNALIGNED_ACCESS
> +	bool "Assume the system expects emulated unaligned memory accesses"
> +	help
> +	  Assume that the system expects emulated unaligned memory accesses.
> +	  When enabled, this option notifies the kernel and userspace that
> +	  unaligned memory accesses will be emulated by either the kernel or
> +	  firmware.
> +
> +config RISCV_SLOW_UNALIGNED_ACCESS
> +	bool "Assume the system supports slow unaligned memory accesses"
> +	depends on NONPORTABLE
> +	help
> +	  Assume that the system supports slow unaligned memory accesses. The
> +	  kernel may not be able to run at all on systems that do not support
> +	  unaligned memory accesses.
> +
>  config RISCV_EFFICIENT_UNALIGNED_ACCESS
> -	bool "Assume the CPU supports fast unaligned memory accesses"
> +	bool "Assume the system supports fast unaligned memory accesses"
>  	depends on NONPORTABLE
>  	select DCACHE_WORD_ACCESS if MMU
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	help
> -	  Say Y here if you want the kernel to assume that the CPU supports
> -	  efficient unaligned memory accesses.  When enabled, this option
> -	  improves the performance of the kernel on such CPUs.  However, the
> -	  kernel will run much more slowly, or will not be able to run at all,
> -	  on CPUs that do not support efficient unaligned memory accesses.
> +	  Assume that the system supports fast unaligned memory accesses. When
> +	  enabled, this option improves the performance of the kernel on such
> +	  systems.  However, the kernel will run much more slowly, or will not
> +	  be able to run at all, on systems that do not support efficient
> +	  unaligned memory accesses.
> =20
> -	  If unsure what to do here, say N.
> +endchoice

Thinking about this some more, you've got 6 different options here:

1 probed with no emulation available (choice set to probe + RISCV_MISALIGNE=
D=3Dn)
2 probe with in-kernel emulation available (choice set to probe + RISCV_MIS=
ALIGNED=3Dy)
3 in-kernel emulation only (choice set to emulated + RISCV_MISALIGNED=3Dy)
4 no in-kernel emulation but report emulated (choice set to emulated + RISC=
V_MISALIGNED=3Dn)
5 slow unaligned (choice set to slow)
6 fast unaligned (choice set to fast)

Out of these, only 2 and 3 are portable options, since 1, 4 and 5 will
cause uabi issues if the CPUs or firmware does not support unaligned
access & 6 will not run in the same circumstances.

My first thought here was about the motivation for the patch and what it
has resulted in. Being able to support HAVE_EFFICIENT_ALIGNED_ACCESS is
pretty nice, but it then seems like beyond that we are introducing
configuration for configurations sake, without looking at what the
resultant kernels will be useful for. Having 6 different options for how
the kernel can be configured in this way seems excessive and I don't
really get why some of them are even useful.

Take for example situation 4. Unless I have misunderstood the Kconfig
options above, if you configure a kernel in that way, it will always
report as emulated, but there is no emulation provided. This just seems
like a option that's only purpose is setting a hwprobe value, which is
a dog wagging the tail situation to me.

The other thing is about what options are actually marked as
NONPORTABLE, given it is done in the choice option - but whether or not
something is actually non-portable actually depends on whether or not
the in-kernel emulator exists.

I think what I would do here is simplify this quite a bit, starting by
making RISCV_MISALIGNED an internal option that users cannot enable but
is selected by the PORTABLE choice options. I would then re-work the
choice options a bit. My 4 would be:

1 probe: probe at boot time, falling back to emulated if not performant
2 emulated: always emulate it in the kernel
3 slow: don't probe or emulate in the kernel
4 fast: Your current fast option

1 & 2 select RISCV_UNALIGNED and are portable because they contain the
emulated support and thus satisfy the UABI constaints.
3 & 4 are marked NONPORTABLE. I think 3 will run on systems that don't
support unaligned accesses but it will have UABI problems. 4 for the
reason mentioned in the Kconfig option above.

I think that that gives you 4 meaningful options, what do you think?

Cheers,
Conor.

--hvrHtvBp2XXICoup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeB3/QAKCRB4tDGHoIJi
0l0gAQCsIcjbvrOvPpiKpVB9valq/E9eJ7pQGz/NhopDAXpGQgD9G4zhieTUL1y3
Ly/DEilJhbVOgmMCdp+TCgbOCiCn9A8=
=KKV4
-----END PGP SIGNATURE-----

--hvrHtvBp2XXICoup--


--===============3081629985981348406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3081629985981348406==--

