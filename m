Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB6C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 16:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWGPIZSWcqv0tb2F3iifjaNfchAyMDuPttHAeNbuMZw=; b=EZKVXUW4xIsPE4QL4ncbxNI88o
	TRvqEbgX22zMfAmn48mLRAVNfhljKIs+O2fBap5poHkEhaQblUpg2f+r17TgUjzEUuamWP1aFkV+f
	ElTJZrytglnKgoqZKCIPyFuh9cPe1ISsDth8M+NGuBaq5VhO9CJz9xRF/Ty8s2WR965DE+qEwup/1
	sNL2Vmb14PK/RjrqWOJmDowWnMKgmkFOKgg0GTZ1GB9YVrZ0wRT1NtPzGxmGj7BB82CBUHSkwlcEv
	VUlmTFDuAFsNMsW3vuDCCp5nIvnzeLLrneLNj9TyRAAUp//52UP5HRTqWTFe3LBlxt6XNmBFuu/ET
	vDSHIP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlvY-0000000D3zo-2d2h;
	Tue, 16 Apr 2024 16:45:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlvW-0000000D3yM-0x8k
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 16:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 686A2CE10F0;
	Tue, 16 Apr 2024 16:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1573FC113CE;
	Tue, 16 Apr 2024 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713285895;
	bh=WFbKwxX8WMuQfW+cB0Y60i7L1vzoyLXTtdrcolu9Gbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeHRO+SCyFOm2lrN9+zZTmXWsbUPJELegE9c39+uTW+nLXLSzamhs5IfwqkA+a6B6
	 Imhs4el6W1gohJ8crDSFfRT+CbcC287m/o8+qtxv8NSOJ83MvJ8CNQ5yVxn1XCD7ju
	 HH8VYsaEnVDRMHLSOqje9X8tDJ7A0WU40EgDZYQsuMl8hsG5Ds48ERNiijWgpQJPhr
	 0BgekzClovYy4FWHFNn5G9BXvJ/lbopZnmR/QMdngL3MBt88qYThcx0FNS+2aOwAX1
	 sGGuVhZ8PaH/t3ISr5UgWSXqw1CeyO+2NrV5V8YVbMsJsie54xtDQ3+l7KevVqdimA
	 nrjcKEKNv1mRg==
Date: Tue, 16 Apr 2024 17:44:48 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2042 support
Message-ID: <20240416-pretext-cognitive-295526072596@spud>
References: <cover.1713258948.git.unicorn_wang@outlook.com>
 <032c06642b01f06c86ba8bcd2108d18c005b57eb.1713258948.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <032c06642b01f06c86ba8bcd2108d18c005b57eb.1713258948.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_094458_655841_6DD46C9E 
X-CRM114-Status: GOOD (  17.93  )
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
Content-Type: multipart/mixed; boundary="===============1707764015326128218=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1707764015326128218==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Oj7/7BmivF9LBeQt"
Content-Disposition: inline


--Oj7/7BmivF9LBeQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 05:50:37PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> SG2042 use Synopsys dwcnshc IP for SD/eMMC controllers.
>=20
> SG2042 defines 3 clocks for SD/eMMC controllers.
> - AXI_EMMC/AXI_SD for aclk/hclk(Bus interface clocks in DWC_mshc)
>   and blck(Core Base Clock in DWC_mshc), these 3 clocks share one
>   source, so reuse existing "core".
> - 100K_EMMC/100K_SD for cqetmclk(Timer clocks in DWC_mshc), so reuse
>   existing "timer" which was added for rockchip specified.
> - EMMC_100M/SD_100M for cclk(Card clocks in DWC_mshc), add new "card".
>=20
> Adding some examples.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 67 ++++++++++++++-----
>  1 file changed, 51 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yam=
l b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 4d3031d9965f..a04ccae216cf 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -21,6 +21,7 @@ properties:
>        - snps,dwcmshc-sdhci
>        - sophgo,cv1800b-dwcmshc
>        - sophgo,sg2002-dwcmshc
> +      - sophgo,sg2042-dwcmshc
>        - thead,th1520-dwcmshc
> =20
>    reg:
> @@ -30,23 +31,36 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    minItems: 1
> -    items:
> -      - description: core clock
> -      - description: bus clock for optional
> -      - description: axi clock for rockchip specified
> -      - description: block clock for rockchip specified
> -      - description: timer clock for rockchip specified
> -
> +    anyOf:
> +      - minItems: 1
> +        items:
> +          - description: core clock
> +          - description: bus clock for optional
> +          - description: axi clock for rockchip specified
> +          - description: block clock for rockchip specified
> +          - description: timer clock for rockchip specified
> +
> +      - minItems: 1

I don't think this minItems is needed, this is for one device which has
all 3, no?

I also think this combination should only be permitted for the sg2042,
since it is not valid for the existing devices.

Cheers,
Conor.

> +        items:
> +          - description: core clock
> +          - description: timer clock
> +          - description: card clock
> =20
>    clock-names:
> -    minItems: 1
> -    items:
> -      - const: core
> -      - const: bus
> -      - const: axi
> -      - const: block
> -      - const: timer
> +    anyOf:
> +      - minItems: 1
> +        items:
> +          - const: core
> +          - const: bus
> +          - const: axi
> +          - const: block
> +          - const: timer
> +
> +      - minItems: 1
> +        items:
> +          - const: core
> +          - const: timer
> +          - const: card
> =20
>    resets:
>      maxItems: 5
> @@ -96,5 +110,26 @@ examples:
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
>      };
> -
> +  - |
> +    mmc@bb0000 {
> +      compatible =3D "snps,dwcmshc-sdhci";
> +      reg =3D <0xbb000 0x1000>;
> +      interrupts =3D <0 25 0x4>;
> +      clocks =3D <&cru 17>;
> +      clock-names =3D "core";
> +      bus-width =3D <8>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +    };
> +  - |
> +    mmc@cc0000 {
> +      compatible =3D "snps,dwcmshc-sdhci";
> +      reg =3D <0xcc000 0x1000>;
> +      interrupts =3D <0 25 0x4>;
> +      clocks =3D <&cru 17>, <&cru 18>, <&cru 19>;
> +      clock-names =3D "core", "timer", "card";
> +      bus-width =3D <8>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +    };
>  ...
> --=20
> 2.25.1
>=20

--Oj7/7BmivF9LBeQt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh6rAAAKCRB4tDGHoIJi
0qoyAQCTaZUNTGi76+cefoQMna0yBcbNZZK6zaaeA6hNVqADngD+LinzXBk8I+hU
Bdhb0V7rfjXZ7RK2SnqiZSWXNVclQAY=
=+oDk
-----END PGP SIGNATURE-----

--Oj7/7BmivF9LBeQt--


--===============1707764015326128218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1707764015326128218==--

