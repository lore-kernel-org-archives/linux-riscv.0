Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE734C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 23:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoRMCZZXSmv7i9G7TSjV6c2/4l9cIDIqisFWprBhwSA=; b=1KKaV4Pm+Q0JStvatadAIrVaE/
	D0tQryPMgbLG7tWErAYqzyA/BTTt5l6UZlWHuMwvNp0dS0GHE7OMK8uM4AQlCLmABEBfbgnyf7K8Q
	GT3Y8zNxSRd6A3QTBV+5CF02VdJir8uagnDzgtjxTz+tRhWc/swQBbcWILWOZSQ0yjOg2FfayB3Ib
	jTkAuzq89OGbtlyWsN3KiqYep0Uczklm7+Iyr7zCpVApd8HZMm2/AbvisqQBIJ38vB2DEf3CvcDK/
	ZcZrFh0mUTBzo4gxNWwU7kivM7s7uaTfsDqWe2fg7hkS/Kl8kg4S9romGNGuPITa7Z5FHravvcOx2
	Xf6wEcTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUcEY-00A8oo-Vh; Tue, 21 Feb 2023 23:39:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUcEW-00A8o0-Ej
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 23:39:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E10D0B8118F;
	Tue, 21 Feb 2023 23:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305F4C433D2;
	Tue, 21 Feb 2023 23:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677022777;
	bh=ie0GAExwZPpmXLWLkpfA8sVNwYvYbybeiZNOj6h8WEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTbwBBUEzXr2PONY2NQhckcJSZb82zbvfiyxjZ989wicvTS9uHXoL9n7squ+tJaFi
	 Rouxs8i5zSa0M1wYR92LiOH5C6E9wC4iK/ghvVBJTdGrEwM6TO8ODO9MUrCtqy0j7x
	 c/4fwKmmUVG7w7uqupmuclAqb1eKDGoaBnQ8xOAtgrKM9Q3WXGI65AviknIZe99KZg
	 KJVDEnwkYoUYrpbt5/o9fr84D6a3Q2ETfDQILnspFjB1FwYJedXAvtQvLFffhms53q
	 UAnpaPrXmOf9gpsekw7ZkA7NYRE//ho1Y2Pdwx8GzGOAt4kYPP9m35PfOzPOamTTa5
	 8ZzXBju3bxPig==
Date: Tue, 21 Feb 2023 23:39:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
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
Message-ID: <Y/VWNPfApsfm3/UD@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com>
 <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <72953dc9371b87da8d03c63633d7d9dd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <72953dc9371b87da8d03c63633d7d9dd.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_153940_792078_F8E24747 
X-CRM114-Status: GOOD (  26.88  )
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
Content-Type: multipart/mixed; boundary="===============1483181128734343625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1483181128734343625==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VknuSA68ljcWlQyJ"
Content-Disposition: inline


--VknuSA68ljcWlQyJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 02:17:17PM -0800, Stephen Boyd wrote:
> Quoting Conor Dooley (2023-02-16 10:20:34)
> > On Thu, Feb 16, 2023 at 10:42:20PM +0800, Hal Feng wrote:
> > > On Tue, 27 Dec 2022 20:15:20 +0000, Conor Dooley wrote:
> > > > On Mon, Dec 26, 2022 at 12:26:32AM +0800, Hal Feng wrote:
> > > Please see the picture of these external clocks in clock tree.
> > >=20
> > > # mount -t debugfs none /mnt
> > > # cat /mnt/clk/clk_summary
> > >                                  enable  prepare  protect            =
                    duty  hardware
> > >    clock                          count    count    count        rate=
   accuracy phase  cycle    enable
> > > ---------------------------------------------------------------------=
----------------------------------
> > >  *mclk_ext*                             0        0        0    122880=
00          0     0  50000         Y
> > >  *tdm_ext*                              0        0        0    491520=
00          0     0  50000         Y
> > >  *i2srx_lrck_ext*                       0        0        0      1920=
00          0     0  50000         Y
> > >  *i2srx_bclk_ext*                       0        0        0    122880=
00          0     0  50000         Y
> > >  *i2stx_lrck_ext*                       0        0        0      1920=
00          0     0  50000         Y
> > >  *i2stx_bclk_ext*                       0        0        0    122880=
00          0     0  50000         Y
> > >  *gmac1_rgmii_rxin*                     0        0        0   1250000=
00          0     0  50000         Y
> > >     gmac1_rx                          0        0        0   125000000=
          0     0  50000         Y
> > >        gmac1_rx_inv                   0        0        0   125000000=
          0   180  50000         Y
> > >  *gmac1_rmii_refin*                     0        0        0    500000=
00          0     0  50000         Y
> > >     gmac1_rmii_rtx                    0        0        0    50000000=
          0     0  50000         Y
> > >        gmac1_tx                       0        0        0    50000000=
          0     0  50000         N
> > >           gmac1_tx_inv                0        0        0    50000000=
          0   180  50000         Y
> > >  *osc*                                  4        4        0    240000=
00          0     0  50000         Y
> > >     apb_func                          0        0        0    24000000=
          0     0  50000         Y
> > >  ...
> > >=20
> > > The clock "gmac1_rgmii_rxin" and the clock "gmac1_rmii_refin" are
> > > actually used as the parent of other clocks.
> >=20
> > > The "dummy" clocks
> > > you said are all internal clocks.
> >=20
> > No, what I meant by "dummy" clocks is that if you make clocks "required"
> > in the binding that are not needed by the hardware for operation a
> > customer of yours might have to add "dummy" clocks to their devicetree
> > to pass dtbs_check.
>=20
> They can set the phandle specifier to '<0>' to fill in the required
> property when there isn't anything there. If this is inside an SoC, it
> is always connected because silicon can't change after it is made
> (unless this is an FPGA). Therefore, any and all input clocks should be
> listed as required.

> If the clk controller has inputs that are
> pads/balls/pins on the SoC then they can be optional if a valid design
> can leave those pins not connected.

=46rom the discussion on the dts patches, where the clocks have been put
(intentionally) into board.dts, I've been under the impression that we
are in this situation.
Up to Hal to tell us if the hardware is capable of having those inputs
left unfilled!

FWIW, there's a v4 [1] of this series - but the question has yet to be
resolved.

Thanks,
Conor.

1 - https://lore.kernel.org/all/20230221024645.127922-1-hal.feng@starfivete=
ch.com/

--VknuSA68ljcWlQyJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/VWMAAKCRB4tDGHoIJi
0vMnAP9+HziqXbEJ1GX8HIr5jD+lzSjYpeu8k3IfZk1pte1WdAEAwNfSAKDpB2Sz
rYa+dCvHzPRG/YzqUU8wOHnRfqNDxQw=
=9xTC
-----END PGP SIGNATURE-----

--VknuSA68ljcWlQyJ--


--===============1483181128734343625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1483181128734343625==--

