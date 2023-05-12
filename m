Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B57CC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVCMp8pJYU1C58wnnOQ5X6Gp1CLgPm3lVxMlglljk/c=; b=Q+hlv0412AchYA9+fZbw/KKhJf
	G5TUASkMfMwGy0VD5LF96lXGJEMfzT5OzM4JdgL5AlNHDcrUCELe453fianRsVriTYj4ukSI1Tifv
	uRHTCMnzAOZnwTUhOK5WSFVvMOOJA/+mK4lSz4a7uWedGCv1Uuo1oZZuyZ8n/+tUvlymMNluCVVJP
	6/6VWq2T8gnoiuCJIZBuWoszU2NlTeQKY2pSVRJcpTB14S1FeScfiX3RzJn5oQqCsibeo24dHpOxl
	jMNEEoBXLZ/T5JwmZlDDmNgB3tITfKnXpXfPkNJm+LklEh18F5o53bMasae4weWfg6OjMZ5Fk/nJZ
	+1x6RUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPBW-00BTDX-15;
	Fri, 12 May 2023 09:35:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPBT-00BTD2-38
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 09:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683884131; x=1715420131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fimsaLVN3IxgXwB6v4650M8bZOFhhLTgufNrSkX2BtI=;
  b=ic5GkReHO9v9JdcZGljzbr24fpwf8PWhUnzV+8fCVl0ZmqO2ok/Yoldn
   emVD9nenNzjdmAcAoSqauy/zddWztZaN/+/4I6+oXMF9ULlToxD/Vu5wQ
   1SewJiKZigKMOxaId32XgYPcEGiPPMlfd5Xi+hhSQ6s9Ah65CPUC9ZrXn
   7o1sWM9GQ+5Xxvbzf7uC78I94e30dzfnzQW10djbdJ6dDlV7OQSOgz5HG
   uQTjxr/h48mQx3g93FhtjbRH9UuZB3xxyjiD9qxEw4foBTd+e4ZKvSe3d
   RDjuSEm9jRxBNqlxefUt+N4+rTJJ76x5pdeT17+BMZmgBlacGzSoKQM4m
   g==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="213028836"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 02:35:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 02:35:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 02:35:27 -0700
Date: Fri, 12 May 2023 10:35:07 +0100
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
Message-ID: <20230512-backlit-radiated-ded0b38b4a94@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-4-xingyu.wu@starfivetech.com>
 <20230512-uproar-external-49a9e793fbc4@wendy>
 <91e4fd3c-20cb-724b-c9a8-e038600aabb7@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <91e4fd3c-20cb-724b-c9a8-e038600aabb7@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_023532_184544_324567FE 
X-CRM114-Status: GOOD (  16.62  )
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
Content-Type: multipart/mixed; boundary="===============8693470305428382631=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8693470305428382631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QcQ3Y5HHQp1oxn9V"
Content-Disposition: inline

--QcQ3Y5HHQp1oxn9V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 04:07:47PM +0800, Xingyu Wu wrote:
> On 2023/5/12 14:47, Conor Dooley wrote:
> > On Fri, May 12, 2023 at 10:20:32AM +0800, Xingyu Wu wrote:
> >> Add PLL clock inputs from PLL clock generator.
> >>=20
> >> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> ---
> >>  .../clock/starfive,jh7110-syscrg.yaml         | 20 +++++++++++++++++--
> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> >=20
> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-vision=
five-2-v1.3b.dtb: clock-controller@13020000: clocks: 'oneOf' conditional fa=
iled, one must be fixed:
> > 	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
> > 	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-=
syscrg.yaml
> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-vision=
five-2-v1.3b.dtb: clock-controller@13020000: clock-names: 'oneOf' condition=
al failed, one must be fixed:
> > 	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2s=
tx_lrck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is=
 too short
> > 	'i2stx_bclk_ext' was expected
> > 	'i2stx_lrck_ext' was expected
> > 	'i2srx_bclk_ext' was expected
> > 	'i2srx_lrck_ext' was expected
> > 	'tdm_ext' was expected
> > 	'mclk_ext' was expected
> > 	'pll0_out' was expected
> > 	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-=
syscrg.yaml
> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-vision=
five-2-v1.2a.dtb: clock-controller@13020000: clocks: 'oneOf' conditional fa=
iled, one must be fixed:
> > 	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
> > 	From schema: Documentation/devicetree/bindings/clock/starfive,jh7110-s=
yscrg.yaml
> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-vision=
five-2-v1.2a.dtb: clock-controller@13020000: clock-names: 'oneOf' condition=
al failed, one must be fixed:
> > 	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2s=
tx_lrck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is=
 too short
> > 	'i2stx_bclk_ext' was expected
> > 	'i2stx_lrck_ext' was expected
> > 	'i2srx_bclk_ext' was expected
> > 	'i2srx_lrck_ext' was expected
> > 	'tdm_ext' was expected
> > 	'mclk_ext' was expected
> > 	'pll0_out' was expected
> > 	Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> >=20
> > This binding change is incompatible with the existing devicetrees for
> > the visionfive 2.
>=20
> This looks like less clocks about PLL in SYSCRG node. And I add this in p=
atch 7.

The existing devicetree is a valid, albeit limited, description of the
hardware.
After your changes to the clock driver in this series, but *without* the
changes to the devicetrees, does the system still function?
=46rom a quick check of 4/7, it looks like it will not?

--QcQ3Y5HHQp1oxn9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF4ISwAKCRB4tDGHoIJi
0iZ9AP4u9KYEMY6ijX89u7Z+3hMOXU9bpxiDpvO0ou//U3u5/QEA/iV3wF+GGG2p
Xe3b7nBI0NXFjIeBsr4Ow5b4xMFfZQc=
=4554
-----END PGP SIGNATURE-----

--QcQ3Y5HHQp1oxn9V--


--===============8693470305428382631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8693470305428382631==--

