Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12907CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNehLgNxaEEj/IEmRNuLsYrXWc9jx3QZV58b6NHP4cM=; b=yqK4UbYa7Q0s4vwPDpLgwhTzUq
	zb2PHXfcSA+Ry44ne8jS6iqB+A2OwacLcZExsKQp8q0qlqPPqzDXP3qFVKPCr8SPCiMR0h5RCoRHN
	hcRByDxBKsnNFLmLyT9uEaiRniTSVL5gvmRPHMHw0zP1zycXl06ZvTUseG2dGjW8YasDv0lKX8cbR
	jandEEfHZDe5aaGCp4MqyIO3Pndv1/mbeugFPPIoHWxVSaajpDc870sbevHY+IH5BvwquuGB5fipv
	/QBNIZSrRdPaVN9T4RwXdmR2JZ5PAwQId+U84QHkx9DL3B3jFI8EsHfI+PhV0hh470YYMNCF8RgA1
	TcQv2F+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXXH-0000000AnxW-3yuS;
	Fri, 02 Oct 2026 07:18:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXXE-0000000Anx5-3jn1
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 07:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790925504; x=1822461504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LKOqFUF1VrzMql9xOqWfSWBZnOUurH7PVS5p9gJjW7g=;
  b=xtzYGX30BDXimaodlkPuhsOaCrOet3JTc4Vxt3+JSWQVi+ELbEE9RZww
   Zn3i7hohRKxeSdQmy6gnGpExym1aTVT3J/yq4dnelWQrRhEStsM6wBVsE
   XdU5T6OMzfdzjl+/rfZMPXAku5Puu77Wa1Z6wE+zsRSlriUksJifOY5R9
   7m/0fHruklotW9k0cFmUHiDJzXcrwq7kH3eT9TA0tPFAPbZsLtprDJzqJ
   Le0pOTi0eWRhk1bqEWVPabBAtxDHFlhml27Uh1PwqI5kbG5RkFEdVQfpB
   S8Adgb1vMsbcqkcDPVLXdnszug/m0RgfkockaBHfgj2QHZGWOOq4rwpsF
   g==;
X-CSE-ConnectionGUID: i0tJqMb/Q1+GnaUojbBUhw==
X-CSE-MsgGUID: sPwnByjRQP6kDmAvWCH9rw==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="asc'?scan'208";a="231582500"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:18:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 2 Oct 2026 00:18:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 00:18:20 -0700
Date: Fri, 2 Oct 2026 08:17:00 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Brian Masney <bmasney@redhat.com>, Yixun Lan
	<dlan@kernel.org>, <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make
 external clocks optional
Message-ID: <20261002-oozy-reversal-e65157724bc3@wendy>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-1-c3e0b5d4c30d@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-1-c3e0b5d4c30d@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_001824_997875_700C6D84 
X-CRM114-Status: GOOD (  16.26  )
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
Content-Type: multipart/mixed; boundary="===============7669181889898372540=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7669181889898372540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nko9mlGfTiTZzztm"
Content-Disposition: inline

--nko9mlGfTiTZzztm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 02:07:00PM +0800, Junhui Liu wrote:
> The external CAN and WDT clocks are optional inputs routed from the
> board; the main oscillator is the only required clock. The binding
> currently requires all three clocks, which forces device trees to add
> stub fixed-clock nodes without a clock-frequency to satisfy it.
>=20
> Allow the clocks and clock-names properties to contain just "osc",
> optionally followed by either or both of "can_ext" and "wdt_ext".
>=20
> Fixes: 155d900e4c7d ("dt-bindings: clock: add Anlogic DR1V90 CRU")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/clock/anlogic,dr1v90-cru.yaml         | 24 +++++++++++++++-=
------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.y=
aml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
> index 11a92588e494..8bd7b78a58d8 100644
> --- a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
> +++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
> @@ -17,16 +17,26 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    items:
> -      - description: Main oscillator
> -      - description: External CAN clock
> -      - description: External WDT clock
> +    minItems: 1
> +    maxItems: 3
> +    description:
> +      The main oscillator is always required. An external CAN clock and =
an
> +      external WDT clock may additionally be provided if the board route=
s these
> +      clocks to the SoC.
> =20
>    clock-names:
> -    items:
> +    oneOf:
>        - const: osc
> -      - const: can_ext
> -      - const: wdt_ext
> +      - items:
> +          - const: osc
> +          - const: can_ext
> +      - items:
> +          - const: osc
> +          - const: wdt_ext
> +      - items:
> +          - const: osc
> +          - const: can_ext
> +          - const: wdt_ext

This need not be so complicated. The following should do the trick:

clock-names:
  minItems: 1
  items:
    - const: osc
    - enum: [can_ext, wdt_ext]
    - const: wdt_ext

pwbot: changes-requested

> =20
>    "#clock-cells":
>      const: 1
>=20
> --=20
> 2.55.0
>=20

--nko9mlGfTiTZzztm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar9abAAKCRB4tDGHoIJi
0hyqAQDEZIKCULEAwrQndVIAevHaJ2R9EhY5vu6x/fmrOPTwXwEAxqtkubDhkZ+1
W0A0l0vK31l0ajK/8nN+ibndkBjaCgQ=
=lnEC
-----END PGP SIGNATURE-----

--nko9mlGfTiTZzztm--


--===============7669181889898372540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7669181889898372540==--

