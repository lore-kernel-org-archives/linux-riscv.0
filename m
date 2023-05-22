Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B3C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w46V7t10XWICE70p2GY94sdlPzhL58BTOPeM5lVDb1Y=; b=TzZZRj8jhDIzXZ3staCNwsKVOJ
	LNra50jZZLNBtaqYuKIH/kFzfDQKAcSVwNSW1a8a40ezb7Z/zgqi21VA0147BFB92tJut4l0Pbqrr
	+DKY3QgwGXcMtQ74FLXvw28hLblDPRjthNspSEN1wgR95vzFIqg3TAv4tUtkf57Gr7Mc0PKkY8W0D
	jUEdL9SBvNKRXChHIWej1+Lmb/SWNPi7i5QPyNo2eogpkC3xvGzw1zm9cURVk3VcP/685fJ52oYQ4
	s1rF7+dk/bnCF/1L3VHpC5p9gmvZ4mhczn914X6coqLsr5u+x4VfcEd9NKbKK2epdFz8DpFCjQpJN
	OGnXSqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zg4-005bL8-1m;
	Mon, 22 May 2023 07:09:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zfz-005bJV-3A
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 07:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684739391; x=1716275391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MrJJoLd9Vm8H+TbQSUZkBsj9vMTQ88kC/Vf4zZfIBbE=;
  b=oL3OA0x4/7f0d5W7TYstpugeijGMZisBM3PSm9/TBApQpshiRf953g4J
   OocKqHXrcphAeEdrWGLPO0uJvVnFqHHTwUQ5BKligxKf6DXC73TNjMPGN
   p6DOoqeEBGd38YhGX7dmuaG/eqCfqvqSTxnB+CxqbHXtX9Yl+A1nvM4Ei
   m1r5hmXqhEcrG9izpAZsZL2sATmft760lyJaHDmuRTE7eOBCxAAMaEAaz
   w28In93EnGE9e8STkD666DLhKF7D3rMr9RsKSvudpruZW6yR6O6qvQaKV
   RsBWnrsaWkIZWy2mPF6bJPUFltgSEUEet1XuZzLWngXW39GWEaMGyuoIc
   w==;
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="asc'?scan'208";a="216588871"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 00:09:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 00:09:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 00:09:39 -0700
Date: Mon, 22 May 2023 08:09:17 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v2 4/9] dt-binding: riscv: add T-HEAD CPU reset
Message-ID: <20230522-motto-seducing-f0fa34f31c18@wendy>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-5-jszhang@kernel.org>
 <20230518-driving-secluding-793b3192776e@spud>
 <CAJF2gTTGgLJ3SNcmhRGpAAw7jhOfYA5j=G9ZibwA8wUmeQN3UQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTGgLJ3SNcmhRGpAAw7jhOfYA5j=G9ZibwA8wUmeQN3UQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_000952_257235_129E986C 
X-CRM114-Status: GOOD (  38.96  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============4497533978030812060=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4497533978030812060==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="auhsdGmR45e7vSPO"
Content-Disposition: inline

--auhsdGmR45e7vSPO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, May 22, 2023 at 10:16:19AM +0800, Guo Ren wrote:
> On Fri, May 19, 2023 at 3:53=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> > On Fri, May 19, 2023 at 02:45:36AM +0800, Jisheng Zhang wrote:
> > > The secondary CPUs in T-HEAD SMP capable platforms need some special
> > > handling. The first one is to write the warm reset entry to entry
> > > register. The second one is write a SoC specific control value to
> > > a SoC specific control reg. The last one is to clone some CSRs for
> > > secondary CPUs to ensure these CSRs' values are the same as the
> > > main boot CPU. This DT node is mainly used by opensbi firmware.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  .../bindings/riscv/thead,cpu-reset.yaml       | 69 +++++++++++++++++=
++
> > >  1 file changed, 69 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/thead,cpu=
-reset.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/thead,cpu-reset.=
yaml b/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
> > > new file mode 100644
> > > index 000000000000..ba8c87583b6b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
> > > @@ -0,0 +1,69 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/riscv/thead,cpu-reset.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: T-HEAD cpu reset controller
> > > +
> > > +maintainers:
> > > +  - Jisheng Zhang <jszhang@kernel.org>
> > > +
> > > +description: |
> > > +  The secondary CPUs in T-HEAD SMP capable platforms need some speci=
al
> > > +  handling. The first one is to write the warm reset entry to entry
> > > +  register. The second one is write a SoC specific control value to
> > > +  a SoC specific control reg. The last one is to clone some CSRs for
> > > +  secondary CPUs to ensure these CSRs' values are the same as the
> > > +  main boot CPU.

> > > +
> > > +  compatible:
> > > +    oneOf:
> > > +      - description: CPU reset on T-HEAD TH1520 SoC
> > > +        items:
> > > +          - const: thead,reset-th1520
> >
> > You've only got one thing here, you don't need the oneOf.
> > Also, s/reset-th1520/th1520-reset/ please - although I do not know if
> > "reset" is the right word here. Do we know what the IP block is called
> > in the TRM/T-Head docs? Perhaps Guo Ren does if not.
> It's called CPU reset controller; every core has reset_ctrl &
> reset_entry signals; Soc just gathers them into some regs.
> For th1520, we have 4 reset_entries registers and 1 reset_ctrl
> register. Fu Wei would give out more details about it.

Okay, thanks. Sounds like this SoC will have multiple reset controllers
then, since there is likely one for the peripherals too?
thead,th1520-cpu-reset seems like a good idea to me?

> > > +  entry-reg:
> > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > +    description: |
> > > +      The entry reg address.
> > > +
> > > +  entry-cn
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      The entry reg count.
> > > +
> > > +  control-reg:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> It should be uint64.
>=20
> > > +    description: |
> > > +      The control reg address.
> > > +
> > > +  control-val:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      The value to be set into the control reg.
> > > +
> > > +  csr-copy:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    description: |
> > > +      The CSR registers to be cloned during CPU warm reset.
> >
> > All of these values set on a per-soc basis, right?
> Yes
> > If so, I don't think they should be in here at all since you should be
> > able to figure out the offsets from the base & the values to write based
> > on the compatible string alone, no?
> The driver works with all T-HEAD CPUs, not only for th1520. Some
> vendors may have their own custom CSRs, so the csr-copy feature is
> flexible enough to adjust in dts. As far as I can tell, hardware teams
> typically prefer to focus on the firmware binary rather than setting
> up the software compiling environment.

In this case "firmware" means opensbi, since that's where Jisheng
mentioned in their cover that they intended using this.

> > Putting register values into the DT is always "suspect"!
> It's not register values, it's register offset/ CSR number.

So "control-val" is not a value? "The value to be set into the control
reg" makes it sound oddly like one!!

My point I guess is that this entry could be written like

reset-controller@ffff019050 {
  compatible =3D "thead,th1520-cpu-reset";
  reg =3D <0xff 0xff019050 0xfoo 0xbar>, <0xff 0xff015004 0xfoo 0xbar>;
};

or even:

reset-controller@ffff019050 {
  compatible =3D "thead,th1520-cpu-reset";
  reg =3D <0xff 0xff019050 0xfoo 0xbar>, <0xff 0xff015004 0xfoo 0xbar>;
  reg-names =3D "entry", "control";
};

And csr-copy, entry-cn and control-val can be derived from the
compatible string given you've said they are set on a per-soc basis.

> > > +required:
> > > +  - compatible
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    cpurst: cpurst@ffff019050 {
> >                ^^^^^^^^^^^^^^^^^
> > This is also "suspect" and implies that "entry reg" should just be a
> > normal "reg" property.
> Yes, but we needn't reg, here. It should be:
>=20
> cpurst {

I don't think it should! Firstly, "cpurst" is not a generic node name,
but I also don't agree that "control-reg" and "entry-reg" should not
just be 2 reg entries.

Cheers,
Conor.

--auhsdGmR45e7vSPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGsVGgAKCRB4tDGHoIJi
0q6mAQDAVZJoUwwAGAtGG8hTwg9oX0NehK7eByB3ZQOeueZBOgD+K6nRAFCBVj5T
fvcrb/ObJzX52usOSnrbCxbC/brSmwc=
=MzD5
-----END PGP SIGNATURE-----

--auhsdGmR45e7vSPO--


--===============4497533978030812060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4497533978030812060==--

