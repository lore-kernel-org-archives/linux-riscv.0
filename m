Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BBDC61DB8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9A51hS+MWNhRkc+qW87OSFZNehDBpWoJIo8r4yDqlYY=; b=e9i/+jX/koY1j23oIT2lB31shE
	W5dyD1Ss2XGe2VI8d22/AC4Ot9CRo7ZPpPZns1TDdvom7qIQr4x/ZvKEyCUkoUIEfRWmt2vMqj/+9
	86f3ZZO7pTbnPT1efz4rQ5QYSVEbOVldDUWEzb+oKHKETXdl1b4RHOwu+kPnKfmbOjwDqtNg2UvZU
	nOOO6jNa4RFckrtB6/SHPALhecxlfZUdVsDPr4+sIZ47MvZinzjffeVIUVHhzockV6XDHG3UL9jso
	YHL/qvXz2MjCUbixWfq16akCuVlli6F/pQhy6xTcheXLlGUFSp1Gg8/Bn/g99aeVC4a/GEiqgTspl
	FDp+h4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjL2m-0000000G6Oi-36B7;
	Wed, 28 Aug 2024 15:57:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKzR-0000000G5iC-2p1Q;
	Wed, 28 Aug 2024 15:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C928BCE18AF;
	Wed, 28 Aug 2024 15:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BEEC4CEC4;
	Wed, 28 Aug 2024 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724860423;
	bh=FceCKpvwCfYxeVjhu7dja8rLnOmk8oo7I++7LCS81Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSHlBo+lH7EtoI6uF+gIKcgjd9oBGCAmJJm51PU7R5og/9T8YIhusI+lD6Hjb8iLY
	 hAtNShc4mk69/Qc56HZoyml4uqh0lO47YpsTrZ4etaMElT9d+jlndSc/aHWkasKc+D
	 FV2ucl0nT3Q6yVPGQh/I/y+0jmwJksKsfxZ+7OROHiB2iWyYav4i3Ds10emSgnx5ol
	 A7CWs3QoFl6kfXs6Ti6gV2IJRdAb8w/tX1vfgZjkT9i/46Exm4qV1f563eSGQh4Wxh
	 1M5e+xKvpzP8ShQEOfg7M/f91GjOc52bGt4cB3H6My1e9dFCLU9wGhhvvhPlbPsy+i
	 19ckAowLYmw5w==
Date: Wed, 28 Aug 2024 16:53:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
Message-ID: <20240828-goofiness-haven-6d22011353e4@spud>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_085345_934371_1A47878C 
X-CRM114-Status: GOOD (  11.31  )
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
Content-Type: multipart/mixed; boundary="===============2602844099067192773=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2602844099067192773==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OayRlMiikjtxs/jT"
Content-Disposition: inline


--OayRlMiikjtxs/jT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:35:59AM +0200, Krzysztof Kozlowski wrote:
> The core schema in dtschema already strictly defines contents of nodes
> with "gpio-hog" property (with additionalProperties: false), thus the
> only thing device schema should do is: define "type: object" and
> required "gpio-hog".  Make the code a bit simpler by removing redundant
> parts.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 11 ------=
-----
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 11 ------=
-----
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml     | 11 ------=
-----
>  .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 12 ------=
------

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


Cheers,
Conor.

--OayRlMiikjtxs/jT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs9H/wAKCRB4tDGHoIJi
0r7DAQDw7o8LeA1EG/uppquSI4wvHkpnTbF9vLKnFD2DK5QubgEApnVKe+GiJvsk
xuyCPYk1pqnyzWfnNVW7zYqynGfKLQ8=
=DkUp
-----END PGP SIGNATURE-----

--OayRlMiikjtxs/jT--


--===============2602844099067192773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2602844099067192773==--

