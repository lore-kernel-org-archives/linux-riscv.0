Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989B5C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 19:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRPE2mCfseGT3K68fXUVveqPG3rY+VLYW9+K9laS1EQ=; b=JFhToz4rhmLD59m3ecKFcdGLqb
	Cvhnm5n0Dfyh/ZtvO8tepZx1Z3HL3G2KGR27AUrstH2RynuvyZivwYKbuD446gASDtmhIvByS0jGO
	+M02p61sSK43NzaIsYoiono9egmUy8dQV8s4ekhbkq9dW9eJbbEjHbMJAxdCNVZ/IMzRCtWvGuOf8
	zzNI9l5NByrIhOXXGI4+yPpuWRyGFXvDl7VxaxOu5eNs+jpds7asR/QQaENTiq+wzjhJAldC2DShU
	xHDY2huzMgP2YfaR4rkUJLjsCr3mco/v/Uh4oNNV5SrFnXwfp5CSbJkcOp0L5YLjBGU7JtiX3gB1U
	sn+v/jbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqY6-00GoPX-6C; Wed, 08 Feb 2023 19:56:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqY0-00GoOK-34
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 19:56:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C03C617CA;
	Wed,  8 Feb 2023 19:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB6AC433EF;
	Wed,  8 Feb 2023 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675886162;
	bh=Nj7MhMOma/HhW6EJVI/dLGhU2fOrQO9qpmLNfI/Who4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcEo3DMVV4Y7zsWygtvXpZ31miHsh4fX1lyo9Z2R7rBcUexvI/yMFmEMPUd3Casfk
	 Q8sYLT2sNaRJ+9Qj1Ve8Oeu+XmdS78gf2n/DymN3UiJ3KylKavgJql5I1RgwZFZE4v
	 KQ/ZeE4ZoUSn8q16KrBtyXmkjbCo3xpQvUGOGd+D5/U9PdPRTh8vCxo16SVlZBcGMg
	 Ebb7W28UH1pG2cszbdgIbDeGYQsRypqEhkW1xRlWEcXdaLm0acZp0rn7qSFCoXE2ry
	 sU9GYsazGaEWdMj/aFnHMqQELDmjQSTFfHBMPg7Fwyc09MWDZET2zmaaZtoT6FmaPE
	 qkDpl8yODLD9g==
Date: Wed, 8 Feb 2023 19:55:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 04/24] RISC-V: ACPI: Add empty headers to enable ACPI core
Message-ID: <Y+P+TF1MJ2OnwHVX@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-5-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_115604_230672_F45FC7E9 
X-CRM114-Status: GOOD (  20.20  )
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
Content-Type: multipart/mixed; boundary="===============5512597651241688373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5512597651241688373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NmY+w7HCTBD70FFj"
Content-Disposition: inline


--NmY+w7HCTBD70FFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:05PM +0530, Sunil V L wrote:
> Few header files are required unconditionally by ACPI core.

nit: A few. Without the article this has a different meaning.

> So add empty header files for now and update it when needed.

s/ and update it when needed// ;)

>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/acenv.h | 17 +++++++++++++++++
>  arch/riscv/include/asm/cpu.h   |  9 +++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 arch/riscv/include/asm/acenv.h
>  create mode 100644 arch/riscv/include/asm/cpu.h
>=20
> diff --git a/arch/riscv/include/asm/acenv.h b/arch/riscv/include/asm/acen=
v.h
> new file mode 100644
> index 000000000000..bbc38ecdf753
> --- /dev/null
> +++ b/arch/riscv/include/asm/acenv.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * RISC-V specific ACPICA environments and implementation
> + *
> + * Copyright (C) 2014, Linaro Ltd.
> + *   Author: Hanjun Guo <hanjun.guo@linaro.org>
> + *   Author: Graeme Gregory <graeme.gregory@linaro.org>
> + * Copyright (C) 2023, Ventana Micro Systems Inc.
> + *   Author: Sunil V L <sunilvl@ventanamicro.com>

More out of idle curiosity than anything else, but what, may I ask, is
copyrightable about 2 empty files?
Triply so given there are !3! contributors to said empty file!

> + */
> +
> +#ifndef _ASM_ACENV_H
> +#define _ASM_ACENV_H
> +
> +/* It is required unconditionally by ACPI core, update it when needed. */

How come this file gets a comment and the other doesn't?
Also the comment doesn't really make much sense to me in a vacuum, and
ideally would read like:
"This header is required unconditionally by the ACPI core"
That is, if a comment is really even needed.

Cheers,
Conor.

> +
> +#endif /* _ASM_ACENV_H */
> diff --git a/arch/riscv/include/asm/cpu.h b/arch/riscv/include/asm/cpu.h
> new file mode 100644
> index 000000000000..51ec1a89a7a9
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpu.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2014 ARM Ltd.
> + * Copyright (C) 2023 Ventana Micro Systems Inc.
> + */
> +#ifndef __ASM_CPU_H
> +#define __ASM_CPU_H
> +
> +#endif /* __ASM_CPU_H */
> --=20
> 2.38.0
>=20

--NmY+w7HCTBD70FFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+P+TAAKCRB4tDGHoIJi
0lCXAQCMJNnnXM92WRsao6hIMtmCm8CiXSb5vBbh41ZMlT//rgD8DVM5pRplyPUB
oIfuBKsZMkhJ3PwPcrbDHKHeWNlxLgg=
=8eKC
-----END PGP SIGNATURE-----

--NmY+w7HCTBD70FFj--


--===============5512597651241688373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5512597651241688373==--

