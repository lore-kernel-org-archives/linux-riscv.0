Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E8BC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsGOm230xfpeBgUxNwZERDHm7mCvtHpcL/o/X2EXyJQ=; b=174NATnHDNeftOURjy7FZDhSgN
	vQXI8A7j8uNXxg6heP/LQY5lskFPFKV9a5poBIc8M4cLjbob6kekvZm0UuNecw3eu6oPies92Ly3w
	kexnmDOAh1Dc5Wg49gUGBuTAKJEtr5H1T0aJhUQ8+QO+0he2sWmCeCDtG+2Ab3CnwYOePeB/cMcub
	YfLkmDQ9ORXDnRvQZHYrLiVM8SEAnD36qwXRjjpBF/w/1w3tTFBvZseumLESuZ36F/GBmXSBa92sF
	0RsZv8MFS28g7vAoAp4lXxLFv1CVFHVME61jymzpdrspq7Kug1clkwfM9WGxkEgUBwuORKmerVfOi
	lUwtnBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrv6-00GJ9V-2x; Mon, 23 Jan 2023 08:11:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJruz-00GJ8I-J3; Mon, 23 Jan 2023 08:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674461465; x=1705997465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yER2n3QmR1h2NXuL0jjEMeaU2dy9JnO+kmS6XsiFYI0=;
  b=FSGuf+Si/uubJrtmkPnbiM50KfEVs94t3+J7F0tUeQ2KjzhwY4OpZ2/0
   83tMF/XsswVs1ktlbZ19XVDgSeplysjEVGF7jN4Km0BU6EmQ/XGvcplcD
   ZsklJG41dxZ5xi4z/Pp7hPk4a/U9e06CgpiV7o5ng2PSxpLXuqOOlgYXO
   1ZlQa201BstI4vpNY/USiT7IUItjtMPzGXRrTzASd/jMSyQTJPqWLcZ7+
   awmZHi0tkkIzvaXS2sHI1jCeeGWKAabmsD+ILLz+hdL81VqATHQTa8PpL
   e/KGrCJu6xED2NX/5hOIqJ61377LwacK6WcWuz+KVrHkceIZ3BvbzuD3u
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669100400"; 
   d="asc'?scan'208";a="193409181"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jan 2023 01:11:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 01:11:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 23 Jan 2023 01:10:58 -0700
Date: Mon, 23 Jan 2023 08:10:35 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>, 'Atish
 Patra ' <atishp@rivosinc.com>, 'Jisheng Zhang ' <jszhang@kernel.org>, 'Palmer
 Dabbelt ' <palmer@dabbelt.com>, 'Albert Ou ' <aou@eecs.berkeley.edu>, 'Paul
 Walmsley ' <paul.walmsley@sifive.com>, 'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
Message-ID: <Y85A+3MW2N/jPTHH@wendy>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230122191328.1193885-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_001105_750655_04F11DB2 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: multipart/mixed; boundary="===============1024799616251640014=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1024799616251640014==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ek/NdeMhlk/2U4U0"
Content-Disposition: inline

--Ek/NdeMhlk/2U4U0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sun, Jan 22, 2023 at 08:13:24PM +0100, Andrew Jones wrote:
> The Zicboz operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.
>=20
> So add the necessary property for the system to know the core's
> block-size.
>=20
> Cc: Rob Herring <robh@kernel.org>

FYI bindings need to be CC Krzysztof & the devicetree list too.

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index c6720764e765..f4ee70f8e1cf 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -72,6 +72,11 @@ properties:
>      description:
>        The blocksize in bytes for the Zicbom cache operations.
> =20
> +  riscv,cboz-block-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The blocksize in bytes for the Zicboz cache operations.

Do you think hardware that has different Zicboz versus Zicbom block
sizes is going to be common, or would we benefit from just defaulting
the Zicboz size to the Zicbom one?

Either way,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--Ek/NdeMhlk/2U4U0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY85A+wAKCRB4tDGHoIJi
0ke7AQCGPJvwCpVHyhuvGR/MLJdfT0M4vPc1ZgK+lmvyu8YRAAEAoMVeTGxyZMRz
uS/apb4qDM6fQV42ru6dBfsl2KU1uQo=
=jJXh
-----END PGP SIGNATURE-----

--Ek/NdeMhlk/2U4U0--


--===============1024799616251640014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1024799616251640014==--

