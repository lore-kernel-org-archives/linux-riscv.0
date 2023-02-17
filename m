Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE50FC636D4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CceY1YIyNId6dJSLuZmtIKOGDjkwrZ4oMH8RPMnRXLc=; b=fM0NYciBejVEKfcjT8lJVjKp7M
	6vKofXjOZTEP4Ypdn3m0Vq+797qmZTq/AvNj0eFEkNpPp8OegO/Mt2r0XcDs4Q1MRiSLD0Z/TJEG9
	hMUFZmJM7iA2Tye68zQKfixSi3XUdp/6C0cJDdAOY5RTFVvadD9DRR38hxnUoo+iMxOOXhTDDVTHb
	OywKF5OsxBUbox65b6a9Ob45qIfUhtuDufa+J0TiTIeIbi/44gmPjVM0KDaksIHZYVN4YZzXBIC1D
	gU2U28E7QitjzI5Xgm4bBS1VS6MHFrSGuXgJUPwErUlug9fiSKTPw2tabXivwsPrTf5nfM0n/pbKX
	xpgzwjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT0sM-00EKJZ-7X; Fri, 17 Feb 2023 13:34:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT0r4-00EJkL-7x
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 13:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676640770; x=1708176770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B+bbiQF6EYNlJmPgLAAO3jqlugcFvskvJnP/gXKqSpU=;
  b=DQbjKJaPog3dXQvIEvoBlZ0W7fphNgZ7VQVWNxN+xJCEUcOXK5NyjLu2
   NZ8LY94SuqpS2E5JMp0Hf8MFuXbYCXtl9JE4wMT0WyJLflv14dwl2aRqS
   RbNQNqvaBLHlTVmii5oYHZk2B7o7pjnqIBA9dT8hVJYtWBaC2bHMXuaYd
   AFw+/I9exB7QKaA8w7k23aZxKUyCq9G1ZwlrUVmGb4aMupBLOt2cPpMRW
   j/HTRlYBctlqlpLBD/cEMLOzyMarlsuRFYwDMxD54nWM3ybFH2+lwP4aw
   hboVxu9tRyD6rBv249mSNG25ZEtx31EE603XXPlw5EjaJSpMde2i5uxgq
   g==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669100400"; 
   d="asc'?scan'208";a="212518728"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Feb 2023 06:32:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 06:32:48 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 17 Feb 2023 06:32:46 -0700
Date: Fri, 17 Feb 2023 13:32:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y++B43uCnPQlRYFi@wendy>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com>
 <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_053250_343569_DD294961 
X-CRM114-Status: GOOD (  43.39  )
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
Content-Type: multipart/mixed; boundary="===============2212967696866335198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2212967696866335198==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="88z+7kkLpZhOqkB+"
Content-Disposition: inline

--88z+7kkLpZhOqkB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hal, Rob, Krzysztof,

On Fri, Feb 17, 2023 at 08:20:14PM +0800, Hal Feng wrote:
> On Fri, 17 Feb 2023 07:51:24 +0000, Conor Dooley wrote:
> > On Fri, Feb 17, 2023 at 10:27:27AM +0800, Hal Feng wrote:
> >> On Thu, 16 Feb 2023 18:20:34 +0000, Conor Dooley wrote:
> >> > Hey Hal!
> >> >=20
> >> > On Thu, Feb 16, 2023 at 10:42:20PM +0800, Hal Feng wrote:
> >> >> On Tue, 27 Dec 2022 20:15:20 +0000, Conor Dooley wrote:
> >> >> > On Mon, Dec 26, 2022 at 12:26:32AM +0800, Hal Feng wrote:
> >> >> >> On Tue, 20 Dec 2022 23:14:39 +0000, Conor Dooley wrote:
> >> >> >> > On Tue, Dec 20, 2022 at 08:50:50AM +0800, Hal Feng wrote:
> >> >> >> > > From: Emil Renner Berthing <kernel@esmil.dk>
> >> >> >> > >=20
> >> >> >> > > Add bindings for the system clock and reset generator (SYSCR=
G) on the
> >> >> >> > > JH7110 RISC-V SoC by StarFive Ltd.
> >> >> >> > >=20
> >> >> >> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> >> >> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> >> >=20
> >> >> >> > > +  clocks:
> >> >> >> > > +    items:
> >> >> >> > > +      - description: Main Oscillator (24 MHz)
> >> >> >> > > +      - description: GMAC1 RMII reference
> >> >> >> > > +      - description: GMAC1 RGMII RX
> >> >> >> > > +      - description: External I2S TX bit clock
> >> >> >> > > +      - description: External I2S TX left/right channel clo=
ck
> >> >> >> > > +      - description: External I2S RX bit clock
> >> >> >> > > +      - description: External I2S RX left/right channel clo=
ck
> >> >> >> > > +      - description: External TDM clock
> >> >> >> > > +      - description: External audio master clock
> >> >> >> >=20
> >> >> >> > So, from peeking at the clock driver & the dt - it looks like =
a bunch of
> >> >> >> > these are not actually required?
> >> >> >>=20
> >> >> >> These clocks are used as root clocks or optional parent clocks i=
n clock tree.
> >> >> >> Some of them are optional, but they are required if we want to d=
escribe the
> >> >> >> complete clock tree of JH7110 SoC.
> >> >> >=20
> >> >> > Perhaps I have a misunderstand of what required means. To me, req=
uired
> >> >> > means "you must provide this clock for the SoC to operate in all
> >> >> > configurations".
> >> >> > Optional therefore would be for things that are needed only for s=
ome
> >> >> > configurations and may be omitted if not required.
> >> >> >=20
> >> >> > From your comment below, boards with a JH7110 may choose not to p=
opulate
> >> >> > both external clock inputs to a mux. In that case, "dummy" clocks=
 should
> >> >> > not have to be provided in the DT of such boards to satisfy this =
binding
> >> >> > which seems wrong to me..
> >> >>=20
> >> >> Please see the picture of these external clocks in clock tree.
> >> >>=20
> >> >> # mount -t debugfs none /mnt
> >> >> # cat /mnt/clk/clk_summary
> >> >>                                  enable  prepare  protect          =
                      duty  hardware
> >> >>    clock                          count    count    count        ra=
te   accuracy phase  cycle    enable
> >> >> -------------------------------------------------------------------=
------------------------------------
> >> >>  *mclk_ext*                             0        0        0    1228=
8000          0     0  50000         Y
> >> >>  *tdm_ext*                              0        0        0    4915=
2000          0     0  50000         Y
> >> >>  *i2srx_lrck_ext*                       0        0        0      19=
2000          0     0  50000         Y
> >> >>  *i2srx_bclk_ext*                       0        0        0    1228=
8000          0     0  50000         Y
> >> >>  *i2stx_lrck_ext*                       0        0        0      19=
2000          0     0  50000         Y
> >> >>  *i2stx_bclk_ext*                       0        0        0    1228=
8000          0     0  50000         Y
> >> >>  *gmac1_rgmii_rxin*                     0        0        0   12500=
0000          0     0  50000         Y
> >> >>     gmac1_rx                          0        0        0   1250000=
00          0     0  50000         Y
> >> >>        gmac1_rx_inv                   0        0        0   1250000=
00          0   180  50000         Y
> >> >>  *gmac1_rmii_refin*                     0        0        0    5000=
0000          0     0  50000         Y
> >> >>     gmac1_rmii_rtx                    0        0        0    500000=
00          0     0  50000         Y
> >> >>        gmac1_tx                       0        0        0    500000=
00          0     0  50000         N
> >> >>           gmac1_tx_inv                0        0        0    500000=
00          0   180  50000         Y
> >> >>  *osc*                                  4        4        0    2400=
0000          0     0  50000         Y
> >> >>     apb_func                          0        0        0    240000=
00          0     0  50000         Y
> >> >>  ...
> >> >>=20
> >> >> The clock "gmac1_rgmii_rxin" and the clock "gmac1_rmii_refin" are
> >> >> actually used as the parent of other clocks.
> >> >=20
> >> >> The "dummy" clocks
> >> >> you said are all internal clocks.
> >> >=20
> >> > No, what I meant by "dummy" clocks is that if you make clocks "requi=
red"
> >> > in the binding that are not needed by the hardware for operation a
> >> > customer of yours might have to add "dummy" clocks to their devicetr=
ee
> >> > to pass dtbs_check.
> >> >=20
> >> >> For the audio related clocks (mclk_ext/tdm_ext/i2srx_lrck_ext/
> >> >> i2srx_bclk_ext/i2stx_lrck_ext/i2stx_bclk_ext), they will be used
> >> >> as the parent clocks in audio related drivers. Note that some
> >> >> clocks need to select different clocks as parent according to
> >> >> requirement.
> >> >> So all these external clocks are required.
> >> >>=20
> >> >> >=20
> >> >> > It would seem to me that you need to set minItems < maxItems here=
 to
> >> >> > account for that & you do in fact need clock-names.
> >> >> >=20
> >> >> >>=20
> >> >> >> > I'd have ploughed through this, but having read Krzysztof's co=
mments on
> >> >> >> > the DTS I'm not sure that this binding is correct.
> >> >> >> > https://lore.kernel.org/linux-riscv/20221220011247.35560-1-hal=
=2Efeng@starfivetech.com/T/#mdf67621a2344dce801aa8015d4963593a2c28bcc
> >> >> >> >=20
> >> >> >> > I *think* the DT is correct - the fixed clocks are all inputs =
=66rom clock
> >> >> >> > sources on the board and as such they are empty in soc.dtsi an=
d are
> >> >> >> > populated in board.dts?
> >> >> >>=20
> >> >> >> Yes, the fixed clocks are all clock sources on the board and inp=
ut to the SoC.
> >> >> >>=20
> >> >> >> >=20
> >> >> >> > However, are they all actually required? In the driver I see:
> >> >> >> > 	JH71X0__MUX(JH7110_SYSCLK_GMAC1_RX, "gmac1_rx", 2,
> >> >> >> > 		    JH7110_SYSCLK_GMAC1_RGMII_RXIN,
> >> >> >> > 		    JH7110_SYSCLK_GMAC1_RMII_RTX),
> >> >> >> > That macro is:
> >> >> >> > #define JH71X0__MUX(_idx, _name, _nparents, ...) [_idx] =3D {	=
		\
> >> >> >> > 	.name =3D _name,								\
> >> >> >> > 	.flags =3D 0,								\
> >> >> >> > 	.max =3D ((_nparents) - 1) << JH71X0_CLK_MUX_SHIFT,			\
> >> >> >> > 	.parents =3D { __VA_ARGS__ },						\
> >> >> >> > }
> >> >=20
> >> >> >> > AFAICT, RMII reference feeds RMII_RTX & RGMII RX *is* RGMII_RX=
IN?
> >> >> >> > Does that mean you need to populate only one of GMAC1 RMII ref=
erence
> >> >> >> > and GMAC1 RMGII RX and the other is optional?
> >> >=20
> >> >> >> Yes, actually only one of them is chosen as the root clock
> >> >> >> source of the clock "gmac1_rx".
> >> > |  *gmac1_rgmii_rxin*  =20
> >> > |     gmac1_rx         =20
> >> > |        gmac1_rx_inv  =20
> >> > |  *gmac1_rmii_refin*  =20
> >> > |     gmac1_rmii_rtx   =20
> >> > |        gmac1_tx      =20
> >> > |           gmac1_tx_inv
> >> > |
> >> > | description: GMAC1 RMII reference
> >> > | description: GMAC1 RGMII RX
> >> >=20
> >> >=20
> >> > So you're telling me that you can either:
> >> > - Provide GMAC1 RMII reference and GMAC1 RGMII RX & then use differe=
nt
> >> >   clocks for gmac1_rx and gmac1_tx
> >> > - Provide only GMAC1 RMII reference & use it for both gmac1_tx *and*
> >> >   gmac1_rx
> >> >=20
> >> > Is that correct?
> >>=20
> >> Yes, it is.
> >=20
> > Which would then make GMAC1 RGMII RX optional, rather than required?
>=20
> If thinking in this way, I must say yes, it is optional. But actually
> GMAC1 RGMII RX feeds gmac1_rx by default.=20
> For a mux, it usually works if you populate only one input to it.
> Does it mean all the other inputs are optional? And how can we define
> which input is required?

I'm not sure, that is a question for Krzysztof and/or Rob.

--88z+7kkLpZhOqkB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY++B4wAKCRB4tDGHoIJi
0himAQCTam2PRSkj3ctNg0s6dRGyXMdNkyVlFSEFuTpnQg5YkwD/X+39mCeT/fMA
i8rVvJH06kUIwiBK0vDgtVzw7XcHaAY=
=oZew
-----END PGP SIGNATURE-----

--88z+7kkLpZhOqkB+--


--===============2212967696866335198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2212967696866335198==--

