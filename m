Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B01DFD45FA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 23:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bO1b5zceJn6DVPS8ktE3vS6gQMkVfmFrUuETd4OFRy4=; b=rggToMTJxtHi3KuR705BUeYVCF
	17xwRE9ohRr6mPbVJkq/zJRXG0xD0f4m7QVDtHU5AJWrw+tR+2Mwt25jLZkc5LxmKQWx/rJfk+1mA
	n6RFTGRpffDq+bMRS/Ay9xmQ4+GfP5Im50iVXAgCqRuqOJkeX0VCJSzBXZLENv0LLxvu2QO5lBEyp
	y4h03F6ZSDLN58N78LyaeZ1hValKD+WPVe5i4SduoYdjboUoYoCHjJIw+EuHUXF6bCUlocttwk4vC
	xb2meJ95DhsFmoK7tHw903a3n7rc1ETlVtvO9jH2nGmHhFmmbyrQA3MjWwoqC/rJVgfw38wk4KVSN
	zHuZMS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvO5m-000000053IE-1oJY;
	Wed, 25 Feb 2026 23:14:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvO5k-000000053Hr-0xrV
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 23:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8852B43C59;
	Wed, 25 Feb 2026 23:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D116C116D0;
	Wed, 25 Feb 2026 23:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772061291;
	bh=VK2YcBiNDigjs2o+L49r0/gexv5vFZDj1q5df5aAjCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlgQFgt5Q++FEAIjW9nuShR0bn2j4iU1a5G4D9nbJS5Jx688UXluHwF1fTrxdbX3I
	 W391wquZ2GN2l1IRM/9E+McOIRtXr5I7AKsbHD7J8/q1PD8xK3lATt3JEdFcGBANnn
	 j/+agO7ejsgWTZWUw0Nbmy+lB5YTdTvsl0ypFPUrXYg1voHDW9Biu5qO3A6vHNujLB
	 rDl09SbVhf7gpfKSDDar4GKi9so68AJHBJk1IPoo5ptTVRGLKQ8jGyeXUAqt+8/Han
	 n8kAjawzc5oV9VJXFfCwV6jL+FfifN0Kut34Egdolq9KWudlFeQcH3NKSM0kmcP9Oq
	 HneetbwLA5h3A==
Date: Wed, 25 Feb 2026 23:14:47 +0000
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
Message-ID: <20260225-cache-nebulizer-2f3669074fa4@spud>
References: <20260224-briskly-scholar-294d13464721@wendy>
 <aZ9-NWiX4wMH3Ay6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aZ9-NWiX4wMH3Ay6@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_151452_330732_F43580D2 
X-CRM114-Status: GOOD (  30.66  )
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
Content-Type: multipart/mixed; boundary="===============4921643419839670508=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4921643419839670508==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvpItN8tSslGWDOf"
Content-Disposition: inline


--GvpItN8tSslGWDOf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 05:56:53PM -0500, Brian Masney wrote:
> Hi Conor,
>=20
> On Tue, Feb 24, 2026 at 09:35:25AM +0000, Conor Dooley wrote:
> > UBSAN reported an out of bounds access during registration of the last
> > two outputs. This out of bounds access occurs because space is only
> > allocated in the hws array for two PLLs and the four output dividers
> > that each has, but the defined IDs contain two DLLS and their two
> > outputs each, which are not supported by the driver. The ID order is
> > PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL output IDs
> > by two while adding them to the array to avoid the problem.
> >=20
> > Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock su=
pport")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > CC: Conor Dooley <conor.dooley@microchip.com>
> > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > CC: Michael Turquette <mturquette@baylibre.com>
> > CC: Stephen Boyd <sboyd@kernel.org>
> > CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > CC: linux-riscv@lists.infradead.org
> > CC: linux-clk@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microch=
ip/clk-mpfs-ccc.c
> > index 3a3ea2d142f8a..54cfbb8be8ab5 100644
> > --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> > +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> > @@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct device =
*dev, struct mpfs_ccc_out_hw_
> >  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
> >  					     out_hw->id);
> > =20
> > -		data->hw_data.hws[out_hw->id] =3D &out_hw->divider.hw;
> > +		data->hw_data.hws[out_hw->id - 2] =3D &out_hw->divider.hw;
>=20
> What happens when / if the DLLs are supported by this driver in the
> future? This seems like a trap for the future.
>=20
> According to include/dt-bindings/clock/microchip,mpfs-clock.h, there are
> only 16 clock IDs. Could hws be initialized to have enough room for all
> 16 structures, and would it be ok if it was a sparse array?
>=20
> At the very least, I think it would be nice to include a comment here.

I think I'd rather add a comment, I know it's at most only 24 extra
allocations, but just feels bad to do it.

--GvpItN8tSslGWDOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ+CZwAKCRB4tDGHoIJi
0oQkAQDqspQZXpWi73qrClv6oQlSbiI4pkaCAQHne1fsgZzU1wEA9uJG7+fpSyAC
PVCJYXDmlCFMeWmVkDtn0nYEdKXJRAQ=
=fJQw
-----END PGP SIGNATURE-----

--GvpItN8tSslGWDOf--


--===============4921643419839670508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4921643419839670508==--

