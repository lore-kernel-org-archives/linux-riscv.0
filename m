Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A4ECD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETaub4Z3gQqgEINeKtfseNJPlNV2gYxM3qCLLtnPMC0=; b=sQz7gCrTMAn2qb1eO28tUcrfBI
	eN3RodNtv59KkEr9Nn+6LZY+RPItqkDodUKzwe3KSkvHl/V7lgeFrWd8be/UUfPK4DuD3hgedGlDN
	ltZ6g5J+k5IDMGqJSIuMOukjdIeu64Oecr0IrxEMC0A+3WY83dtI+kP0UhR7Kw3GHohsgPqD2bcDz
	XdQr/LoRX/FTqhemrBZrACBTWb2Qr7sH6Wul8I0ljnVG+dCpnAOIgXlS8BD6uP92o+atvnNECT6rT
	y9W+hG7BIe2mMN7N/mQrDCO2SFrXVZFw65F5x/OCqDG44QhjhxY33xzJQFqw/gNOnjKPJQ0PmDFUU
	bk5NutMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rut1Y-0000000BpOO-1IpE;
	Thu, 11 Apr 2024 11:55:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rut1U-0000000BpMZ-3PCV;
	Thu, 11 Apr 2024 11:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712836520; x=1744372520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qUHLbICK+OzVzpgAugTLlBx/+ikYrtOfR4K8Nx4oYfw=;
  b=xg7uzJn30soIjVVlPdbLFQfTUd6qkNp869vZFMLMSk28JTgAzwtI62wd
   uSdb5rADyMpwXgFmvvdV97+Uyx7j4/TzgZGNbI3lNB8sH4vFZV5+Zt3Ci
   hD9pLSXJbrOkkkdSEOvWjIKBSBgTmKfrIme6hdTXdyXOYaXa7r9qTenis
   JCx9O6RWnGkezF6mRHaXSjiY8R1CTcMeyI9MK82AbHN3nLcCMaATzk7bC
   zKf8emN7w2h6Sl6Wx5IpdWEU9E5b8urXJyC8p1BM3WjoBALZvxiQ48pbX
   qbthm909Lzw1jIybln8HN02t6tm7hwUFkJoMFIsrL2xEXQTQrvcr9ri3j
   g==;
X-CSE-ConnectionGUID: z5vJuW0ISXO47ggJt+rbgA==
X-CSE-MsgGUID: mQWA4GzKR12LP6aGbYLBwA==
X-IronPort-AV: E=Sophos;i="6.07,193,1708412400"; 
   d="asc'?scan'208";a="251356126"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2024 04:55:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 04:54:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 04:54:33 -0700
Date: Thu, 11 Apr 2024 12:53:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, Shuah
 Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Message-ID: <20240411-backwater-opal-00c9aed2231e@wendy>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
 <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_045521_285508_64729030 
X-CRM114-Status: GOOD (  20.27  )
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
Content-Type: multipart/mixed; boundary="===============3285056907003591676=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3285056907003591676==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jM0CNQ7ZIr2lhGV/"
Content-Disposition: inline

--jM0CNQ7ZIr2lhGV/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 11:08:21AM +0200, Cl=E9ment L=E9ger wrote:
> >> If we consider to have potentially broken isa string (ie extensions
> >> dependencies not correctly handled), then we'll need some way to
> >> validate this within the kernel.
> >=20
> > No, the DT passed to the kernel should be correct and we by and large we
> > should not have to do validation of it. What I meant above was writing
> > the binding so that something invalid will not pass dtbs_check.
>=20
> Acked, I was mainly answering Deepak question about dependencies wrt to
> using __RISCV_ISA_EXT_SUPERSET() which does not seems to be relevant
> since we expect a correct isa string to be passed.

Ahh, okay.

> But as you stated, DT
> validation clearly make sense. I think a lot of extensions strings would
> benefit such support (All the Zv* depends on V, etc).

I think it is actually as simple something like this, which makes it
invalid to have "d" without "f":

| diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
| index 468c646247aa..594828700cbe 100644
| --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
| +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
| @@ -484,5 +484,20 @@ properties:
|              Registers in the AX45MP datasheet.
|              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
| =20
| +allOf:
| +  - if:
| +      properties:
| +        riscv,isa-extensions:
| +          contains:
| +            const: "d"
| +          not:
| +            contains:
| +              const: "f"
| +    then:
| +      properties:
| +        riscv,isa-extensions:
| +          false
| +
| +
|  additionalProperties: true
|  ...

If you do have d without f, the checker will say:
cpu@2: riscv,isa-extensions: False schema does not allow ['i', 'm', 'a', 'd=
', 'c']

At least that's readable, even though not clear about what to do. I wish
the former could be said about the wall of text you get for /each/
undocumented entry in the string.

--jM0CNQ7ZIr2lhGV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhfPRwAKCRB4tDGHoIJi
0stXAP9uCAN5bZHcv91EPinTAeqedRCedCrkE5YEE9f8JUyrxgD8CAHddpGznZHx
TNOtc9GaDiQRS4tdrlJo9+Hn1Puv4w0=
=k3aJ
-----END PGP SIGNATURE-----

--jM0CNQ7ZIr2lhGV/--


--===============3285056907003591676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3285056907003591676==--

