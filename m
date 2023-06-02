Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B421BC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIwM910a5AcpLCm5GkM+yB5010Ev72GxR1AgW67E/Iw=; b=vtq71uOOJ7GvHoq/Leq91wzsSn
	7Wob8Z+9PAxGdoW2x2+kusPgydiwG8CvB410e5jshuXyBVEpqT1ZehMsi5qNgoFdQ36jEJNmm2zNs
	MN1tdLPseXyKlQn5b1NafMx7SuPw6EbVmsF//8GyPLE9IZ7BHJbz3YskgTOeETDef2Ibq9aJ6YntR
	wMhGtgHav3FqK4s9yqgbpYIfEUhYYuqY8y0m/N5/PMREsbVgap8VfvvCMGyuFxLh4+NXGAVTnASjs
	qWcNiuMuLbemtKof/obU6Mx3sFPwdyORQn1ixQ4rAddszqcuWgsffGXzpqMWFU/+OSwne7zVrzb+l
	ANT66d7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q596L-007ath-0N;
	Fri, 02 Jun 2023 18:02:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q596I-007atA-2n
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 18:02:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7054064C01;
	Fri,  2 Jun 2023 18:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CBDC433EF;
	Fri,  2 Jun 2023 18:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685728929;
	bh=XAtF7146Gm5KAng3zs9SmmSWYFO5+S4sp3hfrNzqsaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1iBK/EgCQfwHC9U0wG4xOewz3AJ6+xTOkNs1hHpawt2k9fS+cK2xl6ZTPGY2ImgG
	 dCfa7dnrlhQOZDY27iJuRKwXV5h+YIUOUJfWd+jOV5/glxTMVFjgHVawB1iGecbNhu
	 ifILVn8LXQlzcY3YhiHa394KztaiybnT6XrOSVfanR2+cCas3ZxP3v17Am3URhLd2M
	 Prl/J3Z9rqu+V9MVwJE2m9UDd6U7Hx0ge8IxxFLQ1LEj5nEIXl8odUdzazYgMoBG1C
	 dwrB2nVC7/6ayXs1wpNAfSdyd4JszvWIj0qZm66/BUTF2g6uVPv0fS74AXawy4u+EA
	 ioq/wjjKnYLkA==
Date: Fri, 2 Jun 2023 19:02:05 +0100
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Message-ID: <20230602-impurity-broker-28cc27869b64@spud>
References: <20230602084925.215411-1-william.qiu@starfivetech.com>
 <20230602084925.215411-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230602084925.215411-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_110210_949267_3ADE43B4 
X-CRM114-Status: GOOD (  19.04  )
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
Content-Type: multipart/mixed; boundary="===============4522568094752749162=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4522568094752749162==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1mtQStb3HNNyC+Nn"
Content-Disposition: inline


--1mtQStb3HNNyC+Nn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 04:49:23PM +0800, William Qiu wrote:
> The QSPI controller needs three clock items to work properly on StarFive
> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
> platforms do not have this constraint.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml    | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/D=
ocumentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> index b310069762dd..b6a27171d965 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -26,6 +26,15 @@ allOf:
>              const: starfive,jh7110-qspi
>      then:
>        properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          items:
> +            - const: ref_clk

Aww, I liked Mark's suggestions better.
If you are respinning to fix the LKP reported issue w/ ignoring the result
of enabling the clocks, could you chop the _clk off of this one?

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--1mtQStb3HNNyC+Nn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHounQAKCRB4tDGHoIJi
0ovMAP4rOWvNSNrwxKPStmIgIe61T65PqjNZ69zziOQlOW0aJwEAqRT+V42af0Ph
W6Q7Ex/+PyIMKWfrpZ7JjENsTSQnVQ8=
=GvFA
-----END PGP SIGNATURE-----

--1mtQStb3HNNyC+Nn--


--===============4522568094752749162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4522568094752749162==--

