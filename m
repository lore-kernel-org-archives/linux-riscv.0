Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947A1C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jun 2024 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPuILyfOZj7xY/w2LeAdoj5l4hUrxCn3Kd4yap+V3B0=; b=1czN8RaZ8kZB253uAyPor/LY4n
	/VcjoZ9HPwNn/WELt3L+r4RXG5SU+owXRIlSP49iBrw+ufGH8SwEkb7fRmj2RxcwFxZlsuORFP4B7
	3YConb+J/yTAS3gLe7Si3CSRnGJ6Wf7nIdBHK/YIWoLB1Ms/GHjdxXcKJX9+M8U9HzH9WmBszqW63
	nDo95QP/UppyJMdL/jXJaOow495uT1Xf0wRLlYeFGnM8b+P8ktmeVpxzbnjAmCU/2Il18n2zfzc1C
	tIhuKPjovpCQc74doHh5GWSejW9pPvQ/70VwMKeDv1fIlxk1z5uMEUw+GcLCkfBAHWNoMK/sOJ3jN
	yilEFzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLPN1-0000000EK7e-3rTz;
	Sun, 23 Jun 2024 15:43:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLPMy-0000000EK5t-1J6c;
	Sun, 23 Jun 2024 15:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5AF44CE0ACC;
	Sun, 23 Jun 2024 15:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56C6C2BD10;
	Sun, 23 Jun 2024 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719157385;
	bh=lOo+ByMOxJv+uOcBMeubi7V3Rm4GnZ1uYp8z+JG4D7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ig2qEl3L4TVco7WlBwgMQUjId3RGZgfm6ZSQSHOUzIJt7J2AV7Kl9d399jRG/+/kk
	 yMdLpjNVa+o4mc419wbWElR7rwCDvJ7Odk5KwyJgy+AYatwVFBCtVjSamnAmi4LMFN
	 484fIdjkW+ZcWzV9AYNokqANEnZZjNRA2A/MfG37zTPPZunAVYCGVKw6ZVAe/mJDHG
	 n0Dar0++YGiGAgaRGvenduDqIdQozpvXoQnbL/N/TLBDiG9WV79LnkqZ2Il8O+UqV9
	 5Oeqnog/H75h1RByve23ecbkHVll3UcSUVnIP6kdJcX6RvSKWM+ts5ntO7bc+qra3d
	 oUKygciaWfakQ==
Date: Sun, 23 Jun 2024 16:42:59 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240623-cornbread-preteen-4ec287aa165c@spud>
References: <20240619113529.676940-1-cleger@rivosinc.com>
 <20240619113529.676940-9-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240619113529.676940-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_084308_792646_AEEEA0E3 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Type: multipart/mixed; boundary="===============0779821292992764718=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0779821292992764718==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XCIoMUFlsNIN40u9"
Content-Disposition: inline


--XCIoMUFlsNIN40u9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 01:35:18PM +0200, Cl=E9ment L=E9ger wrote:
> The Zc* standard extension for code reduction introduces new extensions.
> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> are left out of this patch since they are targeting microcontrollers/
> embedded CPUs instead of application processors.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h |  4 +++
>  arch/riscv/kernel/cpufeature.c | 55 +++++++++++++++++++++++++++++++++-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 18859277843a..b12ae3f2141c 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -87,6 +87,10 @@
>  #define RISCV_ISA_EXT_ZVE64F		78
>  #define RISCV_ISA_EXT_ZVE64D		79
>  #define RISCV_ISA_EXT_ZIMOP		80
> +#define RISCV_ISA_EXT_ZCA		81
> +#define RISCV_ISA_EXT_ZCB		82
> +#define RISCV_ISA_EXT_ZCD		83
> +#define RISCV_ISA_EXT_ZCF		84
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index a3af976f36c9..aa631fe49b7c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -111,6 +111,9 @@ static int riscv_ext_zicboz_validate(const struct ris=
cv_isa_ext_data *data,
> =20
>  #define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id,=
 NULL, 0, NULL)
> =20
> +#define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
> +			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
> +
>  /* Used to declare pure "lasso" extension (Zk for instance) */
>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
>  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> @@ -122,6 +125,37 @@ static int riscv_ext_zicboz_validate(const struct ri=
scv_isa_ext_data *data,
>  #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _valida=
te) \
>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _vali=
date)
> =20
> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,

It's super minor, but my OCD doesn't like this being called "depends"
when the others are all called "validate".

> +				 const unsigned long *isa_bitmap)
> +{
> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA))
> +		return 0;
> +
> +	return -EPROBE_DEFER;
> +}
> +static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
> +				  const unsigned long *isa_bitmap)
> +{
> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
> +	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
> +		return 0;
> +
> +	return -EPROBE_DEFER;
> +}
> +
> +static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
> +				  const unsigned long *isa_bitmap)
> +{
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		return -EINVAL;
> +
> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
> +	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> +		return 0;
> +
> +	return -EPROBE_DEFER;
> +}

--XCIoMUFlsNIN40u9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnhCgwAKCRB4tDGHoIJi
0ojNAP4zqID4s2fTIoOLI3MwCtAFLJWCKaU3UhLxLueoiVavOgD+I+moOCuXJqHu
LFPQJbfCtkhdREIdkaCj+l4fuZIM5AI=
=tBDW
-----END PGP SIGNATURE-----

--XCIoMUFlsNIN40u9--


--===============0779821292992764718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0779821292992764718==--

