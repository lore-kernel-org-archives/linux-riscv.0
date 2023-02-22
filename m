Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12A1C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BX+Va4GkuNV/mPwbVEhc7aTaMrIs4KQcKbrwUgpytbA=; b=Al8y5uHDFj3pWzy+re/x4+Zs5F
	MrLeeMlgPVpaPcgeO/RZ5iDSC6iZUJfb64m5ITWUnBXMxADMEJ1kMPlqRNxBNw+A3Gu/JHzItXcgE
	2RlacyZ4BCv933MXDSQNLwNHX3RW+Z29V5WhRPrEvL3p/eP/2Si8U1HlT81xr8G4vzRwHR+gbs7xC
	E8FIyfABF1vDtFosfIQH3mZGROZiMcBn2ct2lXmfOtyH+t3sL9Ux4txS+HUd3c9Uv6SoGZORhf5EA
	XltsfPrjebwPJ1oQ3sq0kKjkfBo03qFBD1zu2c12IniSCSJxrvOIpfCTxuWJ06mTgoqi4k8zTqZoX
	q2HXfVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrxQ-00D1NN-26; Wed, 22 Feb 2023 16:27:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrxF-00D1LL-7v
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 16:26:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65D0B6144A;
	Wed, 22 Feb 2023 16:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D61C433EF;
	Wed, 22 Feb 2023 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677083211;
	bh=V5Qj3BTdP3PhytvonA7I6AsASvM8A2LRZyqqdt9K4kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPqJG/+MLNYT+twMDVYfCmUFo5DCqQrItwwMQo2SN1ejyT1qmdNHTL5HB53T2TGRl
	 yYF7jIyX+o+cHSKknXpJojo+5lpJLZyX98IYOu4NAbJLUTR7RIiG5xxW8TMhTb+OiX
	 ix6rNshsrVLKfLqRgmLxGwr51kKd4P8FfC0E1qPbGf6gfK6PPKH8HYl7NAq4UR4c2i
	 ltlerQlKfX04nSyouNeZlq1jGf1fPewCMcfNFoiMaEa5AiOSPXNLPHDNzhDvQOurn8
	 QHe1mCvRvC4Wuqegaz2XcxS0sPMPMP6PGfp/z+BZdzBR3k9GZIWa9F8YlbSIfMRdje
	 KELX91ruKNM5A==
Date: Wed, 22 Feb 2023 16:26:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y/ZCRv3jHwFxN1Fo@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com>
 <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <72953dc9371b87da8d03c63633d7d9dd.sboyd@kernel.org>
 <Y/VWNPfApsfm3/UD@spud>
 <c0472d7f-56fe-3e91-e0a0-49ee51700b5d@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <c0472d7f-56fe-3e91-e0a0-49ee51700b5d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_082653_381964_4B4E98CB 
X-CRM114-Status: GOOD (  31.33  )
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
Content-Type: multipart/mixed; boundary="===============0320446272395519063=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0320446272395519063==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JLW0UnSXv7FTiqD2"
Content-Disposition: inline


--JLW0UnSXv7FTiqD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 09:27:37PM +0800, Hal Feng wrote:
> On Tue, 21 Feb 2023 23:39:32 +0000, Conor Dooley wrote:
> > On Tue, Feb 21, 2023 at 02:17:17PM -0800, Stephen Boyd wrote:
> >> Quoting Conor Dooley (2023-02-16 10:20:34)
> >> > On Thu, Feb 16, 2023 at 10:42:20PM +0800, Hal Feng wrote:
> >> > > On Tue, 27 Dec 2022 20:15:20 +0000, Conor Dooley wrote:
> >> > > > On Mon, Dec 26, 2022 at 12:26:32AM +0800, Hal Feng wrote:
> >> > > Please see the picture of these external clocks in clock tree.
> >> > >=20
> >> > > # mount -t debugfs none /mnt
> >> > > # cat /mnt/clk/clk_summary
> >> > >                                  enable  prepare  protect         =
                       duty  hardware
> >> > >    clock                          count    count    count        r=
ate   accuracy phase  cycle    enable
> >> > > ------------------------------------------------------------------=
-------------------------------------
> >> > >  *mclk_ext*                             0        0        0    122=
88000          0     0  50000         Y
> >> > >  *tdm_ext*                              0        0        0    491=
52000          0     0  50000         Y
> >> > >  *i2srx_lrck_ext*                       0        0        0      1=
92000          0     0  50000         Y
> >> > >  *i2srx_bclk_ext*                       0        0        0    122=
88000          0     0  50000         Y
> >> > >  *i2stx_lrck_ext*                       0        0        0      1=
92000          0     0  50000         Y
> >> > >  *i2stx_bclk_ext*                       0        0        0    122=
88000          0     0  50000         Y
> >> > >  *gmac1_rgmii_rxin*                     0        0        0   1250=
00000          0     0  50000         Y
> >> > >     gmac1_rx                          0        0        0   125000=
000          0     0  50000         Y
> >> > >        gmac1_rx_inv                   0        0        0   125000=
000          0   180  50000         Y
> >> > >  *gmac1_rmii_refin*                     0        0        0    500=
00000          0     0  50000         Y
> >> > >     gmac1_rmii_rtx                    0        0        0    50000=
000          0     0  50000         Y
> >> > >        gmac1_tx                       0        0        0    50000=
000          0     0  50000         N
> >> > >           gmac1_tx_inv                0        0        0    50000=
000          0   180  50000         Y
> >> > >  *osc*                                  4        4        0    240=
00000          0     0  50000         Y
> >> > >     apb_func                          0        0        0    24000=
000          0     0  50000         Y
> >> > >  ...
> >> > >=20
> >> > > The clock "gmac1_rgmii_rxin" and the clock "gmac1_rmii_refin" are
> >> > > actually used as the parent of other clocks.
> >> >=20
> >> > > The "dummy" clocks
> >> > > you said are all internal clocks.
> >> >=20
> >> > No, what I meant by "dummy" clocks is that if you make clocks "requi=
red"
> >> > in the binding that are not needed by the hardware for operation a
> >> > customer of yours might have to add "dummy" clocks to their devicetr=
ee
> >> > to pass dtbs_check.
> >>=20
> >> They can set the phandle specifier to '<0>' to fill in the required
> >> property when there isn't anything there. If this is inside an SoC, it
> >> is always connected because silicon can't change after it is made
> >> (unless this is an FPGA). Therefore, any and all input clocks should be
> >> listed as required.
> >=20
> >> If the clk controller has inputs that are
> >> pads/balls/pins on the SoC then they can be optional if a valid design
> >> can leave those pins not connected.
> >=20
> > From the discussion on the dts patches, where the clocks have been put
> > (intentionally) into board.dts, I've been under the impression that we
> > are in this situation.
>=20
> For the system (sys) clock controller, we are in this situation.
> For the always-on (aon) clock controller, we are not, because some input
> clocks are inside the SoC.
>=20
> > Up to Hal to tell us if the hardware is capable of having those inputs
> > left unfilled!
>=20
> The situation is different for v1.2A and v1.3B boards.
>=20
> For the v1.2A board,
> gmac1 only requires "gmac1_rmii_refin", which support 100MHz
> gmac0 only requires "gmac0_rgmii_rxin", which support 1000MHz
>=20
> For the v1.3B board,
> gmac1 only requires "gmac1_rgmii_rxin", which support 1000MHz
> gmac0 only requires "gmac0_rgmii_rxin", which support 1000MHz
>=20
> So we should set the "required" property depending on different
> boards.

These were Krzk's suggestions:
oneOf:
 - clock-names:
     minItems: 3
     items:
       - a
       - b
       - c
       - d
 - clock-names:
     items:
       - a
       - b
       - d

or maybe:
 - clock-names:
     minItems: 3
     items:
       - a
       - b
       - enum: [c, d]
       - d

Might be making a mess here, but I think that becomes:
  clock-names:
    oneOf:
      - items:
          - const: osc
          - enum:
              - gmac1_rmii_refin
              - gmac1_rgmii_rxin
          - const: i2stx_bclk_ext
          - const: i2stx_lrck_ext
          - const: i2srx_bclk_ext
          - const: i2srx_lrck_ext
          - const: tdm_ext
          - const: mclk_ext

      - items:
          - const: osc
          - const: gmac1_rmii_refin
          - const: gmac1_rgmii_rxin
          - const: i2stx_bclk_ext
          - const: i2stx_lrck_ext
          - const: i2srx_bclk_ext
          - const: i2srx_lrck_ext
          - const: tdm_ext
          - const: mclk_ext

Cheers,
Conor.


--JLW0UnSXv7FTiqD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/ZCRgAKCRB4tDGHoIJi
0g4EAP0ROfBXRkOJiWSfjIAefdNTaTzOabSQlFUUWjU72aNGGwEAt7fEaK6NxvKg
yJWAnP40qNL4gola77J0qA7O3ZIvxwk=
=yabE
-----END PGP SIGNATURE-----

--JLW0UnSXv7FTiqD2--


--===============0320446272395519063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0320446272395519063==--

