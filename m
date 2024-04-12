Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5991C00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXTvTqTypL7ARsDjb/ZN547nQ+SaIkPqgTAP7FJV1Bw=; b=3MPBqSkxhlmLmb+Wb6nqUO/JEP
	yQmoOCGQguzz/1CFS+x0bzjcZUE1wa4qbKmZQ9nadRQ5bF3Ukr0sVYCCC7+EjDIQqChdZpBYTLvIn
	ns/TsRecihp11J46i/e0/TwS7r/5VSK+Nvy7fGJCOR8rruaTJd3oy+bRM5EVDZnWLDPruSDNus5T6
	z5LHRXgHWvcG6PzSwIn2Q3SIqG995uQqlj/4edgRvJWIIXKr7Xu2FOP49sx6Ipo/kzNEnmPXCd2+X
	hilpugRNocBYrFUBSc89pn6R8FYzjLFE5STjK4rQ00IAwgTbrm9488dBSxIImd5PgJDC16vG6XhPJ
	YTuT0oEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvG3n-0000000H7q2-0mTy;
	Fri, 12 Apr 2024 12:31:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvG3j-0000000H7p0-22zv;
	Fri, 12 Apr 2024 12:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712925071; x=1744461071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8YSWsoCfZ7tptBqUVVtBw1fFnKL06BvA0qNMfnioDw=;
  b=e2v1ZM31opswpuYC8lebOtIFAwqxmTpBNXft/2bO43i1MGFjVMHjZCM0
   fr2v6I76ZRksdbMXIMKuoROrNsCm8LVzMQ1Ok4TJBnBxtmyUbjjVpdUPc
   ipMrN2mOCqpe6X75FvPgPnG2bx+BFdMZdMrh40RMVXITyc+abq1nVJaVc
   lN9Gp9Gsc2i6ynhFbqjXknV7tjOej7k1To1LfGKqJQUTQFuRcen11lAxN
   7fy1/psOFnK2XLa8p+2MMulXyiFZyXZO7Yt+S6OaofwgEJg1cgtRGqn6s
   5L5DHWjGh0wU4580MC/RgFbf9yLHFb9rT7I1+swKxclyV7fQ6knEhkEXD
   w==;
X-CSE-ConnectionGUID: 8n3UuTh2QzaDn5A8rQGjFg==
X-CSE-MsgGUID: nqO9YiBGTYCscAdrhaD7/w==
X-IronPort-AV: E=Sophos;i="6.07,196,1708412400"; 
   d="asc'?scan'208";a="188017039"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 05:31:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 05:31:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 05:30:59 -0700
Date: Fri, 12 Apr 2024 13:30:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Evan Green
	<evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 06/19] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240412-sprawl-product-1e1d02e25bca@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_053111_792524_ED7FEE65 
X-CRM114-Status: GOOD (  20.56  )
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
Content-Type: multipart/mixed; boundary="===============2652650866650316849=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2652650866650316849==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/rKIhypokaxpjzdO"
Content-Disposition: inline

--/rKIhypokaxpjzdO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:12PM -0700, Charlie Jenkins wrote:
>  static void __init riscv_parse_isa_string(unsigned long *this_hwcap, str=
uct riscv_isainfo *isainfo,

> -					  unsigned long *isa2hwcap, const char *isa)
> +					struct riscv_isainfo *isavendorinfo, unsigned long vendorid,
> +					unsigned long *isa2hwcap, const char *isa)
>  {
>  	/*
>  	 * For all possible cpus, we have already validated in
> @@ -349,8 +384,30 @@ static void __init riscv_parse_isa_string(unsigned l=
ong *this_hwcap, struct risc
>  		const char *ext =3D isa++;
>  		const char *ext_end =3D isa;
>  		bool ext_long =3D false, ext_err =3D false;
> +		struct riscv_isainfo *selected_isainfo =3D isainfo;
> +		const struct riscv_isa_ext_data *selected_riscv_isa_ext =3D riscv_isa_=
ext;
> +		size_t selected_riscv_isa_ext_count =3D riscv_isa_ext_count;
> +		unsigned int id_offset =3D 0;
> =20
>  		switch (*ext) {
> +		case 'x':
> +		case 'X':

One quick remark is that we should not go and support this stuff via
riscv,isa in my opinion, only allowing it for the riscv,isa-extensions
parsing. We don't have a way to define meanings for vendor extensions in
this way. ACPI also uses this codepath and at the moment the kernel's
docs say we're gonna follow isa string parsing rules in a specific version
of the ISA manual. While that manual provides a format for the string and
meanings for standard extensions, there's nothing in there that allows us
to get consistent meanings for specific vendor extensions, so I think we
should avoid intentionally supporting this here.

I'd probably go as far as to actively skip vendor extensions in
riscv_parse_isa_string() to avoid any potential issues.

> +			bool found;
> +
> +			found =3D get_isa_vendor_ext(vendorid,
> +						   &selected_riscv_isa_ext,
> +						   &selected_riscv_isa_ext_count);
> +			selected_isainfo =3D isavendorinfo;
> +			id_offset =3D RISCV_ISA_VENDOR_EXT_BASE;
> +			if (!found) {
> +				pr_warn("No associated vendor extensions with vendor id: %lx\n",
> +					vendorid);

This should not be a warning, anything we don't understand should be
silently ignored to avoid spamming just because the kernel has not grown
support for it yet.

Thanks,
Conor.

> +				for (; *isa && *isa !=3D '_'; ++isa)
> +					;
> +				ext_err =3D true;
> +				break;
> +			}
> +			fallthrough;
>  		case 's':
>  			/*
>  			 * Workaround for invalid single-letter 's' & 'u' (QEMU).
> @@ -366,8 +423,6 @@ static void __init riscv_parse_isa_string(unsigned lo=
ng *this_hwcap, struct risc
>  			}
>  			fallthrough;
>  		case 'S':
> -		case 'x':
> -		case 'X':
>  		case 'z':
>  		case 'Z':
>  			/*
> @@ -476,8 +531,10 @@ static void __init riscv_parse_isa_string(unsigned l=
ong *this_hwcap, struct risc
>  				set_bit(nr, isainfo->isa);
>  			}
>  		} else {
> -			for (int i =3D 0; i < riscv_isa_ext_count; i++)
> -				match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
> +			for (int i =3D 0; i < selected_riscv_isa_ext_count; i++)
> +				match_isa_ext(&selected_riscv_isa_ext[i], ext,
> +					      ext_end, selected_isainfo,
> +					      id_offset);
>  		}
>  	}
>  }

--/rKIhypokaxpjzdO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkpUAAKCRB4tDGHoIJi
0suMAP9hVav0oRL2jmBJm2ACwJ1+CNYfBT488OIk7AWbRjBIigEAtUP/mmReLFMY
g7/EcQ6a/96RixRPX9yYcg23rYMJOQE=
=w9t9
-----END PGP SIGNATURE-----

--/rKIhypokaxpjzdO--


--===============2652650866650316849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2652650866650316849==--

