Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994A9CCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIi9ySOBa4cjz0eOQyISE1TKVsQn1A55v/fn+5xwhwY=; b=W0uciX6lGHSdKHaXcHJ0w5cYhE
	7T2FS8gK0yEUTWKlVaIPxhu34V7yI3MBCt2abs43DyFRmzbZwnlWZwUV0rkro0cWQmoeJmaZBzQrh
	Dmaum2w2wutJvcTSukMzQo7LoV1LsystFnies0R9G8jO4DTWtDMfYiv8g/fOJhzZ8Mu2pKk9gr8Df
	NI2KCPbFKSOZ7zVueXobYVde/c0+L0yOHQqPCP4As027Fv7HZgoJL2WLqxTyoYbJnr+Mc+Z7Cc7k6
	fmMcA20HwtJuuUJl/qUdgntfC0kRG5CRFtEpqGMd5xzubKW5jX9pDQiTKjAr2tyKcTjfJLroWgX7g
	oP7PKzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEhT-00000008yEm-0WgV;
	Fri, 24 Oct 2025 10:07:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEhR-00000008yEf-1qh9
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 10:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD1A960051;
	Fri, 24 Oct 2025 10:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68D6C4CEF5;
	Fri, 24 Oct 2025 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761300428;
	bh=mAvyMZkDKEDQzM0cbfFWpMpv34LC/VLxM5Txgp0+6eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CcZskTxTuVZTuy3uofRPvFha3nbGrmDbzJJteid6JGgVpeGmvo36leJYLYmH73zj0
	 wMc9mt5Jkxr/3Cwzswxak9gdaC3byg2lztBpPDHu3zi6vu3hzJVUGlQVngrMLxuZlX
	 rM9cbLDkS7lBtf2z8+rv/POmkY1RydtVhIPRIPF/PoVSSrJTH8r+09A15qUYjhdzec
	 Sinm1jN797NhM6lSrqf8wOv8WLJ83S+fy+vHDP4WmQcxe9/R6NSGu/s9rd0tN8UdAY
	 tgBpd7yn1lnFlENN+9ZUrXop7JsPhLwwwretliTcI/jLwrLvjM+4PBIEXCcwt/4iNY
	 7ONb1IoC40XyA==
Date: Fri, 24 Oct 2025 11:07:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/9] reset: mpfs: add non-auxiliary bus probing
Message-ID: <20251024-void-esteemed-832b3bf5b965@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-crane-utilize-cff9298291a4@spud>
 <60544429-3eeb-41df-b42c-613da651b4a1@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <60544429-3eeb-41df-b42c-613da651b4a1@tuxon.dev>
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
Content-Type: multipart/mixed; boundary="===============2401518080605281576=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2401518080605281576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tXetbUU2Jb29E84+"
Content-Disposition: inline


--tXetbUU2Jb29E84+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 07:06:48AM +0300, Claudiu Beznea wrote:
> Hi, Conor,
>=20
> On 10/13/25 20:45, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > While the auxiliary bus was a nice bandaid, and meant that re-writing
> > the representation of the clock regions in devicetree was not required,
> > it has run its course. The "mss_top_sysreg" region that contains the
> > clock and reset regions, also contains pinctrl and an interrupt
> > controller, so the time has come rewrite the devicetree and probe the
> > reset controller from an mfd devicetree node, rather than implement
> > those drivers using the auxiliary bus. Wanting to avoid propagating this
> > naive/incorrect description of the hardware to the new pic64gx SoC is a
> > major motivating factor here.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > v4:
> > - Only use driver specific lock for non-regmap writes
> >=20
> > v2:
> > - Implement the request to use regmap_update_bits(). I found that I then
> >   hated the read/write helpers since they were just bloat, so I ripped
> >   them out. I replaced the regular spin_lock_irqsave() stuff with a
> >   guard(spinlock_irqsave), since that's a simpler way of handling the t=
wo
> >   different paths through such a trivial pair of functions.
> > ---
> >  drivers/reset/reset-mpfs.c | 83 ++++++++++++++++++++++++++++++--------
> >  1 file changed, 66 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> > index f6fa10e03ea8..8e5ed4deecf3 100644
> > --- a/drivers/reset/reset-mpfs.c
> > +++ b/drivers/reset/reset-mpfs.c
> > @@ -7,13 +7,16 @@
> >   *
> >   */
> >  #include <linux/auxiliary_bus.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> > +#include <linux/mfd/syscon.h>
>=20
> Should you add a depends on MFD_SYSCON ?

Perhaps, but it's a NOP. This driver depends on the clock driver, which
does have a depends on MFD_SYSCON. I'll add it, but makes no difference
to either the build or functionality.

--tXetbUU2Jb29E84+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPtPxwAKCRB4tDGHoIJi
0uinAQDqJ3CDE8D9ZdZAqPBDpFO+5LryRbw842V3DiYnWn1NWAD8DNk95ic8DX2M
KR1ygcP7Fu/7AD8lobFc4LKzSL1XSg4=
=L2vi
-----END PGP SIGNATURE-----

--tXetbUU2Jb29E84+--


--===============2401518080605281576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2401518080605281576==--

