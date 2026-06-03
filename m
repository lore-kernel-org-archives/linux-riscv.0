Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B73CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLJcGZUtJ7KCQ2fcJSKXLTIBVX8oX6VzsQ7+skwLE2I=; b=GDsFP4BtQMq+PAQqHuoWYLhJKK
	+/sgv2m8lI2OgXob3N3F+teQW4INMqvWgjEeVp4IPGnbDQenl49RZDO4sJNX3zGmMET7YLcbUIWpF
	KyWVvXEtU2+/CM49Vl4pbgVC3DhZYJmEBwNSmRav83oN+nnBAYqSV4h0f1Zp8HQ7MJnWN0O0cFEnc
	JBviMCTRvaa5QsAZFOpj7AcgQFIzc+ZkYU/19sN9XLXS7Fw7nHmmfsgCWg/7y+L/9S1m7c06QYLEI
	Vug47VjAl4amyC4ZPUZ58tLODb4/f9rRB6f8afH10de9nJpPl5lrz4gudai3oIKTIIhQ5GYM6WFuy
	gyXw+e0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiG4-0000000EkN6-0fTZ;
	Wed, 03 Jun 2026 09:51:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiG1-0000000EkMN-3RD9
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 09:51:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2922D40BF1;
	Wed,  3 Jun 2026 09:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447461F00893;
	Wed,  3 Jun 2026 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780480289;
	bh=ek6If8iIULmbg70W21YYTSyl9q1BfVHkqFh5wqvnLik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vqt9Drl1Yp9Gu3QtiREuNq5BUYiJ/3z5lVfDB2s7J+34ZRlYA2dAHVI4W01dTJGsD
	 fb3Fm4uL8KlfI6a7EIGDYWKyPP0SOqHC8pDQRiLz5NOSFWIEdzcL7mTbO7CB/57Ffd
	 sb2g9E6FMJJMspE3oWNX8G23MAYNtk5cZSE4A5FcVy+uVu7bFZ6AXNvdnQovlOTMu6
	 YuaHiwveM9h1suQww1Ktd5qskNvEpbvBk0fgxmx+7KG1vwTbc4M6cVqM2io4Dp6Uz0
	 hAOrfaQHWM8d3Lw1j4auAQr1zh2/IPIlRxI0xOKwggOHk5pg7QQdnVkzGGVyY+fZrG
	 OM0NmVnrvzZTw==
Date: Wed, 3 Jun 2026 10:51:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, alexghiti@rivosinc.com, cleger@rivosinc.com,
	conor.dooley@microchip.com, anup@brainfault.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cpufeature: Validate H extension via CSR_HGATP
 probe
Message-ID: <20260603-fantasy-stiffen-5df518d9a3f5@spud>
References: <20260603093301.89430-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20260603093301.89430-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_025129_901938_D4F98A1B 
X-CRM114-Status: GOOD (  29.61  )
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
Content-Type: multipart/mixed; boundary="===============7032075060776033620=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7032075060776033620==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zvOMhiamFSkjOhw6"
Content-Disposition: inline


--zvOMhiamFSkjOhw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:33:01PM +0800, Chen Pei wrote:
> The H extension is advertised to S-mode through three channels --
> the DT "riscv,isa" string, the DT "riscv,isa-extensions" list, and
> the ACPI RHCT ISA string -- all of which converge in
> riscv_resolve_isa().  The H entry has no validate callback today,
> so the kernel trusts the description unconditionally.
>=20
> When firmware advertises H but the hardware does not actually
> implement it (common during early bring-up, e.g. QEMU), kvm.ko
> reaches kvm_riscv_gstage_mode_detect() and oopses on the first
> CSR_HGATP access with an illegal instruction.
>=20
> Add a validate callback for H that probes CSR_HGATP under an
> exception-table fixup.  If the read traps, the H bit is cleared
> during ISA resolution and the rest of the kernel sees H as
> unavailable.  Because the probe runs in riscv_resolve_isa(), it
> covers all three advertisement sources.

The point of validate callbacks is twofold: checking that the kernel
configuration supports the extension and that extensions that the kernel
depends on to support the one in question are present.
It is not the kernel's job to check that the devicetree matches the
hardware. I can only assume that ACPI has the same policy. Firmware must
not report supporting extensions that hardware does not actually support.

NAK, fix your firmware instead please.

Thanks,
Conor.


>=20
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index f46aa5602d74..b34dd789e94e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -17,9 +17,11 @@
>  #include <linux/of.h>
>  #include <asm/acpi.h>
>  #include <asm/alternative.h>
> +#include <asm/asm-extable.h>
>  #include <asm/bugs.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
> +#include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/text-patching.h>
>  #include <asm/hwprobe.h>
> @@ -163,6 +165,32 @@ static int riscv_ext_d_validate(const struct riscv_i=
sa_ext_data *data,
>  	return 0;
>  }
> =20
> +static int riscv_ext_h_validate(const struct riscv_isa_ext_data *data,
> +				const unsigned long *isa_bitmap)
> +{
> +	unsigned long val, ret =3D 1;
> +
> +	/*
> +	 * The H extension may be advertised by firmware (DT/ACPI) even
> +	 * when the underlying hardware does not implement it, or when
> +	 * M-mode firmware has not delegated hypervisor CSR access to
> +	 * S-mode.  Probe CSR_HGATP under an exception-table fixup: if
> +	 * the read traps with an illegal instruction, ret stays 1.
> +	 */
> +	asm volatile(
> +		"1:	csrr	%0, " __stringify(CSR_HGATP) "\n"
> +		"	li	%1, 0\n"
> +		"2:\n"
> +		_ASM_EXTABLE(1b, 2b)
> +		: "=3Dr" (val), "+r" (ret));
> +
> +	if (ret) {
> +		pr_err("H detected in ISA string, disabling as CSR_HGATP is not access=
ible\n");
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>  static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data *=
data,
>  				       const unsigned long *isa_bitmap)
>  {
> @@ -498,7 +526,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, ris=
cv_ext_vector_float_validate),
> -	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(h, RISCV_ISA_EXT_h, riscv_ext_h_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_x=
linuxenvcfg_exts, riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_z=
icbop_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_x=
linuxenvcfg_exts, riscv_ext_zicboz_validate),
> --=20
> 2.50.1
>=20

--zvOMhiamFSkjOhw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah/5HQAKCRB4tDGHoIJi
0h+AAQC/d6lDNdAEa1o/AOSJamhDNm1Q/Ph0J2SDUbmn5trhBQD/XanzC4fjlDoG
bAJgF9q5uXrniDA96M4S6B3E+4A2mgA=
=jsko
-----END PGP SIGNATURE-----

--zvOMhiamFSkjOhw6--


--===============7032075060776033620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7032075060776033620==--

