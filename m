Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE61AC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr2+XRtf08F3frEwV38qvhWtxvvt/5IY0sd9vRpUc9Y=; b=TINw2doM3IvtBfmYXtyQEBd4GG
	lzW5HmJvsYYiIduXAvYoFHzpgdjMiHCA16MiGT1nORujps9P4Nwz1KmUWOCwXhQTQES+rZoeP3i/E
	n3u9FCk1ec12p5b8I02h8YtwKvIQIdu7Ndm2SwEU/mcNdaPSlrn1Um3vvKCYrW+2iDvTJ5IqVCYSI
	0bsMTnnK+LFVujJxEo5WO9MS7MikE0UtI2KEDs51fHmFIBg2DAGxwPK8+RVNf1T6qzTRSOzq5+RIh
	jFqISXoQ5wba63G/guuyW8dztOqyqTpNAlBQWFsyXSeOdIhJPYRiRwVPXxAAQrY15maACqWXM+keU
	Ski/7XwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxrP-00CulL-GS; Tue, 28 Feb 2023 11:09:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxrM-00CukY-Ft
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 11:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677582568; x=1709118568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3EchzkB5Z/lStXH8IV2nakLSYJ/zwXnOAI6aQ1a2oY=;
  b=YNqUJJdmW/SzYKD9dvr9LhDthAUWCFOkthun6O8CPcOSS8A4D8bkl1Og
   diCdZ1PiG5ShYW6mU0aEkytQ1YY789JVfhtaNw6TrAHD1IzNxm98bwVC+
   obGgGB4S2lbItN6f7bEqR0oennFHP+QIW73gW/YGkNeK2XjpERI7e84hh
   AnzMe86uJNlQCcjI2t2M8PPYr3DJlgD5NizoZ4pmROjKNjvAlvHBTPg/b
   OAlWq18eMDT8A24AwHMWL1zKJOJF/SGOTKuSiFKcjF0rGPX1KsdEN1tVn
   zyheQ8lM25u4BPP/9EFDTu3cPsRzA+FFmLofD4IdYFIDWaZgBYoAL5c9L
   g==;
X-IronPort-AV: E=Sophos;i="5.98,221,1673938800"; 
   d="asc'?scan'208";a="139419466"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Feb 2023 04:09:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 04:09:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 28 Feb 2023 04:09:21 -0700
Date: Tue, 28 Feb 2023 11:08:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: William Qiu <william.qiu@starfivetech.com>, Rob Herring <robh@kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Message-ID: <Y/3gxi8ZMWTrnCoe@wendy>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <20230220234335.GA615198-robh@kernel.org>
 <348796cc-72d9-4dcf-9f09-4c2aa55cb858@starfivetech.com>
 <20230227222904.GC1048218-robh@kernel.org>
 <f8d2b665-ce5d-81f8-8c55-81f1a4cb62b9@starfivetech.com>
 <54f51fa0-7821-b67b-b782-eb9a35b7bba9@linaro.org>
MIME-Version: 1.0
In-Reply-To: <54f51fa0-7821-b67b-b782-eb9a35b7bba9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_030928_617558_ED20E389 
X-CRM114-Status: GOOD (  25.40  )
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
Content-Type: multipart/mixed; boundary="===============6325474106315111343=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6325474106315111343==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X8n4J7EvKMl6UgmW"
Content-Disposition: inline

--X8n4J7EvKMl6UgmW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 11:37:20AM +0100, Krzysztof Kozlowski wrote:
> On 28/02/2023 10:05, William Qiu wrote:
> > On 2023/2/28 6:29, Rob Herring wrote:
> >> On Tue, Feb 21, 2023 at 10:44:02AM +0800, William Qiu wrote:
> >>> On 2023/2/21 7:43, Rob Herring wrote:
> >>>> On Wed, Feb 15, 2023 at 07:32:49PM +0800, William Qiu wrote:
> >>>>> Add documentation to describe StarFive System Controller Registers.
> >>>>>
> >>>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >>>>> ---
> >>>>>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 51 +++++++++++++++=
++++
> >>>>>  MAINTAINERS                                   |  5 ++
> >>>>>  2 files changed, 56 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/=
jh7110-syscon.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-=
syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.=
yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..fa4d8522a454
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.=
yaml
> >>>>> @@ -0,0 +1,51 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/soc/starfive/jh7110-syscon.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: StarFive JH7110 SoC system controller
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - William Qiu <william.qiu@starfivetech.com>
> >>>>> +
> >>>>> +description: |
> >>>>> +  The StarFive JH7110 SoC system controller provides register info=
rmation such
> >>>>> +  as offset, mask and shift to configure related modules such as M=
MC and PCIe.
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    items:
> >>>>> +      - enum:
> >>>>> +          - starfive,jh7110-stg-syscon
> >>>>> +          - starfive,jh7110-sys-syscon
> >>>>> +          - starfive,jh7110-aon-syscon
> >>>>
> >>>> Is 'syscon' really part of what the blocks are called? Is just 'stg'=
,=20
> >>>> 'sys' and 'aon' not unique enough?

> >>> In StarFive SoC, we do have syscrg/aoncrg/stgcrg, which is uesd to be=
 the clock
> >>> controller, so 'syscon' is added to avoid confusion.
> >>
> >> You've only added to my confusion. 'syscrg' and 'sys-syscon' are 2=20
> >> different h/w blocks and unrelated to each other? Or 'syscrg' is the=
=20
> >> clock portion of 'sys-syscon'? In that case, 'syscrg' should be a chil=
d=20
> >> of 'sys-syscon' or possibly just all one node. Please provide details =
on=20
> >> the entire h/w block so we can provide better input on the bindings.

> > It's my description that's problematic.'syscon' here refers to the hard=
ware module
> > inside our JH7110, which is different from the syscon interface in linu=
x. The syscon
> > I added now uses the syscon interface of linux to read and write the sy=
scon register
> > in our JH7110. So we decided to name it that way.
>=20
> You didn't really answer Rob's questions.
>=20
> Also, syscon is Linux term, so are you sure hardware module is called
> like this? Hardware engineers took pure Linux name and used it?

Their TRM uses the term SYSCON for these, yes.
Eg:
"The JH7110 system provides the following STG SYSCON control registers
which provides [sic] clock and reset signals to interfaces..."

In fact, the TRM I have describes the following system control register
blocks:
SYS CRG
STG CRG
AON CRG
SYS SYSCON
STG SYSCON
AON SYSCON
SYS IOMUX CFG
AON IOMUX CFG

My understanding is that the first 3 (the CRG ones) are concerned with
clocks and resets & the second 3 contain "random" configuration options,
such as their QSPI IP's configuration options, GPIO voltage settings
etc.

Each of these has a separate, 0x1000 aligned, block in the memory map.

Cheers,
Conor.


--X8n4J7EvKMl6UgmW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/3gxQAKCRB4tDGHoIJi
0m7FAP9ZuJY5lc5LbY1+xIN/TTUhGhhr3IOZmLx6bo+ojl5LUAD6Aq4/6MrSKXxJ
t9GKVJwrsQFXq+f2SPRExjM7cySWEw0=
=y2mX
-----END PGP SIGNATURE-----

--X8n4J7EvKMl6UgmW--


--===============6325474106315111343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6325474106315111343==--

