Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79ADC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjmol/k4NwnikLVwRCEd9QKJkYKcZZo7zP3Sto6Kn84=; b=tjQD6EmZiKzj+4P7jcGnUeZ1cp
	WxUFAaO7/hGzmRs6rj/lCGt3wQ3/3DIKGUchZ+vHuYrvkFbNMobo9oIgqG4JShZ+tZw1fHwTRh5k2
	vLBjZy+5tdXXaalqMlDDzMCj0oyU+7QKg+tpvObnXvBxrMSDri7rOFsCBms6bksGjRyeYkGB7CzoO
	dqANkQFhD38zunu76PkFJfOPabrA2n28my4kg5iGek4tXd+JhkKFnCeATPUJAiwNHRmlmyAc06xOT
	wETwnhYo8v1pWOZuLXHfO7JeVS9WnsLa/f1WALU81MXbFwbZQuuaX3xgtxteYuGrSh85wvYLhm3Zn
	VAGMUcqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMZ7-00B7Bv-16;
	Fri, 12 May 2023 06:47:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMZ4-00B7Aq-0q
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 06:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683874062; x=1715410062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8xCLpgBlCHyRbWeXw0cN2RgWjw7cDE8G0Egfc8IHxes=;
  b=1fvWYE573FVHPl2xfYR//Nfn7TZo4X15p4PlrCF4VJVD5lPcQ2FvGbeJ
   9jaAPjxADxuHmAYlqmlCRrxXM2BDsGeulKZbhSAyeZW3TsZZtZG5XoawO
   opYzNSybukD60voe6RjsLHI+Cf2byguYIdVtHKqm16GwlQPyT0SN810eY
   z36yuFIxTwdnSDYki+4ySIE68u8K3pLJ2SMrxjFmusS17YV3gCmWtwEmn
   8od/+UkacGfi8zhecbNcd0SYIxiwJX7cBVB6wyc2ntYYUuYB6as9+MtEa
   IW+tf0QEQapFFFAT++leE01/njH4Mqy+h9jNuFYwLnYC4pKTX4wytYphC
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="213558597"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 23:47:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 23:47:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 23:47:33 -0700
Date: Fri, 12 May 2023 07:47:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
Message-ID: <20230512-uproar-external-49a9e793fbc4@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-4-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230512022036.97987-4-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_234742_308111_2226B293 
X-CRM114-Status: UNSURE (   9.64  )
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
Content-Type: multipart/mixed; boundary="===============3157842846908079079=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3157842846908079079==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="flOQef4Xu+ZZp6dZ"
Content-Disposition: inline

--flOQef4Xu+ZZp6dZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 10:20:32AM +0800, Xingyu Wu wrote:
> Add PLL clock inputs from PLL clock generator.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.3b.dtb: clock-controller@13020000: clocks: 'oneOf' conditional failed=
, one must be fixed:
	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-sysc=
rg.yaml
/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.3b.dtb: clock-controller@13020000: clock-names: 'oneOf' conditional f=
ailed, one must be fixed:
	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2stx_l=
rck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is too=
 short
	'i2stx_bclk_ext' was expected
	'i2stx_lrck_ext' was expected
	'i2srx_bclk_ext' was expected
	'i2srx_lrck_ext' was expected
	'tdm_ext' was expected
	'mclk_ext' was expected
	'pll0_out' was expected
	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-sysc=
rg.yaml
/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.2a.dtb: clock-controller@13020000: clocks: 'oneOf' conditional failed=
, one must be fixed:
	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
	From schema: Documentation/devicetree/bindings/clock/starfive,jh7110-syscr=
g.yaml
/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.2a.dtb: clock-controller@13020000: clock-names: 'oneOf' conditional f=
ailed, one must be fixed:
	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2stx_l=
rck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is too=
 short
	'i2stx_bclk_ext' was expected
	'i2stx_lrck_ext' was expected
	'i2srx_bclk_ext' was expected
	'i2srx_lrck_ext' was expected
	'tdm_ext' was expected
	'mclk_ext' was expected
	'pll0_out' was expected
	Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml

This binding change is incompatible with the existing devicetrees for
the visionfive 2.

--flOQef4Xu+ZZp6dZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF3g8QAKCRB4tDGHoIJi
0gVTAP4ywjId2CiomCDX0yZX5w9nULUiXIqcBDWgQBBXFqkvyQD/WHWtGF5tiLCz
7eU2v5Dumdw3jJo+4zXQPGPu7O5ZFQs=
=7jKj
-----END PGP SIGNATURE-----

--flOQef4Xu+ZZp6dZ--


--===============3157842846908079079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3157842846908079079==--

