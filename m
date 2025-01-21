Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ADCC02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nFOZJND6ZYyay9D+IMhksVu5TYHiYzJds3swgbdwNI=; b=AR9AVlg9YL6IHz2A6XnjXi2H/u
	3C15X95SXUwKWrmxcJcvqeOQwf2tfKUTSEs7xe1eWg9kQIvMBKvfI1cKw4BVjxtrZG5dY+fDZQJTF
	eMM3SrhUoBHZ2VqlaJck9pUMo/NPy7ij+p29n8cTaEw/ANgf/3ZH6aJyatAW5WMX6z2tPnfpZNy5L
	Dg8GNKvnUvFyGr6HNLm8Hjrj/rQD+vcryaJkJIgT8obos/btvph8OTTH/F+xjWmfsla86wr9on/lM
	HPZ2aVh8cT/7GVHHrXMSRAfER4kH1wAaVK5cUFQwNfi0A+n+S8+8KVJIE/SaCN8vYvmS02ggTWmJ8
	ul0YctkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCGw-00000007jSg-39LH;
	Tue, 21 Jan 2025 11:18:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taCF9-00000007j5Z-25zl
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 11:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7196B5C560D;
	Tue, 21 Jan 2025 11:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCCBC4CEE2;
	Tue, 21 Jan 2025 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737458186;
	bh=Yul0dY1W7TJ0im0cLifhL477CvUbR0lwcyOhbO9oTRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj1QAG+Lp9mTno6/VicWbthUXpIn9zxXN0HpvL8Bqy7RsEZFnRpoWcev8XTvvLzje
	 ji9jtmkhzI2w0eF0Z2nKnKEzlz7/L0TsYEUYGWgPQshOuFa+YmziZm1ZeB4/mqzeEp
	 6RFvH4CiX3IyNF33DrOwl9Q6N7NL3L7DqRyTNks7zjyuDN1vuXCEJjE1K2tLzYfng6
	 Ts24kPif9FUADKJSojOOGL4IjapslzRIti2v5kvOWf8q9g7GdAoj+zaApyduasGhb+
	 SWBucR1vfzROWjWL73QnJnpQf7IHZX9uMVgKaQL1OihLzRgIjls+nqL8C89xflGAEY
	 5k3Q4TEFuFiyA==
Date: Tue, 21 Jan 2025 12:16:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
Message-ID: <dvjnhptep4fa3iqxzsau5fdp7qrno4nhnpdecvvyb55h6sxjpl@ohnvvbldwtpj>
References: <cover.1733281657.git.unicorn_wang@outlook.com>
 <673f314d78ab467399afc02b96ac730149f19587.1733281657.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <673f314d78ab467399afc02b96ac730149f19587.1733281657.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_031627_642090_8F01AF4D 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Type: multipart/mixed; boundary="===============0872979295126734880=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0872979295126734880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huec3nvjneppu6k6"
Content-Disposition: inline


--huec3nvjneppu6k6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
MIME-Version: 1.0

Hello,

On Wed, Dec 04, 2024 at 11:16:22AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Sophgo SG2042 contains a PWM controller, which has 4 channels and
> can generate PWM waveforms output.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Nitpick: Put your S-o-b last.

> ---
>  .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-p=
wm.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml=
 b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> new file mode 100644
> index 000000000000..5dea41fa4c44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 PWM controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  This controller contains 4 channels which can generate PWM waveforms.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2

Please use 3 here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +unevaluatedProperties: false

Best regards
Uwe

--huec3nvjneppu6k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmePggUACgkQj4D7WH0S
/k5JIQgAlxVeCOpps3Aki/zCI/ccjfWrmWRKg7iuCZ0woJgM7spcEL3XFnczHG9i
Zc9+LCG42ERSL5mlJ2HAw5jHde3JqrVgkJZFbGWQIDNMR1ni0MH2vsHAykE/Nprc
cZIMIbqh9AQ+BUythNR026bYYBBA0OrleoljbDDsStC2JBOKDsCsmq51qgKlqWxy
zaYPLxtCwIbgUkQmXWMC2VOlGakZFB/lNlngQq1nYRyTawCaLLyzGYg5uPTWfkSX
oQtPBjlcDi1qfkObHzFZGc+rdi/aW/3xwjcRNWxWJ/Cmz+ylGlDErrZ5QglwHl/9
+qNNVMMZULpWG9c2KZao+uyJOAAIhQ==
=0J6r
-----END PGP SIGNATURE-----

--huec3nvjneppu6k6--


--===============0872979295126734880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0872979295126734880==--

