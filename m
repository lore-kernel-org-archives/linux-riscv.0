Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8BFC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gD1gxd9BdvaJHaHTkW9S8b492vTbYLpMpefIft0wiBs=; b=CGMGy428KC8S/5FODvhua8YSVH
	pNiM4LVpFn1XDZ3FCTTTBe6yMTe3o5wevYm4M1wc+ZfggHJKpkNJZTvFYv7aqlhmTpgw89OR6gAYT
	zo6+8SB4nmZoyhE3+SV6hbke3iTRApLOiK/2bc6BGz9XjAtzSo0e4YrVLKy8CKIPU/MAW82YJfHb6
	6DJGj02kIa0LFrjzWRss2e/JIy/VS8ja3N081ZS6cr0pSFAQA+l8eOb8+vX09MlS4ZrZbzdFyMUKY
	h/MwOqh9nAALvZw/+daNnlskb/QPCUgFhsMLvmWrBWy5gVqF6MIuFNQW+wAS+2xbE7EARKUrUMyE+
	ZhLrvKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0OOD-0000000DFE7-0rc0;
	Fri, 26 Apr 2024 16:25:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0OO9-0000000DFCS-3bO9;
	Fri, 26 Apr 2024 16:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A62CECE1C92;
	Fri, 26 Apr 2024 16:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673CCC113CD;
	Fri, 26 Apr 2024 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148726;
	bh=115os4ZbmsDyr8IcVI++ZT4rfl/lG18N3YGeEEwRbs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrysoNhZl/2rj5EmyPUxvne4oOcCBvgT7FwXv0B4qEZLA2jUuBiMT+Pr00XjxUudr
	 F73EfI2exm1yIlq/9kiwYzitcBk7FA3SkwYa2biMKrRLz2jye0hyB9NYWeRpCYleRh
	 7GgXwMDopM+45H9xSM766w80njApyOPHcaI0cHzOShkgg3VlHCxI3FhBNJOovBhe5T
	 p9A0WrvyAlgEFfURIKB8i21Dp5vQInsmtbx5lL85VD9p1B18Gr8aJ38hhZRA0PAbcs
	 rHk6vG45aPqXMmgHMq2QPlbfRr35oW4Yyjz8iUe2m4aSNwzMQOKtoQZkg51qF6vK7B
	 rW4xYAn2q2gVA==
Date: Fri, 26 Apr 2024 17:25:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 09/17] riscv: drivers: Convert xandespmu to use the
 vendor extension framework
Message-ID: <20240426-venue-maximum-f78ac451b146@spud>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-9-67cff4271d1d@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-9-67cff4271d1d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_092530_373421_B9E4E7A0 
X-CRM114-Status: GOOD (  18.29  )
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
Content-Type: multipart/mixed; boundary="===============3785782142209179950=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3785782142209179950==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yY5dZCAicSqxniow"
Content-Disposition: inline


--yY5dZCAicSqxniow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2024 at 06:04:41PM -0700, Charlie Jenkins wrote:
> Migrate xandespmu out of riscv_isa_ext and into a new Andes-specific
> vendor namespace.
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 8cbe6e5f9c39..84760ce61e03 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -24,6 +24,8 @@
>  #include <asm/errata_list.h>
>  #include <asm/sbi.h>
>  #include <asm/cpufeature.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/vendor_extensions/andes.h>
> =20
>  #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
>  asm volatile(ALTERNATIVE_2(						\
> @@ -32,7 +34,7 @@ asm volatile(ALTERNATIVE_2(						\
>  		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
>  		CONFIG_ERRATA_THEAD_PMU,				\
>  	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
> -		0, RISCV_ISA_EXT_XANDESPMU,				\
> +		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
>  		CONFIG_ANDES_CUSTOM_PMU)				\
>  	: "=3Dr" (__ovl) :						\
>  	: "memory")
> @@ -41,7 +43,7 @@ asm volatile(ALTERNATIVE_2(						\
>  asm volatile(ALTERNATIVE(						\
>  	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
>  	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
> -		0, RISCV_ISA_EXT_XANDESPMU,				\
> +		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
>  		CONFIG_ANDES_CUSTOM_PMU)				\
>  	: : "r"(__irq_mask)						\
>  	: "memory")
> @@ -837,7 +839,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, =
struct platform_device *pde
>  		   riscv_cached_mimpid(0) =3D=3D 0) {
>  		riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
>  		riscv_pmu_use_irq =3D true;
> -	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
> +	} else if (riscv_isa_vendor_extension_available(-1, XANDESPMU) &&

What's the rationale for this not using riscv_has_extension_unlikely()?
Happens once in probe so don't bother? I forget if we discussed it when
the code was added, but it would save us from the NULL/-1 syntax,
neither of which I think is a good interface.

Also, I'd prob drop the "drivers" from $subject.

I'll come back and look at the rest of this Monday, it's a sunny Friday
here and I've still got my devicetree patch queue to clear..

Cheers,
Conor.

>  		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
>  		riscv_pmu_irq_num =3D ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
>  		riscv_pmu_use_irq =3D true;
>=20
> --=20
> 2.44.0
>=20

--yY5dZCAicSqxniow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZivVcAAKCRB4tDGHoIJi
0q5xAQCe2FA1+i41mmMJDi5wo0K0launNVhNkUuTkEaiFR0IhAD/Ym63WbkJOpJ0
Y1cgyr29/q9i4AU76MmaZX7FfGD9pAU=
=pgke
-----END PGP SIGNATURE-----

--yY5dZCAicSqxniow--


--===============3785782142209179950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3785782142209179950==--

