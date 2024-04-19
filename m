Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABADC071FD
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSlGs+XGQSu8Mox5mDzaUFW+eEF23N4F/ExFLg/Lv1A=; b=aEG67Z7M9PcQ4ortI7tRvqjMWM
	9NnJ0j0dqTExKnH2+cGC9/QVyHusP5qcAPaAmL49/jfA69pp9HmVRgMe5LHetmsAhqJvOFllsycC7
	zB350zTFgO5XHDcx8HSzlkW77Snhl2PYR66LZ1uIClupv3luS/E8vKPi8nfx0KinW0t21moAh/579
	Cr5CEjlS2h41t+gYaq//aO8o/1NEtJkLx+eQ8NxEdzHoaqqTswzvPPF2HpPFwsv8QgeJBf+bJNoma
	1imAUuU2V6J7QYrtl2xZBgtw6+A+KPOy9g8yjIDcxcfbqn8IpZ2nIOZYSS4jFhj9zOSRNHVUNs5Dr
	s6kd1Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqWM-00000006Fbk-30Iy;
	Fri, 19 Apr 2024 15:51:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqWJ-00000006FYa-1IfN;
	Fri, 19 Apr 2024 15:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A5444CE1AFE;
	Fri, 19 Apr 2024 15:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCAFC2BD10;
	Fri, 19 Apr 2024 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713541880;
	bh=zWv/xUUueVGUPY7NUN+yMB++Labd0w15D1CcT2ZEb+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jflr+Mery9Icxy3YAAa4Gdj1oYC1mkU/VBqOa5PU8S9zq1KHtzXsbjjighF29TwsJ
	 IEGyN7LbfLHMhudzxyLDGuBrxur2rD2/bITcoXu9aCd2TgbCbvg3HfWH4PKAV5xtgR
	 PVBM6v7TnN/bL4vZHAFIXwb7W3Eirxvr/YYmU+cXDmBCnSc52XsswVcM3GvavAVprm
	 j0hZ8UIKiDE8jB5I4EbIobbHFn+kCkpBe1s+WdO+MGy68eJJsLGnyYbjJPrLjc2UGZ
	 kKcV+moXe7AQVMTxZt43CKoqxWVDscrmU1W0b2RJa1R6w8JJaFX0Pp7uuDBjbJd9fs
	 tCoVpy/FjJG/Q==
Date: Fri, 19 Apr 2024 16:51:10 +0100
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
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240419-clinic-amusing-d23b1b6d2af2@spud>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240418124300.1387978-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_085123_756261_D09046F3 
X-CRM114-Status: GOOD (  15.89  )
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
Content-Type: multipart/mixed; boundary="===============8124375024397021988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8124375024397021988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QS4RfLs7pvJlTuus"
Content-Disposition: inline


--QS4RfLs7pvJlTuus
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 02:42:27PM +0200, Cl=E9ment L=E9ger wrote:
> The Zc* standard extension for code reduction introduces new extensions.
> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> are left out of this patch since they are targeting microcontrollers/
> embedded CPUs instead of application processors.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 4 ++++
>  arch/riscv/kernel/cpufeature.c | 4 ++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 543e3ea2da0e..b7551bad341b 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -82,6 +82,10 @@
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
>  #define RISCV_ISA_EXT_ZIMOP		75
> +#define RISCV_ISA_EXT_ZCA		76
> +#define RISCV_ISA_EXT_ZCB		77
> +#define RISCV_ISA_EXT_ZCD		78
> +#define RISCV_ISA_EXT_ZCF		79
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 115ba001f1bc..09dee071274d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> +	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> +	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> +	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),

Ye, this looks exactly like what I "feared".

--QS4RfLs7pvJlTuus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKS7gAKCRB4tDGHoIJi
0j53AP91a0/pzMnYOB5Q1NSAdfxkcqTq0TgGDLsop/SUUlrxKAD+Oqehg3RXMuA6
lxMl1823mjF1OflpyCXnIjSA8qwLFAA=
=4Weq
-----END PGP SIGNATURE-----

--QS4RfLs7pvJlTuus--


--===============8124375024397021988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8124375024397021988==--

