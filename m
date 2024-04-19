Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B639C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xsYILznluR6Lxrupe6lMzUjC/aX8GRyXwu+SwZHp1M=; b=jX1okINiqbPpvBoPThusthlqiA
	q15Iy5iKYuGewjFnvfS2IivKvO4NH48IoU1gzwtaYGmJo016iJUql5xhuWjQ/HFl3jZFG3RyW0CcQ
	tWoLFgIGrpCWDNNbGzI+K7/v0jkqTSRpklMagowR8UGcDomp050zgyYIvP8KL6uhizZeV1IPzbBzJ
	Vpn7gEYitFYX1+XCIGKHRnyASmg+LBNkvDZJy6sG/hnsyku3l7j7c4n6C4Bp+/g+0IzFvUlxqrGuD
	GlLfUXNymqRH0eHU8lTlXyd1DOrIFb3Dz7slgqkY1ej2ZY0usnijAbnYhjKWHMU3248wfZ1BieFW+
	uFPlfs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqce-00000006H6B-0Lou;
	Fri, 19 Apr 2024 15:57:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqca-00000006H5C-2WI4
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 15:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E026861A1D;
	Fri, 19 Apr 2024 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5B9C072AA;
	Fri, 19 Apr 2024 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713542271;
	bh=8QEDQjOppN6rgrkwPLW/8KvmAUWYG8et7RnU5mOglu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NB10FGA3HUo4FWUdWzr/7uRQFBe3lrvgTHD57CEE1hkQsdk2PFT0iRvsT6WlBsryH
	 R9ECS0tIP+q2ePoWG3IXYHRwrC4ZbdKbm2b6WKVRbsH6kivseIWcvWn1YLLFFCjqnJ
	 +WEiNG9+K6yDDCcarItZTLBsG6w0laG+wVvCVK6NBCvHmYuMpUV1H6260C2irK8N3s
	 N1ICOKTf3K1upQySIskCOkv9FNsFnP6fBdzQmAOw3+O15/uvuu1Td3Jr7hm0nIo9ij
	 ShYAEPNvj7I0A5Guge7e3pn+aQC+rO7on5RMuT9Gg8vururtjFLBW040ID3hA375Zi
	 S69jOsJC2LEcw==
Date: Fri, 19 Apr 2024 16:57:40 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 4/5] dt-bindings: PCI: microchip: increase number of
 items in ranges property
Message-ID: <20240419-batboy-mutt-4da787cffd3d@spud>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
 <20240327-debunk-perky-f5514ca332be@spud>
MIME-Version: 1.0
In-Reply-To: <20240327-debunk-perky-f5514ca332be@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_085752_706927_8056B8D2 
X-CRM114-Status: GOOD (  16.10  )
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
Content-Type: multipart/mixed; boundary="===============5446448881569729797=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5446448881569729797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P5gNKGuon3/meze+"
Content-Disposition: inline


--P5gNKGuon3/meze+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

PCI maintainers, could you please either apply this (preferred!) or give
me an ack to take it with the dts?

Thanks,
Conor.

On Wed, Mar 27, 2024 at 12:24:39PM +0000, Conor Dooley wrote:
> From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
>=20
> Increase the number of items in the ranges property to allow up to 3
> ranges. For example a prefetchable range, a non-prefetchable range
> and an IO range, depending on configuration.
>=20
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.ya=
ml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index f7a3c2636355..e8212a05b7b1 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -65,7 +65,8 @@ properties:
>        - const: msi
> =20
>    ranges:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> =20
>    dma-ranges:
>      minItems: 1
> --=20
> 2.43.0
>=20

--P5gNKGuon3/meze+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKUdAAKCRB4tDGHoIJi
0uRiAP0V/vBz26onjgXgloeZ0gVi8i6q/SLsKfs59S/dQBZHkwEAjywPdUJikVo/
2Y4XvNpmuSZqJZbzHcMQXcsxriJmdgQ=
=nmUD
-----END PGP SIGNATURE-----

--P5gNKGuon3/meze+--


--===============5446448881569729797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5446448881569729797==--

