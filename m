Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0600C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIs705zFRpzGvNpGcRjRyoedzT5mg+vQA80uuV5oZL4=; b=FixIXXzGBu7iwM+/NSrUmLEL+n
	qgPXejcJehSCk6c7o13tsHoO6TE3ef/YglSdqaOkhFVG+JipXJgDq4HWmC8aAUNGYmXvDgNJEnxhD
	rUWC+UlQyVWGu1zNQ8WlWNQp3J860w/qCkdMNMuiETOfYAB7fjLjh12j6y4M6PlqFhxDAr0Elpxna
	GkFK1CAIfOYfkDTBxfGlTkOeTnVncpuWwC8o6TTQTx4934x/aVBO7ekZCD565mwz1oNrS0XE3kr97
	aTm0bcPYez4PMNR0+KXjrrxrqjNOa81+Nl/cqu0dklRCJlHsfHDmUFWqYnt/bqvPB1hrpoKOGldFQ
	QKRd7MIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvE8x-0000000GfBZ-2Y2w;
	Fri, 12 Apr 2024 10:28:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvE8t-0000000GfA9-24e9;
	Fri, 12 Apr 2024 10:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712917703; x=1744453703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kTLKhtwsa3h1qGVsoBTw6KqmQbL6Q+SdjxubJOC058A=;
  b=tM/Hv55ujaC1/xrzF+d6S8jappRm99BcYH6YQJwFhjjCTqAFR9GyHpSh
   8LBR9yTD6IErQhBE306TDeMc25Ov4gQywgqnDy7GcVW9xy7uoQUqVGSjz
   oC2eaE6fHoMAGj3LuTj7h59TMTwWX8V111DLjOmHIFFlzw84L8PG3RVQn
   7WwzdJ5Ltlkf8mFlSkiAcwCZz+I7GkLaYK7klREp8oGI/0S43tvOFoLUa
   SVd8gEm6XykWYPF9bMxrsZiwrsZIWQAjC6cxQ2dSsD7mo27ykBQfZHj70
   45/5vw+wMFrzmxkkcs74R//ZJ0XW8I4NJRiWg6/bJWIo2lDC4toOCTEIQ
   g==;
X-CSE-ConnectionGUID: pekK4ghjTo2w0Gm+KgOwIA==
X-CSE-MsgGUID: 7y8rWc9PRki4RcpHGC2VyA==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="20673244"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 03:28:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 03:28:18 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 03:28:14 -0700
Date: Fri, 12 Apr 2024 11:27:23 +0100
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
Subject: Re: [PATCH 03/19] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Message-ID: <20240412-ream-dwarf-8cdc3d0f279c@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-3-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-3-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_032823_590224_AA1A585B 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: multipart/mixed; boundary="===============3081376620446736681=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3081376620446736681==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qHjL7kIT1sLLfOfO"
Content-Disposition: inline

--qHjL7kIT1sLLfOfO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:09PM -0700, Charlie Jenkins wrote:
> The xtheadvector ISA extension is described on the T-Head extension spec
> Github page [1].
>=20
> [1] https://github.com/T-head-Semi/thead-extension-spec/blob/master/xthea=
dvector.adoc

Link: <foo> [1]

>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..3fd9dcf70662 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -477,6 +477,10 @@ properties:
>              latency, as ratified in commit 56ed795 ("Update
>              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> =20
> +        # vendor extensions, each extension sorted alphanumerically unde=
r the
> +        # vendor they belong to. Vendors are sorted alphanumerically as =
well.
> +
> +        # Andes
>          - const: xandespmu
>            description:
>              The Andes Technology performance monitor extension for count=
er overflow
> @@ -484,5 +488,10 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
> +        # T-HEAD
> +        - const: xtheadvector
> +          description:
> +            The T-HEAD specific 0.7.1 vector implementation.

This needs the link and a SHA or some other reference to the version
of the document.

Thanks,
Conor.

> +
>  additionalProperties: true
>  ...
>=20
> --=20
> 2.44.0
>=20

--qHjL7kIT1sLLfOfO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkMiwAKCRB4tDGHoIJi
0jwIAQDE34qo4fc159LqDVXLnUh1xD3mFK2kVSZZanvcn5G3rAEA7T4mAnRBt/8y
DaAR+UAhIFMAcbXd35hewh6U4mwHMwk=
=Co3F
-----END PGP SIGNATURE-----

--qHjL7kIT1sLLfOfO--


--===============3081376620446736681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3081376620446736681==--

