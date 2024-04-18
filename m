Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBC7C04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8aNTP9Tn83ldfFbb9mL271OxG8mNWzyN/FFd7wTC1w=; b=M/nX9YjE9QdUdSeAGRlVGFzKGk
	4n+OE7Rk80yyhRu54154+8SZz+fzXGt1KqSj2acUlmNuUspogi0fj0PPCReKGAmfgEQjeogoKh8Pv
	xKOmxHlHs72sDHQv5lVNr3m3NxP27e0RcoDG96Vgy/PExBm1FFZiqJK1FdzfFVSHHW10ISlyV8aRP
	y3zYdeXBw9Q+Kp16LfEcEsuiCTStPYWH59fOdr2+u6/t6GhKWfJJopC/TOJJ+fDNy8iwmMpMW1KQk
	HnoE2lXX+jo6f6tnVIsAVTCpDPmFniF6KPCcMd95BP9Za7er9imJ3uy4Imq1/95CsaGHiJ5qenNWQ
	prRaL0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPXU-00000001vDw-0NYu;
	Thu, 18 Apr 2024 11:02:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPXM-00000001vAP-2f61
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 11:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713438161; x=1744974161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FyCYOXuQuFnqLJOd0ixM+LSRi8DdC/fR8KXM8DwEEqA=;
  b=DifVgYHlQfBx5zI6f9CeWUBcx4z3d7M+vK/34ptvXsx3lLJwGEzy2EWK
   3/ZBD8q6oFk8u1k7Q9XrN/S5k0ncYWzhFFEI1w/LlUeHJHkanKrtDFPgL
   Qbyu909DLn0CT50D/ukR6JpnrzXvLBY+xdNJV5WZNCggH6IK4IP0gH51H
   Wo+jhwNzgfd2R6XO6EqIKGSZPDn5tM5VIVry1PkcxFv6N7f0LFPYkDbiy
   X7H25nEFl4PUEkkstO9xJhR4n776mHLGqPs/ISbAEp11VS7S8q1XYHUk8
   rHgxaH3ZeM2jA8INnntyofteV5cq6JbmLZBH07VvRkAta4FdPOvN3Lf9k
   w==;
X-CSE-ConnectionGUID: rvrVkihjRC23jbRPgAPjgA==
X-CSE-MsgGUID: 1ioO6pXxSeexXatwL4Ch4w==
X-IronPort-AV: E=Sophos;i="6.07,212,1708412400"; 
   d="asc'?scan'208";a="252394332"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2024 04:02:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 04:02:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 04:02:25 -0700
Date: Thu, 18 Apr 2024 12:02:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	<heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Evan
 Green <evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, Joel Granados
	<j.granados@samsung.com>, Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240418-brook-chili-4d3e61d1a55c@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_040240_808794_14D9EFC0 
X-CRM114-Status: GOOD (  34.81  )
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
Content-Type: multipart/mixed; boundary="===============7882935811493631889=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7882935811493631889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gv1MjADy0vzlN0Wa"
Content-Disposition: inline

--Gv1MjADy0vzlN0Wa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Eric, Jerry

On Fri, Apr 12, 2024 at 02:49:03PM +0800, Andy Chiu wrote:
> Make has_vector take one argument. This argument represents the minimum
> Vector subextension that the following Vector actions assume.
>=20
> Also, change riscv_v_first_use_handler(), and boot code that calls
> riscv_v_setup_vsize() to accept the minimum Vector sub-extension,
> ZVE32X.
>=20
> Most kernel/user interfaces requires minimum of ZVE32X. Thus, programs
> compiled and run with ZVE32X should be supported by the kernel on most
> aspects. This includes context-switch, signal, ptrace, prctl, and
> hwprobe.
>=20
> One exception is that ELF_HWCAP returns 'V' only if full V is supported
> on the platform. This means that the system without a full V must not
> rely on ELF_HWCAP to tell whether it is allowable to execute Vector
> without first invoking a prctl() check.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Acked-by: Joel Granados <j.granados@samsung.com>

I'm not sure that I like this patch to be honest. As far as I can tell,
every user here of has_vector(ext) is ZVE32X, so why bother actually
having an argument?

Could we just document that has_vector() is just a tyre kick of "is
there a vector unit and are we allowed to use it", and anything
requiring more than the bare-minimum (so zve32x?)must explicitly check
for that form of vector using riscv_has_extension_[un]likely()?

Finally, the in-kernel crypto stuff or other things that use
can_use_simd() to check for vector support - do they all function correctly
with all of the vector flavours? I don't understand the vector
extensions well enough to evaluate that - I know that they do check for
the individual extensions like Zvkb during probe but don't have anything
for the vector version (at least in the chacha20 and sha256 glue code).
If they don't, then we need to make sure those drivers do not probe with
the cut-down variants.

Eric/Jerry (although read the previous paragraph too):
I noticed that the sha256 glue code calls crypto_simd_usable(), and in
turn may_use_simd() before kernel_vector_begin(). The chacha20 glue code
does not call either, which seems to violate the edict in
kernel_vector_begin()'s kerneldoc:
"Must not be called unless may_use_simd() returns true."

What am I missing there?

Cheers,
Conor.


> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index c8219b82fbfc..e7c3fcac62a1 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  	if (riscv_isa_extension_available(NULL, c))
>  		pair->value |=3D RISCV_HWPROBE_IMA_C;
> =20
> -	if (has_vector())
> +	if (has_vector(v))
>  		pair->value |=3D RISCV_HWPROBE_IMA_V;
> =20
>  	/*
> @@ -112,7 +112,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *p=
air,
>  		EXT_KEY(ZACAS);
>  		EXT_KEY(ZICOND);
> =20
> -		if (has_vector()) {
> +		/*
> +		 *  Vector crypto and ZVE* extensions are supported only if
> +		 *  kernel has minimum V support of ZVE32X.
> +		 */
> +		if (has_vector(ZVE32X)) {
>  			EXT_KEY(ZVE32X);
>  			EXT_KEY(ZVE32F);
>  			EXT_KEY(ZVE64X);

I find this to be an indicate of the new has_vector() being a poor API,
as it is confusing that a check
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 6727d1d3b8f2..e8a47fa72351 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -53,7 +53,7 @@ int riscv_v_setup_vsize(void)
> =20
>  void __init riscv_v_setup_ctx_cache(void)
>  {
> -	if (!has_vector())
> +	if (!has_vector(ZVE32X))
>  		return;
> =20
>  	riscv_v_user_cachep =3D kmem_cache_create_usercopy("riscv_vector_ctx",
> @@ -173,8 +173,11 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>  	u32 __user *epc =3D (u32 __user *)regs->epc;
>  	u32 insn =3D (u32)regs->badaddr;
> =20
> +	if (!has_vector(ZVE32X))
> +		return false;
> +
>  	/* Do not handle if V is not supported, or disabled */
> -	if (!(ELF_HWCAP & COMPAT_HWCAP_ISA_V))
> +	if (!riscv_v_vstate_ctrl_user_allowed())
>  		return false;
> =20
>  	/* If V has been enabled then it is not the first-use trap */
> @@ -213,7 +216,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
>  	bool inherit;
>  	int cur, next;
> =20
> -	if (!has_vector())
> +	if (!has_vector(ZVE32X))
>  		return;
> =20
>  	next =3D riscv_v_ctrl_get_next(tsk);
> @@ -235,7 +238,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
> =20
>  long riscv_v_vstate_ctrl_get_current(void)
>  {
> -	if (!has_vector())
> +	if (!has_vector(ZVE32X))
>  		return -EINVAL;
> =20
>  	return current->thread.vstate_ctrl & PR_RISCV_V_VSTATE_CTRL_MASK;
> @@ -246,7 +249,7 @@ long riscv_v_vstate_ctrl_set_current(unsigned long ar=
g)
>  	bool inherit;
>  	int cur, next;
> =20
> -	if (!has_vector())
> +	if (!has_vector(ZVE32X))
>  		return -EINVAL;
> =20
>  	if (arg & ~PR_RISCV_V_VSTATE_CTRL_MASK)
> @@ -296,7 +299,7 @@ static struct ctl_table riscv_v_default_vstate_table[=
] =3D {
> =20
>  static int __init riscv_v_sysctl_init(void)
>  {
> -	if (has_vector())
> +	if (has_vector(ZVE32X))
>  		if (!register_sysctl("abi", riscv_v_default_vstate_table))
>  			return -EINVAL;
>  	return 0;
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index bc22c078aba8..bbe143bb32a0 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -14,7 +14,7 @@
> =20
>  SYM_FUNC_START(__asm_copy_to_user)
>  #ifdef CONFIG_RISCV_ISA_V
> -	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CO=
NFIG_RISCV_ISA_V)
> +	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32=
X, CONFIG_RISCV_ISA_V)
>  	REG_L	t0, riscv_v_usercopy_threshold
>  	bltu	a2, t0, fallback_scalar_usercopy
>  	tail enter_vector_usercopy
>=20
> --=20
> 2.44.0.rc2
>=20

--Gv1MjADy0vzlN0Wa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiD9sgAKCRB4tDGHoIJi
0hS5AQCdwRiPTKaH/dGSkcjf1wQonDQjGD5X0skDUYsM0VZcdQEAz/immLGV5ulM
Dxx67jswzCJGlWQgDMMvkyy3LXO4fgA=
=Td09
-----END PGP SIGNATURE-----

--Gv1MjADy0vzlN0Wa--


--===============7882935811493631889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7882935811493631889==--

