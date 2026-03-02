Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2E5EB3622
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 17:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yg+vxObzF9goCOr2QbAilHEuEbHTIVFTFnktU5CPVxY=; b=ZdYJExtiyjyda1WyES1Ml5AYtE
	w1xOL6yyoCXvENQYGeqQXAfudNkvtPmjCE9TgH4vTjf6kKDY2F1gu8NOtAN4rLUAul7tfpsUkZJKw
	IJNj1wIY3kFkC3e+MMpbjAL/HpMCwsu7up+MD0/ppesxjEh1BMpWB1ibTQaCX6bzeIPQ5b23olr/h
	/8Spl4tTgxpnMUI3bf6qAZ5biRTEuvD+SmzAuiu6XhYa7kCpeLDPgKRPVFzxjHeKKCYmbxtafVjt2
	ceKUPQWcq5UjdoLgwM9Xy7mpGVSzInFq6B+2ms/friNO+/t8WJphlz9YnjCNQEUnQCm6EpXH7cJmW
	rGJ823bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6q4-0000000DZNo-1fGu;
	Mon, 02 Mar 2026 17:13:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6q1-0000000DZNH-2Lur
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 17:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1C8143FA1;
	Mon,  2 Mar 2026 17:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CB3C19423;
	Mon,  2 Mar 2026 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772471624;
	bh=QKdJaOSGIzBxcUx9X/A3nsrNbzD/gVBg/TDbhNKK6o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCTIOQKnzO2RfPySqjw6WycKiSw28+Ko+GcRT/ug82GCGeGiyZZqM4f4Dvj+7DcAW
	 SEbASDyrtCkczNgglbOuZkltfaV2WKOOn0XhRNV7Yku3ZExd3QQgzmF7h4LXNpD5iY
	 YOT+3picLmyKFjAxzeQTKILiXDaTlb83OiHhLzw7FkEc1AGBsd6Y/Wdml0z7A9c+1J
	 oh4TRM3nQHhbfDFGPKwNyIikBPSbVilJbR8xgXxa0Dtrc/+9mp0Ktb424lRfS3CveA
	 yPqLYnW+mduXMWIzgTF1awwAyMjPPeptYqpIuk2YjrkeuLCytRg2FsXUrIgCQLSpYU
	 4O7vQrQjhhU/g==
Date: Mon, 2 Mar 2026 17:13:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: fix out of bounds access
 during output registration
Message-ID: <20260302-snort-unpicked-a15d25b4d52b@spud>
References: <20260224-briskly-scholar-294d13464721@wendy>
 <aZ9-NWiX4wMH3Ay6@redhat.com>
 <20260225-cache-nebulizer-2f3669074fa4@spud>
 <20260225-thrive-endless-3168e0b0f916@spud>
 <aaBpBYVtt_VhuJws@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aaBpBYVtt_VhuJws@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_091345_636967_C9B57B00 
X-CRM114-Status: GOOD (  38.89  )
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
Content-Type: multipart/mixed; boundary="===============0935221326436678397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0935221326436678397==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BSpNHjmm58g1yjQa"
Content-Disposition: inline


--BSpNHjmm58g1yjQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 10:38:45AM -0500, Brian Masney wrote:
> On Wed, Feb 25, 2026 at 11:24:59PM +0000, Conor Dooley wrote:
> > On Wed, Feb 25, 2026 at 11:14:47PM +0000, Conor Dooley wrote:
> > > On Wed, Feb 25, 2026 at 05:56:53PM -0500, Brian Masney wrote:
> > > > Hi Conor,
> > > >=20
> > > > On Tue, Feb 24, 2026 at 09:35:25AM +0000, Conor Dooley wrote:
> > > > > UBSAN reported an out of bounds access during registration of the=
 last
> > > > > two outputs. This out of bounds access occurs because space is on=
ly
> > > > > allocated in the hws array for two PLLs and the four output divid=
ers
> > > > > that each has, but the defined IDs contain two DLLS and their two
> > > > > outputs each, which are not supported by the driver. The ID order=
 is
> > > > > PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL out=
put IDs
> > > > > by two while adding them to the array to avoid the problem.
> > > > >=20
> > > > > Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric cl=
ock support")
> > > > > CC: stable@vger.kernel.org
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > ---
> > > > > CC: Conor Dooley <conor.dooley@microchip.com>
> > > > > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > > > > CC: Michael Turquette <mturquette@baylibre.com>
> > > > > CC: Stephen Boyd <sboyd@kernel.org>
> > > > > CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > > > > CC: linux-riscv@lists.infradead.org
> > > > > CC: linux-clk@vger.kernel.org
> > > > > CC: linux-kernel@vger.kernel.org
> > > > > ---
> > > > >  drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/m=
icrochip/clk-mpfs-ccc.c
> > > > > index 3a3ea2d142f8a..54cfbb8be8ab5 100644
> > > > > --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> > > > > +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> > > > > @@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct d=
evice *dev, struct mpfs_ccc_out_hw_
> > > > >  			return dev_err_probe(dev, ret, "failed to register clock id: =
%d\n",
> > > > >  					     out_hw->id);
> > > > > =20
> > > > > -		data->hw_data.hws[out_hw->id] =3D &out_hw->divider.hw;
> > > > > +		data->hw_data.hws[out_hw->id - 2] =3D &out_hw->divider.hw;
> > > >=20
> > > > What happens when / if the DLLs are supported by this driver in the
> > > > future? This seems like a trap for the future.
> > > >=20
> > > > According to include/dt-bindings/clock/microchip,mpfs-clock.h, ther=
e are
> > > > only 16 clock IDs. Could hws be initialized to have enough room for=
 all
> > > > 16 structures, and would it be ok if it was a sparse array?
> > > >=20
> > > > At the very least, I think it would be nice to include a comment he=
re.
> > >=20
> > > I think I'd rather add a comment, I know it's at most only 24 extra
> > > allocations, but just feels bad to do it.
> >=20
> > I'll add this, maybe on application.
> >=20
> > @@ -234,6 +234,10 @@ static int mpfs_ccc_probe(struct platform_device *=
pdev)
> >         unsigned int num_clks;
> >         int ret;
> > =20
> > +       /*
> > +        * If DLLs get added here, mpfs_ccc_register_outputs() currentl=
y packs
> > +        * sparse clock IDs in the hws array
> > +        */
> >         num_clks =3D ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_cc=
c_pll0out_clks) +
> >                    ARRAY_SIZE(mpfs_ccc_pll1out_clks);
>=20
> That makes sense.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>

I applied the patch with this comment added.

--BSpNHjmm58g1yjQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaXFQQAKCRB4tDGHoIJi
0kzGAQDTiMAn/9pA3ovo9CSKkGSKQcbIO43P1mRGblWEqMoLqQEAp5LlMMg9HYIC
5SB4jiExbrG6ZtuwLfhWVE4Ax0vCTAg=
=Z7oQ
-----END PGP SIGNATURE-----

--BSpNHjmm58g1yjQa--


--===============0935221326436678397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0935221326436678397==--

