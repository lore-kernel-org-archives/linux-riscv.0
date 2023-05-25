Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C1BC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 21:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dgnl6IdLIQHcSV46FEKcO/4EhQv8I1k90PJsGOc9t8=; b=ug5lygdw164kZWCcpCwUlHUyBl
	PuEqT4xppITUHYVk/+RPshjMRVtBkj1m+u+Pci0+LROS2DktGc9ZAN61HHwGhzifCIhbIj1ix+Qx2
	QqOJMq4lRV/Py59xSbhVrs1GpqySxfufVBA4liW84AA8hChFpcsjGcsMxqyNdm2+KwudiDV80NDI5
	lp4gBxjLGEwKG9NHvhVEBaNF9AV/jTUDiJXQ8TRX1go2jRjspaCoNutXd4dOxUzzmfPnDENjzw1HZ
	o4kSlB2Sbn3ysSpwwUu+FXjR01lWhjXsUlXGlAVhb4cZY8USLiRYc1bf+A8oD9Iq8fVMjJgrPW1F2
	Gva7Gokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IbF-000D1M-1d;
	Thu, 25 May 2023 21:34:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IbC-000D0X-14;
	Thu, 25 May 2023 21:34:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB0F664AF3;
	Thu, 25 May 2023 21:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBA4C433EF;
	Thu, 25 May 2023 21:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685050457;
	bh=zZK1RRwMzH2sbsee7VnC7rlgcun9B4/SN/dI3FKVvrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYy8VE1VD0cAgEQuQim7zpsjY9TurkTcJPM8V//GYjopKthjG7swTE5W5MfBkiymv
	 gptEA5LzE3IQ95cBxZ2YaS+ouWHeojSMRaBTKoUhsGIXRsxsxPjsX6TPztQfMhMldh
	 SuTIH5cGrlLwRkrvhRW0H4JvwkVdYq4GVx9hTsSWN0X+ERFX/OkNNQPf1/WVd/JLgX
	 /AFo9muWJpPvbUiV5Vkz+O+/FB7GMsA1yaEPll0FSZXSUItNyIjw43FnpK+hMSGlrj
	 gSxpoHHqT3QTPfco7ev8HFXnGS/mrM0GTn+0tO7TzsMQgFzKyLBSEnWqD1V1v0qzTR
	 X5t+2G3DdOoZw==
Date: Thu, 25 May 2023 22:34:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v6 5/7] dt-bindings: usb: Add StarFive JH7110 USB
 controller
Message-ID: <20230525-shopper-handbrake-27fc06aede32@spud>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-6-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230518112750.57924-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_143418_467155_4F7BC74E 
X-CRM114-Status: GOOD (  17.26  )
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
Content-Type: multipart/mixed; boundary="===============3121331068085490905=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3121331068085490905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLOnlnkMNKq6BWyy"
Content-Disposition: inline


--SLOnlnkMNKq6BWyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 07:27:48PM +0800, Minda Chen wrote:
> StarFive JH7110 platforms USB have a wrapper module around
> the Cadence USBSS-DRD controller. Add binding information doc
> for that.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/usb/starfive,jh7110-usb.yaml     | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110=
-usb.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.ya=
ml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> new file mode 100644
> index 000000000000..24aa9c10d6ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controll=
er

I think you told Krzysztof you'd rename this to "StarFive JH7110 Cadence
USBSS-DRD SoC controller"?

Otherwise, it looks like all the stuff from him and Rob have been sorted
out, so other than $title this is
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor..

--SLOnlnkMNKq6BWyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG/UUgAKCRB4tDGHoIJi
0v75AP9K+Svm5FyZzmMv+llB8XO317ghvBO5MrADfge2KP6pPwEAl0bZpPNFfw8m
AK1S29TZeiBbhbcxD8KECfWuk1118AQ=
=3/eV
-----END PGP SIGNATURE-----

--SLOnlnkMNKq6BWyy--


--===============3121331068085490905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3121331068085490905==--

