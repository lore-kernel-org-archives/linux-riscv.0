Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CF6C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgYc8donZWAZXqkyKW4dJCc2XXQQGa/BNmwEWms7Reo=; b=306W5Lkf7pDMrI8t9W+PtOXEvb
	gOYa8X95PQ4R7Q+GAXP8thlaJM0lOC/8rdRbO0vdWoaDqLYIB3gj7WtLtq5ScWK5D8qcD27TAocOI
	WeT3M66BoM93YZnyKv/DoyBqVp1FgG94IFfhvHuEXShztYp3lrhVLe2wxUHAUEdOKRwHbXevUNZM2
	2XEnPLo2OD1brhpQ56h/FIB3F2x7gnm9r8LkZE+NpORp8wwXfPLx+btBlWqUiR7WlZecfNOzpLgqR
	z377zXagnY4eCcVVZ1l1QmGcEiR2eo1ugOrhtUbXaHfuVKZN3SDtDtRy4MWW8vrqYyo3r8RZRk/+l
	iNvcKOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb2G-0000000FfrQ-4BfM;
	Tue, 18 Jun 2024 15:46:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb2D-0000000Ffpk-1TJr
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 15:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39817CE1BBC;
	Tue, 18 Jun 2024 15:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FA8C3277B;
	Tue, 18 Jun 2024 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718725570;
	bh=EK96rzd5A3P5K/VFg0/wmbgbJAOIBXdNn4AqTodCC/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYixjFojwYot5ptgE8zN8lK5mY7IGCZXpxfYVbMszYvYSEelI8lHUao3DGvWPlg5k
	 hwwBLEExc0JXQTUQEdNha6rzAP2jPtpp8ldU5kgLqN3GYKPau2dfXWsCnNhaNF5USA
	 df5CVUGzm7k5TcAVbPbxrguu5YUnli+5a/oZVpB/Utc0bDOWzjomV1oxRkvEezJfCe
	 +ywNochVPUF8sy7hEux93xLluKCRITb2jLFd25wiNIF0dVmIu9ivjt1CJ0xpKVEfV2
	 WIkaTxxUPB+QLqTWgRxm9nvqDKjvbh/rEKttRQf5raAX8mIWr7HOCyjHnJg1QZVa9G
	 /PBLff63dEzpQ==
Date: Tue, 18 Jun 2024 16:46:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/9] dt-bindings: vendor-prefixes: add spacemit
Message-ID: <20240618-geiger-morbidity-89f93030cc40@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_24CA6BAF3BB2E3A6C490854834FAF2E1080A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_24CA6BAF3BB2E3A6C490854834FAF2E1080A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_084613_655507_C454B40D 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: multipart/mixed; boundary="===============3854751198888106422=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3854751198888106422==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cwg5FMgi/syvrj0E"
Content-Disposition: inline


--Cwg5FMgi/syvrj0E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 01:20:46AM +0800, Yangyu Chen wrote:
> Add new vendor strings to dt bindings for SpacemiT K1 SoC.
>=20
> Link: https://www.spacemit.com/en/spacemit-key-stone-2/
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Same nit here.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index fbf47f0bacf1..7ee6e4a89376 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1362,6 +1362,8 @@ patternProperties:
>      description: Sophgo Technology Inc.
>    "^sourceparts,.*":
>      description: Source Parts Inc.
> +  "^spacemit,.*":
> +    description: SpacemiT (Hangzhou) Technology Co. Ltd
>    "^spansion,.*":
>      description: Spansion Inc.
>    "^sparkfun,.*":
> --=20
> 2.45.1
>=20

--Cwg5FMgi/syvrj0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnGrvgAKCRB4tDGHoIJi
0ngRAQDHlcWYxf46LvAXnaqeqZZo+TyovpuMV8gHkopB9T5GoAD9EIEWKyaHtlRf
RkUEtENONd86bn0hR/ZFzPCvY/u2/As=
=ho4q
-----END PGP SIGNATURE-----

--Cwg5FMgi/syvrj0E--


--===============3854751198888106422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3854751198888106422==--

