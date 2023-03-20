Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4399C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSOz6QA547dhEzEtQAMDB2NnLHqbnBFLtmVtksRuGok=; b=XO2i3udnGTR1EDTjaH38fP9fVR
	8qo5ZBciWe8cZpM/zbD7gc80fW3/L+vA8qyfs5jz0kRwCcIcMYGfPk7CiWmdCy/3ekQzxFxK0eZEX
	I8q51zQ+HHD/lah7Je1tTWgGMe3Vwg7IRR9Gu63XaT/D7OZcY3ZGinGB4aAW8IFpbZcPftVxUci7R
	hGlYwKIRryZcsRlJOLrhTtB/ajkf/KSnysjNel6+fIMT+31sM+uNhuaNZv0HG51Yhu9t6K1AXCmhF
	PQF02VrkrjPwDx2UG+VGPJ7aMMVnYj6aMu+3tW2gdEH8pZtqCT5bJKRn2GJl/dlM2dVLK7f58pUZG
	wlv9rnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFCp-00936M-1F;
	Mon, 20 Mar 2023 13:05:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFCm-00935f-2Q;
	Mon, 20 Mar 2023 13:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679317540; x=1710853540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vPMTTr7gr1vB/hswDtcnPIfmmPNBZ98WhX1DDACOsbY=;
  b=WxeaL23DJ1u+9M7xZS+WOFXgxi/kz3OAWXbkyHyxM0UQGxYppusfNXeu
   5i78gtW7qVkOZdr8s0v7jHkgbc3ZXVlBkHB26aXp0Chi2JKoXR1CiLdCZ
   cvbNCARAVmfrDXXg7+wW5Yuv2MIHjU4QO6gXgyNRgGMg5qMepRzNsyqev
   LEPV+msmbRXvH+Oki7F1kCwS8pyEDBuLeYd725zGn6+zLpXJDnQkjSpU4
   J5pWWcRTpLuwtNSjLNGHWL+Mr50up/71Q67VJctXsP77kIctqB/de/Qr7
   qA3amaA/UOOZ5l9YpCgElcFL+Y8Ao54XfVeO9TkZEv3KNtGQlYlz2vgZW
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="206279037"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 06:05:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 06:05:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 06:05:35 -0700
Date: Mon, 20 Mar 2023 13:05:05 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo
 Ren <guoren@kernel.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v15 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
Message-ID: <456a8e61-c6b7-46d5-a25c-c466820912d7@spud>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-9-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230317113538.10878-9-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_060540_860376_0670D905 
X-CRM114-Status: GOOD (  20.98  )
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
Content-Type: multipart/mixed; boundary="===============6765440787891393938=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6765440787891393938==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="im+qcLwrAl4VxO92"
Content-Disposition: inline

--im+qcLwrAl4VxO92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 11:35:27AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Add vector state context struct to be added later in thread_struct. And
> prepare low-level helper functions to save/restore vector contexts.
>=20
> This include Vector Regfile and CSRs holding dynamic configuration state
> (vstart, vl, vtype, vcsr). The Vec Register width could be implementation
> defined, but same for all processes, so that is saved separately.
>=20
> This is not yet wired into final thread_struct - will be done when
> __switch_to actually starts doing this in later patches.
>=20
> Given the variable (and potentially large) size of regfile, they are
> saved in dynamically allocated memory, pointed to by datap pointer in
> __riscv_v_ext_state.
>=20
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

I think you missed a:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/vector.h      | 97 ++++++++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/ptrace.h | 17 +++++
>  2 files changed, 114 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 18448e24d77b..c7143b7d64d1 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -10,8 +10,10 @@
> =20
>  #ifdef CONFIG_RISCV_ISA_V
> =20
> +#include <linux/stringify.h>
>  #include <asm/hwcap.h>
>  #include <asm/csr.h>
> +#include <asm/asm.h>
> =20
>  extern unsigned long riscv_v_vsize;
>  void riscv_v_setup_vsize(void);
> @@ -21,6 +23,26 @@ static __always_inline bool has_vector(void)
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
>  }
> =20
> +static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
> +{
> +	regs->status =3D (regs->status & ~SR_VS) | SR_VS_CLEAN;
> +}
> +
> +static inline void riscv_v_vstate_off(struct pt_regs *regs)
> +{
> +	regs->status =3D (regs->status & ~SR_VS) | SR_VS_OFF;
> +}
> +
> +static inline void riscv_v_vstate_on(struct pt_regs *regs)
> +{
> +	regs->status =3D (regs->status & ~SR_VS) | SR_VS_INITIAL;
> +}
> +
> +static inline bool riscv_v_vstate_query(struct pt_regs *regs)
> +{
> +	return (regs->status & SR_VS) !=3D 0;
> +}
> +
>  static __always_inline void riscv_v_enable(void)
>  {
>  	csr_set(CSR_SSTATUS, SR_VS);
> @@ -31,11 +53,86 @@ static __always_inline void riscv_v_disable(void)
>  	csr_clear(CSR_SSTATUS, SR_VS);
>  }
> =20
> +static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state=
 *dest)
> +{
> +	asm volatile (
> +		"csrr	%0, " __stringify(CSR_VSTART) "\n\t"
> +		"csrr	%1, " __stringify(CSR_VTYPE) "\n\t"
> +		"csrr	%2, " __stringify(CSR_VL) "\n\t"
> +		"csrr	%3, " __stringify(CSR_VCSR) "\n\t"
> +		: "=3Dr" (dest->vstart), "=3Dr" (dest->vtype), "=3Dr" (dest->vl),
> +		  "=3Dr" (dest->vcsr) : :);
> +}
> +
> +static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_st=
ate *src)
> +{
> +	asm volatile (
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"vsetvl	 x0, %2, %1\n\t"
> +		".option pop\n\t"
> +		"csrw	" __stringify(CSR_VSTART) ", %0\n\t"
> +		"csrw	" __stringify(CSR_VCSR) ", %3\n\t"
> +		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
> +		    "r" (src->vcsr) :);
> +}
> +
> +static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *sav=
e_to,
> +					 void *datap)
> +{
> +	unsigned long vl;
> +
> +	riscv_v_enable();
> +	__vstate_csr_save(save_to);
> +	asm volatile (
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
> +		"vse8.v		v0, (%1)\n\t"
> +		"add		%1, %1, %0\n\t"
> +		"vse8.v		v8, (%1)\n\t"
> +		"add		%1, %1, %0\n\t"
> +		"vse8.v		v16, (%1)\n\t"
> +		"add		%1, %1, %0\n\t"
> +		"vse8.v		v24, (%1)\n\t"
> +		".option pop\n\t"
> +		: "=3D&r" (vl) : "r" (datap) : "memory");
> +	riscv_v_disable();
> +}
> +
> +static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *=
restore_from,
> +					    void *datap)
> +{
> +	unsigned long vl;
> +
> +	riscv_v_enable();
> +	asm volatile (
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
> +		"vle8.v		v0, (%1)\n\t"
> +		"add		%1, %1, %0\n\t"
> +		"vle8.v		v8, (%1)\n\t"
> +		"add		%1, %1, %0\n\t"
> +		"vle8.v		v16, (%1)\n\t"
> +		"add		%1, %1, %0\n\t"
> +		"vle8.v		v24, (%1)\n\t"
> +		".option pop\n\t"
> +		: "=3D&r" (vl) : "r" (datap) : "memory");
> +	__vstate_csr_restore(restore_from);
> +	riscv_v_disable();
> +}
> +
>  #else /* ! CONFIG_RISCV_ISA_V  */
> =20
> +struct pt_regs;
> +
>  static __always_inline bool has_vector(void) { return false; }
> +static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return f=
alse; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_setup_vsize()	 		do {} while (0)
> +#define riscv_v_vstate_off(regs)		do {} while (0)
> +#define riscv_v_vstate_on(regs)			do {} while (0)
> =20
>  #endif /* CONFIG_RISCV_ISA_V */
> =20
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/ua=
pi/asm/ptrace.h
> index 882547f6bd5c..586786d023c4 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -77,6 +77,23 @@ union __riscv_fp_state {
>  	struct __riscv_q_ext_state q;
>  };
> =20
> +struct __riscv_v_ext_state {
> +	unsigned long vstart;
> +	unsigned long vl;
> +	unsigned long vtype;
> +	unsigned long vcsr;
> +	void *datap;
> +	/*
> +	 * In signal handler, datap will be set a correct user stack offset
> +	 * and vector registers will be copied to the address of datap
> +	 * pointer.
> +	 *
> +	 * In ptrace syscall, datap will be set to zero and the vector
> +	 * registers will be copied to the address right after this
> +	 * structure.
> +	 */
> +};
> +
>  #endif /* __ASSEMBLY__ */
> =20
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> --=20
> 2.17.1
>=20
>=20

--im+qcLwrAl4VxO92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhaAQAKCRB4tDGHoIJi
0ryLAPwOHJRz/7VkUSciIMzxHf7hR0Y8WFvJMjRRjvhpNPkQrAD+OfXytbiXW1fE
0XAxG7whQZGTjvw/o61vV/Ufg85rzAI=
=XZEP
-----END PGP SIGNATURE-----

--im+qcLwrAl4VxO92--


--===============6765440787891393938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6765440787891393938==--

