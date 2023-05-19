Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2325AC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lee/wye0cf5uLYud0dS/hbmnzGCMXPxGwNE0KNoGVJ8=; b=HFd7XQ5IokjU0HLGGOWbyPfXib
	N2gojO3iANR8e9xBkedNr1TbvraQolPLugCUxhT8vtwHTI5GjGJjr61k08hvNboRpohyskpYscI9J
	8fzbUdiPN7lAWAGtPcRGUDBh9TE3FfrJuYjCLURKGWbZyoUxHIE+YTEx+iacWVu4lVjA0naG+ZttW
	n0lrCXrcY/sbAk9HxY4wrE2QPbJYQ1Viipn2pSIWIxgdtzqkobXFWvOJ6EQ+dnomLX+40NBtd/IZF
	f8EaesGmY4vcjnoDU8MnS/fVq05tjnnDy0O1FUy5IQW0HuCkCxWdx97IOtlbyTUqqwRVM1RCg4PYX
	3+um9e6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvEN-00FTvF-1l;
	Fri, 19 May 2023 08:12:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvEJ-00FTtg-2R
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 08:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684483971; x=1716019971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AICApxT69uepygya0AreeAzqrDtA69Jyg+g0w/dzNrA=;
  b=OxE478jjiHkEL3wF+8y5gw0ePEhzh/OxjLUeLD7T7UdrYiSrXrmVPYMP
   9l5C1g3k8ZDTSft/MORbXjvFIveFBm1dmb2/t2e4Hrv6/B7IClY88P91j
   dVC2LuePVJlBBClxjEGgZOxL7a/D/6vcRDAHFEUVZ4XuqV0ZR9hwjndPZ
   KZjTX363QuCWfFPJhxYZ0FrmM7fMfNg5eM5QR9dVvOBg/f88eDT4hmt3H
   A7mrRHOgf9azaoCVzyA56T/RvINxjGNgBXfTGoZjg177X+FEloui1GMr1
   tISAdUq0gB5AUZlNDTdOesW0Mkmfjac7DQxEoev7GAqWWEz2596LGGlkP
   A==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="152919385"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 01:12:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 01:12:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 01:12:37 -0700
Date: Fri, 19 May 2023 09:12:16 +0100
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
Message-ID: <20230519-gosling-rewrap-bfd03dc549ae@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-4-xingyu.wu@starfivetech.com>
 <20230512-uproar-external-49a9e793fbc4@wendy>
 <91e4fd3c-20cb-724b-c9a8-e038600aabb7@starfivetech.com>
 <20230512-backlit-radiated-ded0b38b4a94@wendy>
 <be85aa2a-c72c-5272-ee40-f1265768e7b3@starfivetech.com>
 <20230512-traffic-popsicle-5c3423b37fab@wendy>
 <906cec55-e438-0eca-618c-4f29b2642fcb@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <906cec55-e438-0eca-618c-4f29b2642fcb@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_011252_152540_03596AB1 
X-CRM114-Status: GOOD (  30.17  )
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
Content-Type: multipart/mixed; boundary="===============0658171282775636875=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0658171282775636875==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fmR9wFkfHIZNBkc5"
Content-Disposition: inline

--fmR9wFkfHIZNBkc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 03:59:19PM +0800, Xingyu Wu wrote:
> On 2023/5/12 21:49, Conor Dooley wrote:
> > On Fri, May 12, 2023 at 05:56:16PM +0800, Xingyu Wu wrote:
> >> On 2023/5/12 17:35, Conor Dooley wrote:
> >> > On Fri, May 12, 2023 at 04:07:47PM +0800, Xingyu Wu wrote:
> >> >> On 2023/5/12 14:47, Conor Dooley wrote:
> >> >> > On Fri, May 12, 2023 at 10:20:32AM +0800, Xingyu Wu wrote:
> >> >> >> Add PLL clock inputs from PLL clock generator.
> >> >> >>=20
> >> >> >> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> >> >> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> >> >> ---
> >> >> >>  .../clock/starfive,jh7110-syscrg.yaml         | 20 ++++++++++++=
+++++--
> >> >> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> >> >> >=20
> >> >> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-=
visionfive-2-v1.3b.dtb: clock-controller@13020000: clocks: 'oneOf' conditio=
nal failed, one must be fixed:
> >> >> > 	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too sh=
ort
> >> >> > 	From schema: /Documentation/devicetree/bindings/clock/starfive,j=
h7110-syscrg.yaml
> >> >> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-=
visionfive-2-v1.3b.dtb: clock-controller@13020000: clock-names: 'oneOf' con=
ditional failed, one must be fixed:
> >> >> > 	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext'=
, 'i2stx_lrck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ex=
t'] is too short
> >> >> > 	'i2stx_bclk_ext' was expected
> >> >> > 	'i2stx_lrck_ext' was expected
> >> >> > 	'i2srx_bclk_ext' was expected
> >> >> > 	'i2srx_lrck_ext' was expected
> >> >> > 	'tdm_ext' was expected
> >> >> > 	'mclk_ext' was expected
> >> >> > 	'pll0_out' was expected
> >> >> > 	From schema: /Documentation/devicetree/bindings/clock/starfive,j=
h7110-syscrg.yaml
> >> >> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-=
visionfive-2-v1.2a.dtb: clock-controller@13020000: clocks: 'oneOf' conditio=
nal failed, one must be fixed:
> >> >> > 	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too sh=
ort
> >> >> > 	From schema: Documentation/devicetree/bindings/clock/starfive,jh=
7110-syscrg.yaml
> >> >> > /tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-=
visionfive-2-v1.2a.dtb: clock-controller@13020000: clock-names: 'oneOf' con=
ditional failed, one must be fixed:
> >> >> > 	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext'=
, 'i2stx_lrck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ex=
t'] is too short
> >> >> > 	'i2stx_bclk_ext' was expected
> >> >> > 	'i2stx_lrck_ext' was expected
> >> >> > 	'i2srx_bclk_ext' was expected
> >> >> > 	'i2srx_lrck_ext' was expected
> >> >> > 	'tdm_ext' was expected
> >> >> > 	'mclk_ext' was expected
> >> >> > 	'pll0_out' was expected
> >> >> > 	Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.y=
aml
> >> >> >=20
> >> >> > This binding change is incompatible with the existing devicetrees=
 for
> >> >> > the visionfive 2.
> >> >>=20
> >> >> This looks like less clocks about PLL in SYSCRG node. And I add thi=
s in patch 7.
> >> >=20
> >> > The existing devicetree is a valid, albeit limited, description of t=
he
> >> > hardware.
> >> > After your changes to the clock driver in this series, but *without*=
 the
> >> > changes to the devicetrees, does the system still function?
> >> > From a quick check of 4/7, it looks like it will not?
> >>=20
> >> I just tested it on the board and the system still worked without the =
changes
> >> about devicetree. But these clocks' rate were 0 because these could no=
t get
> >> the PLL clocks from devicetree.
> >=20
> > Hmm, that sounds like an issue to me. If all of the clock rates are
> > computed based off of parents that incorrectly report 0, are we not in
> > for trouble?
> > Should the fixed-factor clocks be retained as a fallback for the sake of
> > compatibility?
> > Emil, Stephen?
>=20
> I got your concern. Actually, I can add a check in driver to see if the d=
ts
> has pll clocks and then decide whether to use fixed-factor clocks or pll =
clocks
> from syscon. But eventually we have to use pll clocks and dts has to add =
it.
> Then the binding should add it synchronously, right?

IMO, it is okay to change the bindings to only allow the "correct"
representation of the clock tree, but the driver should fall back to the
fixed factor clocks if it detects the old/limited configuration.

Cheers,
Conor.

--fmR9wFkfHIZNBkc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGcvYAAKCRB4tDGHoIJi
0qjtAQCnxoHjat9m2l+ZRA6gRaDH14KVQN8ui70BNMgDp3RP1gD/W8KYmQpQPelR
QL0Lv3BwxzncwLIkFHzlyTIptDazoQs=
=IH/w
-----END PGP SIGNATURE-----

--fmR9wFkfHIZNBkc5--


--===============0658171282775636875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0658171282775636875==--

