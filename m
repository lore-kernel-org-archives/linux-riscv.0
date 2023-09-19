Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768E4CD3445
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7i38NmDb3VRSD3O2tD2o2hCdB+jBF2VuRYeMjOAhfA=; b=YqFEKJzWFOD/rWgNMc4vrMeO5E
	NRQvYWrsiH9UB1xw2j8YkL+QxyVy6NdptB0XMc4kVisXdXBGO0kSoh1iSGd3ebjoqCpF2OM/D8fMG
	h0L9UZnNjD5WcKCJiiqHlmbrJgHSto5EFmksLFx0gDeNchE5FokMfXm7npDPo2VhZv9XoKBG1rWmy
	APldooO1kKmy2cavVA1km3Xs/9aoxzhVsAbNAId1/nO4vpso0tZc1GHL5ugC/20Dj6VbCqLCNHFZT
	TFhtzezSYAbdaVpGYFoqCoslc+d31b6JsD33dlhIxUYSP7cD/MSRdg500FXxjMAu3J8xnqmdo9qG8
	Mrl+0IWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiV9H-00HEEZ-2j;
	Tue, 19 Sep 2023 07:27:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiV9E-00HEDG-2w;
	Tue, 19 Sep 2023 07:27:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDE216145C;
	Tue, 19 Sep 2023 07:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFC3C433C8;
	Tue, 19 Sep 2023 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695108471;
	bh=mzK6crL+VUkpX6w6hXMx4eUQWGf2NhkR2PJIoKzzRO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/ERXLsV3Xy1yo8dnksIiY6+McHxQxZGbDRAtjIMwY/TZ1/wRekuqbJU1TTpbpigV
	 nOc5qi7PuwaejQWULNWNEdNuuIVNQlukDOeqDHrZspEavoLdBgEr86SKnAEIyJKthD
	 GCoGOg3uEwzPM+RJLeJO8GSm2BxyNysvvnRq1pLwOnNHR2W8vOP2rDZtMSEI5ps9QS
	 NAjDl5HjDOqlFCztueNRQLhvYF/xLO6uvi9zsTQQpIK93VYwtqmd9fKih0HbPH066q
	 +Qv0bA/QGthE6LTLsqBppsKtbOZJsVYZ62emEPmcB8d3y29WHOLOJzqVlbigtKAy5i
	 XleWtnM189YSw==
Date: Tue, 19 Sep 2023 08:27:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/7] RISC-V: Detect Zicond from ISA string
Message-ID: <20230919-3a8fcdaa86607d0ff8399132@fedora>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-3-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230919035343.1399389-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_002753_036106_3CDC0A1D 
X-CRM114-Status: GOOD (  18.51  )
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
Content-Type: multipart/mixed; boundary="===============6362053908984567217=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6362053908984567217==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CvRVj5A87ghfW3qF"
Content-Disposition: inline


--CvRVj5A87ghfW3qF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 09:23:38AM +0530, Anup Patel wrote:
> The RISC-V integer conditional (Zicond) operation extension defines
> standard conditional arithmetic and conditional-select/move operations
> which are inspired from the XVentanaCondOps extension. In fact, QEMU
> RISC-V also has support for emulating Zicond extension.
>=20
> Let us detect Zicond extension from ISA string available through
> DT or ACPI.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Same applies here w.r.t. splitting in two.

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  arch/riscv/include/asm/hwcap.h                          | 1 +
>  arch/riscv/kernel/cpufeature.c                          | 1 +
>  3 files changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cad8ef68eca7..7ea90e2dbc5b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -225,6 +225,12 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
> =20
> +        - const: zicond
> +          description:
> +            The standard Zicond extension for conditional arithmetic and
> +            conditional-select/move operations as ratified in commit 8fb=
6694
> +            ("Update Gemfile") of riscv-zicond.
> +
>          - const: zicsr
>            description: |
>              The standard Zicsr extension for control and status register
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b7efe9e2fa89..15bafc02ffd4 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -60,6 +60,7 @@
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
>  #define RISCV_ISA_EXT_XVENTANACONDOPS	44
> +#define RISCV_ISA_EXT_ZICOND		45
> =20
>  #define RISCV_ISA_EXT_MAX		64
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3a31d34fe709..49b6551f3347 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -174,6 +174,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> +	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> --=20
> 2.34.1
>=20

--CvRVj5A87ghfW3qF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQlNbQAKCRB4tDGHoIJi
0sB/AQCkDRgOkSjJzzncOD0fKPsUVygPrBmienPpyGN8TCotZQD/Xu8iLOeByBoU
/C12tvL3YG5xQOT+5JAwKrmczt+L0AI=
=X24a
-----END PGP SIGNATURE-----

--CvRVj5A87ghfW3qF--


--===============6362053908984567217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6362053908984567217==--

