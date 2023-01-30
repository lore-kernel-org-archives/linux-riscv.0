Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40199C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVwJiAqB9F7AHiQ00EQtQIngc9zWpQJKS0d9uk5UVS4=; b=mNJYhXRYGUzXGUeelRSG3c/RoS
	Ob/F1PuE5Pp2JkZTk/yThwftFc3guNmqIUlh87W5kKXAVqUBFxSM9jmwzsUgk5Bf5DKMbVOsc9G0Y
	VL0XO0ICw0XBScP4wU1CoDK76D7zGqRIktVcnwkwwmBwho8YuOK/XdLwTTxhcA/8bpAiDL796RqLu
	edewcSs7edBt0kkx4IX1ri6HeCsH9jwPNu3ApsJnY2V9e9v8dDfPVrzr8k54bbmPrzgKXbasfbFdG
	hxcHvYb5LzfwrUOiE7HYnmCx1mNcgvDwuw0RTMRWiEfvgadnsysk0zVUNXHWlus4gOk5+sF8EuCUF
	iIFFBdyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYGt-004hkq-0K; Mon, 30 Jan 2023 17:48:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYDW-004gLS-Nf; Mon, 30 Jan 2023 17:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675100718; x=1706636718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lKJrHep2C/qtcQm0TVHkNmoEgCsza5aoCQOndXPOmJo=;
  b=o/Scw9SeNvsEZ5gLiuaJNmGkDaVzS1KVe8RBbExdh9ANK4WcoLWSucfS
   pFYq7y1xe59OmQNNkqkecGaXPTaV7cZ/RWQLJhZe5KrB4+xYmOF+F6I91
   xaKcNMy+WIFtL0tlz631651qd2RGjKls6/qT6eqOtbH25kEnVhDPZzyQQ
   GQpTW9roqJaHhkn3nf11f715I0WXFPmkxRfY2SAfiuGhloEH1g2Guj5CF
   Be4jxR96PGf5eAn93HKMDAj2UfoIMwRgipT4K8MsShBIB0ofVXsO9ACpc
   39y3DihV7kyz8F6OTt+F3Zmn1RUhURcVorngWGqnpK87SU1RrvqM+3f18
   A==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; 
   d="asc'?scan'208";a="197976787"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jan 2023 05:26:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 05:26:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 30 Jan 2023 05:26:03 -0700
Date: Mon, 30 Jan 2023 12:25:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, 'Heiko Stuebner ' <heiko@sntech.de>, 'Krzysztof
 Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>, 'Anup Patel '
	<apatel@ventanamicro.com>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 'Atish
 Patra ' <atishp@rivosinc.com>, 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>, 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Document cboz-block-size
Message-ID: <Y9e3Q5M8J8pTWZja@wendy>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
 <20230130120128.1349464-3-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130120128.1349464-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_094518_895769_F335D1D0 
X-CRM114-Status: GOOD (  18.14  )
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
Content-Type: multipart/mixed; boundary="===============4953415893914901271=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4953415893914901271==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0UZUfhBsR2lxiI1e"
Content-Disposition: inline

--0UZUfhBsR2lxiI1e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Mon, Jan 30, 2023 at 01:01:24PM +0100, Andrew Jones wrote:
> The Zicboz operation (cbo.zero) operates on a block-size defined
> for the cpu-core. While we already have the riscv,cbom-block-size
> property, it only provides the block size for Zicbom operations.
> Even though it's likely Zicboz and Zicbom will use the same size,
> that's not specified.

If you end up respinning for some other reason, perhaps:
s/that's not specified/that's not required by the specification/ or
some other wording to that effect?
I'm assuming by "specified" you're referring to the cmobase spec, but
that wording I don't think is particular clear.

> Create another property specifically for
> Zicboz.
>=20
> Cc: Rob Herring <robh@kernel.org>
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
> +

I was happy with either keeping them apart entirely or a having this one
default to the value of cbom-block-size, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--0UZUfhBsR2lxiI1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9e3QwAKCRB4tDGHoIJi
0rWcAP9r2ZdFD/HLOUeyA8E7JMn9OFNNG/h0sTQyXW6HVG3wswEAps/+KUnEiepK
zpeOl4Wl4Nwdc/JvnLdWEHU/8vpYAAc=
=66lk
-----END PGP SIGNATURE-----

--0UZUfhBsR2lxiI1e--


--===============4953415893914901271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4953415893914901271==--

