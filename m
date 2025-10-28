Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2305CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBYnHo+8XOZj+xpGlDveMFrqQZSePlboWGxrY1gGzUs=; b=DMQyRPISdYYYjqWYWIT5Me5u3J
	9HU/d8FJ6RirPSCbLFTSgthd984n33dZK9NApnYwpiCU+l3kx6E6hmqBOdRoKAZ4ptqzZyl83uDbd
	LJhK6UJVrFMJLI18mJAoNUmJVO23xtQ1vIjIfEprRmnubWjrnq6u7i0bI+rMrZCQLwHBj5veEqgmX
	VdpnUsKCNnN6649ZIjRgEfoIBupVKdQ2hWH6xxJ5M2C1LCwgPZun+SmEjqyNT8nqOeW54eMkSob6Z
	iiKBKv79KN6JLC+xSF3VdFVlBmiej+DLAGizZCvuwEpgsO9BPqHT4mqVxAbrImjINhYEr4KqQCbgt
	cKHvR3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhKl-0000000Fnhc-443h;
	Tue, 28 Oct 2025 10:53:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhKk-0000000FnhC-2FhA
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 10:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0194A4174A;
	Tue, 28 Oct 2025 10:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6227FC4CEE7;
	Tue, 28 Oct 2025 10:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761648825;
	bh=o2i+hy59JTIggu4JkKszi2raX5XX+rmhgCt0oVfg3ZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7BnFmJRDOshpE8vQBRrbCa3ydyjv2KFtBTVJqPK7+5Gp+MkVkpJmV9Pwf+2cDMin
	 w8iMhGqdRz+NsCjfKLkYN5a1aIA4VNNf+I63Ae/u5X6q07NOfNasqYLajschcvQuvi
	 nCrE1zfmZnkX/myc+8zIhLfog0VbA257/WTgHNAJcyCCtE951QszHIw/Xlqcmk5JYf
	 3Fgk+sjNNC3cJZMkvJtRhGhok45wbLhc5nvkbgujozxogp7QFRRfwCB5CAn8J+X/P8
	 eW/r0WTbVPOGZEDfYC3yJMu3j0I0K1CMiu+U/Y+Tk/qz5JBgXP3RudXYu29uy9vszu
	 +Xo446SnG3wNA==
Date: Tue, 28 Oct 2025 10:53:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, luxu.kernel@bytedance.com, atishp@rivosinc.com,
	cleger@rivosinc.com, ajones@ventanamicro.com,
	apatel@ventanamicro.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, songshuaishuai@tinylab.org,
	bjorn@rivosinc.com, charlie@rivosinc.com, masahiroy@kernel.org,
	valentina.fernandezalanis@microchip.com, jassisinghbrar@gmail.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH 1/3] drivers: firmware: riscv: add SSE NMI support
Message-ID: <20251028-foam-hypocrite-f37fe270115d@spud>
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
 <20251027133431.15321-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20251027133431.15321-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_035346_615926_EEDFCA63 
X-CRM114-Status: GOOD (  22.49  )
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
Content-Type: multipart/mixed; boundary="===============7670810950400344154=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7670810950400344154==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+zhbmMplIx6EbLzo"
Content-Disposition: inline


--+zhbmMplIx6EbLzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 09:34:29PM +0800, Yunhui Cui wrote:
> Add support for handling Non-Maskable Interrupts (NMIs) through the
> RISC-V Supervisor Software Events (SSE) framework. Since each NMI
> type(e.g., unknown NMI, etc.) requires a distinct SSE event, a newfile
> sse_nmi.c is introduced to manage their registration and enabling.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  MAINTAINERS                      |  7 +++
>  arch/riscv/include/asm/sbi.h     |  1 +
>  drivers/firmware/riscv/Kconfig   | 10 ++++
>  drivers/firmware/riscv/Makefile  |  1 +
>  drivers/firmware/riscv/sse_nmi.c | 81 ++++++++++++++++++++++++++++++++
>  5 files changed, 100 insertions(+)
>  create mode 100644 drivers/firmware/riscv/sse_nmi.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8bf5416953f45..6df6cbec4d85d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22057,6 +22057,13 @@ S:	Maintained
>  F:	drivers/firmware/riscv/riscv_sse.c
>  F:	include/linux/riscv_sse.h
> =20
> +RISC-V SSE NMI SUPPORT
> +M:	Yunhui Cui <cuiyunhui@bytedance.com>
> +R:	Xu Lu <luxu.kernel@bytedance.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	drivers/firmware/riscv/sse_nmi.c

Does actually this need a separate entry?

>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
>  M:	Guo Ren <guoren@kernel.org>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 874cc1d7603a5..52d3fdf2d4cc1 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -486,6 +486,7 @@ enum sbi_sse_attr_id {
>  #define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
>  #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
>  #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000

> +#define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001

Where is this canonically defined?

I looked at the v3 SBI spec and it says:
0xffff0001 - 0xffff3fff Local events reserved for future use
This needs to be marked RFC until this event is in a frozen version of
the SBI spec.

>  #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
> =20
>  #define SBI_SSE_EVENT_PLATFORM		BIT(14)
> diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kcon=
fig
> index ed5b663ac5f91..fd16b4c43cf01 100644
> --- a/drivers/firmware/riscv/Kconfig
> +++ b/drivers/firmware/riscv/Kconfig
> @@ -12,4 +12,14 @@ config RISCV_SBI_SSE
>  	  this option provides support to register callbacks on specific SSE
>  	  events.
> =20
> +config RISCV_SSE_NMI

I think I'd like to see both the filename and Kconfig option match the
established naming for the base sse support.

> +	bool "Enable SBI Supervisor Software Events NMI support"
> +	depends on RISCV_SBI_SSE
> +	default y
> +	help
> +	  This option enables support for delivering Non-Maskable Interrupt
> +	  (NMI) notifications through the Supervisor Software Events (SSE)
> +	  framework.

> When enabled, the system supports some common NMI features
> +	  such as unknown NMI handling.

No, when enabled the _kernel_ supports these things. The code in this
patch seems to fail gracefully when there's no SSE support in the
underlying system, but you should make the option description match
reality.

Cheers,
Conor.

--+zhbmMplIx6EbLzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQCgswAKCRB4tDGHoIJi
0itnAQDnpl32Y0LtSa+sgVEcSirydmilahyOEHFqJeoVuN3qJQEA3IwUjCLKYTo9
5TmToOPz2OqeTGSRyc455k4/O7slyQk=
=f9tW
-----END PGP SIGNATURE-----

--+zhbmMplIx6EbLzo--


--===============7670810950400344154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7670810950400344154==--

