Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4911E8536F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agfK/vxwMI/I0Pb2yAJcWYbQ8Nd6x5MjekeIeoFvm48=; b=LUbs2jhYkWWfrJWRegww9GaLB2
	Fxa4I0w+Ly8lr/6eMaZM8TPRPp78ZNi95Q50o7TuFJPFwxAFhug0GYj2cFfADH2OxcPhRKFTOTQEt
	YLlcK2HFkVl9jbp0C4lIUhKFMSFsnVMOqBW5C0skasKoCBe9lbiN8ZoKDYe69O4iT+M1hzFPgB2ZF
	skW/ZiozAN7U8hvO8P7DvfE0DktU2oUchYwR6HOhcPVcAev5xS3nbxqd8zn6cGGqe/1o1o/AkIkZ+
	ke3GPlEvNZe/zd4UDN3nPqorjA8VOD3ndpDblJDEywWlcf8/r1oged3x0AJrBzI9SorFjronsikFl
	NTGaRLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8f7t-000000027Af-2SoI;
	Fri, 03 Apr 2026 14:03:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8f7r-0000000279y-3T8u
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 14:03:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9617543CA9;
	Fri,  3 Apr 2026 14:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC9BC4CEF7;
	Fri,  3 Apr 2026 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775225034;
	bh=4RCGYKzKvjqw6dRyZ1WZ1cabXeFnkUPkqKqCAUHF/Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkUY/4mAIPXiVTcRvDpQiusVSAIqL5ZhjMjkbMe+epj/H9B7YUb2fdN3TBU0S3/nt
	 94M/L5pTBpiYQCtBQV4dVmecQti3kRCbmX0tIrHZ3nCDq3yyqGvPPNmAq5+aIrRq9S
	 hdr8BNSvBAS9HBeM1GXCV9i4ujgjM646YgHBktXfdb354iV+5JPSzGaCSlCOHA4pCV
	 vKaoPSJRVF6drMXBr+7p1CD9Zu15UmW/kuAX9s/g/zPed4VDCJOfjvXvksKSqL2cpm
	 25nFNUtxRkrXq5tr+4JNKmseqHc8f4oluvHSV5Kpr+qipPLPXrTSmYCQhckf2Sd3xv
	 g4hM2qdw47Vlw==
Date: Fri, 3 Apr 2026 15:03:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	JeeHeng Sia <jeeheng.sia@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 22/22] riscv: dts: starfive: jhb100: Add clocks and
 resets nodes
Message-ID: <20260403-composed-overvalue-f6bf1a1fc220@spud>
References: <20260402105523.447523-1-changhuang.liang@starfivetech.com>
 <20260402105523.447523-23-changhuang.liang@starfivetech.com>
 <20260402-fox-overhand-9a45ec670bce@spud>
 <ZQ4PR01MB12025313E4A491A86580558DF25E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB12025313E4A491A86580558DF25E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_070355_933939_718D40E9 
X-CRM114-Status: GOOD (  25.26  )
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
Content-Type: multipart/mixed; boundary="===============6332122367787928924=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6332122367787928924==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A6JRgh3YACkqS410"
Content-Disposition: inline


--A6JRgh3YACkqS410
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 01:07:48AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> > On Thu, Apr 02, 2026 at 03:55:23AM -0700, Changhuang Liang wrote:
> > > Add clocks and resets nodes for JHB100 RISC-V BMC SoC. They contain
> > > sys0crg/sys1crg/sys2crg/per0crg/per1crg/per2crg/per3crg.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  arch/riscv/boot/dts/starfive/jhb100.dtsi | 198
> > > ++++++++++++++++++++++-
> > >  1 file changed, 195 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi
> > > b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> > > index 4d03470f78ab..700d00f800bc 100644
> > > --- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> > > @@ -4,6 +4,8 @@
> > >   */
> > >
> > >  /dts-v1/;
> > > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > > +#include <dt-bindings/reset/starfive,jhb100-crg.h>
> > >
> > >  / {
> > >  	compatible =3D "starfive,jhb100";
> > > @@ -268,12 +270,96 @@ pmu {
> > >  			<0x00 0x22 0xFFFFFFFF 0xFFFFFF22 0x00007FF8>;	/* Event
> > ID 34 */
> > >  	};
> > >
> > > -	clk_uart: clk-uart {
> > > -		compatible =3D "fixed-clock"; /* Initial clock handler for UART */
> > > +	osc: osc {
> > > +		compatible =3D "fixed-clock";
> > >  		#clock-cells =3D <0>;
> > >  		clock-frequency =3D <25000000>;
> > >  	};
> >=20
> > Is this really on the SoC?
>=20
> This is not on the SoC.
>=20
> >=20
> > >
> > > +	pll0: pll0 {
> > > +		compatible =3D "fixed-clock";
> > > +		#clock-cells =3D <0>;
> > > +		clock-frequency =3D <2400000000>;
> > > +	};
> >=20
> > What's providing all of these PLLs? Are they all fixed-frequency on-chi=
p PLLs
> > without an off-chip reference? I find that somewhat unlikely.
> >=20
> > Since devicetrees are now being imported into U-Boot, it's important to=
 make
> > sure that I'm not merging fixed-clocks that later get replaced by dedic=
ated
> > drivers that U-Boot won't have.
> >=20
> > To that end, I won't apply the series this depends on without this patc=
h being
> > applied at the same time.
>=20
> I am preparing a PLL driver series, but PLL0 and PLL1 will still retain f=
ixed frequencies.=20
> The reference clock for each PLL comes from the osc. Perhaps I can use "f=
ixed-factor-clock"=20
> to indicate the relationship of the reference clock.

I'll reserve judgement until I see that series so, but it wasn't as if
any of this was going into 7.1 anyway (or maybe even 7.2) so not a
problem.

--A6JRgh3YACkqS410
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCac/IwAAKCRB4tDGHoIJi
0qWuAP45kSoUpbgjkvCJMmJeVgPQwqzykf0EcvPgM4HWcs0dDgEA8YZtZ6Vyulfg
x37EvusJc3nMGl8IOH7sy2iN3jGeUwg=
=LpLD
-----END PGP SIGNATURE-----

--A6JRgh3YACkqS410--


--===============6332122367787928924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6332122367787928924==--

