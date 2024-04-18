Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540F0C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhysL/KIc/o1HbmxZMWJ5QnLwnLNibrIE399gYnPqJM=; b=etCMY3393YI2rpSuA+GAr4ZwGz
	Lbsr6k0art7bagAZcMJo3cy51DG2Jr7IQFhOZH5/C0bwthhbk2Y0CeTauha8HvNGKLUot+gAbX7B2
	hO9MNIaFQ/f4a872NwNMVgPDM4j81SCkpJ8WGEABXJ0VcrVJC8cbSJs8GNQUH3odS7t+UHcx79T0x
	teYiXJAvHYtgHYb7FuxyxLxlZo1Lz95fTHHnwFndnXhkynh2+M9H07A/N86Zi0HLM+2vj8iBiAve5
	Do2kayY7apKCElAtow0n+wNO4dwh/LBehRjyw6b4Fq7dvSJog4yjr2uHwI7bRhmU8sxLasTAR6ig4
	Jiz2Gs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTL2-00000002jaP-2GQQ;
	Thu, 18 Apr 2024 15:06:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTKu-00000002jXr-3gix
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 15:06:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 778F461735;
	Thu, 18 Apr 2024 15:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70079C113CC;
	Thu, 18 Apr 2024 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713452760;
	bh=+n6ASrep4rJoEHRc9MR1zx75DlI9VbOIWLCu5kaRRS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mE03bmgwtprNd/G1IRYw0JNGMZbK3KktG2zSr0Nn4pRG4ZnbILOkUnUoQcns8qQPT
	 3N9p7MVJzYT4xOjy2n+ga/vowLGxcraGOm6bOG06q/oWanx10qOEKQvHgoX6BJ+i2A
	 GIEk62HwkKAOv9Ae0tp0tPWft2fCbvd7nxeP86/0E0Sy/VlgRWf4YNxSJ70XYRH/jF
	 gF9czmv0d+oSy70KmhUvl8zpoiE69hqmNl1VbsmMhIYCtN5VYEo1jORmuhiAtELy4T
	 deYoX24zrtX1JDVCtpkTa7dUrV+nlm/jyMEepxscwfFDIr4cTpYMxgauabdNjZOd8l
	 hDHSN7mYwDp1Q==
Date: Thu, 18 Apr 2024 16:05:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	andy.chiu@sifive.com, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	lihangjing@bytedance.com, dengliang.1214@bytedance.com,
	xieyongji@bytedance.com, chaiwen.cc@bytedance.com,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [RFC 1/2] riscv: process: Introduce idle thread using Zawrs
 extension
Message-ID: <20240418-dove-deferral-2b01100e13ca@spud>
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <20240418114942.52770-2-luxu.kernel@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20240418114942.52770-2-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_080605_344892_94E28F87 
X-CRM114-Status: GOOD (  26.11  )
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
Content-Type: multipart/mixed; boundary="===============8085477365329279041=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8085477365329279041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W4+rgWywh9lWFt3p"
Content-Disposition: inline


--W4+rgWywh9lWFt3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+ Drew,

On Thu, Apr 18, 2024 at 07:49:41PM +0800, Xu Lu wrote:
> The Zawrs extension introduces a new instruction WRS.NTO, which will
> register a reservation set and causes the hart to temporarily stall
> execution in a low-power state until a store occurs to the reservation
> set or an interrupt is observed.
>=20
> This commit implements new version of idle thread for RISC-V via Zawrs
> extension.
>=20
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> Reviewed-by: Hangjing Li <lihangjing@bytedance.com>
> Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
> Reviewed-by: Wen Chai <chaiwen.cc@bytedance.com>
> ---
>  arch/riscv/Kconfig                 | 24 +++++++++++++++++
>  arch/riscv/include/asm/cpuidle.h   | 11 +-------
>  arch/riscv/include/asm/hwcap.h     |  1 +
>  arch/riscv/include/asm/processor.h | 17 +++++++++++++
>  arch/riscv/kernel/cpu.c            |  5 ++++
>  arch/riscv/kernel/cpufeature.c     |  1 +
>  arch/riscv/kernel/process.c        | 41 +++++++++++++++++++++++++++++-
>  7 files changed, 89 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index be09c8836d56..a0d344e9803f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -19,6 +19,7 @@ config RISCV
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_BINFMT_FLAT
> +	select ARCH_HAS_CPU_FINALIZE_INIT
>  	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> @@ -525,6 +526,20 @@ config RISCV_ISA_SVPBMT
> =20
>  	   If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_ZAWRS
> +	bool "Zawrs extension support for wait-on-reservation-set instructions"
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the Zawrs
> +	   extension and enable its usage.

Drew, could you, in your update, use the wording:
	   Add support for enabling optimisations in the kernel when the
	   Zawrs extension is detected at boot.

There was some confusion recently about what these options were actually
for, because this option doesn't control "dynamic detection" as the
ACPI or DT detection is compiled at all times. I had written a patch for
this wording in other options at the time but had forgotten to properly
send it:
https://lore.kernel.org/linux-riscv/20240418-stable-railway-7cce07e1e440@sp=
ud/T/#u

> +
> +	   The Zawrs extension defines a pair of instructions to be used
> +	   in polling loops that allows a core to enter a low-power state
> +	   and wait on a store to a memory location.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_V
>  	bool
>  	default y
> @@ -1075,6 +1090,15 @@ endmenu # "Power management options"
> =20
>  menu "CPU Power Management"
> =20
> +config RISCV_ZAWRS_IDLE
> +	bool "Idle thread using ZAWRS extensions"
> +	depends on RISCV_ISA_ZAWRS
> +	default y
> +	help
> +		Adds support to implement idle thread using ZAWRS extension.
> +
> +		If you don't know what to do here, say Y.

I don't think this second option is needed, why would we not always want
to use the Zawrs version of this when it is available? Can we do it
unconditionally when RISCV_ISA_ZAWRS is set and the extension is
detected at runtime?

Cheers,
Conor.



--W4+rgWywh9lWFt3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiE20wAKCRB4tDGHoIJi
0mB2AP9jDM+N0TaP3N/aRVlNJxBAwWPjQeQiXXdjkXc4uIfepAEAxccqrQyX3H0O
FYtsk8xkGJ2X1LJ0uU4Kb7k4EqyF5wA=
=byH8
-----END PGP SIGNATURE-----

--W4+rgWywh9lWFt3p--


--===============8085477365329279041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8085477365329279041==--

