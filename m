Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DC1C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pqs8aqOwj1V0cTFQuhCcHOEfIjNMZ1aDiRhZ4vAjbY=; b=y1kIF8Rr31rlOTu1VBjCTmwv8B
	JGu5/NCNRvJ/J989E5f9d9e3Y6RJzZ5ZUoLXWHiPek71TDAkuwd8kQK+v8lvM5XqxCgf2wUpth2aS
	SQfmtETxsofSacEG0TF83z+1YCkqdAM/akr2il9MuD83D86dHFFT4J6wcWZujmk7YIU6wXtfi4FyS
	w1QmOT9G9AASMLdd9keFfdmZuR72SFKUp0lCv3Mdv4fBUe0gsSMPp+83MSHBmiVkpf9/Z6PeMUkvI
	+5Fg1yhEGa3d2QfGJ5MGsd2fmarpLyWVgclrSAcS5uDj35dWp8kE/ug4ggblFS+4fkbKfbxhj0VqG
	+yVW9mDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUThk-0000000DJcr-3yBO;
	Mon, 29 Jan 2024 15:37:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUThh-0000000DJbO-1Rih
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:37:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B704562256;
	Mon, 29 Jan 2024 15:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DC7C433F1;
	Mon, 29 Jan 2024 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706542634;
	bh=l8Gerv/RnUXdqS32Hvg6dJnaeNoXsPQ5rKnHUXy1+3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCzSPJNF1f+jY8xMHnlLtWyLXT1HI1n9Z4l5hknVao0Sj9ZK35v8ZQshRQKY/BcQh
	 U/LfUyh8lv+z9SSWk3kI8YaLHmO+7bYfg+L2dUKlx6/eCn2T2wJond/WgS4SsVssIK
	 snu2PTE8kFw76oRqBBHS45J3rBnMwFsZpkaSVFfjtE1C8gsMbo0Dlyigho3/J4REU6
	 P8soMwsIBftAs5Gdwfqx8QWi64XaOVfBXJYqCtDfdLK0NXJPj5rgpa24gLKmRAqM1S
	 MNY60Zf+1CYLoDlW1j6B9CoTcS0LTvRXnW3r7BSx6yH9Q/9wyqbVFzMsctmng9N1h2
	 h9oqmmVm0apTA==
Date: Mon, 29 Jan 2024 15:37:08 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-can@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 2/4] dt-bindings: can: Add bindings for CAST CAN
 Controller
Message-ID: <20240129-garnet-polar-65afd461a1c6@spud>
References: <20240129031239.17037-1-william.qiu@starfivetech.com>
 <20240129031239.17037-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240129031239.17037-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_073745_481966_1E423504 
X-CRM114-Status: GOOD (  20.07  )
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
Content-Type: multipart/mixed; boundary="===============9058128629695888908=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9058128629695888908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2qZLto2B8G05buYu"
Content-Disposition: inline


--2qZLto2B8G05buYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey William,

On Mon, Jan 29, 2024 at 11:12:37AM +0800, William Qiu wrote:
> Add bindings for CAST CAN Controller
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../devicetree/bindings/net/can/cast,can.yaml | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/cast,can.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/cast,can.yaml b/Do=
cumentation/devicetree/bindings/net/can/cast,can.yaml
> new file mode 100644
> index 000000000000..ea52132d9b1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/can/cast,can.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/can/cast,can.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CAST CAN controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +allOf:
> +  - $ref: can-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,can
> +    then:
> +      required:
> +        - starfive,syscon

If you've got property related stuff in the allOf, move it down after
the property definitions.

> +properties:
> +  compatible:
> +    enum:
> +      - cast,can
> +      - cast,canfd

I don't like these uber generic compatibles that have no users as a
fallback. Allowing them in the binding only really discourages people
=66rom creating device specific compatibles.
Secondly, this is some purchased IP that I am sure has a versioning
scheme and the compatibles that you have created do not reflect that.
If they were being used as a fallback, I would request some versioning.
That's not going to really work though since the canfd features on the
jh7110 require setting u0_can_ctrl_can_fd_enable, so neither of these
compatibles really has a use right now.

> +      - starfive,can

Just "starfive,can"? Can you please add device specific compatibles for
the SoCs on which this is used?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: apb_clk
> +      - const: timer_clk
> +      - const: can_clk

Drop _clk, they're all clocks!

> +
> +  resets:
> +    minItems: 3
> +
> +  reset-names:
> +    items:
> +      - const: rst_apb
> +      - const: rst_core
> +      - const: rst_timer

Same here, drop rst_

> +
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Register Controller syscon no=
de
> +          - description: offset of SYS_SYSCON_NE__SAIF__SYSCFG register =
for CAN controller

The docs I have call this register "SYS_SYSCONSAIF__SYSCFG". Did the
names change since the TRM I have was written?

> +          - description: shift of SYS_SYSCON_NE__SAIF__SYSCFG register f=
or CAN controller
> +          - description: mask of SYS_SYSCON_NE__SAIF__SYSCFG register fo=
r CAN controller
> +    description:
> +      Should be four parameters, the phandle to System Register Controll=
er
> +      syscon node and the offset/shift/mask of SYS_SYSCON_NE__SAIF__SYSC=
FG register
> +      for CAN controller.

Cheers,
Conor.

--2qZLto2B8G05buYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfGJAAKCRB4tDGHoIJi
0naRAP9mnACAXbLoF5wZAI6lRZERQ91NOgTNtwrrOxfxsnoi6QEAuxoA1rFwLJSd
w8okICO/nnTr5tVns55t5LOoIKk5wwA=
=jD/W
-----END PGP SIGNATURE-----

--2qZLto2B8G05buYu--


--===============9058128629695888908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9058128629695888908==--

