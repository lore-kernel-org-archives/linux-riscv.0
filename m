Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CD9C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 19:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re7ydRDFO0dJbppBwVutz5riNh1I8l2wdk1Qh7eFW5A=; b=K3712IzvFmKiiCye9L8dNmIp0k
	6tnzBhMAt6zI91EtX1xtvWSCMJU3LjYLOTR+Dyeu/BbA46JG3YWmvs1xQngsUreDTRz4+88JuqnRU
	x59jDSxYOZvhKYpT9of7wKJ9e98RXY743Mi5PJMkQlFbqT6azXxRM3I/5SqCEhw30eEwSHV5RBoxP
	Yw7Kx90vzFkeLBtRCiC0loYJnTjbUytd32cLM/FRc19XOZBaN2EvqhvNKJ5Yv3NuYO5RTPow9QNXo
	e7TfOoQedfTymXceb5RlD1NGCJe+SoOxCC40lkZL/YR1cUd9puf67/3c6BT2NC5e1Dp4PSNAK789X
	q5UvcMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjgZ-00E1cz-0N;
	Thu, 18 May 2023 19:53:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjgW-00E1bZ-0E
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 19:53:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9353E651DD;
	Thu, 18 May 2023 19:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C131EC433EF;
	Thu, 18 May 2023 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684439591;
	bh=97mz22yBYEwl0uvWrtuRvN7tEwZZw/SN6l1zVITlLDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTO9zbT3tTtj/wiMe3RV534PsCiKjDcTFx7Lmpa+7VeztrSVhtHUZxENUB9q9ZNRS
	 TN+dNPikgdKWGSym+QLjodbNSPibWLOJKdWUWxzihD6j7aF2bmnEhzO1ROaz9sdlqu
	 1TEdEtR2FFhd4hFIRSbcrCFgJ5KTj5anJF/LMRByTR4AW3NwPqWyZj5jF/r3hsGQ+i
	 7927PmZs0vRzQbX/QMeFjUz/mysprIGWNQBiZOnRZx59qP/mRMxZbg1xM3kRsyGgsb
	 7Ow0FODITuh3B8Q6YO7+TlJhvzW/4dQNzj1iQIDfqii/0+qSZtm2PJi4cawChCbOER
	 0m7Jt9EXo+RPg==
Date: Thu, 18 May 2023 20:53:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 4/9] dt-binding: riscv: add T-HEAD CPU reset
Message-ID: <20230518-driving-secluding-793b3192776e@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_125312_190641_AB1F4352 
X-CRM114-Status: GOOD (  27.98  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============0468507524966828688=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0468507524966828688==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4uiDuJOB38i7bEfg"
Content-Disposition: inline


--4uiDuJOB38i7bEfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Fri, May 19, 2023 at 02:45:36AM +0800, Jisheng Zhang wrote:
> The secondary CPUs in T-HEAD SMP capable platforms need some special
> handling. The first one is to write the warm reset entry to entry
> register. The second one is write a SoC specific control value to
> a SoC specific control reg. The last one is to clone some CSRs for
> secondary CPUs to ensure these CSRs' values are the same as the
> main boot CPU. This DT node is mainly used by opensbi firmware.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/riscv/thead,cpu-reset.yaml       | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/thead,cpu-res=
et.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml=
 b/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
> new file mode 100644
> index 000000000000..ba8c87583b6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/thead,cpu-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD cpu reset controller
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description: |
> +  The secondary CPUs in T-HEAD SMP capable platforms need some special
> +  handling. The first one is to write the warm reset entry to entry
> +  register. The second one is write a SoC specific control value to
> +  a SoC specific control reg. The last one is to clone some CSRs for
> +  secondary CPUs to ensure these CSRs' values are the same as the
> +  main boot CPU.

Okay..

> +
> +properties:
> +  $nodename:
> +    pattern: "^cpurst"

Firstly, why the nodename enforcement? We have a compatible, so we
should be okay, no?

> +
> +  compatible:
> +    oneOf:
> +      - description: CPU reset on T-HEAD TH1520 SoC
> +        items:
> +          - const: thead,reset-th1520

You've only got one thing here, you don't need the oneOf.
Also, s/reset-th1520/th1520-reset/ please - although I do not know if
"reset" is the right word here. Do we know what the IP block is called
in the TRM/T-Head docs? Perhaps Guo Ren does if not.

> +  entry-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description: |
> +      The entry reg address.
> +
> +  entry-cnt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The entry reg count.
> +
> +  control-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The control reg address.
> +
> +  control-val:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The value to be set into the control reg.
> +
> +  csr-copy:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      The CSR registers to be cloned during CPU warm reset.

All of these values set on a per-soc basis, right?
If so, I don't think they should be in here at all since you should be
able to figure out the offsets from the base & the values to write based
on the compatible string alone, no?

Putting register values into the DT is always "suspect"!

> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cpurst: cpurst@ffff019050 {
               ^^^^^^^^^^^^^^^^^
This is also "suspect" and implies that "entry reg" should just be a
normal "reg" property.


> +      compatible =3D "thead,reset-th1520";
> +      entry-reg =3D <0xff 0xff019050>;
> +      entry-cnt =3D <4>;
> +      control-reg =3D <0xff 0xff015004>;
> +      control-val =3D <0x1c>;
> +      csr-copy =3D <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
> +    };
> --=20
> 2.40.0
>=20

--4uiDuJOB38i7bEfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaCIQAKCRB4tDGHoIJi
0n9SAP92K/2ImcXGHXRjUY3v5X+WdDMZxN/kIxZBW3btQoK6twD8CWE0LOA195ry
vmZPV/di2h45fbZHO5L8dKmuh9vxHwU=
=0QHL
-----END PGP SIGNATURE-----

--4uiDuJOB38i7bEfg--


--===============0468507524966828688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0468507524966828688==--

