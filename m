Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BCBC7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6iPKgdJ4SCiJXCAkKmZXci//NTi65xxPG5O8Zayuu4=; b=wO5++qQJ7MQ6Nd2xHefNlxgLFr
	oofGfLwE1ePk0MU2d4ZBiV/3rsF9Xh8SDK5kRJia0VS1dg7NXQfNGURLdSVSChOgklEgwZPAjOWqr
	2imOeF5Cyk5dvKNvEwizFHnYl83PP6ueVKwkWCOypr5L64IOGWpfuy63YAujISY9U5V/YEXABvmYi
	AQpiUW+EbgYiatfSRxbt4aChYorD2+8bcUCFgcJSrjneAi9O7f96SGzJ4qNPBdkVDkcYvYPoZfD8g
	3HXbh3vMeZLpqkC/oeO9UPjed2/U/vnIdX9hqqOGxph0BLQlt/yefBC/qdyXaOxoioubASfgH9AsS
	J/MDdaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q16Ph-006oXV-0O;
	Mon, 22 May 2023 14:21:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q16Pd-006oVF-2D
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 14:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684765285; x=1716301285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6B3vXaIvsSyFL8WRgXEifU405baar89aaaU3DZ4ZCOI=;
  b=L1QPqG4ilv0hq9PSwgfCQyf1GXsgfVRmEYUcxVBxANdobzx95hDyrorV
   9FpUmZikCBH+w0MLL0gFCCbsQgcfU6Q9DDtFpwOOQLNFq+GHo26JMS94u
   2kCpO4Db2UOke3hPxSLYU528oWs5jiMM8vOS1SnS4FtzoSwhuYeynx5Ee
   NUL39SkKCQ3CgdDTKPHL6Yp4OVJm3GBxcBtG3JC3pnlhAQvBBCMdOIFy2
   3illLusukobY8mZcvKwtwbMekpAZR9jhXcXD3XhmUFOF6Oz2Rb93HO1tq
   MU9ZLs3p/9/S0ZFG78MY/6BsQNIegWqcKH9Pj2cTbml0FViav6XB9Qi2E
   A==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="asc'?scan'208";a="212478960"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 07:21:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 07:21:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 07:21:07 -0700
Date: Mon, 22 May 2023 15:20:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, <linux-crypto@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v8 2/4] crypto: starfive - Add crypto engine support
Message-ID: <20230522-darkish-undaunted-9e184932d93f@wendy>
References: <20230515125355.624250-1-jiajie.ho@starfivetech.com>
 <20230515125355.624250-3-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230515125355.624250-3-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_072125_808833_9B49E48D 
X-CRM114-Status: UNSURE (   9.07  )
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
Content-Type: multipart/mixed; boundary="===============2238461811394102637=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2238461811394102637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dVy3OAxHoIQI9VdR"
Content-Disposition: inline

--dVy3OAxHoIQI9VdR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2023 at 08:53:53PM +0800, Jia Jie Ho wrote:
> +config CRYPTO_DEV_JH7110
> +	tristate "StarFive JH7110 cryptographic engine driver"
> +	depends on SOC_STARFIVE || COMPILE_TEST
> +	select CRYPTO_ENGINE
> +	select ARM_AMBA

I have yet to bisect, but I think this has broken the build on RISC-V:
drivers/dma/pl330.c:1053:13: error: redefinition of '_start' as different kind of symbol
static bool _start(struct pl330_thread *thrd)
            ^
arch/riscv/include/asm/sections.h:11:13: note: previous definition is here
extern char _start[];
            ^
drivers/dma/pl330.c:1705:10: error: called object type 'char[]' is not a function or function pointer
                        _start(thrd);
                        ~~~~~~^
drivers/dma/pl330.c:2092:9: error: called object type 'char[]' is not a function or function pointer
                _start(pch->thread);
                ~~~~~~^
drivers/dma/pl330.c:2110:11: error: called object type 'char[]' is not a function or function pointer
                                _start(pch->thread);
                                ~~~~~~^
4 errors generated.

The pl330 dma driver depends on ARM_AMBA.

Cheers,
Conor.


--dVy3OAxHoIQI9VdR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGt6PQAKCRB4tDGHoIJi
0mpoAP9RDzkFAWWLnCRZfm4XNQ+rF1nl5k6lvaz5slDTFQKPAgD9HeBaio8Z6lrR
D2oRKJK24+1MMfPI4S824JdtjnZOIw0=
=Y2QR
-----END PGP SIGNATURE-----

--dVy3OAxHoIQI9VdR--


--===============2238461811394102637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2238461811394102637==--

