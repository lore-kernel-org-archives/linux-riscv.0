Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978A0C83F14
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1hGrNtRzncIVmEK4b+iij9HQhhtz897iuMpUJTFFTU=; b=sFdw8I8VIj11feWkpKYE4abQqa
	JZ7sNXXG3kmWKltvGdIEmStsCu+oLhHt8ueR6/UydtPcA/+w0olqYWXxExL+FYvOYGlhyHCFdrS7b
	LY3HLjvsVDs/P+PpzDc3OY8lWpns1qAvVstrhpKwXv51On3FmoOQr+8A/FkBO+wj17QwjdIdOXICO
	FzvBxI+rnpI07bcs0+AAwtiBOeQId11G001WQa8XTpgYJa1lPHvEqYpmkdyuepuHGPksYzNwxv5kh
	82z9KYoWLC3mLVW0AzNaVnID7p4vxilNiK0XpqtrmnHSSPfhwpEUypes3Wc4tsJEyDuHjYbQYnC9Y
	Hh2tvoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFc-00000009g0d-1ZTb;
	Wed, 09 Jul 2025 19:14:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXDx-00000009FTX-0mbY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 16:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 786F9A54844;
	Wed,  9 Jul 2025 16:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28468C4CEEF;
	Wed,  9 Jul 2025 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752076844;
	bh=GoEXxmA+Dj27zsd8ziX2WQulAna4dGReDWUKd8Vxl20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a94vT2rt84gZSUYEQYOq4PJimJ4WvBRG5cgCgI/HHXMOGvq1LoklWN1v+bSjK3YwO
	 WD4vI4heZOeZKeiyAx655rLGJcSfYKonvEKJcSYu61avIOunM6F0gW9CIvz+R1WOuQ
	 JM2+2CYd30LwBuL6wg+zqLBDfs4fMLTvHgnd40DvbwYRsPB2bghUEAtEypKrFvITRo
	 JuxuxHeCQRavqF1LtK2SscXcJBmYA/YzA+E84z/6CZPlyOom5qZXUlZnA7lWykK9Vi
	 Ufnbyx2q/AUC9R1Zn5D58cffCuu8PmxvvX4vqwdhq9ZwNBCcSC4cAqyAhwwSDlLaXM
	 5xBMVXP+6nb2g==
Date: Wed, 9 Jul 2025 17:00:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] dt-bindings: riscv: Add SiFive vendor extensions
 description
Message-ID: <20250709-startup-coasting-aa58a99c5585@spud>
References: <20250708065242.26371-1-nick.hu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250708065242.26371-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_090045_356566_2D4F7B4F 
X-CRM114-Status: GOOD (  14.95  )
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
Content-Type: multipart/mixed; boundary="===============5833360270413860199=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5833360270413860199==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H5XYBjydcd73WNlI"
Content-Disposition: inline


--H5XYBjydcd73WNlI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2025 at 02:52:42PM +0800, Nick Hu wrote:
> Add description for SiFive vendor extensions "xsfcflushdlone",
> "xsfpgflushdlone" and "xsfcease".
>=20
> Signed-off-by: Nick Hu <nick.hu@sifive.com>

You have this, but no user or anything along with it. What's actually
making use of this? If it's just for the SBI impl or w/e then say that.

> ---
>  .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 72c1b063fdfe..10c37c61243d 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -626,6 +626,24 @@ properties:
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
>          # SiFive
> +        - const: xsfcease
> +          description:
> +            SiFive CEASE Instruction Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/freedom-u740-c000-manual
> +
> +        - const: xsfcflushdlone
> +          description:
> +            SiFive L1D Cache Flush Instruction Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/freedom-u740-c000-manual
> +
> +        - const: xsfpgflushdlone
> +          description:
> +            SiFive PGFLUSH Instruction Extensions for the power manageme=
nt. The
> +            CPU will flush the L1D and enter the cease state after execu=
ting
> +            the instruction.
> +
>          - const: xsfqmaccdod
>            description:
>              SiFive Int8 Matrix Multiplication Extensions Specification.
> --=20
> 2.17.1
>=20

--H5XYBjydcd73WNlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaG6SJwAKCRB4tDGHoIJi
0ks9AQC/Q6brAPmhJnR++6Ix8DAoDmvW23xMTc8wvhh0d6IbsAEAxM/WqT0TXydO
bNW64h83RlVLS5t5xy7nvJakYc2suww=
=hXLq
-----END PGP SIGNATURE-----

--H5XYBjydcd73WNlI--


--===============5833360270413860199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5833360270413860199==--

