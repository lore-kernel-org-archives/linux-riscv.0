Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD66FD45FA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHRhjT1qjTWzymL/gLRNAPyaL8h5jLqg7KQV6rtc8WQ=; b=SSV8Rd2Eh0BjL8cmpAhykFBpY5
	prITuLDfRcNafTmaa6PGVPk+UEpQlgqo/kvHZ01/QBjS31PXpvnf+/U/BcL7CsvjU7+BmFZGBlOnN
	KvCyxiM58NieYEMsWLWmT3bsaJTjTW66f9lpPr7lGgH0FnPbbydyIB/0zR5BT1qtVtCyL5t8whe+G
	2GSRwH+YBfiqJiOUyF1D/uBmEsnfQS+IAs/VVi53FfjCCiOTXdkEqAgLngju0zVIMpmN47a0A51S8
	vs/zsSoEfKcwty0dzRX7j5hMoEqz7/t8kGFyVUoWPxvVKYhGp+YUkYffFeY4PhQRxX6LfWSIfUtYA
	xeD+R/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOFe-000000054NC-39g1;
	Wed, 25 Feb 2026 23:25:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOFd-000000054N6-1poW
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 23:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7096860097;
	Wed, 25 Feb 2026 23:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFCEC19425;
	Wed, 25 Feb 2026 23:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772061904;
	bh=dqERQJmOH4aGB9pkJ5LjuWoL8pGfStP2xh05xN/ZBCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcPEd03MbkVYOUlQQZNPs13SW+n30iH51DZYMtvyf+E5I8KUt5k4ySGhASiSJKAyF
	 KnADC64X7i58v94r9RGAZRITxR3ZDo9hh58apxvb3eCi9zWJ8KW4mymTYYMgQLJ/gd
	 5sB21nv4xcnvYKnYDwPulFGxOHYmA6LFD/LsxtNBV3k5I6IhT8xUp9V9PHZ9vZ3dbw
	 u0DPNSoAdAZiBR39iYnKxiQ/s5mk2rN93L7SSqsRxUiAk1JdM6HQmSuKHxSxH0pr1k
	 WnC/saxX7K48W0oFotpB2LfqyEtSSJ7cx0BpzxBUElBkxjOH6pWge5AQKIFtCHx4+g
	 8Vwv5uzUZepQQ==
Date: Wed, 25 Feb 2026 23:24:59 +0000
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
Message-ID: <20260225-thrive-endless-3168e0b0f916@spud>
References: <20260224-briskly-scholar-294d13464721@wendy>
 <aZ9-NWiX4wMH3Ay6@redhat.com>
 <20260225-cache-nebulizer-2f3669074fa4@spud>
MIME-Version: 1.0
In-Reply-To: <20260225-cache-nebulizer-2f3669074fa4@spud>
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
Content-Type: multipart/mixed; boundary="===============5952605670397101400=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5952605670397101400==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BOZkWEMkKWK9MVwc"
Content-Disposition: inline


--BOZkWEMkKWK9MVwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 11:14:47PM +0000, Conor Dooley wrote:
> On Wed, Feb 25, 2026 at 05:56:53PM -0500, Brian Masney wrote:
> > Hi Conor,
> >=20
> > On Tue, Feb 24, 2026 at 09:35:25AM +0000, Conor Dooley wrote:
> > > UBSAN reported an out of bounds access during registration of the last
> > > two outputs. This out of bounds access occurs because space is only
> > > allocated in the hws array for two PLLs and the four output dividers
> > > that each has, but the defined IDs contain two DLLS and their two
> > > outputs each, which are not supported by the driver. The ID order is
> > > PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL output =
IDs
> > > by two while adding them to the array to avoid the problem.
> > >=20
> > > Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock =
support")
> > > CC: stable@vger.kernel.org
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > CC: Conor Dooley <conor.dooley@microchip.com>
> > > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > > CC: Michael Turquette <mturquette@baylibre.com>
> > > CC: Stephen Boyd <sboyd@kernel.org>
> > > CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > > CC: linux-riscv@lists.infradead.org
> > > CC: linux-clk@vger.kernel.org
> > > CC: linux-kernel@vger.kernel.org
> > > ---
> > >  drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/micro=
chip/clk-mpfs-ccc.c
> > > index 3a3ea2d142f8a..54cfbb8be8ab5 100644
> > > --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> > > +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> > > @@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct devic=
e *dev, struct mpfs_ccc_out_hw_
> > >  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n=
",
> > >  					     out_hw->id);
> > > =20
> > > -		data->hw_data.hws[out_hw->id] =3D &out_hw->divider.hw;
> > > +		data->hw_data.hws[out_hw->id - 2] =3D &out_hw->divider.hw;
> >=20
> > What happens when / if the DLLs are supported by this driver in the
> > future? This seems like a trap for the future.
> >=20
> > According to include/dt-bindings/clock/microchip,mpfs-clock.h, there are
> > only 16 clock IDs. Could hws be initialized to have enough room for all
> > 16 structures, and would it be ok if it was a sparse array?
> >=20
> > At the very least, I think it would be nice to include a comment here.
>=20
> I think I'd rather add a comment, I know it's at most only 24 extra
> allocations, but just feels bad to do it.

I'll add this, maybe on application.

@@ -234,6 +234,10 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
        unsigned int num_clks;
        int ret;
=20
+       /*
+        * If DLLs get added here, mpfs_ccc_register_outputs() currently pa=
cks
+        * sparse clock IDs in the hws array
+        */
        num_clks =3D ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pl=
l0out_clks) +
                   ARRAY_SIZE(mpfs_ccc_pll1out_clks);

--BOZkWEMkKWK9MVwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ+EywAKCRB4tDGHoIJi
0momAP9uDt68utwPZDTUNSuzOABEQhqL9EIcGlxduMBsmrWjrwD/bBddyNiT/Wsy
vY/xE8cBbqIUxbHuPSsvaTLzOYpUQQw=
=HMKd
-----END PGP SIGNATURE-----

--BOZkWEMkKWK9MVwc--


--===============5952605670397101400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5952605670397101400==--

