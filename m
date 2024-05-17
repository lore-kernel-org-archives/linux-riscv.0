Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6FCC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtAMCXzvzDkGwwmJS/ijKwDYUQG+llFsa3Gnao4Q6cQ=; b=UVLHN6rr7/a2bdOTYJLVgygJCj
	aJrenK9qjn0GMFONr49E4wVtWMUqKv3LtlPmKJhZNTUI8VmmlhG4e1KY09vRdQSb/Qo9JSsXWanas
	1hAL9QHY9dKgfek2wjFJxen/gBMi1iNORpSufSta/TDb9sfTLT1fZnVqvcOcTWMbB7r3F1uKM+INl
	cD32NBkU5aZ0McP/UMwh0v/cjiOeuq50BUIEdahWWVW52TLHWP6U66XkUt8BOB6JUyHxfNYxcuGlS
	N64hR1GIT0TXyyqsPCaj0quX4LSX4/Umy7xaXXEebWbhHhNiPcj7o53iOMxCv8reB2sQ5Fbwm0c51
	d3A6kL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s804p-00000008Ki6-2PMn;
	Fri, 17 May 2024 16:04:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s804k-00000008Kf8-1Mrz
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 16:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3434CCE1B26;
	Fri, 17 May 2024 16:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6D7C2BD10;
	Fri, 17 May 2024 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715961886;
	bh=PRGn5yS45nGwi27XM7eShxf8tGp3/cS4hWoTWqSmaxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IENZa+YtYz5FtNibpC769+vO2zenR/BKAsTUwCq1ZDRQ4YVls6Lhkrc9AlyXvuD7r
	 N+2i06r7DAoq01usdyD4Jp+ssY57DuOqq7FaitmWbPT0F2nQVx1xeqbL882SLjjh8H
	 WXRoCXuknegPjBcynLkm0yGQkC9QOP71xbsNeW4qGJqSbYTyCD7aZCai8vSZhgObMw
	 pHqIceuuITdDGyxMeb6CG1RwDy5QUtfk0kDpxs91fhQqqs0rcDHz44zLLA68gExs6o
	 LyY4DWcLks+e/CXuyX5er//2Gbrgp+VQJtxExClGsV1PUP2MomjTFnscGv1b/K9C2K
	 6Fz6luBwpNrnA==
Date: Fri, 17 May 2024 17:04:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: riscv,cpu-intc:
 convert to dtschema
Message-ID: <20240517-disfigure-disperser-1fa6b36729ec@spud>
References: <20240517150741.181303-1-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <20240517150741.181303-1-kanakshilledar111@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_090456_303108_23915F0A 
X-CRM114-Status: GOOD (  34.84  )
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
Content-Type: multipart/mixed; boundary="===============6755271498927793759=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6755271498927793759==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="21BkFEkE1h7lw5HM"
Content-Disposition: inline


--21BkFEkE1h7lw5HM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Fri, May 17, 2024 at 08:37:40PM +0530, Kanak Shilledar wrote:
> Convert the RISC-V Hart-Level Interrupt Controller (HLIC) to newer
> DT schema, Created DT schema based on the .txt file which had
> `compatible`, `#interrupt-cells` and `interrupt-controller` as
> required properties.
> Changes made with respect to original file:
> - Changed the example to just use interrupt-controller instead of
> using the whole cpu block
> - Changed the example compatible string.
>=20
> Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
> ---
>  .../interrupt-controller/riscv,cpu-intc.txt   | 52 -----------------
>  .../interrupt-controller/riscv,cpu-intc.yaml  | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,cpu-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,cpu-intc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/risc=
v,cpu-intc.txt
> deleted file mode 100644
> index 265b223cd978..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-in=
tc.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -RISC-V Hart-Level Interrupt Controller (HLIC)
> ----------------------------------------------
> -
> -RISC-V cores include Control Status Registers (CSRs) which are local to =
each
> -CPU core (HART in RISC-V terminology) and can be read or written by soft=
ware.
> -Some of these CSRs are used to control local interrupts connected to the=
 core.
> -Every interrupt is ultimately routed through a hart's HLIC before it
> -interrupts that hart.
> -
> -The RISC-V supervisor ISA manual specifies three interrupt sources that =
are
> -attached to every HLIC: software interrupts, the timer interrupt, and ex=
ternal
> -interrupts.  Software interrupts are used to send IPIs between cores.  T=
he
> -timer interrupt comes from an architecturally mandated real-time timer t=
hat is
> -controlled via Supervisor Binary Interface (SBI) calls and CSR reads.  E=
xternal
> -interrupts connect all other device interrupts to the HLIC, which are ro=
uted
> -via the platform-level interrupt controller (PLIC).
> -
> -All RISC-V systems that conform to the supervisor ISA specification are
> -required to have a HLIC with these three interrupt sources present.  Sin=
ce the
> -interrupt map is defined by the ISA it's not listed in the HLIC's device=
 tree
> -entry, though external interrupt controllers (like the PLIC, for example=
) will
> -need to define how their interrupts map to the relevant HLICs.  This mea=
ns
> -a PLIC interrupt property will typically list the HLICs for all present =
HARTs
> -in the system.
> -
> -Required properties:
> -- compatible : "riscv,cpu-intc"

> -- #interrupt-cells : should be <1>.  The interrupt sources are defined b=
y the
> -  RISC-V supervisor ISA manual, with only the following three interrupts=
 being
> -  defined for supervisor mode:
> -    - Source 1 is the supervisor software interrupt, which can be sent b=
y an SBI
> -      call and is reserved for use by software.
> -    - Source 5 is the supervisor timer interrupt, which can be configure=
d by
> -      SBI calls and implements a one-shot timer.
> -    - Source 9 is the supervisor external interrupt, which chains to all=
 other
> -      device interrupts.

I don't think that we should remove this test from the binding.

> -- interrupt-controller : Identifies the node as an interrupt controller
> -
> -Furthermore, this interrupt-controller MUST be embedded inside the cpu
> -definition of the hart whose CSRs control these local interrupts.
> -
> -An example device tree entry for a HLIC is show below.
> -
> -	cpu1: cpu@1 {
> -		compatible =3D "riscv";
> -		...
> -		cpu1-intc: interrupt-controller {
> -			#interrupt-cells =3D <1>;
> -			compatible =3D "sifive,fu540-c000-cpu-intc", "riscv,cpu-intc";
> -			interrupt-controller;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ris=
cv,cpu-intc.yaml
> new file mode 100644
> index 000000000000..6fe86d243633
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-in=
tc.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,cpu-intc.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Hart-Level Interrupt Controller (HLIC)
> +
> +description:
> +  RISC-V cores include Control Status Registers (CSRs) which are local to
> +  each CPU core (HART in RISC-V terminology) and can be read or written =
by
> +  software. Some of these CSRs are used to control local interrupts conn=
ected
> +  to the core. Every interrupt is ultimately routed through a hart's HLIC
> +  before it interrupts that hart.
> +
> +  The RISC-V supervisor ISA manual specifies three interrupt sources tha=
t are
> +  attached to every HLIC namely software interrupts, the timer interrupt=
, and
> +  external interrupts. Software interrupts are used to send IPIs between
> +  cores.  The timer interrupt comes from an architecturally mandated rea=
l-
> +  time timer that is controlled via Supervisor Binary Interface (SBI) ca=
lls
> +  and CSR reads. External interrupts connect all other device interrupts=
 to
> +  the HLIC, which are routed via the platform-level interrupt controller
> +  (PLIC).
> +
> +  All RISC-V systems that conform to the supervisor ISA specification are
> +  required to have a HLIC with these three interrupt sources present.  S=
ince
> +  the interrupt map is defined by the ISA it's not listed in the HLIC's =
device
> +  tree entry, though external interrupt controllers (like the PLIC, for
> +  example) will need to define how their interrupts map to the relevant =
HLICs.
> +  This means a PLIC interrupt property will typically list the HLICs for=
 all
> +  present HARTs in the system.
> +

> +maintainers:
> +  - Kanak Shilledar <kanakshilledar111@protonmail.com>

Are you knowledgeable about the cpu-intc on RISC-V? If you put yourself
down just to satisfy dt_binding_check, I would suggest that you put down
Palmer and Paul here as the maintainers of the architecture instead.

> +properties:
> +  compatible:
> +    const: "riscv,cpu-intc"

A new warning with dtbs_check from your patch:
/stuff/linux/build/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: inte=
rrupt-controller: compatible:0: 'riscv,cpu-intc' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/riscv,=
cpu-intc.yaml#
/stuff/linux/build/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: inte=
rrupt-controller: compatible: ['andestech,cpu-intc', 'riscv,cpu-intc'] is t=
oo long
	from schema $id: http://devicetree.org/schemas/interrupt-controller/riscv,=
cpu-intc.yaml#

There's a duplicate description in riscv/cpus.yaml:
  interrupt-controller:
    type: object
    additionalProperties: false
    description: Describes the CPU's local interrupt controller

    properties:
      '#interrupt-cells':
        const: 1

      compatible:
        oneOf:
          - items:
              - const: andestech,cpu-intc
              - const: riscv,cpu-intc
          - const: riscv,cpu-intc

      interrupt-controller: true

I think the one in cpus.yaml should be converted to a ref and the
andestech compatible added here.

> +  interrupt-controller: true
> +
> +  '#interrupt-cells': true

`const: 1` to match the text binding being removed.

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        #interrupt-cells =3D <1>;
> +        compatible =3D "riscv,cpu-intc";
> +        interrupt-controller;
> +    };
> --=20
> 2.34.1
>=20

--21BkFEkE1h7lw5HM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkeAGQAKCRB4tDGHoIJi
0iLpAP0U6v1uqKIyhBNx1wD1zg6ylJa1asw97S4cAYOXdq5Y2gEAv6UyS+m9dbHN
ZR9d9gmD0h/jlIqgsCfEufhc8VmEXwg=
=QVAp
-----END PGP SIGNATURE-----

--21BkFEkE1h7lw5HM--


--===============6755271498927793759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6755271498927793759==--

