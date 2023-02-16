Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7963EC636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BnrKsvcbzJ9Do74XsFAxiqYmDbfwth0tQWjLf15p/o=; b=p5SlFBAxJPbH3WMTYCTdxE4jqb
	zp6DvZbmQxu7X4PCdBVO8AIsn6HsgGDnfHyOMzbUcuQDZGQfrOYhLi23OHkzoizqJYb+8I09HkwhX
	LfitFhlDyJ/9AHgmt8CWtXFEdmV2KkEyksO22cpM66dUNEdu2nvuU7jfktlMijQ6ZWIYbG+w0kIwC
	Vp5mu078o34Zu5cJM1mKIKV+J4VEjwUh4emG4Ju7kaQx5i204N1FA3oxzAulcEHPfV0E48aImVVIk
	ACVTdDtU7qKOPZSwyaH2XGXackyCT1THW8y8JAbJdq0/4MtD2uaYFJTYTOSMbvXLpFNtVRQatFBWV
	vzprVPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbW9-009ZNN-8m; Thu, 16 Feb 2023 10:29:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbW7-009ZMK-0G
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676543371; x=1708079371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9gLgZeRie+5X0NWOfUFylDfDXdQvE8EQTmZGjjxlp8A=;
  b=dFA5G8vLnYaohUXoIsVj5vQ+zYG3CWH5I9Pnwe+qOqxohlEcqr9143I6
   RYkas1iuHvE63/tQV+LUpRq3wQ2u7OVvHfVdWolwlze7tiNO3TgjMrENG
   pyfkHjEC12olJY8566+V1II9s4IN+tskYaVyLnU/0v/1fqX9oVi3cMkpT
   r0okAbbNPvOf+c4T2PQz8WTKqEYLw4Gpc6fkJ9EnIGGJYUtzko+vIV7Vp
   ykRNeZ22ZVxyFYR1yDJ04yJpTVQwHZZXOh0Px4xP/FOyLc64XfLzlEuwT
   O1xCqWpxSoqF+yqw0GxkenKQReoGHirSgEaDIf2fpfP82Da+ZoP/AuYdF
   A==;
X-IronPort-AV: E=Sophos;i="5.97,302,1669100400"; 
   d="asc'?scan'208";a="201233189"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Feb 2023 03:29:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 03:29:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 16 Feb 2023 03:29:28 -0700
Date: Thu, 16 Feb 2023 10:29:02 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: William Qiu <william.qiu@starfivetech.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Message-ID: <Y+4Fbrz8EYIGyjVj@wendy>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org>
MIME-Version: 1.0
In-Reply-To: <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_022931_072949_5BECDA83 
X-CRM114-Status: GOOD (  13.81  )
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
Content-Type: multipart/mixed; boundary="===============5820377888241211239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5820377888241211239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ra2G7SmeZgRSrojk"
Content-Disposition: inline

--ra2G7SmeZgRSrojk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 11:23:00AM +0100, Krzysztof Kozlowski wrote:
> On 15/02/2023 12:32, William Qiu wrote:
> > Add documentation to describe StarFive System Controller Registers.
> >=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > ---
>=20
> Thank you for your patch. There is something to discuss/improve.
>=20
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - starfive,jh7110-stg-syscon
> > +          - starfive,jh7110-sys-syscon
> > +          - starfive,jh7110-aon-syscon
>=20
> Maybe keep them ordered alphabetically?
>=20
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    syscon@10240000 {
> > +        compatible =3D "starfive,jh7110-stg-syscon", "syscon";
> > +        reg =3D <0x10240000 0x1000>;
> > +    };
>=20
> Keep only one example. All others are the same.

With these fixed:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

@Krzysztof, I assume the location of the binding is okay with you since
you didn't object to it & I suppose this one is up to me to apply if so.

Cheers,
Conor.


--ra2G7SmeZgRSrojk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+4FbgAKCRB4tDGHoIJi
0jqYAP40NbZNtujRwbP0JCaq9jdkbggGcHng7GimVi2bqkmsdQD/UXYjPT9A/qo3
5aV3tPPs1rRe2G1HjpgQ07Ubn/Ck6gs=
=PPhL
-----END PGP SIGNATURE-----

--ra2G7SmeZgRSrojk--


--===============5820377888241211239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5820377888241211239==--

