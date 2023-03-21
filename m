Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AF7C6FD20
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 22:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI5lpHvZy/8Pn0v2z4gi6rGmGthURUew2aF3FSk2Kow=; b=NBvy3WfiBhQEynVwdzhSGiDgV4
	6BNf+rdPRys6JuhHpmQ8RgrtFgW32M3HumBcrrf8/q4Bmr8MkOw40opAa/jv23YDhxEcFWPDe6Hsk
	iJOz5qB9YTJr5+7GICBNxmOmHyQRuVSYdzRkhRDVX9SeYNFB5if3A175r/FJb7XVPuTDEBowmY/cE
	zk/w38lOKahtJ2YDOhZBkrW7Fg6vlOV5DCeT9VFY/mrYX2ixwmMdrdY/NAWRyFfeMSMbgjPb6+btm
	in7fRlEAVUi9lwbnzLDOfkaQsd/oBYXy4/BlFOgOCNTssoMvKG4UJmMDLRUHhJb/fTvZd9XnPFWf4
	IVvJN7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pekAa-00DvvJ-09;
	Tue, 21 Mar 2023 22:09:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pekAR-00DvtS-0c;
	Tue, 21 Mar 2023 22:09:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9E73AB81A46;
	Tue, 21 Mar 2023 22:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E3FC433D2;
	Tue, 21 Mar 2023 22:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679436556;
	bh=jywNbEZP25XOTZg0s8YbV2eIX3RE5vkLLBPIK+u/ySE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrkUUZGKD1eXCrJftt1lQn8XiF7fLosApLIr0bnxzYnVCQzSaA5xwod/LCwwbW8Z/
	 HfOnGOfFvlQ4hAIQQGLiXy0kdtfEoHQVz8qMn0AnvhH9YNTdwNe9m58oVCxpJuvoQM
	 hUVoCDNzo6aPaf8cYlH7QN8rKKxmVO6EYOUW71f9imbQ3RfChI790fIW5r+LzB8g47
	 59uW5gGnYIAJQ4csIoP1a4dF9qKKf036CjK6UU5TQG7RRpVsQ7Q+Id0lxJ3RPxQdc3
	 8RiLwzTmqfRvDCbgPKUD1xxBh0KIkKoCvq4RAAbhPM2QgMvWu5rZx+fmQo6i+g5Xrf
	 lp5RpbvNlPGwg==
Date: Tue, 21 Mar 2023 22:09:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 01/10] dt-bindings: serial: snps-dw-apb-uart: Switch
 dma-names order
Message-ID: <5287504e-c0f7-4964-8a61-fd49b7ee9547@spud>
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230321215624.78383-2-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_150919_781520_AADF1113 
X-CRM114-Status: GOOD (  23.36  )
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
Content-Type: multipart/mixed; boundary="===============7344755454192035858=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7344755454192035858==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yyWiahmxEjVuYmMu"
Content-Disposition: inline


--yyWiahmxEjVuYmMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 11:56:15PM +0200, Cristian Ciocaltea wrote:
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwinner
> D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
> reverse of what a different board expects:
>=20
>   rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
>=20
> A quick and incomplete check shows the inconsistency is present in many
> other DTS files:

> The initial proposed solution was to allow a flexible dma-names order in
> the binding, due to potential ABI breakage concerns after fixing the DTS
> files. But luckily the Allwinner boards are not really affected, since
> all of them are using a shared DMA channel for rx and tx:

> Switch dma-names order to tx->rx as the first step in fixing the
> inconsistency. The remaining DTS fixes will be handled by separate
> patches.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for doing all of the switch overs too. I should've probably
broadened my searching beyond the allwinner platforms when I initially
added this, so yeah, thanks.

> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 2becdfab4f15..d28cc96fa8e9 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -72,8 +72,8 @@ properties:
> =20
>    dma-names:
>      items:
> -      - const: rx
>        - const: tx
> +      - const: rx
> =20
>    snps,uart-16550-compatible:
>      description: reflects the value of UART_16550_COMPATIBLE configurati=
on
> --=20
> 2.40.0
>=20

--yyWiahmxEjVuYmMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBorBQAKCRB4tDGHoIJi
0vyGAQDrKXra/8V/UIFrQD3UAgVFLRIkAIlnoCWPSGwe9HVDMAEAwe3VgGkUrGcQ
QDMvCe69akSjd+Fl/v/4b8852K/B+AI=
=VkVV
-----END PGP SIGNATURE-----

--yyWiahmxEjVuYmMu--


--===============7344755454192035858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7344755454192035858==--

