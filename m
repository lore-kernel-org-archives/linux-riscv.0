Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCFDC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQaj0qNoWyENnW5S2rkm9wzoWzBzy/0sU13/5/hT2Jc=; b=YGRUQgZQ0kuZk8R9X4JP6PhVy+
	NaG3sjiOt8fLL56qPw861CUzMUPNPJ7rzLwr/30ch3kjeDcUSvFTF7A74W0jFxSUnnei3r3V3gRTf
	3t5wMqMmLGmyrZl4veCc241kffSWwfxI0x4Pl//lnOfJ5popieKDbtVFxCsIXz2W8PPicWim3hH8n
	6OzGgnd9SxMi9YKYxPUAmGhU5TGow5cWe99HR1l3SdJVMt4eS4FBth2eJQUEhvpLRlWaCMOhV9aFg
	UaU338WlVXlyJ26uaDKAHdAI8vhZHChbnSQjBeAmbl3RpyCMeLqQfR+nHjq+C+PsIF4qd75KQvgUW
	+Hcz78Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzK3-00000001EQk-1yOy;
	Thu, 25 Jul 2024 14:19:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzJt-00000001EMu-2UHK
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E19261425;
	Thu, 25 Jul 2024 14:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA61C116B1;
	Thu, 25 Jul 2024 14:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721917188;
	bh=xSXbpBKVBhuZ4AyMY+6MQuhpMHVCd4YhhxciNhrGcMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOIwYLb4PE900cdK78Zk1zR+oad48KV56rFvEz0yj57Nt7qkbpnCBJW8vukMvV/gb
	 gBs1EhqtoLtDT1rkEIdxxD7x5ssQow1s1ahbS6nSbU3cysVyVUK+6kt+EdrI0KvdG+
	 xCf2dSxfBC6EfQNtHMM/tPmCmukVPN8dFK/DXcWRelYSZNqCH2Nc5Stl8U2wc1UgRf
	 LhnmnM8w6Aeplpc4X6YXiB6nuZxTTtnDQg2Ulur9SwKsht4OWOZVCV97jkJEiBz9F2
	 D77BtymVLs0lg5LiOg6SRFaSiAFL9TbU0feh4ngdaYFODeleZmRXIQDH0vjYy/HcLO
	 Sdrxd0YJmkufg==
Date: Thu, 25 Jul 2024 15:19:43 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/17] dt-bindings: clock: mpfs-ccc: Add PIC64GX
 compatibility
Message-ID: <20240725-trance-creme-d71484a00581@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-8-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-8-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_071949_726061_FA904F44 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Type: multipart/mixed; boundary="===============4068992420095514879=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4068992420095514879==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="duUHs0Bth47OpGBI"
Content-Disposition: inline


--duUHs0Bth47OpGBI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:15:59PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX SoC has clock compatibles with the MPFS IP

These commit messages don't really make sense. It should read something
like "The pic64gx SoC has has Clock Conditioning Circuitry compatible
with that on PolarFire SoC" or something along those lines.

>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.y=
aml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> index f1770360798f..9a6b50527c42 100644
> --- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> @@ -17,7 +17,11 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: microchip,mpfs-ccc
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-ccc
> +          - const: microchip,mpfs-ccc
> +      - const: microchip,mpfs-ccc
> =20
>    reg:
>      items:
> --=20
> 2.30.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--duUHs0Bth47OpGBI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJe/wAKCRB4tDGHoIJi
0slGAP4wp/zEDCscW2AIhOJSwQdtzjmmLTjj+1JuMn38oqByKgEA6ThBH9tWmOYa
PvNEFcO75zEzmND+DCX0MJSXwX4tZwE=
=GAWT
-----END PGP SIGNATURE-----

--duUHs0Bth47OpGBI--


--===============4068992420095514879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4068992420095514879==--

