Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0739C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0RygVg0Wkf6nVMEIMUm0ues6ZVSCDK++3T4A9kPO1o=; b=dY9g9GDV+innmIGw1qBjnTdTLR
	oq5hrcY8OVGEsS3oXcWaCbdj/O68xrmYuRpmHoMHZWWUINP4HBoftCunaYr86OmOyF/40xrrd0uUI
	jtP7quqbuReA8rqOq7G7CG1YVF1V1dGiEaLnGJcl3+BvmTXmqGlER+Z3HhqxS8O/hJT+oJNIFmaNB
	8ZLMFldfjXo7OGomXc6PaYTPI6ANFO81zBL0p5i5gjaLpec7ylrA45+X1R0wyGHsyvZGmqPUroXIf
	BoTDP/hl/GWfSMKVXnWwnntcCW/6LKv0LRLaf1JR7hV9NpEl5HDH6D8EdmWd39L5VF5R/9/iU1IZF
	xhIXRCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDg6-0000000GXu4-0DeJ;
	Fri, 12 Apr 2024 09:58:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDg1-0000000GXrs-48ZZ;
	Fri, 12 Apr 2024 09:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712915914; x=1744451914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QndV9TT9pmDT+fXwJI9iOQE9VYOlSdccevWqhWNEacg=;
  b=hxydG2DY9EC4gf9jhE6POyrRgP9gVbeFSIfbtTDRlNoYlmjNkHKDWyZg
   lGFUk5KqlVY2Sv0yT/qSMD2y2dzKI9B/4M5LJNQSlbWtj8TLy0msjE0eD
   xwvbJLM5WzQJ3Q6n/PLrPO2YviF8UHYbHEX1p34HgTmhwjCR3t2mmBGHD
   Lw9uuYAFksj4VHQZEvdS5t/nVd72Vz7zhCBytqZv9wxQwfoL5ycyJ/jdA
   FM6pz1ejiW2UNcrQJ8eX9RMCctyOP6V0G8fDxpFLpTPf1FNj8Tk7TOQ9+
   uUI/UdWagxerd3YS0v3Z9jImbhVyi4YuOveGpm2o0KxcosWYQV6QqDL3R
   A==;
X-CSE-ConnectionGUID: OGnVlqFaSN2/PpP1KY9laQ==
X-CSE-MsgGUID: +7SHxj1mSZiXXuIvu13hXg==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="20723575"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 02:58:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 02:58:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 02:58:12 -0700
Date: Fri, 12 Apr 2024 10:57:21 +0100
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
Subject: Re: [PATCH 01/19] dt-bindings: riscv: Add vendorid and archid
Message-ID: <20240412-revocable-dosage-99265debe66b@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-1-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-1-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_025834_323415_CF5349C7 
X-CRM114-Status: GOOD (  18.06  )
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
Content-Type: multipart/mixed; boundary="===============8477803233683255466=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8477803233683255466==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YzIxShuT9j2BnF76"
Content-Disposition: inline

--YzIxShuT9j2BnF76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:07PM -0700, Charlie Jenkins wrote:
> vendorid and marchid are required during devicetree parsing to determine
> known hardware capabilities. This parsing happens before the whole
> system has booted, so only the boot hart is online and able to report
> the value of its vendorid and archid.

I'll comment on the kernel patch, but this is not needed.

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..c21d7374636c 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -94,6 +94,17 @@ properties:
>      description:
>        The blocksize in bytes for the Zicboz cache operations.
> =20
> +  riscv,vendorid:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      Same value as the mvendorid CSR.
> +
> +  riscv,archid:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      Same value as the marchid CSR.
> +
> +
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
>=20
> --=20
> 2.44.0
>=20

--YzIxShuT9j2BnF76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkFgQAKCRB4tDGHoIJi
0taCAP4tYStLi/B4J7M5neONl/q/8R8/ZSNYoUC3mB5o++Qa+gD7BOaDcH4iTfuG
7JqZQnqsXKTRSQOes4E+V+bAkjzkYQU=
=x06j
-----END PGP SIGNATURE-----

--YzIxShuT9j2BnF76--


--===============8477803233683255466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8477803233683255466==--

