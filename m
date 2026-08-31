Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A91C61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 16:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lqhAvJ3HkyFb7mlzm712nGyXozjkOaDyk4TaETcz6M=; b=phezpKpMISlFucsj3W0NDKBeUA
	EUfWnYcQWZAbsEpS8wtXxVONJY/EeOhwpJTSY7J40oQP7xoS6aE+fKi3b3C9IeZImA02mRhhTL+GI
	cyQdeIstSRXS8NLSikbML+WhTR3ck8Fth92gGmg3EE/Gkw3rukYQZUvnVShn5ZYmVhz4DfBiNuhkU
	KyX58YUp0yJeF0CD17CrW8DztFWjSi9KLvbYRr7FcYxCe2XGskEc/S6ffAMNJSThH9+QxHye/zG69
	X57ysC7LiikfkpvT1wL4FNPgpOG5Iq5F7jB/tDgUtFGKUn+TpAmRFFqBM/ya5TVm6G14j5Ij6iCWy
	gApGAEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x154p-0000000A5iw-3BYA;
	Mon, 31 Aug 2026 16:41:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x154o-0000000A5iP-2K0U
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 16:41:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C03E1601DE;
	Mon, 31 Aug 2026 16:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E3A1F000E9;
	Mon, 31 Aug 2026 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194501;
	bh=KbeZZ7+hcGKd4km3JCmhGTKowXSg86VoMpeJipGz+MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hlw5yJ+gOXKIm+3VfgLM4h6EAJt3OwhEx2su6JcoATyMt4L9mxuCNXJsgWyeSwndr
	 CnLi5FqM3xN3mUR3g7RjYuo+amUpC5cOz8fEedb6Am1cfI7jhSQ4tzX3DMOCYdXoT+
	 c7eFPVQVrVm4r6YkLMsFmC1WLZbclY2APzYhkIyFQ7mULYNijiFJpGHrrj7vA/t4I/
	 YJdrH9CHqOc6I0oef/xP24SgSupHClwszspUBmtvOorS8ZC8VFsyXb9f8UNjF4HvsY
	 ISgmykVEOM+OHYZjNX2MgwOlVSgNLdYrNrrRTTnVQ+L0oMNaCaiDEYEmjTbBqGd8Jn
	 SExECFwiNCP7Q==
Date: Mon, 31 Aug 2026 17:41:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ulfh@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: Add RPMI device power service
 bindings
Message-ID: <20260831-squeamish-pulverize-7e8334767707@spud>
References: <20260829205520.1691-1-joshua.yeong@starfivetech.com>
 <20260829205520.1691-2-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260829205520.1691-2-joshua.yeong@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============3854334088092910434=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3854334088092910434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2QJMYTI2ERRE10FT"
Content-Disposition: inline

--2QJMYTI2ERRE10FT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 04:55:18AM +0800, Joshua Yeong wrote:
> Add device tree bindings for the RISC-V Platform Management Interface
> (RPMI) device power service group, both for the supervisor-facing power
> domain controller and for the SBI MPXY channel which the SBI
> implementation uses to expose the service group.
>=20
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>

Carbon copy of the clock bindings, right?

This stuff is past the stage of being frozen I assume? Github is
currently being slow as molasses for me and I cannot load the links.

If so
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> ---
>  .../power/riscv,rpmi-device-power.yaml        | 65 +++++++++++++++++++
>  .../power/riscv,rpmi-mpxy-device-power.yaml   | 65 +++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-de=
vice-power.yaml
>  create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-mp=
xy-device-power.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/power/riscv,rpmi-device-po=
wer.yaml b/Documentation/devicetree/bindings/power/riscv,rpmi-device-power.=
yaml
> new file mode 100644
> index 000000000000..5afdc40df7e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/riscv,rpmi-device-power.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI device power service group based power domain control=
ler
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines device power service group for
> +  accessing and controlling the power state of platform devices managed
> +  by a platform microcontroller. The supervisor software can access RPMI
> +  device power service group via SBI MPXY channel or some dedicated
> +  supervisor-mode RPMI transport.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-device-power
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  "#power-domain-cells":
> +    const: 1
> +    description:
> +      Platform specific DOMAIN_ID as defined by the RISC-V Platform Mana=
gement
> +      Interface (RPMI) specification.
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    power-controller {
> +        compatible =3D "riscv,rpmi-device-power";
> +        mboxes =3D <&mpxy_mbox 0x1002 0x0>;
> +        #power-domain-cells =3D <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-devi=
ce-power.yaml b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-dev=
ice-power.yaml
> new file mode 100644
> index 000000000000..2b7df66ba172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-powe=
r.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/riscv,rpmi-mpxy-device-power.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI device power service group based message proxy
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines device power service group for
> +  accessing and controlling the power state of platform devices managed
> +  by a platform microcontroller. The SBI implementation (machine mode
> +  firmware or hypervisor) can implement an SBI MPXY channel to allow RPMI
> +  device power service group access to the supervisor software.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the SBI implementation.
> +    const: riscv,rpmi-mpxy-device-power
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport.
> +
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software.
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - riscv,sbi-mpxy-channel-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    device-power-service {
> +        compatible =3D "riscv,rpmi-mpxy-device-power";
> +        mboxes =3D <&rpmi_shmem_mbox 0x9>;
> +        riscv,sbi-mpxy-channel-id =3D <0x1002>;
> +    };
> +...
> --=20
> 2.43.0
>=20

--2QJMYTI2ERRE10FT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWuwAAKCRB4tDGHoIJi
0qjTAP9LJfBoXWTp5spj+xWhnI1+nc0iTLQo47IGSxWkoIis7gEA662EtseuouP5
8OlHNKK8t9DevUKH7F8NK/2HmABkLQI=
=CLai
-----END PGP SIGNATURE-----

--2QJMYTI2ERRE10FT--


--===============3854334088092910434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3854334088092910434==--

