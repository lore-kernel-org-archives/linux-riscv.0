Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC83CD37B2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQbrWgzD1Dk5ptw5P7DTf16idsaH0z4m5gk+0zucK0k=; b=3u5agnD8cLczBAtoSs1dy6XLvm
	bSuEtnr5HeZtpoEel/IietP5syrxcYEIH+3UdCaQ7YUinJCfOvRWCAUHXTILJ6l6ROeJxwp0JwN+z
	hxwMKDq5/4704LzofotnEL2IFZhvkfsgPXnGhck8afYS6bKl7745nW3Nb5DHybpinpgXDr7dBrimQ
	phzW2lmxgrZYigamKGwTLvm/KTLMfdh+ajl62gI+bFlNd26PiYoYm/qjgKfl+E1Rz9epNHIOdqEO4
	o9Hh0UzFqK7BAL/h4EUyv/uTjg8eGXVevKJGUsjo97fjSOT7R4iNvx9PfmErMoBvxUsqr9PWHS0LT
	FAKtwSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT4B-0000000E8LD-3sHx;
	Mon, 11 May 2026 16:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT49-0000000E8KQ-1SQq
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 16:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3427344216;
	Mon, 11 May 2026 16:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B91CC4AF10;
	Mon, 11 May 2026 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515268;
	bh=2HuFrmcqmrOVVVEJLWAsX3GcJ54PviZDnJzTCse+KvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIw+P1WJ139ZdeZh18cFAJgEPOzYZKXkq5NY9vuGIONy0I0bVmS+1zNOZxc6axGm7
	 FrR1h4nW2Fsnx7z1AYAKyeFwn79bR9r9qLB7CYkfm64KAoqTi5Ar8+HLbMQX53brIe
	 UJK8AvCuglU3Hb4nfKUzSk27r0HPln9hLX1zoWqzLGXXjLGwMuXootMyMoPedBBi2w
	 acZTlgmkAOo3Wg3RfmP+J4hGWajuifA1VDy1zqyOMgdFXn0ZUXdpe7laLp6K85S3Zg
	 D4PPXd31yz6JkoY/gQBO/r7KZppkYvimHrCEI5nDsQLLxHJpF+2G87woLrEeGp8xol
	 NiP5DzGgUk1LA==
Date: Mon, 11 May 2026 17:01:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback
 compatible for CV1800B
Message-ID: <20260511-crave-sworn-3b43371ce11a@spud>
References: <20260511063818.463877-1-inochiama@gmail.com>
 <20260511063818.463877-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260511063818.463877-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090109_430050_39041DF7 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Type: multipart/mixed; boundary="===============3509132796649207817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3509132796649207817==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2fbZeqJoc29vaDy"
Content-Disposition: inline


--c2fbZeqJoc29vaDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 02:38:16PM +0800, Inochi Amaoto wrote:
> The previous version of the binding change only add compatible
> string without adding the fallback compatible, this breaks
> backward compatibility. Add the needed fallback compatible to
> fix this.

I don't understand how adding a specific comaptible affected backwards
compatibility. Did the dts originally use the snps compatible before the
device specific one was added?

>=20
> Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B com=
patible")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml =
b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 804514732dbe..0a30a455b0ee 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -21,11 +21,12 @@ properties:
>        - enum:
>            - snps,axi-dma-1.01a
>            - intel,kmb-axi-dma
> -          - sophgo,cv1800b-axi-dma
>            - starfive,jh7110-axi-dma
>            - starfive,jh8100-axi-dma
>        - items:
> -          - const: altr,agilex5-axi-dma
> +          - enum:
> +              - altr,agilex5-axi-dma
> +              - sophgo,cv1800b-axi-dma
>            - const: snps,axi-dma-1.01a
> =20
>    reg:
> --=20
> 2.54.0
>=20

--c2fbZeqJoc29vaDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH9PQAKCRB4tDGHoIJi
0n/6APwOg5niWfMpu4WYU6LySqCZ3EEoA3wCehMsY5KQ/dRYEAD/TfNSikQqeftQ
UpdvGLy8bfVYXPoeZ5291/4e3aIz7gQ=
=fW1f
-----END PGP SIGNATURE-----

--c2fbZeqJoc29vaDy--


--===============3509132796649207817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3509132796649207817==--

