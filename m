Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13331EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQlQQR+AF66wX2rsY62i1ZCZ5xFV+FJISj2IBfCV3W8=; b=Lf7xomtCUI/JlXN6E1dzx4hl9d
	7MXXWmFRYn/2odUXn76F8Y9B4/lsmQn5UR/XSEVbntVPoFIdWZqOcDxBgEKepg7mZEqk6zY8FykZ/
	vdcqoDnq5Bh9hKqLD/GBDbYIKrcLra91b+qRfYE1HQePsHmO1MgiJ2LMV1GPcSNe/eJI2+TGZzwCB
	8Zi4EcOSKeglwh6DhZw08tHeNyjP7R+B8Phd4rMNStDRmrttrbx2rjfN0IgGF5lEbvMBeHsAgGvUs
	cQ9eDVN/oJamQPQ04Yvj5EqkGcVsaZSSc1UetHVCl06QlQNklSZF4z05FWQs5qhQHpF2Xg3twYlDq
	FNsSOjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZHn-00HZNm-0P;
	Wed, 12 Jul 2023 12:49:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZHk-00HZMh-0o
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 12:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689166175; x=1720702175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AHerdfplQxVzMVmIE7yitFw6DX49G+yaoHF+TRw2CtE=;
  b=pHBCeCxQTkDywBhGLUPf7GledHTiOI2BuKcRNjM+xWr1a0Fdo+7eAqY4
   +KFnJ63VczJx47jXnoNfblgWtNbusx6CHFdObdNmWQslcO9jdt5yZeFv2
   D+S4g7+ovTxtqy7kQ31p/2iv/6Zb1hlz3ftAC9HBMkV5uhJ7+uQQ0cRjW
   6yjhfiEoiE5zmdL8rY1pteY2O8UJVRUAalcNZlVXhBkvIj5OeJ6PAAquw
   t71OgFtGnTOPv9UbW9iMPhWvsXJyvcqSJClUQpy+yunVyQ6ki1rM4zCyn
   zWNzWXtmTo+ItVVeIuN3IWyaup93DWCi4P+hDh9SKXOBfwqmYAnb4/UMg
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="asc'?scan'208";a="161005954"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2023 05:49:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 05:49:31 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Jul 2023 05:49:29 -0700
Date: Wed, 12 Jul 2023 13:48:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Eric Lin <eric.lin@sifive.com>, <conor@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dslin1010@gmail.com>, Zong Li <zong.li@sifive.com>,
	<vincent.chen@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20230712-parking-acting-e91f24204467@wendy>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
 <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
 <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org>
 <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
 <f5275617-d68c-c76b-d799-106f67cc2071@linaro.org>
 <20230712110908.GA23216@hsinchu16>
 <0865b422-d587-c1c7-9463-510832ddddf4@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0865b422-d587-c1c7-9463-510832ddddf4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_054936_349214_FBE328E4 
X-CRM114-Status: GOOD (  30.16  )
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
Content-Type: multipart/mixed; boundary="===============7632383746466785425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7632383746466785425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CU9LDp6QRihEXXU7"
Content-Disposition: inline

--CU9LDp6QRihEXXU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 02:30:06PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2023 13:09, Eric Lin wrote:
> > On Sat, Jul 01, 2023 at 10:22:25AM +0200, Krzysztof Kozlowski wrote:
> >> On 28/06/2023 18:31, Eric Lin wrote:
> >>
> >>>>>>
> >>>>>>> +      - enum:
> >>>>>>> +          - sifive,pL2Cache0
> >>>>>>> +          - sifive,pL2Cache1
> >>>>>>
> >>>>>> What is "0" and "1" here? What do these compatibles represent? Why=
 they
> >>>>>> do not have any SoC related part?
> >>>>>
> >>>>> The pL2Cache1 has minor changes in hardware, but it can use the same
> >>>>> pl2 cache driver.
> >>>>
> >>>> Then why aren't they compatible?
> >>>>
> >>>
> >>> The pL2Cache1 has removed some unused bits in the register compared to
> >>> pl2Cache0.
> >>> From the hardware perspective, they are not compatible but they can
> >>> share the same pl2 cache driver in software.
> >>
> >> So they are compatible... If they were not compatible, you wouldn't be
> >> able to use the same match in the driver.
> >>
> >>> Thus, we would like to keep both. It would be great if you can provide
> >>> some suggestions. Thanks.
> >>
> >> I propose to make them compatible, like every other piece of SoC. I
> >> don't see any benefit of having them separate.
> >>
> > Sorry for the late reply.
> > The pl2 cache is our internal platform IP and is not part of any SoC.=
=20
> >=20
> > The reason why this driver is compatible with the hardware "pl2cache0" =
and hardware "pl2cache1"
> > is that it doesn't program the different parts of the config register
> > However, our internal software (e.g., bare-metal software) will program=
 these different parts,
> > so it needs to rely on the different compatible string to identify the =
hardware.
> >  =20
> > Additionally, we would like the compatible strings to reflect which har=
dware is being used Thanks.
>=20
> I don't understand how does it contradicts anything I said. So you do
> agree with me? Or what?

I probably should've been keeping a closer eye here, sorry.

I assume what Krzysztof means is why do you permit both
"sifive,pL2Cache0" and "sifive,pL2Cache1" appearing in isolation. IOW,
both of
compatible =3D "sifive,pl2cache0";
and
compatible =3D "sifive,pl2cache1";
are valid in your binding.

The hardware for both might be different, and their full featuresets may
be incompatible, but they implement a compatible subset of features. I
would expect that the following would be the permitted compatible setups:
compatible =3D "sifive,pl2cache0";
and
compatible =3D "sifive,pl2cache1", "sifive,pl2cache0";

A consumer of the DT that does care for the differences should be
looking for the specific compatible, and OS code that does not care can
always bind to the "0" version.

Do the "0" & "1" here refer to the IP version, as in
sifive-blocks-ip-versioning.txt? I didn't think the compatibles
containing those IP versions were supposed to appear in isolation,
without a soc-specific one?

Thanks,
Conor.

--CU9LDp6QRihEXXU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK6hOQAKCRB4tDGHoIJi
0u6kAQDnxOYwgeV+62r679GBsIIYf5NNa99MaO9EeUMAlI+TNQD9G3vpXDAUE94T
A/l9b6xBjLKF8+2Ag3R54+tIC9OqEgc=
=dQpf
-----END PGP SIGNATURE-----

--CU9LDp6QRihEXXU7--


--===============7632383746466785425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7632383746466785425==--

