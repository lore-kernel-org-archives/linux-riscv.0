Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC23ECD4F45
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhb/aSQw5NWrBi/R0q3H2/GktpnU5uh6geYSYAZ/2SA=; b=nvsxzeigcXsQEAAYpA+XxGivf/
	9ZHrqHjmJjWaZUxKPx5ChBzKvycDGWqbS24hyTBcz6aNaJm8tqB4YJ96vgL+PIhMzTl1/oa97PV1n
	XxRkLjxhJuSuJQ+emDTFuj+4LQf2glmjscHs9x24jHbRqC+GvHJo7dg3pnzc/yanMpP+iCfKJI3oi
	3K81HvUSmSH2r+/azMZrttZtjeqX73kvZ2mg22vohyRlYnz4IHYj6C0YbFRUK0YiGzJKXqTnBuZuZ
	e0XmJb3/2zybjgCfikZZO9pWJfCJBjwThM1l6ShGy8MSgLEMvhmzNiysVrsgse+7wb73nbjppqF1X
	E5N4r7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcuw-008ed6-14;
	Fri, 22 Sep 2023 09:57:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcuu-008ebq-0U
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 09:57:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 743D862191;
	Fri, 22 Sep 2023 09:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69C9C433C7;
	Fri, 22 Sep 2023 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695376662;
	bh=Lfg64vDBMqqMuekyEShYM/GguXqls4PxLGqLNLeMVQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/RhEJc/+n34ONrY1ylE/pq0kRonnc5VfiydY7HWO0N7NLeIPD9XgdaKB7qtHPncW
	 w/KRdPGIAAuNEyrQQMZ+W1b8CwWq2Mm7oCk155jEUQgJnIw/dAIQQufz6XX0z5FUJm
	 j4IduZfdMbcSk22cStuwAjqbG2JFRFXzjrwPghF2COD60L6et/QMuPOaGxM22iGIoy
	 AO/NWv/iTykwQE3Xkn+ckgNaOBkbi+Yw3D5g82qapaTx9VY7iWO0PmAh0zSmHvESv5
	 j3HepWM0yPGlL3F674r9723GkHHfevPS/eC8ej8KuR5Vq6+Kjm5z6MNNRlHcj+5TnT
	 d13G5qryQ6mRA==
Date: Fri, 22 Sep 2023 10:57:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
Message-ID: <20230922-parish-ice-a22e93dc3027@spud>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-1-49f76c274fb3@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230921-th1520-mmc-v1-1-49f76c274fb3@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025744_271663_7421242E 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============0245885810117469622=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0245885810117469622==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eawcWMQ/3FYJXdeS"
Content-Disposition: inline


--eawcWMQ/3FYJXdeS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew,

On Thu, Sep 21, 2023 at 06:49:48PM -0700, Drew Fustini wrote:
> Add compatible value for the T-Head TH1520 dwcmshc controller and add
> thead,phy-pull-up property.
>=20
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yam=
l b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index a43eb837f8da..46b768d46712 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,7 @@ properties:
>        - rockchip,rk3568-dwcmshc
>        - rockchip,rk3588-dwcmshc
>        - snps,dwcmshc-sdhci
> +      - thead,th1520-dwcmshc
> =20
>    reg:
>      maxItems: 1
> @@ -60,6 +61,9 @@ properties:
>      description: Specify the number of delay for tx sampling.
>      $ref: /schemas/types.yaml#/definitions/uint8
> =20
> +  thead,phy-pull-up:
> +    description: Enable weak pull-up on PHY pads
> +    type: boolean

Why is the weak pull-up required? How would the dts author know if they
need to use this property?

Thanks,
Conor.

> =20
>  required:
>    - compatible
>=20
> --=20
> 2.34.1
>=20

--eawcWMQ/3FYJXdeS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1lEAAKCRB4tDGHoIJi
0ur5AP9J83si/VNah9uXWQh6yWcqwodTBG01tc11Lr8CYSXRhAEAs3heA19N2euY
iKJcToy85ytl2YnADrdTAOVK+RzGMgE=
=kKS5
-----END PGP SIGNATURE-----

--eawcWMQ/3FYJXdeS--


--===============0245885810117469622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0245885810117469622==--

