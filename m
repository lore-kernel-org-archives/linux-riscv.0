Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B7C7EE43
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiSFYkua/8DNmG+qbosIJxLRroPmEgY5gzEKirnpdrk=; b=2j7o8R/D1UsHg8G+HIlETmWXtj
	mvOJKnD8E4ADijhphpujebM9dnoKKZZNYz8zRRRQ/uSSRVO28Dj2VIsJqE7NfZ6DdojZwcF/A5BiE
	BSDLdVZGgTAVHJpd9PdJSbRdtmhTy1I89irRxkKG26268K6p4Bl5i8Ci8zCnolaE15rBxXz9Hcfc4
	JYCB3w2tFVrDLdIW9xV0v/YPggMtDHQfoVpRbKfzxHHuIep7xtdB5Ri4LUSFiDC8/I7uKUVJtmWOh
	yDOVHHoXf8mBl92pETVbyVim/2B3qhgsvsa/qPUyU1bWBxbmYxha59cguD8aJA6DiJSCLOOxVPuqS
	BZb//7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7czs-00DF1p-0P;
	Fri, 09 Jun 2023 14:21:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7czo-00DF1G-3A
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 14:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686320504; x=1717856504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2a+lt3aPP+ngTS29/z29BKrwVI4Tp9UL/tf+aJWyQX8=;
  b=QZjXBoFw8hL//vlPO5B7xLCesEhW2l5/dbdvgqjAlcDOWr4NQ7/6iKi3
   upIvnb158yfImg0SPWjoWbS7iSZ4H2KapnPp9mpz76eoJuzaX6uToQ/UA
   BF4dGXcKq7qLh3JI6p1RyvlKFVZFBpiJHQftSGkLGkfInx1m2PHHzF2QF
   s1KJYBiEsGYvoJLCj8LjE7uWKsv/r8zmcmTg5sPeuNJZX0fVKs9ttW0GJ
   MgTY7HaydKasbJNZZ+Wi2dZyfbekJesV9teMSj5cSpPq7TBw7Tz3I1AVJ
   1AnpVEbha+S4JJyU8cgeZ8iRXDdIMR23dfRNy4URzAzWKLl4wYftiZX+m
   w==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="asc'?scan'208";a="156290937"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2023 07:21:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 9 Jun 2023 07:21:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 9 Jun 2023 07:21:42 -0700
Date: Fri, 9 Jun 2023 15:21:17 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
Message-ID: <20230609-discourse-lapped-5217cc4d7ede@wendy>
References: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072145_077914_90CF5CEA 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5374225530540766762=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5374225530540766762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bGQeEsxycwJfD2sU"
Content-Disposition: inline

--bGQeEsxycwJfD2sU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 04:07:06PM +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--bGQeEsxycwJfD2sU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIM1XQAKCRB4tDGHoIJi
0nBVAP0T8hWbMHaBw02aqSDgr7Tl2Q8lR8gW+HR1CNAnRw7BsAEA4TuanTVt5EJl
qcen++SX5zQGb7LCunLo88GpZK932AI=
=VSOJ
-----END PGP SIGNATURE-----

--bGQeEsxycwJfD2sU--


--===============5374225530540766762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5374225530540766762==--

