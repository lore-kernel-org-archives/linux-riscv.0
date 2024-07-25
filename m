Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B16C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoryTFibN/XBxF6ctzOnHenRpuSvWAFjqhzCE76c6RQ=; b=Lup4P9MukDxKIF3LUUbudjtCSc
	nFxOVdP9gMwbxvk9NVQQHWJzf0DPthwFK0BqZas3m4DLvSuXBb2S3WKi1bdG/VKaShYMQjhxfR7A8
	vvC9Cz6WVa/UzQ9V2HXEEE5GeB18Z4/OcMmzJixMuAvHAxki6XDBuWrSTlYXFZOPAJ9ww6K+nw4Vd
	XiAImpyJnZ8PlSiFf2iWHcFXa1AjxfOLIb3RUWB9dxvmL8NMMT/1XyHDeE4go2nLImXE/kKH1Cd42
	mHsr6mzNHMmgBXCz5fr5JAuPvhj56W+kOHeki6OwUOXAE4nwkSYMvL2RAS2OwEjF9FxhCpM7CZlSu
	8aV4LWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX1bB-00000001aSv-18a4;
	Thu, 25 Jul 2024 16:45:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzHJ-00000001DkM-1cTl
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 14:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p9v6DHeF2/R8D4FxfLcOXJBTu8Z4fzaNmL3n+nmshpQ=; b=RxMq1BjmDaJyi6naRNxRGN0zCi
	9MiFNvmX7MruoLTwyqPVwgWzIU3m4Ytr2aXA9hjoa97/BnccqrhAmoviImJc3y3c0KNsw+Sr57IL7
	nIjDP2CNj10PCDVt9NiZXYqdGdPl9lgjobp10mUo5aaOBNnXpEY2HCtxmD04e1DfCe16l6howQSYY
	70DDRd2ut/LpSC4ycBS54gpWrKVKu6U7gz/+OPGlkdMZM1Qka14xTYd70FgwvTjhdF6MoAANyMyjW
	zXB2UwaDBT+TFq5JUXcTNSA+feYz9w7PC2VLLE1tgesHR8VGoaVsjx+pAFfUc5ZyDzMfo8s0964F6
	9o+Bts9A==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzHF-000000042BM-1qex
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E67B7CE1398;
	Thu, 25 Jul 2024 14:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28039C116B1;
	Thu, 25 Jul 2024 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721917019;
	bh=r6dCvysR3gN+kQ220XRbk7Ss9uWNopX4IArNIRfBQc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWGPRl6zUNWx//VydX3Qz57Lx0NRWH9pBjs4uMmJFpFaShaLmH2v3fphuClc6FlCW
	 mIw2EG3AXtn8nK/a15E+xEfiMEWi9yNnMDcMyOLyc73w/EH7uvn6Ro0UIk/otz0Hg7
	 vkaW/dJpnWEqPBA62qN5Cvt0dML3/XrZksIjjjy/OWAwXMOCDhzoEZQR3n48rVwuwx
	 OipZfdgOXWZx4QQ6o6FIBnCvbs5M0Fsglk9807713lDlSqprbXcbrw36yXe95Y1EsK
	 +VJEGJKG8/8MrLO1jatwaroAvka5fL2P05ARTNshaXn3sPreuvPtp+DhuNtay3cfHi
	 3nW5z291YIMAQ==
Date: Thu, 25 Jul 2024 15:16:55 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] dt-bindings: mbox: add PIC64GX mailbox
 compatibility to MPFS mailbox
Message-ID: <20240725-treachery-revenue-80e5262190b7@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-4-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-4-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_151706_145381_FB0D6AFC 
X-CRM114-Status: GOOD (  15.06  )
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
Content-Type: multipart/mixed; boundary="===============2192332795880117833=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2192332795880117833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T+jEq7Zw12QY1R2P"
Content-Disposition: inline


--T+jEq7Zw12QY1R2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:15:55PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX mailbox is compatible with MPFS mailbox driver

I don't want this one merged as-is. The mpfs binding here is wrong, and
doesn't describe the hardware properly. One of the regions should be
described as an mfd or syscon because there are several unrelated functions
(hwmon, a reset, mailbox cr/sr and trimming) there - see pfsoc_control_scb
in the regmap for more information. The mpfs binding should be fixed,
rather than adding something incorrect here for the pic64gx.

I'm on holidays atm, I'll try to explain more when I get back.

>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbo=
x.yaml
> index 404477910f02..9e45112e185a 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.ya=
ml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.ya=
ml
> @@ -11,7 +11,11 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: microchip,mpfs-mailbox
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-mailbox
> +          - const: microchip,mpfs-mailbox
> +      - const: microchip,mpfs-mailbox
> =20
>    reg:
>      oneOf:
> --=20
> 2.30.2
>=20
>=20

--T+jEq7Zw12QY1R2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJeVgAKCRB4tDGHoIJi
0sn3AQDgWg2Pm3tJQgDQV6PDReudh0FuTvKUewdsyxYm7or+hwEA1iiLwvJYd5W7
UemNeiHfI7e9Zv6mK4rizbYb73L7Tw8=
=GTjB
-----END PGP SIGNATURE-----

--T+jEq7Zw12QY1R2P--


--===============2192332795880117833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2192332795880117833==--

