Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26066E82CAA
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlwjNYncDceCxoUhLZKDIOpCoK+i9zbzo9XAVxTMNgw=; b=gfvVDu1HuOiGEa3gPM3bU5ybzg
	A/nYzl4QuT2Gk+H5AY8ye3iQR1z5BDs6Az52QJ2C+LOhJmThtK7rlTwpXVxyP9PcIH3Ca5cQhS9/w
	Tgm5XS8mtdh9XnINFCk5We9JRM9p5TJkeG9qP1fByDnJj2YONOyjkqih8wpoWs7V/fLInjkrpqmyv
	2ntnKDG27O+hVHMImLoeeMNKYKVwCajnhxTI/+OuzKmZdwS/YKXY9/bHKEHKGdzwVAl/seg2uhsaS
	DrZuMSlWR6z4YOUwrE4xOL2jx5AqxMT5A4o8GN95/9yGjxBQC6hzqn2A0Q/CcdIlcHzJZnwg7lljz
	/IfblOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWyQ-001ODe-0Z;
	Wed, 27 Sep 2023 16:01:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWyM-001OCi-26
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 16:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 404926028C;
	Wed, 27 Sep 2023 16:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16AFC433C7;
	Wed, 27 Sep 2023 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695830468;
	bh=cGg7lDklhNmelt6repmP3pClIhhjdk7i56CRb2SdcKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S28Nno+R5snpz8UdEH/HIKuKkDyeCHzaSrDWSxCIhuP7L5uxwiFrr+rTIZoAjtedr
	 DJ6oLXWdlQ4RRNXvqUCkOQAAyRNP2DaZxx573zfGNY15ViAP5+Cpg1cFahatfx6HzG
	 59R8r5O91eUi2n6RUeAx1XVgQjkCNwpElVUN6QfpXbnhbfQApvndIQ2SEPfA7TStYO
	 EimLrRFOuE6OLtu6xfjOnm6MvIBiED2ydeDKxt9lOMHR9rgJL8ckJ6ervd33h/xIZf
	 2GBDORmczS0l6Wxl4l9YnSH8Uf5xvMXkFYwQdHRiT5yNbjvG9BkHPklPJ7Uwe1K/3P
	 ltKXitxrGYeHA==
Date: Wed, 27 Sep 2023 17:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, devicetree@vger.kernel.org,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v3 06/11] dt-bindings: timer: Add Sophgo sg2042 CLINT
 timer
Message-ID: <20230927-uncorrupt-bronco-72e35232b1cc@spud>
References: <cover.1695804418.git.unicornxw@gmail.com>
 <6e263430685732a4f354b45396c7422a37440ac8.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6e263430685732a4f354b45396c7422a37440ac8.1695804418.git.unicornxw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_090110_799151_01718C3B 
X-CRM114-Status: GOOD (  23.18  )
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
Content-Type: multipart/mixed; boundary="===============3060699824445447803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3060699824445447803==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rumhzbk4+1O3PjAY"
Content-Disposition: inline


--Rumhzbk4+1O3PjAY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Sep 27, 2023 at 05:01:37PM +0800, Chen Wang wrote:
> From: Inochi Amaoto <inochiama@outlook.com>
>=20
> The clint of Sophgo sg2042 is incompatible with the standard sifive
> clint, as the timer and ipi device on the different address, and can
> not be handled by the sifive,clint DT.
>=20
> In addition, the timers of sg2042 are mapped by per cluster, which is
> hard to merge with its ipi device.

I think the description here is kinda poor, it needs to be explained
that this is an implementation of the not frozen & likely abandoned
aclint spec.

> To avoid conficts caused by using the same clint compatible string when
> this device is parsed by SBI, add a new vendor specific compatible string
> to identify the timer of sg2042 soc.

And this whole section about avoiding conflicts is not relevant, since
the binding is specifically for the timer. It'd be better to mention why
a single compatible cannot work for all elements, than bring up a
situation that does not exist and would be a misuse of the binding in
the first place.

> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> Signed-off-by: Chen Wang <unicornxw@gmail.com>

You only need to sign this off once. The iscas one looks like it
probably is the relevant signoff?

> ---
>  .../timer/sophgo,sg2042-clint-mtimer.yaml     | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sophgo,sg2042=
-clint-mtimer.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-=
mtimer.yaml b/Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-m=
timer.yaml
> new file mode 100644
> index 000000000000..5da0947d048a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.=
yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/sophgo,sg2042-clint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CLINT Timer
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sophgo,sg2042-clint-mtimer

There's only one of these, so you don't need the oneOf.
Also, is the clint here not a thead IP? In which case, you need to add a
second compatible IMO. That second compatible then would be the one that
appears in opensbi etc.

Otherwise, this looks fine.

Thanks,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    timer@ac000000 {
> +      compatible =3D "sophgo,sg2042-clint-mtimer";
> +      interrupts-extended =3D <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>,
> +                            <&cpu4intc 7>;
> +      reg =3D <0xac000000 0x00010000>;
> +    };
> +...
> --=20
> 2.25.1
>=20

--Rumhzbk4+1O3PjAY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRRRvwAKCRB4tDGHoIJi
0qNlAP0Sb0OKToYSPefL04TYxLi44wFiOIPYB7BuJ6hjs8WViwD/c9eLvuIugBjd
5JDpirk/b/AI0Le/pGYSDPHZMQ26MwY=
=JWmr
-----END PGP SIGNATURE-----

--Rumhzbk4+1O3PjAY--


--===============3060699824445447803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3060699824445447803==--

