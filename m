Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DB6E83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIYzD8og0M8VyG5cbFJFL+3rIN3CPwkcPflmbB5ZKAM=; b=oJj12Wm3D1+dW/vvx+B7ixyGwD
	HdSjdqSBe0JWPujy83tQJzv9lt8goEoqi7Xcw9I265zfgz91GrrJEESggHDargBoDrkpzWqJuQeeo
	y7sxkV4OA4vaqYAJGnxVCYVkb0E2JBqPAiaGO4eODTu8rbXXdXOWTlE4XXN543J9CO6wzGxlFFc+M
	miSBKTpfgPwjQaF6C1DfrLMM9LofvzZaPWkJhfs8ro16ws2nwHWHRQUSIEqVNp9OFaggqjQyh0Eii
	/y1KiaMHx2JuEzxNc98iaWHj7Z5FPM+xaZxBUX7uhDJs7hXEYUIS5iVxtj+8VlToplL8qSF1a4ymp
	UGAf7ztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhKk-00000008udl-0Q3e;
	Wed, 04 Feb 2026 18:10:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhKh-00000008udM-1TXV
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 18:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8662744488;
	Wed,  4 Feb 2026 18:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F98C4CEF7;
	Wed,  4 Feb 2026 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228630;
	bh=WxnyfoifFLABy924YWy34UmPHS+Gu+G1OW1cX5TS97g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwlvXR0BslkaCy+/hSCOL0MF1xdY916PZTThBizYeo+xr+kKryC5ijj74IyVy7lXm
	 APGnV4r1EqI8sExTrRGxlIqMXdqsmQAYZIE7Mkg6FNDTY8MetCUl+o3pr3dbSwG+Mb
	 ONGbZc+/e47L/Ud14axA4wRO5X22Bp84ZJR8R8RrVTf+FpvpPfj3f5wXGJvKrHhfaR
	 WxpJWGmiVgsN8XeDnY6p0Dqu8GuBSHViK9Z9vJ/fqu8w/h3gQEIZmWf6nff8XWweO9
	 JDsTVFVItFCZnIhHJxmxMBOR6/qNIgoAcxGECk2yLo59G0LIjH8Ak5TrDf2C6yDwBB
	 oL8PCWRP2V2lg==
Date: Wed, 4 Feb 2026 18:10:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Add sdhci support for Canaan k230
Message-ID: <20260204-imperfect-blitz-55fe5a85590f@spud>
References: <20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260204082908.27501-2-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260204082908.27501-2-jiayu.riscv@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_101031_433866_ABF57CCB 
X-CRM114-Status: GOOD (  16.32  )
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
Content-Type: multipart/mixed; boundary="===============5528095509391964740=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5528095509391964740==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/gxknbu3c92leW+z"
Content-Disposition: inline


--/gxknbu3c92leW+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 04:29:06PM +0800, Jiayu Du wrote:
> The Canaan k230 uses the SDHCI from Synopsys. Add compatible strings
> to the k230. The k230 has two controllers. MMC0 supports eMMC, while
> MMC1 supports SDIO.
>=20
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yam=
l b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 7e7c55dc2440..cab33da3af7d 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -23,6 +23,8 @@ properties:
>            - const: sophgo,sg2044-dwcmshc
>            - const: sophgo,sg2042-dwcmshc
>        - enum:
> +          - canaan,k230-emmc
> +          - canaan,k230-sdio

I don't understand why there are two compatibles here, when the driver
is able to handle them both identically, using the common properties for
mmc controllers to differentiate. Is which is emmc and which sdio
actually just determined by how the k230 boards use them?

Or, if there are pinout differences, would pinctrl allow each to be used
for either?

>            - rockchip,rk3568-dwcmshc
>            - rockchip,rk3588-dwcmshc
>            - snps,dwcmshc-sdhci
> @@ -87,6 +89,26 @@ required:
>  allOf:
>    - $ref: mmc-controller.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - canaan,k230-emmc
> +              - canaan,k230-sdio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: bus
> +            - const: axi
> +            - const: block
> +            - const: timer
> +
>    - if:
>        properties:
>          compatible:
> --=20
> 2.52.0
>=20

--/gxknbu3c92leW+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOLkQAKCRB4tDGHoIJi
0jE5AP9A5xbrmdc6tgcmxgxJUe3JH7gzKH+FdLOdHZitm/CrGgEA9tVmRtqMmCcu
bGQiOM9DLm67cQgmD4jeFM1ADLjrmAs=
=fQk9
-----END PGP SIGNATURE-----

--/gxknbu3c92leW+z--


--===============5528095509391964740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5528095509391964740==--

