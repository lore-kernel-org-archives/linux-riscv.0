Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5962DC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxWqWufz7MKlkE1jsQionhra5Bx2WbogX5OX5rnImxQ=; b=oHYIC2MKr4UgIBmBxRqxfj87tR
	0fSDY8iBtcCATC+4VOxrH6w0KDwwVzeyNEXhMlUA9Lsy7QBLrOc4ewpM6XM5zFJV+VjeG0/D1Qcc5
	BIqj558QeR4SOOrGkquolfti2fN849GCnn4tTJ7LsWT5B4SIamCROWdyWqLjWJyg+QQ+MZzPZk6n9
	DbVvRu2WZt3w00fANr1oQI9xMMLecWh+olOEMCNc/+o0iNNadGx6GPQs2VaJAdM72atB83joh/wPe
	IEMNSqyoVT2w7a3ixo7bk2c0nkQda2fIOt+IS06VgSI7H+OM8Z/4UMK0S27PMZ0cOYO9DiaIINcXb
	j6f8xw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfSt-00H5I2-5h; Thu, 02 Feb 2023 19:41:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfSp-00H5H5-JP
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 19:41:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64FC6B827EA;
	Thu,  2 Feb 2023 19:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA33C433EF;
	Thu,  2 Feb 2023 19:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675366899;
	bh=ohgt3lIakhxU8+IrFeKBod3BbAPmwUvAG3g0QpjBq8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGtGiGbmAzt3PIQeZqE9ZEenv8aDaVxgrZFW7FGL5/DzLrR5kkuf1JVX8NiWZUxua
	 1G6dAK+CvGWq+b9uilq7le95hJfLcZn6AwEdJ6d8VDHpp2QoS5Doi762Os1UPxlloa
	 iqGxXiA7XLjYLRaY0KmgGIm+bXogRa4LgsDX3Dm4YdbVB2LiZ/BO6LIYvsfJkBfS77
	 +34VIFEJZstSv7UZigrDcNsRgMes1xI9sPhoJMsxeir6q8fhoNNX43xLqdaP/ECcvP
	 G7MfKHxzgVlLZ004PYBGrwzgfGXKFt9SaK7fprKyZ7upS7P+c12b1ArOHhIqpQ24Dz
	 1PlWuUQWmdFwQ==
Date: Thu, 2 Feb 2023 19:41:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Message-ID: <Y9wR7Up+iObw5qoE@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <Y6zHy9oL4xzl+6Rd@spud>
 <c507e0b2-5ca3-cffe-55d2-873ed8c24e3d@starfivetech.com>
 <Y9og8Q2UnJ452KH/@wendy>
 <df6755ed-a358-ea01-d89e-f3c004b9c297@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <df6755ed-a358-ea01-d89e-f3c004b9c297@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_114143_980564_80B69409 
X-CRM114-Status: GOOD (  51.35  )
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
Content-Type: multipart/mixed; boundary="===============7742971289666548402=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7742971289666548402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ds2DvVv+Wo+HxSlv"
Content-Disposition: inline


--ds2DvVv+Wo+HxSlv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 02:56:41AM +0800, Hal Feng wrote:
> On Wed, 1 Feb 2023 08:21:05 +0000, Conor Dooley wrote:
> > On Wed, Feb 01, 2023 at 03:21:48PM +0800, Hal Feng wrote:
> >> On Wed, 28 Dec 2022 22:48:43 +0000, Conor Dooley wrote:
> >> > On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:
> >=20
> >> >> +/ {
> >> >> +	compatible =3D "starfive,jh7110";
> >> >> +	#address-cells =3D <2>;
> >> >> +	#size-cells =3D <2>;
> >> >> +
> >> >> +	cpus {
> >> >> +		#address-cells =3D <1>;
> >> >> +		#size-cells =3D <0>;
> >> >> +
> >> >> +		S76_0: cpu@0 {
> >> >> +			compatible =3D "sifive,u74-mc", "riscv";
> >> >=20
> >> > The label here says S76 but the compatible says u74-mc.
> >>=20
> >> U74-MC has 5 cores including 1 * S7 core and 4 * U74 cores.
> >>=20
> >> > Which is correct? Your docs say S7 and S76, so I would imagine that =
it
> >> > is actually an S76?
> >>=20
> >> I found SiFive website [1] call it S76, but call it S7 in other places.
> >> So I misunderstood this. Considering the ISA difference you described
> >> as below, I think it's proper to change the label to "S7_0".
> >=20
> > I'm less worried about the label & more interested in the compatible.
> > hart0 is, as you say, not a u74. Should we not be adding a "sifive,s7"
> > compatible string to Documentation/devicetree/bindings/riscv/cpus.yaml
> > and using that here instead?
>=20
> First of all, it's my fault that I didn't check the revision of U74-MC
> manual, so most of my previous replies might not make sense.

No that's fine. The manual stuff confused me too when I went looking
initially, and I still get get mixed up by the fact that there are
core-complex manuals but not core manuals.

> If we add a new compatible string for S7, should we change the compatibles
> of hart1~3 to "sifive,u74" also? And then, there may be no point keeping =
some
> compatible strings of core complex like "sifive,u74-mc" and "sifive,u54-m=
c".
> I'm not sure about this.

[...]

> >> Yes, "RV64IMAC" is correct. The monitor core in U74-MC is a
> >> S7-series core, not S76.
> >=20
> > Cool, thanks.
>=20
> Now I think it might be another version of S76.

The SiFive docs describe the u74-mc core complex, which AFAIU you have,
as being 1x S7 & 4x U7.

I'd be happy with new binding for "sifive,s7" & then we use that here.
If you're sure it's S76, we can also use that. S76 is described, in what
docs I can see, as a core complex containing an S7, so S7 seems likely
to be correct?

u7, u74 & u74-mc are valid compatibles, added by SiFive, in commit
75e6d7248efc ("dt-bindings: riscv: Update DT binding docs to support
SiFive FU740 SoC"). Unfortunately, they never actually *used* those
compatibles for anything, and just used "sifive,bullet0" for the fu740.

I'll accept any of u7, u74 or u74-mc for those harts.

> >> >> +			tlb-split;
> >> >> +			status =3D "disabled";
> >> >> +
> >> >> +			cpu0_intc: interrupt-controller {
> >> >> +				compatible =3D "riscv,cpu-intc";
> >> >> +				interrupt-controller;
> >> >> +				#interrupt-cells =3D <1>;
> >> >> +			};
> >> >> +		};
> >> >> +
> >> >> +		U74_1: cpu@1 {
> >> >> +			compatible =3D "sifive,u74-mc", "riscv";
> >> >> +			reg =3D <1>;
> >> >> +			d-cache-block-size =3D <64>;
> >> >> +			d-cache-sets =3D <64>;
> >> >> +			d-cache-size =3D <32768>;
> >> >> +			d-tlb-sets =3D <1>;
> >> >> +			d-tlb-size =3D <40>;
> >> >> +			device_type =3D "cpu";
> >> >> +			i-cache-block-size =3D <64>;
> >> >> +			i-cache-sets =3D <64>;
> >> >> +			i-cache-size =3D <32768>;
> >> >> +			i-tlb-sets =3D <1>;
> >> >> +			i-tlb-size =3D <40>;
> >> >> +			mmu-type =3D "riscv,sv39";
> >> >> +			next-level-cache =3D <&ccache>;
> >> >> +			riscv,isa =3D "rv64imafdc";
> >> >=20
> >> > That also begs the question:
> >> > Do your u74s support RV64GBC, as the (current) SiFive documentation
> >> > suggests?
> >>=20
> >> Actually, U74 doesn't support the full B extension, and the SiFive doc=
 [1]
> >=20
> > Yeah, I knew asking that question that the "RV64GBC" in SiFive's online
> > documentation was using outdated terminology. Also, that is not the doc
> > for your core complex as far as I can tell. That is the document for
> > impid 0x0621_1222, whereas (IIRC) your core is 0x0421_0427.
> > Jess and I had a look one evening but could not find the 21G1.02.00
> > revision of this document, which is the one corresponding to 0x421_0427.
> > See Table 92 for more details.
>=20
> I found the 21G1.02.00 revision on StarFive internal net, but I'm not sure
> whether I can make it public and I am checking this.

Yeah, certainly don't do anything without cross-checking!

> This revision records
> that the ISA of 21G1.02.00 U74 is "RV64GCB" and ISA of 21G1.02.00 S7 is
> "RV64IMACB". I am asking someone to check with SiFive whether both 21G1.0=
2.00
> U74 and S7 support the full B extension.

Having cross-checked a 21G1.01.00 document against a 21G2.01.00 one, I'm
99% sure that you have _Zba_Zbb.
The G2.01 document says _Zba_Zbb & has the same instructions listed as
supported as the G1.02 one.
I've also tried the Zbb support patches posted by Heiko [2] on a
VisionFive V2 and had them work - which is why a definitive statement on
the version of Zbb supported would be really great to have!

[2] - https://lore.kernel.org/linux-riscv/20230113212301.3534711-1-heiko@sn=
tech.de/

> >> describes the ISA of U74 is "RV64GC_Zba_Zbb_Sscofpmf" which "G" includ=
es
> >> "IMAFD".
> >=20
> > I could not find the 21G1.02.00 version of this document online, but I
> > was able to find the 21G1.01.00 version of it & that version does not
> > support the Sscofpmf extension (but does have Zba/Zbb support).
> >=20
> >> "_Zba_Zbb_Sscofpmf" is not shown in other device trees such as
> >> jh7100.dtsi and fu740-c000.dtsi, so I didn't show them here.
> >=20
> > Just because other devicetrees omit them, doesn't mean that you should
> > too!
> > This compatible should be an accurate description of your hardware, so
> > you should add what you actually have.
>=20
> Will keep it in mind. Thank you.

FWIW, the deadline for getting material in for v6.3 has already passed,
so you can send the next version of this series without waiting for
clarification on the compatibles & ISA string. We should have plenty of
time to get those fixed up before the series gets applied.

Thanks,
Conor.

> > If you have Zba and Zbb, then add them.
> > I would double check against your internal documentation for 21G2.02.00
> > as to whether you do have Sscofpmf, and if you do, add that too!
> >=20
> > That way, whenever support for those extensions lands, the jh7110 will
> > automatically pick it up, rather than needing to have them retrofitted.
> >=20
> >> [1] https://sifive.cdn.prismic.io/sifive/2dd11994-693c-4360-8aea-5453d=
8642c42_u74mc_core_complex_manual_21G3.pdf

--ds2DvVv+Wo+HxSlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9wR7QAKCRB4tDGHoIJi
0o8CAP40o9+u4KY0EeAaTpMPdJI5Q/P7+3Baxjpu5lDe3dcQ0QEA91reS5VWDnuT
nrd0jpGuwMXYdoMwKiPD7+jz3kmjTgI=
=LWU1
-----END PGP SIGNATURE-----

--ds2DvVv+Wo+HxSlv--


--===============7742971289666548402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7742971289666548402==--

