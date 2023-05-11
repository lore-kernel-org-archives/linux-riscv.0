Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EE6C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ft5QSyqaWY/H+35ywGhPpwrevNPs+Sf+VYo7EzDpF4E=; b=UhjdCuNSeFrroLmIgEpHiogmD+
	jowzbanQr95QQDDLace9pMJSxTAUO/pCYpHHHd+xQKrQ107f/5yjqDUvH0lkLmY4ZFIZKBD2z2du6
	HMT5eHtG1JlhPEDn5RGZb/oa7YfWaiWuKZnIsv5HWppWX3mYybMEhvbVLWL/o/dyXVl2x14tbYT1Q
	PSYUObtTHZaPqF1MN3UWGupNn93MfEdjQo9YoKrnl3fYHJsfxDHnpIShBWPtikO5JlHLvwTNJeFth
	Hwb1yb7zEgSfn8eIdZJugtNHDoTO8KNUiFcNbArVFAMOKHGBsTSzIlaYLlbc+LKVkP97WCeFymWIs
	al6/ik2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0gN-0087fR-0o;
	Thu, 11 May 2023 07:25:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0gK-0087eh-0w
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683789944; x=1715325944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hj9/Xos0c73jvpI7skfzLdMH/vZFNW5unlnGn+GOZFg=;
  b=y85M5aY/7JHL7UFwTIJkcf232EyTfGeOkGD1s27JOZSpQZ0MdVWJqwt7
   Hxp8VA3yEEOKQGuUuBggfr25V42YSUy8ZSeUTHU76x2EWyW8rhmVxj6LZ
   l8ph4lIoaembQFeZ3ZWdKW8HlnvdK3L3XBORh81LErGYTo2bwWbJ+ZFn8
   //RWucUDg/Gfv/GZXDsTuE30bz0exs6h61K9MpUYGMsW6g7uyFVxS+blK
   7nxZYSjWmA2cXnVFcjgVz2moa0hS8jll5aQhArKZEir1bF+e4YDWcSZi5
   C9/jxGx77zQvAfp1jndP9UherGYvV9Ov4GW+E8ep6tQcnsrrlrSRaZG1G
   g==;
X-IronPort-AV: E=Sophos;i="5.99,266,1677567600"; 
   d="asc'?scan'208";a="210719448"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 00:25:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 00:25:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 00:25:35 -0700
Date: Thu, 11 May 2023 08:25:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Pranavi Somisetty <pranavi.somisetty@amd.com>
CC: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>, <git@amd.com>, <michal.simek@amd.com>,
	<harini.katakam@amd.com>, <radhey.shyam.pandey@amd.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: cdns,macb: Add
 rx-watermark property
Message-ID: <20230511-canned-gray-005130594368@wendy>
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
 <20230511071214.18611-2-pranavi.somisetty@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230511071214.18611-2-pranavi.somisetty@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_002544_409952_103DA315 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Type: multipart/mixed; boundary="===============5318424878000837232=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5318424878000837232==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H+osmLhakqf8SYZU"
Content-Disposition: inline

--H+osmLhakqf8SYZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 01:12:13AM -0600, Pranavi Somisetty wrote:
> watermark value is the minimum amount of packet data
> required to activate the forwarding process. The watermark
> implementation and maximum size is dependent on the device
> where Cadence MACB/GEM is used.
>=20
> Signed-off-by: Pranavi Somisetty <pranavi.somisetty@amd.com>

Please send dt-binding patches to the dt-binding maintainers and list.
get_maintainer.pl should have told you to do so & without having done
so, the bindings will not get tested :/

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Docum=
entation/devicetree/bindings/net/cdns,macb.yaml
> index bef5e0f895be..779bc25cf005 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -109,6 +109,13 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  rx-watermark:
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Set watermark value for pbuf_rxcutthru reg and enable
> +      rx partial store and forward.
> +
>    '#address-cells':
>      const: 1
> =20
> @@ -166,6 +173,7 @@ examples:
>              compatible =3D "cdns,macb";
>              reg =3D <0xfffc4000 0x4000>;
>              interrupts =3D <21>;
> +            rx-watermark =3D /bits/ 16 <0x44>;
>              phy-mode =3D "rmii";
>              local-mac-address =3D [3a 0e 03 04 05 06];
>              clock-names =3D "pclk", "hclk", "tx_clk";
> --=20
> 2.36.1
>=20

--H+osmLhakqf8SYZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFyYUAAKCRB4tDGHoIJi
0jMaAP0Qag2Eb48tWi3gGaw/nHxQP9YRqnaVqNrnLGsYG7A38wEAxpLH3SseU5ek
OeYBBUqOa21Fw8xZH0uSrW8O94TXdAw=
=B22H
-----END PGP SIGNATURE-----

--H+osmLhakqf8SYZU--


--===============5318424878000837232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5318424878000837232==--

