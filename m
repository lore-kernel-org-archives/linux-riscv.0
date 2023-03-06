Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F32C678D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvnmVqZjDpcebRR2gCIVkVHPxcXybnOpSQpJxBUTf5k=; b=WhbT7j/oPNEY3Ce/fjwNNs1l0Z
	HqsR9rL8kBDNRE4e7Qwor6yFUHJMfyiN5xqDasAfS4vP+6gznVo1VMS/M/qERNo3DMHhjoSVcSOu3
	j311hdkSJYjvotsRffO8oyj/5bD/HkWVAvvZvsjltePIjlDL1N39zTpQglvq333qLlRuGaOadH+dh
	itaFHCmq+Wu8ssm2YzJhP3H+RDFpn9Rym+o46iNrCn1WPirimZH9AHIjyYwcBLFuvPb6o6IjfyPjH
	3unhJIfA4sEBYeXZDOh5njQRzcvzuG7/l1U3cAAlEpWAvR8TAnQYI9Bm9dciXcsXyCvUyZKCdrSpI
	nV4hGyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBT6-00D3JM-44; Mon, 06 Mar 2023 14:05:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBT2-00D3Hc-3J
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 14:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678111532; x=1709647532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j460tnFBqbOnjRtbkvJml91BluSKepD3j5MyrI06lZY=;
  b=jN5L7KZ7+OsGRrMzfE9G5PUERHXa+xW03gmb8tK3A6shtXXdJlQ2K0ET
   /eOkaINhreQZjLYoeJngUopbac3RNkHXlyn/Im61UfQP+DF/pq3MAd122
   muqlablnrAQZAbzRAm7+CkkLZ5jrdglSegjMK8ud4BHvuPlq7G4G1cwZX
   02NznqHuvRT5KILgXUXPvn+k+cjg9aSgl5258za7OiWEawp5dT9m30c0y
   xseyTdAKf5zg1B+fojjpZuwR6pHdrS5Ex7pj5EXJthKcYPnS9iQXch9Ud
   2sSCBo/xSWwA1/JiBpaA9XxlPokkG+9j8Xt3IVzBbiI8If6IfAzKRuQVB
   A==;
X-IronPort-AV: E=Sophos;i="5.98,238,1673938800"; 
   d="asc'?scan'208";a="200138216"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Mar 2023 07:05:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Mar 2023 07:05:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 6 Mar 2023 07:05:25 -0700
Date: Mon, 6 Mar 2023 14:04:57 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: William Qiu <william.qiu@starfivetech.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Message-ID: <ZAXzCfs7wkxaUWN7@wendy>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org>
 <Y+4Fbrz8EYIGyjVj@wendy>
 <8388695b-98f9-223b-1e15-86aaefec2d6f@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8388695b-98f9-223b-1e15-86aaefec2d6f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060532_223873_125F5C8F 
X-CRM114-Status: GOOD (  18.64  )
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
Content-Type: multipart/mixed; boundary="===============2396474146288990746=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2396474146288990746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wJtNSCpBxG2n/Eo9"
Content-Disposition: inline

--wJtNSCpBxG2n/Eo9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey William,

On Thu, Feb 16, 2023 at 11:31:45AM +0100, Krzysztof Kozlowski wrote:
> On 16/02/2023 11:29, Conor Dooley wrote:
> > On Thu, Feb 16, 2023 at 11:23:00AM +0100, Krzysztof Kozlowski wrote:
> >> On 15/02/2023 12:32, William Qiu wrote:
> >>> Add documentation to describe StarFive System Controller Registers.
> >>>
> >>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >>> ---
> >>
> >> Thank you for your patch. There is something to discuss/improve.

Could you please submit a v5 of this, with the bits below fixed,
whenever Hal sends their next version of the base dts series?
There's no maintainers coverage for a soc/starfive subdirectory of
dt-bindings yet, so please CC conor@kernel.org &
linux-riscv@lists.infradead.com on the patch.

Thanks,
Conor.

> >>
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - starfive,jh7110-stg-syscon
> >>> +          - starfive,jh7110-sys-syscon
> >>> +          - starfive,jh7110-aon-syscon
> >>
> >> Maybe keep them ordered alphabetically?
> >>
> >>> +      - const: syscon
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    syscon@10240000 {
> >>> +        compatible =3D "starfive,jh7110-stg-syscon", "syscon";
> >>> +        reg =3D <0x10240000 0x1000>;
> >>> +    };
> >>
> >> Keep only one example. All others are the same.
> >=20
> > With these fixed:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > @Krzysztof, I assume the location of the binding is okay with you since
> > you didn't object to it & I suppose this one is up to me to apply if so.
>=20
> Yeah, generic sysreg devices go to soc. If their primary functions were
> different (e.g. clock controller which also is syscon), then they should
> go to respective directories, but it's not the case here, I think.
>=20
> Best regards,
> Krzysztof
>=20
>=20

--wJtNSCpBxG2n/Eo9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAXzCQAKCRB4tDGHoIJi
0vj0APsEG0BpMkkdDazmeJqsM4kXPSsQBhKaSl/nXRDAbqD8GwD+O0NncG358/h5
GJTAkWmJAdokfjZhfNFmBhbBeRylkgU=
=Y/Ml
-----END PGP SIGNATURE-----

--wJtNSCpBxG2n/Eo9--


--===============2396474146288990746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2396474146288990746==--

