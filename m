Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0840AC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgO2Dr2XSohh55SRAb7JIbXk3wIEO/A3XAXL5o2AHw0=; b=b7UDxU5o9px2vwLsir77aHIGoM
	vvdixiAfAOMCkMGdYrxZgj2SXP9r4iVCwhpn3W1HOhvvkZCwC8wpWD3TYHRCUVGe+RwyHNu3c5SGW
	Vh6C0xzrc3SYpQxwI6/5tfx+oj0JKb1wotBwENv/NfRNVC4/XkhQEQ21S7dJ+wOuaQKOiMXX2Tcmc
	1t2nJ9fQdgoSjEX99emYSFcaH4HTzBcusxo2Cjyaf65nWGc4AJBQZo4cho/DCRrUlDWDU5e5AMmyC
	5rlCsLL5PyrsYoMtr0N3YpAf/1lZjQ1CpeVUZKuVlPgbLDNhI7bBud5nPzNjbB5j6BoOc/X8q1rL6
	WgfQKjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8NK-00AmHI-B9; Wed, 01 Feb 2023 08:21:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8NF-00AmFp-Bf
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 08:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675239705; x=1706775705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+++3AKOus/O6vcVxXKNRBP6OduqJ+gE9kdM+3NcAes=;
  b=1MJzqV5UKDK4WWmJSGbG8LyZLtjBtIRRsTXsGde6KMH1p59siH88Aq5T
   9hKYSZAe9KZNPBPZNwZP/MDDE467DXmOyxBdcPCNW3v2aw6Z/C0SQdGVE
   LaVC9kKYE51C6bYSHipN221O9mJh3yE6rZMVAF39BOwKQX2bWLpLf4PQ6
   ggtXYmCShxAKgQPj602IdElBO05QuYw9gYYjVWrugw1zqjjOpx8L4/ei7
   uqDsuXQgW8Yhh25Bhx9Yd+hrLVk351xqEbFM0EDHxVUW00UZ8cwOmrbVa
   J2Co5GtbPorGls7xNdyqimGKwV/q4eVM+xhczHxn/lEyZDWvSce2fFGR+
   A==;
X-IronPort-AV: E=Sophos;i="5.97,263,1669100400"; 
   d="asc'?scan'208";a="194824865"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Feb 2023 01:21:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 01:21:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 1 Feb 2023 01:21:29 -0700
Date: Wed, 1 Feb 2023 08:21:05 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Message-ID: <Y9og8Q2UnJ452KH/@wendy>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <Y6zHy9oL4xzl+6Rd@spud>
 <c507e0b2-5ca3-cffe-55d2-873ed8c24e3d@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <c507e0b2-5ca3-cffe-55d2-873ed8c24e3d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_002145_512189_3F1FDB4E 
X-CRM114-Status: GOOD (  31.77  )
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
Content-Type: multipart/mixed; boundary="===============8398746938008956039=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8398746938008956039==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KPhFTYruXrbnFQ+t"
Content-Disposition: inline

--KPhFTYruXrbnFQ+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2023 at 03:21:48PM +0800, Hal Feng wrote:
> On Wed, 28 Dec 2022 22:48:43 +0000, Conor Dooley wrote:
> > On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:

> >> +/ {
> >> +	compatible =3D "starfive,jh7110";
> >> +	#address-cells =3D <2>;
> >> +	#size-cells =3D <2>;
> >> +
> >> +	cpus {
> >> +		#address-cells =3D <1>;
> >> +		#size-cells =3D <0>;
> >> +
> >> +		S76_0: cpu@0 {
> >> +			compatible =3D "sifive,u74-mc", "riscv";
> >=20
> > The label here says S76 but the compatible says u74-mc.
>=20
> U74-MC has 5 cores including 1 * S7 core and 4 * U74 cores.
>=20
> > Which is correct? Your docs say S7 and S76, so I would imagine that it
> > is actually an S76?
>=20
> I found SiFive website [1] call it S76, but call it S7 in other places.
> So I misunderstood this. Considering the ISA difference you described
> as below, I think it's proper to change the label to "S7_0".

I'm less worried about the label & more interested in the compatible.
hart0 is, as you say, not a u74. Should we not be adding a "sifive,s7"
compatible string to Documentation/devicetree/bindings/riscv/cpus.yaml
and using that here instead?

>=20
> [1] https://www.sifive.com/cores/essential
>=20
> >=20
> >> +			reg =3D <0>;
> >> +			d-cache-block-size =3D <64>;
> >> +			d-cache-sets =3D <64>;
> >> +			d-cache-size =3D <8192>;
> >> +			d-tlb-sets =3D <1>;
> >> +			d-tlb-size =3D <40>;
> >> +			device_type =3D "cpu";
> >> +			i-cache-block-size =3D <64>;
> >> +			i-cache-sets =3D <64>;
> >> +			i-cache-size =3D <16384>;
> >> +			i-tlb-sets =3D <1>;
> >> +			i-tlb-size =3D <40>;
> >> +			mmu-type =3D "riscv,sv39";
> >> +			next-level-cache =3D <&ccache>;
> >> +			riscv,isa =3D "rv64imac";
> >=20
> > While I was poking around trying to see if there was some logic behind
> > that compatible, I noticed that SiFive's docs for the S76 say it is
> > RV64GBC *but* the docs for the u74-mc say "4xRV64GBC and 1xRV64IMAC".
> > I assume that rv64imac is the correct one here?
>=20
> Yes, "RV64IMAC" is correct. The monitor core in U74-MC is a
> S7-series core, not S76.

Cool, thanks.

> >> +			tlb-split;
> >> +			status =3D "disabled";
> >> +
> >> +			cpu0_intc: interrupt-controller {
> >> +				compatible =3D "riscv,cpu-intc";
> >> +				interrupt-controller;
> >> +				#interrupt-cells =3D <1>;
> >> +			};
> >> +		};
> >> +
> >> +		U74_1: cpu@1 {
> >> +			compatible =3D "sifive,u74-mc", "riscv";
> >> +			reg =3D <1>;
> >> +			d-cache-block-size =3D <64>;
> >> +			d-cache-sets =3D <64>;
> >> +			d-cache-size =3D <32768>;
> >> +			d-tlb-sets =3D <1>;
> >> +			d-tlb-size =3D <40>;
> >> +			device_type =3D "cpu";
> >> +			i-cache-block-size =3D <64>;
> >> +			i-cache-sets =3D <64>;
> >> +			i-cache-size =3D <32768>;
> >> +			i-tlb-sets =3D <1>;
> >> +			i-tlb-size =3D <40>;
> >> +			mmu-type =3D "riscv,sv39";
> >> +			next-level-cache =3D <&ccache>;
> >> +			riscv,isa =3D "rv64imafdc";
> >=20
> > That also begs the question:
> > Do your u74s support RV64GBC, as the (current) SiFive documentation
> > suggests?
>=20
> Actually, U74 doesn't support the full B extension, and the SiFive doc [1]

Yeah, I knew asking that question that the "RV64GBC" in SiFive's online
documentation was using outdated terminology. Also, that is not the doc
for your core complex as far as I can tell. That is the document for
impid 0x0621_1222, whereas (IIRC) your core is 0x0421_0427.
Jess and I had a look one evening but could not find the 21G1.02.00
revision of this document, which is the one corresponding to 0x421_0427.
See Table 92 for more details.

> describes the ISA of U74 is "RV64GC_Zba_Zbb_Sscofpmf" which "G" includes
> "IMAFD".

I could not find the 21G1.02.00 version of this document online, but I
was able to find the 21G1.01.00 version of it & that version does not
support the Sscofpmf extension (but does have Zba/Zbb support).

> "_Zba_Zbb_Sscofpmf" is not shown in other device trees such as
> jh7100.dtsi and fu740-c000.dtsi, so I didn't show them here.

Just because other devicetrees omit them, doesn't mean that you should
too!
This compatible should be an accurate description of your hardware, so
you should add what you actually have.
If you have Zba and Zbb, then add them.
I would double check against your internal documentation for 21G2.02.00
as to whether you do have Sscofpmf, and if you do, add that too!

That way, whenever support for those extensions lands, the jh7110 will
automatically pick it up, rather than needing to have them retrofitted.

> [1] https://sifive.cdn.prismic.io/sifive/2dd11994-693c-4360-8aea-5453d864=
2c42_u74mc_core_complex_manual_21G3.pdf

Thanks,
Conor.


--KPhFTYruXrbnFQ+t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9og4QAKCRB4tDGHoIJi
0tOrAQDxy2YUtDmZP0uGY2G7VVQmxY/H7/RCvN6XsiK5Abxk4QEA0VibqsVrabQ+
Is0+JZUVcS7gshDUpJ+imNRbOCIk0A0=
=xcFQ
-----END PGP SIGNATURE-----

--KPhFTYruXrbnFQ+t--


--===============8398746938008956039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8398746938008956039==--

