Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B76C282D0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 18:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shFkO6xoRww0U1251apd/rpgz9mZ9rFzX5unh/j1v3k=; b=L9Yb5t78mGjdSFe98C+nYGcECh
	U8FItGusqob7qa4UcdOJRo8F2ZeYlfXENxNed8DxZY/784q1zpMdsF74fZvjPQr/GGp4hiqWglSpW
	xVRlphtRN2gxVeUNtkpXHRgdqBXQax0p/kSRNu/nT5PbxbVXZcW2fzX0cBO9hfctXB00aSd2U3RyG
	/3LDQ6JmBpyz87XzT8NQMoT3spvNlHmcebSqBudFA4FqtqiaYBNzNkaNivaRh+ORNtwXo1LM30PoA
	C8sUEcIoeU/Ec9kh6Rd5WyPnpRTUl6LIwLO8E9CsfuFFnKgQbKhOqyIN2G23It3ED7DR+9RlSitWS
	RSXTsrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4zx-0000000C717-2pge;
	Fri, 28 Feb 2025 18:22:09 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4zw-0000000C70Z-14xh
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 18:22:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15FC461166;
	Fri, 28 Feb 2025 18:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD57C4CED6;
	Fri, 28 Feb 2025 18:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740766927;
	bh=L7nx2qw0ww3IcjVdyW4mjPxnThBtNa64sCtxvSfHX1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHdJm99dr70XTwFpyITFYJXriGp1uxqm7Hh5XDySE+HKhTi5RfIAWdPSJ3SSka/ZG
	 1GyPH2hIvUrJX9dV0XwHXvSUNRddgbZ6RV6DW/Vqhefm5IZD9HupwFShXEX9GnwfJf
	 r5mmMVxaCVpa3jNFbjseWAKTBLUxg0XECFMN5aMEWLY8c/nwA3jzfrYc7yUzJyer6j
	 zzbftPKBIqvWs088hW0tBeLO9pbKyUhaao+UdS8Uk+9TQy0vCDJI1dVHkS+n0ZLua9
	 b36k0X6FT1mRPnfHc5qlHt/oKwJDEylV6L7btZ9j7y2gm+eXUG7ASefUZ5srCf94us
	 fUk+BWVLDujRw==
Date: Fri, 28 Feb 2025 18:22:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
Message-ID: <20250228-factual-rage-0e1e1e48b009@spud>
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8790856232135937853=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8790856232135937853==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5HTFhaoNLB+m4rvM"
Content-Disposition: inline


--5HTFhaoNLB+m4rvM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 08:40:23PM +0800, Zixian Zeng wrote:
> Add spi controllers for SG2042.
>=20
> SG2042 uses the upstreamed Synopsys DW SPI IP.
>=20
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
> For this spi controller patch, only bindings are included.

^^^ you've not actually included any bindings in this patch, copy-paste
mistake?

> This is tested on milkv-pioneer board. Using driver/spi/spidev.c
> for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
> functionality.
> ---
> Changes in v2:
> - rebase v1 to sophgo/master(github.com/sophgo/linux.git).
> - order properties in device node.
> - remove unevaluated properties `clock-frequency`.
> - set default status to disable.
> - Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed9491=
1@gmail.com
> ---
>  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  8 +++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 28 ++++++++++++++++=
++++++
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/r=
iscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index be596d01ff8d33bcdbe431d9731a55ee190ad5b3..c43a807af2f827b5267afe5e4=
fdf6e9e857dfa20 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -72,6 +72,14 @@ &uart0 {
>  	status =3D "okay";
>  };
> =20
> +&spi0 {
> +	status =3D "okay";
> +};
> +
> +&spi1 {
> +	status =3D "okay";
> +};
> +
>  / {
>  	thermal-zones {
>  		soc-thermal {
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts=
/sophgo/sg2042.dtsi
> index e62ac51ac55abd922b5ef796ba8c2196383850c4..500645147b1f8ed0a08ad3caf=
b38ea79cf57d737 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -545,5 +545,33 @@ sd: mmc@704002b000 {
>  				      "timer";
>  			status =3D "disabled";
>  		};
> +
> +		spi0: spi@7040004000 {
> +			compatible =3D "snps,dw-apb-ssi";

I thought were were dropping the use of "snps,dw-abp-ssi" in isolation,
and starting to require soc-specific compatibles now.

Rob, Krzysztof?


--5HTFhaoNLB+m4rvM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8H+ygAKCRB4tDGHoIJi
0n2wAQCLvQ8ZMOWUD0T2/OYl1/lAg6L9QMRCqx+crVNoQ6oyJAEAwoY+HGNeol8+
sKuPMRdwNeSwauRr9jNk0DoRyGuLVw8=
=HgAK
-----END PGP SIGNATURE-----

--5HTFhaoNLB+m4rvM--


--===============8790856232135937853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8790856232135937853==--

