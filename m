Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D6BC636CD
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 21:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DnZuMRY4oPtF2eYn05tvYDvOn10eqBE6Atth3S1QHU=; b=vU9TQRBFj3pB8abokuzhWXxA3D
	CVQ3bPH/3yo0wyRYvrXkz3cpsfmNNBTyOGI9VhbcRcJfCLuoQ1RH7ercQgnTinbNJV5aB2sn4GEMt
	YKODg1lylY/vRI2epp7e2LuNmoduSyZxuo7nb99Eiecu+qcRSxRE5/mUuPEI4t/0RmoUhh0tAiQ9S
	BO+K3zU3xqlAXM/oSMt3xplpqcg/3dmnJRJOrWUYD/bJlUm3K5vaMJH8HtfEW/fdfpzJWoAsGQaox
	oSVHZGDK+jnQtJZT0NDsD57puhZd2zRuHHss4gwrqzz2s3rSlGrEhPjJ3+7WIhVDxx2N75q+yroh+
	zxKEVfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMc1l-005YOW-5X; Mon, 30 Jan 2023 21:49:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMc1i-005YNe-JK
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 21:49:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1923961268;
	Mon, 30 Jan 2023 21:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA69BC433D2;
	Mon, 30 Jan 2023 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675115361;
	bh=CeFUjt1qi5cKN9n5135B7q6JriZX4WQ5PfaYh6IzHlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSGnSoSJmHmWMBcJL26Y/a/Qjynrpse+xHoQ1tZddfwIMjmAyA4aXHxAUILnJVrhb
	 ocS7+ydtWz02tmR36c6QURDWz8ciMBGcuOgo1oUN8Ft0dj3AalzCDjWHFpcsnXZHHO
	 j3yYxikggkmbFVub5fNafgWrsVsYF930niOqj6ialkRAZb6dtAt6rhL9PBvhLhz0Hp
	 zVmE4/exYbDVayHy2FAJZf1jyJU7tzjycHRD1zPlsEvTyuEDzvRltMlNTcvJ38lbYi
	 ekE4ZOdQAeNLFXTeFKtXk2BtOoEhq3wMem3WHs3pFKW6nhFwGN+Oc33aWs8e6VQzxp
	 sn1YFg4qHiM9w==
Date: Mon, 30 Jan 2023 21:49:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH v3 2/4] RISC-V: Factor out common code of
 __cpu_resume_enter()
Message-ID: <Y9g7XeTbWjCxB3BT@spud>
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230127091051.1465278-3-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_134922_736590_D104ADA4 
X-CRM114-Status: GOOD (  19.08  )
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
Content-Type: multipart/mixed; boundary="===============6418969245247948295=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6418969245247948295==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hb+0kK26SmitlXYB"
Content-Disposition: inline


--Hb+0kK26SmitlXYB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2023 at 05:10:49PM +0800, Sia Jee Heng wrote:
> The cpu_resume() function is very similar for the suspend to disk and
> suspend to ram cases. Factor out the common code into restore_csr macro
> and restore_reg macro.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>  arch/riscv/include/asm/assembler.h | 62 ++++++++++++++++++++++++++++++
>  arch/riscv/kernel/suspend_entry.S  | 34 ++--------------
>  2 files changed, 65 insertions(+), 31 deletions(-)
>  create mode 100644 arch/riscv/include/asm/assembler.h
>=20
> diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/=
assembler.h
> new file mode 100644
> index 000000000000..ef1283d04b70
> --- /dev/null
> +++ b/arch/riscv/include/asm/assembler.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + *
> + * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
> + */
> +
> +#ifndef __ASSEMBLY__
> +#error "Only include this from assembly code"
> +#endif
> +
> +#ifndef __ASM_ASSEMBLER_H
> +#define __ASM_ASSEMBLER_H
> +
> +#include <asm/asm.h>
> +#include <asm/csr.h>
> +#include <asm/asm-offsets.h>
> +
> +/**
> + * restore_csr - restore hart's CSR value
> + */
> +	.macro restore_csr
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
> +		csrw	CSR_EPC, t0
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
> +		csrw	CSR_STATUS, t0
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
> +		csrw	CSR_TVAL, t0
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
> +		csrw	CSR_CAUSE, t0
> +	.endm
> +
> +/**
> + * restore_reg - Restore registers (except A0 and T0-T6)

arch/riscv/include/asm/assembler.h:34: warning: Incorrect use of kernel-doc=
 format:  * restore_reg - Restore registers (except A0 and T0-T6)

Otherwise, LGTM.

> + */
> +	.macro restore_reg
> +		REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
> +		REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
> +		REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
> +		REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
> +		REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
> +		REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
> +		REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
> +		REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
> +		REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
> +		REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
> +		REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
> +		REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
> +		REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
> +		REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
> +		REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
> +		REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
> +		REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
> +		REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
> +		REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
> +		REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
> +		REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
> +		REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
> +		REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> +	.endm
> +
> +#endif	/* __ASM_ASSEMBLER_H */
> diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspen=
d_entry.S
> index aafcca58c19d..74a8fab8e0f6 100644
> --- a/arch/riscv/kernel/suspend_entry.S
> +++ b/arch/riscv/kernel/suspend_entry.S
> @@ -7,6 +7,7 @@
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>  #include <asm/asm-offsets.h>
> +#include <asm/assembler.h>
>  #include <asm/csr.h>
>  #include <asm/xip_fixup.h>
> =20
> @@ -83,39 +84,10 @@ ENTRY(__cpu_resume_enter)
>  	add	a0, a1, zero
> =20
>  	/* Restore CSRs */
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
> -	csrw	CSR_EPC, t0
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
> -	csrw	CSR_STATUS, t0
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
> -	csrw	CSR_TVAL, t0
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
> -	csrw	CSR_CAUSE, t0
> +	restore_csr
> =20
>  	/* Restore registers (except A0 and T0-T6) */
> -	REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
> -	REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
> -	REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
> -	REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
> -	REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
> -	REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
> -	REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
> -	REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
> -	REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
> -	REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
> -	REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
> -	REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
> -	REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
> -	REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
> -	REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
> -	REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
> -	REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
> -	REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
> -	REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
> -	REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
> -	REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
> -	REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
> -	REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> +	restore_reg
> =20
>  	/* Return zero value */
>  	add	a0, zero, zero
> --=20
> 2.34.1
>=20

--Hb+0kK26SmitlXYB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9g7XQAKCRB4tDGHoIJi
0gfTAP94o9Bp9hjJ9nyX1uAV0kJl3St5aJLTOE4jHIfw7w0AbQEA36tFzpX/hj8T
eFWNhYi0dCzk90b9EkfBFpnoG3Zr8gs=
=San3
-----END PGP SIGNATURE-----

--Hb+0kK26SmitlXYB--


--===============6418969245247948295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6418969245247948295==--

