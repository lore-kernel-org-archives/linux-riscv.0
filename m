Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4B6FD8764
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktEh2OfZulSJygbwWLrBam3jWPB8DU/3baqIkogr+/E=; b=YyOAY4tVdwIEaGSh1ob16nTpnm
	iZcSl3iC744J5FpjdBGjMSvP2BCJ+Mankra6myA4p7PVnzkAgSGG/tsVtgbM8/IU+FPBxjlS7kjrV
	zJSy8EMPUVeY+1lwgS6NPsLipo++rtgFV61+9N9hUHT+E8H/avpl7u2ShHWGcEwQB3KjO++obYirC
	bGZDyA57F4qzzqrk9VkQhgfcHHnHedOAVOyHHbwkfuFXXWsF7mZ9yqAj22DG2L7ZuvrY1qA2Tsaag
	dzonHkb5+ZEFpucl6CzR+2ckb6NC1XkctUmdTh0A+N11UF5zE1WYoGoECcG2gybjtcpUpEXg6qgQn
	Hlr/qAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TxO-00000006L2H-3qWj;
	Tue, 17 Mar 2026 12:55:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TxM-00000006L1l-44mZ
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 12:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 012A460008;
	Tue, 17 Mar 2026 12:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9B3C19425;
	Tue, 17 Mar 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773752131;
	bh=JjzTP7hmp1XcE7FvW69lGHkfiLxgys4jXR9NwDPJZHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+p6n/jlYOqTL1GKPlXe3s+fY4jFeIO+PMtxymQ8kOyB4MOY7pNsK/41pb0AkU1kI
	 eHuo1eN6Il+Z7yn2xOVcpip3IKqn6pYPlN2isod5lb+sYPJWt5mmPHzvEidB4JmosI
	 WtHWZNfFzG9WFcm8irnejmYHX3V1/IcJnLkRbs50tzmnq/jNthYGMcspArBxmoCQBX
	 BSe8NkzR4pX/7VmsMBx36/Rwj+tzxREi6pie0juXYfsOhUjDPdGoDCFzL4LFlTZNB7
	 Mj83zJsmPb/FlrD714JrJ0G2iJWssWHDT50k2wln0tiP7zdL0tQc0tiWKfSjw2SDQU
	 nPQlHQTKAZ6Hg==
Date: Tue, 17 Mar 2026 12:55:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260317-shortness-gecko-72f14fbc79f2@spud>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============4312360951181449835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4312360951181449835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EuN2sbgx2TXCBXAM"
Content-Disposition: inline


--EuN2sbgx2TXCBXAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
> The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> USB2.0 functionality, and requires only one USB2.0 PHY connected.
>=20
> Explicitly reduce number of phy property to minimal one.

Is this valid for the existing compatible, will it work with only one
clock?

>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml =
b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> index 0f0b5e061ca1..cc27b363ca79 100644
> --- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> @@ -27,7 +27,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: spacemit,k1-dwc3
> +    enum:
> +      - spacemit,k1-dwc3
> +      - spacemit,k3-dwc3
> =20
>    reg:
>      maxItems: 1
> @@ -42,11 +44,13 @@ properties:
>      maxItems: 1
> =20
>    phys:
> +    minItems: 1
>      items:
>        - description: phandle to USB2/HS PHY
>        - description: phandle to USB3/SS PHY
> =20
>    phy-names:
> +    minItems: 1
>      items:
>        - const: usb2-phy
>        - const: usb3-phy
>=20
> --=20
> 2.53.0
>=20

--EuN2sbgx2TXCBXAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCablPPQAKCRB4tDGHoIJi
0kOzAP9IrBhz/9lUWu6n36ZzFVdy7rbYI2ZzdxCKDRsfR4RKowD/UYnpNrGUAgeX
VhlMZkWPWooLosGBq/M0pO1VFGiCvQ8=
=DUTM
-----END PGP SIGNATURE-----

--EuN2sbgx2TXCBXAM--


--===============4312360951181449835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4312360951181449835==--

