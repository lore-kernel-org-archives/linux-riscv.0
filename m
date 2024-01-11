Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970F9C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KN2tjKA1q1vaplejxf6ZPxjTq2Oso8s7j2t1arALruI=; b=s+G7NDgbZ/n00YSVoszeUGenUY
	mAc9LfyjErMbcD9GNC5Bq8XP7HQ64JPTugDWWTo1ExNtNZIqho7DPIqtJbRN+denKe63cVYC5nnCx
	IeGq2stTfiDvhLh3/9kh6DysYSzez6nZm0LPbRAr/cZH2Fl/Y9sqK4MDEZqW3IQYK4d6MwTlNGqof
	zY4wwY1eNZjMk0+syXrN4p3eEs5hNMPC/oXPt2QdT7FOWMdRMlQon4CPqofj/7z/MaF0lgXJ7T/xi
	8SmhZXHoOf7JYTbhgBxXVeA80WAqDTKbYL5x0xWGIflyTfrZ4UA6cUU/z6fSqX4WCKAey8dDLc9No
	wJ7y9Naw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNyOY-000flc-2C;
	Thu, 11 Jan 2024 16:59:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNyOV-000fkw-0F
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 16:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66DB461B91;
	Thu, 11 Jan 2024 16:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0496C43390;
	Thu, 11 Jan 2024 16:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704992341;
	bh=eQSxTNQ2W6/VSJpR484BvIKV22Pqxjk+fAuWCYj2jVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lofzQF1tFyOByroeV3UFo1pfjRktuNwSFvxUlJG99QgodmAbjE6YjsCXNXQMTlj8B
	 RTtDuLpe9nUVY//QwipfkpRBMHeWmhJWLcQrAatkrGL7Ne3qIh3gmnnb099PCYU43w
	 cAgH+fMxSMnJqfjQLndi//cvUBImJawPX3QIiUVi0Ct4pyinKKtPHjFBFdGtNdPvfV
	 NS2ApwBN75TaTaXR8dEPspuLpEIqIQCZF13B3byqlhiUhcPedv1gtReJFP7+k1Kcny
	 LwgdCKPLFbcfzZlee3vX0vMGq9bAyVwqreQFTuOoSoVMxwDVAo7c8/SHl8XZoFBq6x
	 Vtkh9EHzFYi/Q==
Date: Thu, 11 Jan 2024 16:58:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, richardcochran@gmail.com,
	robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
	inochiama@outlook.com, samuel.holland@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: clock: sophgo: support SG2042
Message-ID: <20240111-jolly-prize-930931cc648a@spud>
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <925d99d5b4ece01337cb3389aaea4b631894dd1d.1704694903.git.unicorn_wang@outlook.com>
 <f88b79c3-e44b-4136-ae56-10e1f2502e2d@linaro.org>
 <MA0P287MB2822C7A3C1DC7786708E860BFE692@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240110-untoasted-underfed-fe81479506f6@spud>
 <MA0P287MB282224A6097B4FCCF721C89AFE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB282224A6097B4FCCF721C89AFE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_085903_227915_BCF1EE0C 
X-CRM114-Status: GOOD (  50.46  )
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
Content-Type: multipart/mixed; boundary="===============1473671041044617481=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1473671041044617481==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HoCpbscajEdid/h2"
Content-Disposition: inline


--HoCpbscajEdid/h2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 04:00:04PM +0800, Chen Wang wrote:
> Resent and fixed some format issue in last email.
>=20
> On 2024/1/10 22:42, Conor Dooley wrote:
> > Hey,
> >=20
> > On Wed, Jan 10, 2024 at 08:53:42AM +0800, Chen Wang wrote:
> > > On 2024/1/8 15:04, Krzysztof Kozlowski wrote:
> > > > On 08/01/2024 07:49, Chen Wang wrote:
> > > > > From: Chen Wang <unicorn_wang@outlook.com>
> > > > >=20
> > > > > Add bindings for the clock generator on the SG2042 RISC-V SoC.
> > > > >=20
> > > > > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > ---
> > > > >    .../bindings/clock/sophgo,sg2042-clkgen.yaml  |  53 ++++++
> > > > >    .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 169 ++++++++++=
++++++++
> > > > >    2 files changed, 222 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/clock/sop=
hgo,sg2042-clkgen.yaml
> > > > >    create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clk=
gen.h
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg204=
2-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkge=
n.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..f9935e66fc95
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkge=
n.yaml
> > > > > @@ -0,0 +1,53 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/clock/sophgo,sg2042-clkgen.ya=
ml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Sophgo SG2042 Clock Generator
> > > > > +
> > > > > +maintainers:
> > > > > +  - Chen Wang <unicorn_wang@outlook.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: sophgo,sg2042-clkgen
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  sophgo,system-ctrl:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +    description:
> > > > > +      Phandle to SG2042 System Controller node. On SG2042, part =
of control
> > > > > +      registers of Clock Controller are defined in System contro=
ller. Clock
> > > > > +      driver will use this phandle to get the register map base =
to plus the
> > > > > +      offset of the registers to access them.
> > > > Do not describe the driver, but hardware. What registers are in
> > > > system-ctrl? What are their purpose? Why this hardware needs them?
> > > Understood, will fix the words in revision, thanks.
> > I hope that I am not misunderstanding things, but I got a bit suspicious
> > of this binding and look at the driver, and saw that there are clocks
> > registered like:
> >=20
> > | static int sg2042_clk_register_gates(struct sg2042_clk_data *clk_data,
> > | 				     const struct sg2042_gate_clock gate_clks[],
> > | 				     int num_gate_clks)
> > | {
> > | 	struct clk_hw *hw;
> > | 	const struct sg2042_gate_clock *gate;
> > | 	int i, ret =3D 0;
> > | 	void __iomem *reg;
> > |
> > | 	for (i =3D 0; i < num_gate_clks; i++) {
> > | 		gate =3D &gate_clks[i];
> > | 		if (gate->flag_sysctrl)
> > | 			reg =3D clk_data->iobase_syscon + gate->offset_enable;
> > | 		else
> > | 			reg =3D clk_data->iobase + gate->offset_enable;
> >=20
> > iobase_syscon is the base address of the system controller that this
> > property points at & iobase is the base address of the clock controller
> > itself.
> >=20
> > | 		hw =3D clk_hw_register_gate(NULL,
> > | 					  gate->name,
> > | 					  gate->parent_name,
> > | 					  gate->flags,
> > | 					  reg,
> > | 					  gate->bit_idx,
> > | 					  0,
> > | 					  &sg2042_clk_lock);
> >=20
> > As far as I can tell, in this particular case, for any gate clock that
> > flag_sysctrl is set, none of the registers actually lie inside the
> > clkgen region, but instead are entirely contained in the sysctrl region.
> >=20
> > I think that this is because your devicetree does not correctly define
> > the relationship between clocks, and these clocks are actually provided
> > by the system controller block and are inputs to the clkgen block.
> >=20
> > | 		if (IS_ERR(hw)) {
> > | 			pr_err("failed to register clock %s\n", gate->name);
> > | 			ret =3D PTR_ERR(hw);
> > | 			break;
> > | 		}
> > |
> > | 		clk_data->onecell_data.hws[gate->id] =3D hw;
> > | 	}
> > |
> > | 	/* leave unregister to outside if failed */
> > | 	return ret;
> > | }
> >=20
> > I had a much briefer look at the `sg2042_pll_clock`s that make use of
> > the regmap, and it doesn't seem like they "mix and match" registers
> > between both blocks, and instead only have registers in the system
> > controller? If so, it doesn't seem like this clkgen block should be
> > providing the PLL clocks either, but instead be taking them as inputs.
> >=20
> > Reading stuff like
> > https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/system=
-control.rst#pll_stat-offset-0x0c0
> > (and onwards) makes it seem like those PLLs are fully contained within
> > the system controller register space.
> >=20
> > It seems like
> > https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/clock-=
reg.rst
> > is the register map for the clkgen region? It seems like that region
> > only contains gates and divider clocks, but no PLLs.
> >=20
> > Am I missing something, or is this description of the clock controllers
> > on the soc incomplete?
> hi=EF=BC=8CConor=EF=BC=8C
>=20
> There are four types of clocks for SG2042 and following are where their
> control registers are defined in:
>=20
> PLL=EF=BC=9Aall in SYS_CTRL
> DIV: all in CLOCK
> GATE: some are in SYS_CTRL, some others are in CLOCK

When you say "some", do you meant some entire clocks are in SYS_CTRL and
some entire clocks are in the CLOCKS? Or do you meant that for a given
clock, some registers are in SYS_CTRL and some are in CLOCK? It's the
first option, right?

> MUX: all in CLOCK
>=20
> For PLLs, yes, they are all controlled by registers defined in SYS_CTRL.
> About what you said "it doesn't seem like this clkgen block should be
> providing the PLL clocks either, but instead be taking them as inputs.", I
> am not very sure what your meaning of "inputs". I try to write DTS with my
> undrstadning, please help me see if it fits what you mean.
>=20
> ```dts
>=20
> sys_ctrl: system-controller@7030010000 {
> =C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,sg2042-sysctrl";
> =C2=A0=C2=A0=C2=A0 reg =3D <0x70 0x30010000 0x0 0x1000>;
>=20
> =C2=A0=C2=A0=C2=A0 pllclk: clock-controller {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,sg2042-=
pll";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #clock-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&cgi>;
> =C2=A0=C2=A0=C2=A0 };
> };
>=20
> clkgen: clock-controller@7030012000 {
> =C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,sg2042-clkgen";
> =C2=A0=C2=A0=C2=A0 reg =3D <0x70 0x30012000 0x0 0x1000>;
> =C2=A0=C2=A0=C2=A0 #clock-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0 clocks =3D <&pllclk MPLL_CLK>,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&pllclk FPLL_CLK>,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&pllclk DPLL0_CLK>,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&pllclk DPLL1_CLK>;
> =C2=A0=C2=A0=C2=A0 clock-names =3D "cgi", "mpll", "fpll", "dpll0", "dpll1=
";
> };
>=20
> ```
>=20
> With this change, we describe the plls defined in system control as pllcl=
k,
> as a child node of system controller. clkgen will use pllclk as "input"
> because pll clocks are parent of div clocks .
>=20
> But there is another remaining question about the gate clock. For those g=
ate
> clocks controlled by CLOCK, no problem we will provide then in clkgen, bu=
t=C2=A0
> for those gate clocks controlled by registers in SYS_CTRL, they are child
> gate of the "clk_gate_rp_cpu_normal", which is a gate clock provided by
> clkgen. If I extracted those SYS_CTRL gate clocks and define them in syst=
em
> controller dts node, I may have to use "clk_gate_rp_cpu_normal" as their
> input, it looks a bit wierd becasue there are cases where each other serv=
es
> as input. I try to draft below DTS to explan what I meant. I'm not sure if
> it can work and I'd love to hear your guidance.

I'm not sure how this sort of circular relationship works for probing
works either. Stephen etc would know more than me here.

> ```dts
>=20
> sys_ctrl: system-controller@7030010000 {
> =C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,sg2042-sysctrl";
> =C2=A0=C2=A0=C2=A0 reg =3D <0x70 0x30010000 0x0 0x1000>;
>=20
> =C2=A0=C2=A0=C2=A0 pllclk: clock-controller {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,sg2042-=
pll";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #clock-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&cgi>;
> =C2=A0=C2=A0=C2=A0 };
>=20
> =C2=A0=C2=A0=C2=A0 somegateclk: clock-controller2 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,sg2042-=
somegate";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #clock-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&clkgen GATE_CLK_R=
P_CPU_NORMAL>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D "clk_gate_rp_c=
pu_normal";
> =C2=A0=C2=A0=C2=A0 };
> };
>=20
> clkgen: clock-controller@7030012000 {
> =C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,sg2042-clkgen";
> =C2=A0=C2=A0=C2=A0 reg =3D <0x70 0x30012000 0x0 0x1000>;
> =C2=A0=C2=A0=C2=A0 #clock-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0 clocks =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&pllclk MPLL=
_CLK>,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
<&pllclk FPLL_CLK>,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
<&pllclk DPLL0_CLK>,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
<&pllclk DPLL1_CLK>,;
> =C2=A0=C2=A0=C2=A0 clock-names =3D "cgi", "mpll", "fpll", "dpll0", "dpll1=
";
> };
>=20
> ```
>=20
> So, can we put all gate clocks in clkgen to simplify this?

The dts should describe how the hardware actually looks, even if that is
not really convenient for the operating system.

--HoCpbscajEdid/h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaAeTgAKCRB4tDGHoIJi
0tgqAP0ScdtTWzpHMsPW0GSOiD8togIuF7H6CxTQPP3tRaZimwD/TzPIHicxvc/i
gBIQ3MCPICx8OuWHBTiGJF59nOfiLgE=
=JrSY
-----END PGP SIGNATURE-----

--HoCpbscajEdid/h2--


--===============1473671041044617481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1473671041044617481==--

