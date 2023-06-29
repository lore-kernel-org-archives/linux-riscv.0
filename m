Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A17EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIVYSXqk8tosenkE5VHuKpVGG6WOZ3g541L/Asiwgys=; b=tGP76hTXVDzdPqZ5YsXqrXgkKy
	iAQTlVOPR1eQrBL1RMKIOjjIeBOanzQknpj/pi2aAAlcH6i+4606XfGjPdTx2firwIW2rP5sp1pwE
	BRtvgsVDbQQUY+pRDK4S0Sqg04jwViG5JoPoQAMUMfNYv4Cn+fMX5PvUNf5Ef4HibbPaSbC8oTSBi
	tr6tW9zzXlwiAbXZChAOtRy17CpLON7oqFlwLw12G8G78lkTm1Px5LyZ3MoT7ApnlqIzHcbWUYdh2
	HhWB7DWRP8MjpRKN8pl8qGPD6KEwLU9/ZGlDy7efD9xruq5HWxyS9hiFSKBqqc5aDvLhcNNQ2XAih
	GtBkQDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEluH-000Boo-1X;
	Thu, 29 Jun 2023 07:17:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEluE-000Bo2-1O
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 07:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688023050; x=1719559050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nK8BedOH27UtXwec6PHB9EByjtu/2aErMUP6wGpmuCk=;
  b=PQXBgDKqv1EFj1uqwqPaHh7T2RtqLU4YBAXBqKXCNvW5tMXuX3nT5NbG
   kDV+EpDhEIg72VqDQB36IRmKSz+Mn2KgcswX5GOuE/pu3AIkRCzY5SQw2
   BVWBrktsY7EUHHjWRdHqCbn52GtaB2NpOoQFwp4AncGf0bs62jBLkKjv7
   eSb1RUJBU4Bt5BS1ALq6BrqDoOrzn8nGwaWozwY4PC40CDciGeXH4J5Lu
   y3aeugfDadyEvUIYeOby9B4wIYeqzTMF4VOUY8OzpWuwl1S71FB9kW45+
   +npLt6bPOaX9FZzumeO+7vU3MKlmVzhK2x/vYYm02onbukyi3MC9HiYRp
   A==;
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="asc'?scan'208";a="159095504"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 00:17:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 00:17:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 00:17:08 -0700
Date: Thu, 29 Jun 2023 08:16:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	<linux-kernel@vger.kernel.org>, <linux@rivosinc.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, =?iso-8859-1?Q?R=E9mi?= Denis-Courmont
	<remi@remlab.net>, Darius Rad <darius@bluespec.com>
Subject: Re: [PATCH v3] riscv: Discard vector state on syscalls
Message-ID: <20230629-flight-vanity-c1c86240e7fc@wendy>
References: <20230629062730.985184-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230629062730.985184-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_001730_704449_DE065E6F 
X-CRM114-Status: GOOD (  19.49  )
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
Content-Type: multipart/mixed; boundary="===============7744334299619576878=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7744334299619576878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gPSfqy8IpN60HMsQ"
Content-Disposition: inline

--gPSfqy8IpN60HMsQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Jun 29, 2023 at 08:27:30AM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> The RISC-V vector specification states:
>   Executing a system call causes all caller-saved vector registers
>   (v0-v31, vl, vtype) and vstart to become unspecified.
>=20
> The vector registers are set to all 1s, vill is set (invalid), and the
> vector status is set to Dirty.
>=20
> That way we can prevent userspace from accidentally relying on the
> stated save.
>=20
> R=E9mi pointed out [1] that writing to the registers might be
> superfluous, and setting vill is sufficient.
>=20
> Link: https://lore.kernel.org/linux-riscv/12784326.9UPPK3MAeB@basile.reml=
ab.net/ # [1]
> Suggested-by: Darius Rad <darius@bluespec.com>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: R=E9mi Denis-Courmont <remi@remlab.net>
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

clang allmodconfig and rv32_defconfig fail to build with this patch,
according to patchwork:
=2E./arch/riscv/kernel/traps.c:299:3: error: call to undeclared function 'r=
iscv_v_vstate_discard'; ISO C99 and later do not support implicit function =
declarations [-Wimplicit-function-declaration]

Cheers,
Conor.

> ---
>=20
> v2->v3:
>   Set state to Dirty after discard, for proper ptrace() handling
>   (Andy)
>=20
> v1->v2:
>   Proper register restore for initial state (Andy)
>   Set registers to 1s, and not 0s (Darius)
>=20
> ---
>  arch/riscv/include/asm/vector.h | 33 +++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/traps.c       |  2 ++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 04c0b07bf6cd..0b23056503c5 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -33,6 +33,11 @@ static inline void __riscv_v_vstate_clean(struct pt_re=
gs *regs)
>  	regs->status =3D (regs->status & ~SR_VS) | SR_VS_CLEAN;
>  }
> =20
> +static inline void __riscv_v_vstate_dirty(struct pt_regs *regs)
> +{
> +	regs->status =3D (regs->status & ~SR_VS) | SR_VS_DIRTY;
> +}
> +
>  static inline void riscv_v_vstate_off(struct pt_regs *regs)
>  {
>  	regs->status =3D (regs->status & ~SR_VS) | SR_VS_OFF;
> @@ -128,6 +133,34 @@ static inline void __riscv_v_vstate_restore(struct _=
_riscv_v_ext_state *restore_
>  	riscv_v_disable();
>  }
> =20
> +static inline void __riscv_v_vstate_discard(void)
> +{
> +	unsigned long vl, vtype_inval =3D 1UL << (BITS_PER_LONG - 1);
> +
> +	riscv_v_enable();
> +	asm volatile (
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
> +		"vmv.v.i	v0, -1\n\t"
> +		"vmv.v.i	v8, -1\n\t"
> +		"vmv.v.i	v16, -1\n\t"
> +		"vmv.v.i	v24, -1\n\t"
> +		"vsetvl		%0, x0, %1\n\t"
> +		".option pop\n\t"
> +		: "=3D&r" (vl) : "r" (vtype_inval) : "memory");
> +	riscv_v_disable();
> +}
> +
> +static inline void riscv_v_vstate_discard(struct pt_regs *regs)
> +{
> +	if ((regs->status & SR_VS) =3D=3D SR_VS_OFF)
> +		return;
> +
> +	__riscv_v_vstate_discard();
> +	__riscv_v_vstate_dirty(regs);
> +}
> +
>  static inline void riscv_v_vstate_save(struct task_struct *task,
>  				       struct pt_regs *regs)
>  {
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 5158961ea977..5ff63a784a6d 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -296,6 +296,8 @@ asmlinkage __visible __trap_section void do_trap_ecal=
l_u(struct pt_regs *regs)
>  		regs->epc +=3D 4;
>  		regs->orig_a0 =3D regs->a0;
> =20
> +		riscv_v_vstate_discard(regs);
> +
>  		syscall =3D syscall_enter_from_user_mode(regs, syscall);
> =20
>  		if (syscall < NR_syscalls)
>=20
> base-commit: 488833ccdcac118da16701f4ee0673b20ba47fe3
> --=20
> 2.39.2
>=20

--gPSfqy8IpN60HMsQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ0vyAAKCRB4tDGHoIJi
0lq4AQDJmBkHL9uIQXrGq+rw+KjV4YUtkqA5kGQjaCE1hV7yRgD+IhiI2ceg403c
DPXV+9dDiRYpV22IGnuLTS/P4kB8dAU=
=gsD+
-----END PGP SIGNATURE-----

--gPSfqy8IpN60HMsQ--


--===============7744334299619576878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7744334299619576878==--

