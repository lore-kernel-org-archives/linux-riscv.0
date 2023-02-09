Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5691C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3wvbhud322yqzu8nEyk0w7i7YK7pseY4615e8YN0Q4=; b=hzy4U2M6tydx0Pi6SrkSlyGIcd
	XHWOHsKZLz6EKKGzCCmwKssafgwpacyYTx23rde1KYJOcra4XJy2MBFpt8QWLHl2T2R/OGSFEvsFK
	+gbzZ0+sYYVDpqyh2vD+jU5T4oTCVJJfzXQLQVzv7s0CfFUOHkff8iDqkRz4WGp+oLIkwPStYTSk6
	p5iABhBlawGIQevzOFFpzuR3/KRSp1rFavtjvtN797/FXoeRJiOg958nZ4iKuMExDisJcxsBPxcWG
	TbMIJoiMQOjC9S1ncv0CQf9I5f1zmWk8P/PrU6NoZKKzTTOUaCODSokzyvG/FDLG2cZVWZz2SZy5m
	lHGxDkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCEK-002wE9-5r; Thu, 09 Feb 2023 19:05:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCEG-002wCf-QU; Thu, 09 Feb 2023 19:05:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76F95B822BE;
	Thu,  9 Feb 2023 19:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C169C433EF;
	Thu,  9 Feb 2023 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675969505;
	bh=buvYIsrhn1oB7B2jLvbD4S8NrUtc03iq+TFR/uY3GJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBa/7OssRr955SL08GKrYJ1lJqn20kDxi4Epp1Quie+ePadJ8xGcxMq/lUgfrBb3x
	 D9gxfY7MHPZpXMHAn9lY+hA7qX82n4RCS57ExKNVvKcf5fhXiAKE7J6n2Z4Cm1ks3E
	 lPcHEXYS74mevTl76d7oNnLFUowtNOABEd3TAuIGYGRWJFgRd4kxs3IwEyzH8fgaHS
	 DxVp7xPWw/N03j+hxgYdPRDcFmXaEpCJwtLw5ODpGV3Yfl1oaEt2uwhSuQZAucCPP7
	 Bc0NrM/bMSXe+0i4GFBoumIDJNO6ffz0+kWL72SZ5CqgIfyOPitN8OtM6paLRbxzuK
	 I90rhe4vM02eQ==
Date: Thu, 9 Feb 2023 19:04:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 5/8] RISC-V: cpufeature: Put vendor_id to work
Message-ID: <Y+VD2/owMIvqzOx8@spud>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-6-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230209152628.129914-6-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_110509_215503_90407C3B 
X-CRM114-Status: GOOD (  26.75  )
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
Content-Type: multipart/mixed; boundary="===============6662951287482923990=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6662951287482923990==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f0wBqtZLHXrhN6vM"
Content-Disposition: inline


--f0wBqtZLHXrhN6vM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew,

On Thu, Feb 09, 2023 at 04:26:25PM +0100, Andrew Jones wrote:
> When [ab]using alternatives as cpufeature "static keys", which can
> be used in assembly, also put vendor_id to work as application-
> specific data. This will be initially used in Zicboz's application to
> clear_page(), as Zicboz's block size must also be considered. In that
> case, vendor_id's role will be to convey the maximum block size which
> the Zicboz clear_page() implementation supports.
>=20
> cpufeature alternative applications which need to check for the
> existence or absence of other cpufeatures may also be able to make
> use of this.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 0d2db03cf167..74736b4f0624 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -278,6 +278,11 @@ void __init riscv_fill_hwcap(void)
>  }
> =20
>  #ifdef CONFIG_RISCV_ALTERNATIVE

I think a comment here about what "application check" means would be
nice.
That wording just feels clunky & the meaning is not immediately
graspable?

/*
 * riscv_cpufeature_application_check() - Check if a cpufeature applies.
 * The presence of a cpufeature does not mean it is necessarily
 * useable. This function is used to apply the alternative on a
 * case-by-case basis.
 */

Dunno, does something like that convey the intent?

> +static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> +{
> +	return data =3D=3D 0;
> +}
> +
>  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begi=
n,
>  						  struct alt_entry *end,
>  						  unsigned int stage)
> @@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(str=
uct alt_entry *begin,
>  		return;
> =20
>  	for (alt =3D begin; alt < end; alt++) {
> -		if (alt->vendor_id !=3D 0)
> -			continue;

Can you remind me what makes this "safe"?
My understanding was that a vendor_id of zero was safe, as zero is
reserved in JEDEC.
What is stopping someone stuffing this with a given value and
colliding with a real vendor's errata?

	for (alt =3D begin; alt < end; alt++) {
		if (alt->vendor_id !=3D A_VENDOR_ID)
			continue;
		if (alt->errata_id >=3D ERRATA_A_NUMBER)
			continue;

		tmp =3D (1U << alt->errata_id);
		if (cpu_req_errata & tmp) {
			oldptr =3D ALT_OLD_PTR(alt);
			altptr =3D ALT_ALT_PTR(alt);

			/* On vm-alternatives, the mmu isn't running yet */
			if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
				memcpy((void *)__pa_symbol(oldptr),
				       (void *)__pa_symbol(altptr),
				       alt->alt_len);
			else
				patch_text_nosync(oldptr, altptr, alt->alt_len);
		}
	}

I've probably just missing something, my brain swapped out alternatives
the other week. Hopefully whatever I missed isn't embarrassingly obvious!

Cheers,
Conor.

>  		if (alt->errata_id >=3D RISCV_ISA_EXT_MAX) {
>  			WARN(1, "This extension id:%d is not in ISA extension list",
>  				alt->errata_id);
> @@ -300,6 +303,9 @@ void __init_or_module riscv_cpufeature_patch_func(str=
uct alt_entry *begin,
>  		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
>  			continue;
> =20
> +		if (!riscv_cpufeature_application_check(alt->errata_id, alt->vendor_id=
))
> +			continue;
> +
>  		oldptr =3D ALT_OLD_PTR(alt);
>  		altptr =3D ALT_ALT_PTR(alt);
>  		patch_text_nosync(oldptr, altptr, alt->alt_len);
> --=20
> 2.39.1
>=20

--f0wBqtZLHXrhN6vM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VD2wAKCRB4tDGHoIJi
0tdiAP4kOYMLH3byXTeESx+WKaoDFDZ+WqWL6KuJR0lPG7+/NAD+K/lQRdCtXEIy
6baWI5c3148YvFzQA5sN3KeX/j3CtQM=
=sV7f
-----END PGP SIGNATURE-----

--f0wBqtZLHXrhN6vM--


--===============6662951287482923990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6662951287482923990==--

