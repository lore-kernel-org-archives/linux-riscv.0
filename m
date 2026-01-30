Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D9EE6BF2F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMMcoarFftAVjrJ18bD+vfZyN8/5MNwgruwU4yQ5xTk=; b=IIbZ011DByES4a1w2/C0krOG4o
	6Z8p4LVwqKivdNpsT6U/r2ab5DEvgSVfaUzqQyafphINTswenPu+kJpTxHWmXvTzyJu0rqlcpPGn+
	MCgbhrMWcK0H56gP5PI7wN5ieCdZ7ZkS8Sty6G6xXbbJqfc6uoeUmH4BY3FyguXL83bB/yLZVQREu
	eqYt6sLJJ4qeRCBVFWbBYbjYfqylD28sFIck29dlHxqaj35Ef3DoLvlFMAEvsAykD5OUnIjFsH4HW
	j0ufv7bgSgTOAAiNhuDuK42S7FMWEkjceBDfL85UWld1iDlAC3AWe2yo2lIxOjcgXzlUTJQDqsPqh
	i4zD8RdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vls1w-00000001kFO-0zHF;
	Fri, 30 Jan 2026 17:11:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vls1t-00000001kET-2iuc
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:11:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6223243EAA;
	Fri, 30 Jan 2026 17:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2892C116C6;
	Fri, 30 Jan 2026 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769793092;
	bh=aIOowKRbbtWXCBTrIHVIrdOUVd0KWK+9sOxeQrb9Ik0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOm4AEZgDq3BINv4ERUCFxnUo2rsm1AVJdfJIOgBhB4PmksARYScWcO6voVrPnYGg
	 /7eI3N2vahljl5YNsTjZQn2EZwNKeKjisq99NTqFJEZhqsRIc9BrQRpZkL75Hqmm2p
	 hUdXtLxoR2tOlNN0HW/ZEbWDrw8KMR1rJL4ojLBvoao5P27HgL6WlZZnsqvBFzIzxB
	 RXSESCYXrPeHDoDgDDk8m7C0iYiogmPz67Zodg68N1Ru6bvVJ7gDI57LL/IiW3Xdci
	 Sho7k1vNr+vu8KTk0YEbw/QkjNPrijCsU3b6hgJ0ut2OCu3RWzUAR57tLxgNKT98Hc
	 c5vmb30d4Y6eQ==
Date: Fri, 30 Jan 2026 17:11:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: spacemit: fix drive-strength check
 warning
Message-ID: <20260130-outsmart-ether-73a7927b4c95@spud>
References: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_091133_725030_A3843D5A 
X-CRM114-Status: GOOD (  19.90  )
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
Content-Type: multipart/mixed; boundary="===============5736581693697512070=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5736581693697512070==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXE3nMVoCCy1SEy/"
Content-Disposition: inline


--BXE3nMVoCCy1SEy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 07:22:15PM +0800, Yixun Lan wrote:
> The problem is that one value from drive-strength may match to more than
> two different enum groups which lead to DT complaint, switch to use 'anyO=
f'
> to fix this kind warning.
>=20

Acked-by: Conor Dooley <conor.dooley@microchip.com>

And I guess:
Reported-by: Conor Dooley <conor.dooley@microchip.com>


> Fixes: c3efac0592f8 ("dt-bindings: pinctrl: spacemit: convert drive stren=
gth to schema format")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Doing DT check with command: make dtbs_check W=3D1, will get this kind
> of warning message:
>=20
> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: pinctrl@d401e000 (spacemi=
t,k1-pinctrl): gmac0-cfg:gmac0-pins:drive-strength: 21 is valid under each =
of {'enum': [2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33]}, {=
'enum': [11, 21, 32, 42]}
>=20
> Instead of using more complicated minimum and maximum value of property
> with constrains of compatibles, we decide to use 'anyOf' to fix this
> warning.
> ---
>  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctr=
l.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index f009fed87e6b..5194fa92fe93 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -76,7 +76,7 @@ patternProperties:
>            drive-strength:
>              description:
>                typical current (in mA) when the output at high level.
> -            oneOf:
> +            anyOf:
>                - enum: [ 11, 21, 32, 42 ]
>                  description: For K1 SoC, 1.8V voltage output
> =20
>=20
> ---
> base-commit: 3fcdb264b61a5bb0eb3fb7272717468aa376a74c
> change-id: 20260130-k3-pinctrl-io-drv-fix-5b11752dae1f
>=20
> Best regards,
> --=20
> Yixun Lan <dlan@kernel.org>
>=20

--BXE3nMVoCCy1SEy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXzmPwAKCRB4tDGHoIJi
0l9OAPwIZSVqA3HcerTZTYpElKg+7wSay+MnJcfS6DqQXii4XQD/XnTWlAiX3ZXJ
XmLWxI52yWO62/AAzYhO6YGjdIbqOw0=
=LlSc
-----END PGP SIGNATURE-----

--BXE3nMVoCCy1SEy/--


--===============5736581693697512070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5736581693697512070==--

