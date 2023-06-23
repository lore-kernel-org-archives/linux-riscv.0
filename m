Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEE8EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFeONRCanXwItlFbGNUvDGdlorKMh3AhToClYlUCFzk=; b=JS1zUh893KQrwGjTfF8iyQa8UE
	A3Zu1K1ECneaJunL1Z/Gj2UxwrmzSp8e4F2xm66HFX0bbK/l1VPVaqhOw2TNOkuBKVo3eEIN74bq/
	qT/MVbjReYvHCRMIbigeplx+niBwjBevUzDNqChZ+tGNKnR8r/XgTUJqAxeP2Y3dyXEuVBa1MS0Te
	dxHctgy7+wSeRpfal0YdQsi2SO80usHFItArWLQnlZ1+b90zFStiUhfR/FxKIyUApvnnGkX4v/L30
	PI4jKL694fDvb3WRwvDlrwPUVlJOiABs8jBjL6lpefq2SRvm4C8jsU5s3vhT4zEUhi7fcyziuqXA/
	oEZKQEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcxQ-0030hR-1s;
	Fri, 23 Jun 2023 09:19:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcxM-0030fj-1q
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 09:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687511992; x=1719047992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XGiyyAs9cVt4Aoql04BBBGaqkZFGdvDDQCfl0RCfgVg=;
  b=BsBRB99JCF4+6/n4ta5V3GsnAUkI5+HlHD6mos9V1DrIAHhkC7SS7gjk
   PXdq2q61vfbBG+Ghdw+QEogHmF6hDCObnZG3dCXK0Tb7D19fkww4CvgXf
   cv0H0Xc1UnDW8+qE/XozRb9q+lOdw3NvQPuUCOp05lGq4eg5+stgra372
   gk/t7bBIG6Armxg9bKk7KJ5TMhM0shpdtL/vkF0wVa8P7AW8TMogMdo6v
   yzzsJcxpAMMzVpVMPuabFg9yDIBMfwFzNA2nbg9jxjsop5hLIjXDRhVHg
   2q897jja56/a36U7RfXwKjElcXj6T7YQva93G0VKWLMr2f6VYyxpS+f9i
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="asc'?scan'208";a="220110214"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 02:19:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 02:19:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 23 Jun 2023 02:19:35 -0700
Date: Fri, 23 Jun 2023 10:19:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Heiko Stuebner <heiko@sntech.de>
CC: <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<linux-riscv@lists.infradead.org>, <samuel@sholland.org>,
	<guoren@kernel.org>, <christoph.muellner@vrull.eu>,
	<linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 2/3] RISC-V: move vector-available status into a
 dedicated variable
Message-ID: <20230623-celestial-vitality-f4a564208b7b@wendy>
References: <20230622231305.631331-1-heiko@sntech.de>
 <20230622231305.631331-3-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230622231305.631331-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_021952_782805_85C62ABC 
X-CRM114-Status: GOOD (  21.55  )
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
Content-Type: multipart/mixed; boundary="===============2620274481179958318=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2620274481179958318==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dIb/j54IQUnxjZNI"
Content-Disposition: inline

--dIb/j54IQUnxjZNI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Heiko,

On Fri, Jun 23, 2023 at 01:13:04AM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> There is at least one core implementing the wrong vector specification,
> which cannot claim to implement the v extension but still is able to
> do vectors similar to v.
>=20
> To not hack around this by claiming to do v, move the has_vector() return
> to act similar to riscv_noncoherent_supported() and move to a separate
> variable that can be set for example from errata code.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/vector.h | 5 ++++-
>  arch/riscv/kernel/setup.c       | 6 ++++++
>  arch/riscv/kernel/vector.c      | 8 ++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 04c0b07bf6cd..315c96d2b4d0 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -19,13 +19,16 @@
>  #include <asm/csr.h>
>  #include <asm/asm.h>
> =20
> +extern bool riscv_v_supported;
> +void riscv_vector_supported(void);
> +
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
>  bool riscv_v_first_use_handler(struct pt_regs *regs);
> =20
>  static __always_inline bool has_vector(void)
>  {
> -	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
> +	return riscv_v_supported;

Since you're moving this thing away from being backed by an alternative,
should this variable then be marked with something like __ro_after_init?

Cheers,
Conor.

>  }
> =20
>  static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 971fe776e2f8..952dfb90525e 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -36,6 +36,7 @@
>  #include <asm/thread_info.h>
>  #include <asm/kasan.h>
>  #include <asm/efi.h>
> +#include <asm/vector.h>
> =20
>  #include "head.h"
> =20
> @@ -308,6 +309,11 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_fill_hwcap();
>  	init_rt_signal_env();
>  	apply_boot_alternatives();
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_V) &&
> +	    riscv_isa_extension_available(NULL, v))
> +		riscv_vector_supported();
> +
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>  	    riscv_isa_extension_available(NULL, ZICBOM))
>  		riscv_noncoherent_supported();
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index f9c8e19ab301..74178fb71805 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -22,6 +22,9 @@
> =20
>  static bool riscv_v_implicit_uacc =3D IS_ENABLED(CONFIG_RISCV_ISA_V_DEFA=
ULT_ENABLE);
> =20
> +bool riscv_v_supported;
> +EXPORT_SYMBOL_GPL(riscv_v_supported);
> +
>  unsigned long riscv_v_vsize __read_mostly;
>  EXPORT_SYMBOL_GPL(riscv_v_vsize);
> =20
> @@ -274,3 +277,8 @@ static int riscv_v_init(void)
>  	return riscv_v_sysctl_init();
>  }
>  core_initcall(riscv_v_init);
> +
> +void riscv_vector_supported(void)
> +{
> +	riscv_v_supported =3D true;
> +}
> --=20
> 2.39.2
>=20

--dIb/j54IQUnxjZNI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJVjeAAKCRB4tDGHoIJi
0u32AQCEH5dh46wYlzcytvlmzGZZ1ELU0VlUt4hnRxFArrW7TgEAgd5IEQlWTbuA
Jr3XQI6Op3zOmHf4p98etsTEV6rDrwo=
=y0Xk
-----END PGP SIGNATURE-----

--dIb/j54IQUnxjZNI--


--===============2620274481179958318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2620274481179958318==--

