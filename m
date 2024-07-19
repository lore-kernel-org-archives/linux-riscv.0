Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1BCC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GF7vJXDPWKoW28Cp+t6/+4bQP/Ub1Trn7UBXjbqsHI=; b=i8pJyfdmx8p4498BAdhDYtXMx8
	DN1ORWHEvQvmnB6oI0I6qm5Nda4n8bvd41wqKqjQDKSuSptOpP89De59I1rNrdbeKTirscfYDIbMP
	HYhZNNfxDBd7jbI3KHWfFbCgAWs6WAy/zYsyB1U07891HaeOT7c1i2K43/v8d936/qXKKcjw72aAf
	K8cm/cNgpY6v/Kb6DIhMBVRheSocRMx3eY4HRInP1+Ms82Yz+v/sH0iprrqBjbk61GjXyglgrbmQi
	Kip43X9qd2TFzyDmow9NLoI3gGnLHeH0rAi6dwc0+uiGb4AUjeEOanyPd5y1oLDP+3DJrRMTEooz7
	7sKnd/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUq2R-000000039aA-2v28;
	Fri, 19 Jul 2024 16:00:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUp5F-000000030jB-2JZW
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Jul 2024 14:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cFKhzsvESrjfl6qDGINhXnm31DpzGOsVc+Vmct8ZHK0=; b=qBoQRxvFhS3OQ0fe7UmWNR9dFa
	B00QG7ul4JYovNdJjFSRGRbi2WCncNYSRuaYLRuRc9mBDtZmyqBHy+mORC5iQeFddKcnlksS44SIy
	3YTk7jl4Pf2RM9ry+SXGngeAFJQSohyZd/rS14xTfkQiHAeWDbp1zuW+ol8c0pLpg953zUtjrrqlF
	Y/cBLApL/NGIWeyd9XqNZg5D2kHrJqlFnGF5KRf+uZnztn6JYg1kOLWWNUa5iQs7BdVBYevTnUPRF
	mcwFdxlCzBR/Mh4fyTtdA2eLLiPJNe7l2nR5clNbf9cHnWJ4Pa5y/fzVLSXQ3s5o06FyemAwKDmzs
	+g8Y23Eg==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUp5C-00000002p4v-0Y9y
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 14:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76E48CE1C34;
	Fri, 19 Jul 2024 14:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AEFC32782;
	Fri, 19 Jul 2024 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721401172;
	bh=riKWNj9ymyyL39s71PP994WyzSU+759xl9rDSHnUAF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hqcu5kTgtqSNGXwpr+rLf04U8saJ0oT+7KTOqaK5tIjgB49z7iYXDKoh002v28T47
	 KHyA5ZaXNQsi2hio+QNnXJ8uwE6iQppaC9K+BWrJQhHPfQnyGq3KC3s5pkiMo8dRiE
	 RFplIazgJJqcuOewPcVf8x7dtkusX1kR6fsneJl3lRbSyTyzXgXvxrWZamOk6hqoNk
	 m1wTGrmoVGkd27pfCG1MUL9lGyTfUwcjb9LqCSzpWsAwp9D2nt5HgS/QvlaLEebiBa
	 6NOf4oUk6/EdVNVJ7XcCGHbqilRXLwYCwdm4i7yUI/13ZUPJGF+/wV9tnCX/OlNNDe
	 lkl4tuS9RJjTQ==
Date: Fri, 19 Jul 2024 15:59:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 6/8] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2042 support
Message-ID: <20240719-catnip-pushup-81d3e104de7b@spud>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
 <55bc60606bc9b2558eeddb00fd8b659d3fcd69ff.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <55bc60606bc9b2558eeddb00fd8b659d3fcd69ff.1721377374.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_155942_803212_873D257C 
X-CRM114-Status: GOOD (  17.09  )
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
Content-Type: multipart/mixed; boundary="===============7187881511173313162=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7187881511173313162==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mebK71Pev/WbD3jG"
Content-Disposition: inline


--mebK71Pev/WbD3jG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 04:46:50PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> SG2042 use Synopsys dwcnshc IP for SD/eMMC controllers.
>=20
> SG2042 defines 3 clocks for SD/eMMC controllers.
> - EMMC_100M/SD_100M for cclk(Card clocks in DWC_mshc), so reuse
>   existing "core".
> - AXI_EMMC/AXI_SD for aclk/hclk(Bus interface clocks in DWC_mshc)
>   and blck(Core Base Clock in DWC_mshc), these 3 clocks share one
>   source, so reuse existing "bus".
> - 100K_EMMC/100K_SD for cqetmclk(Timer clocks in DWC_mshc), so reuse
>   existing "timer" which was added for rockchip specified.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 60 +++++++++++++------
>  1 file changed, 43 insertions(+), 17 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yam=
l b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 4d3031d9965f..80d50178d2e3 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -10,9 +10,6 @@ maintainers:
>    - Ulf Hansson <ulf.hansson@linaro.org>
>    - Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> =20
> -allOf:
> -  - $ref: mmc-controller.yaml#
> -
>  properties:
>    compatible:
>      enum:
> @@ -21,6 +18,7 @@ properties:
>        - snps,dwcmshc-sdhci
>        - sophgo,cv1800b-dwcmshc
>        - sophgo,sg2002-dwcmshc
> +      - sophgo,sg2042-dwcmshc
>        - thead,th1520-dwcmshc
> =20
>    reg:
> @@ -31,22 +29,11 @@ properties:
> =20
>    clocks:
>      minItems: 1
> -    items:
> -      - description: core clock
> -      - description: bus clock for optional
> -      - description: axi clock for rockchip specified
> -      - description: block clock for rockchip specified
> -      - description: timer clock for rockchip specified

Does anyone know what "for rockchip specified" means? Is meant to be "for
rockchip specifically"? If it is, should probably be actually
constrained! Patch itself seems fine though and I don't think it's your
responsibility to fix that, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> -
> +    maxItems: 5
> =20
>    clock-names:
>      minItems: 1
> -    items:
> -      - const: core
> -      - const: bus
> -      - const: axi
> -      - const: block
> -      - const: timer
> +    maxItems: 5
> =20
>    resets:
>      maxItems: 5
> @@ -63,7 +50,6 @@ properties:
>      description: Specify the number of delay for tx sampling.
>      $ref: /schemas/types.yaml#/definitions/uint8
> =20
> -
>  required:
>    - compatible
>    - reg
> @@ -71,6 +57,46 @@ required:
>    - clocks
>    - clock-names
> =20
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sophgo,sg2042-dwcmshc
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: core clock
> +            - description: bus clock
> +            - description: timer clock
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: bus
> +            - const: timer
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          items:
> +            - description: core clock
> +            - description: bus clock for optional
> +            - description: axi clock for rockchip specified
> +            - description: block clock for rockchip specified
> +            - description: timer clock for rockchip specified
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: core
> +            - const: bus
> +            - const: axi
> +            - const: block
> +            - const: timer
> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.34.1
>=20

--mebK71Pev/WbD3jG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpp/TgAKCRB4tDGHoIJi
0qRSAQCcxNgXXQFBflYmeBWap/fYoOK6l9k5GvMV4TcSeNbazAEAt9rJueFEhCG0
M64Ytc4yOLvPk7XxHj6Mt7x1DATCXg8=
=+Shv
-----END PGP SIGNATURE-----

--mebK71Pev/WbD3jG--


--===============7187881511173313162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7187881511173313162==--

