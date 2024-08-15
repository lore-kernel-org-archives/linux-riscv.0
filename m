Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29BEC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGcMNgRpMk1pMV6BuFhpkqiFXle15pTr+Vh1Q3RQrOI=; b=xmYCEmzJZzxB1by99wlrRCEu7H
	f88X7VfeqgwXGquqgV0+Q1p4bYkSJT3f+a9pCP0uM6wYzk4+9wIfDbrHCGh9WhZcwbHVd1XEwNabS
	KP4/QRA3AfYUnjkcAY6dveqybPi7iOZHLibI9++/w0jyJJuXl4CyxV+rWhFcutoxI2bCAiidsdViX
	nafoot1RYC4RxuV1ngXbVZ9m8xxNg17sRMbG7osSTHWliDysf1u1tS8kPkGFvcmk6W03t5m5C8hrR
	Y1QJ7w8KA71FFEJcucyYnAyjdTb/AUHyexaCFKidcmAqMhOFVQkbq+FtgffhiHlANBj9YTnvyAjWY
	nFUYUYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebhY-0000000AFmg-0gDh;
	Thu, 15 Aug 2024 14:43:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebg0-0000000AFMa-2zKR;
	Thu, 15 Aug 2024 14:42:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4FBECE1CA4;
	Thu, 15 Aug 2024 14:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93ABC32786;
	Thu, 15 Aug 2024 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723732925;
	bh=M40/005yIp6PCsxxKStq9i/vMz5yXRGyPImHwfgRiyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEAB2bn5hNHq7njuWlDTwBaBdfm593hUm+7dAlHYT1OXAgZo5F5FwZQGGvCvXRcXH
	 Ix+EVn36nGzdPtpoGHDBmxWfsDGB9R00F1NtpKo4KUZ9xEVMEVhVdT0rd0s/JGskIz
	 kRvbs7GY5572G1kVn+7t23D+XoNj7g+exF5MT9GlnanqdVJX1MhOVfjO+Q4Ugd2B0e
	 sicrwqsWDLXwTCTJPcY0xgvtcgPYed8xFYfaCRxFaNN9icRjFy6/FNsFVZVrZcEa5a
	 SPO8jgsVrwOzqHhwrvhd7IIJ1xngfd5kKoV01ssLmo63DyCnmulPArf46eD/FZxn/9
	 JdARv89eYqdMg==
Date: Thu, 15 Aug 2024 15:42:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMS8z?= =?utf-8?Q?=5D?=
 dt-bindings: phy: jh7110-usb-phy: Add sys-syscon property
Message-ID: <20240815-endless-credible-324438d164f4@spud>
References: <cover.1723472153.git.jan.kiszka@siemens.com>
 <30f3ca9f6bd788e16767b36aa22c0e9dc4d1c6a4.1723472153.git.jan.kiszka@siemens.com>
 <20240812-overstuff-skirt-7a8aabbcdc6f@spud>
 <8cdba8b0-7364-4c09-b18a-f3f59da1eae2@siemens.com>
 <20240813-haiku-pusher-f2fb037a2f49@wendy>
 <SHXPR01MB08633B523DA1F6C5632F6D9DE6802@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB08633B523DA1F6C5632F6D9DE6802@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_074209_320502_EFC5DEC3 
X-CRM114-Status: GOOD (  33.18  )
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
Content-Type: multipart/mixed; boundary="===============5084227830259964790=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5084227830259964790==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y6obAq/LA5e3r0dd"
Content-Disposition: inline


--Y6obAq/LA5e3r0dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 10:33:55AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > On Tue, Aug 13, 2024 at 07:31:50AM +0200, Jan Kiszka wrote:
> > > On 12.08.24 17:55, Conor Dooley wrote:
> > > > On Mon, Aug 12, 2024 at 04:15:51PM +0200, Jan Kiszka wrote:
> > > >> From: Jan Kiszka <jan.kiszka@siemens.com>
> > > >>
> > > >> Analogously to the PCI PHY, access to sys_syscon is needed to
> > > >> connect the USB PHY to its controller.
> > > >>
> > > >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > > >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > >> ---
> > > >> CC: Rob Herring <robh@kernel.org>
> > > >> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > >> CC: Conor Dooley <conor+dt@kernel.org>
> > > >> ---
> > > >>  .../bindings/phy/starfive,jh7110-usb-phy.yaml         | 11
> > +++++++++++
> > > >>  1 file changed, 11 insertions(+)
> > > >>
> > > >> diff --git
> > > >> a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yam
> > > >> l
> > > >> b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yam
> > > >> l index 269e9f9f12b6..eaf0050c6f17 100644
> > > >> ---
> > > >> a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yam
> > > >> l
> > > >> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy
> > > >> +++ .yaml
> > > >> @@ -19,6 +19,16 @@ properties:
> > > >>    "#phy-cells":
> > > >>      const: 0
> > > >>
> > > >> +  starfive,sys-syscon:
> > > >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > >> +    items:
> > > >> +      - items:
> > > >> +          - description: phandle to System Register Controller
> > sys_syscon node.
> > > >> +          - description: PHY connect offset of
> > SYS_SYSCONSAIF__SYSCFG register for USB PHY.
> > > >
> > > > Why is having a new property for this required? The devicetree only
> > > > has a single usb phy, so isn't it sufficient to look up the syscon
> > > > by compatible, rather than via phandle + offset?
> > > >
> > >
> > > I didn't design this, I just copied it from
> > > starfive,jh7110-pcie-phy.yaml. As that already exists, I'm neither
> > > sure we want to change that anymore nor deviate in the pattern here.
> >=20
> > To be honest, I think some of the other users of phandle + offset on th=
is soc were
> > just copy-pasted without thinking about whether or not they were requir=
ed too.
> > This one seems like it should just be a lookup by compatible in the dri=
ver instead
> > of by phandle. As a bonus, it will work with existing devicetrees - whe=
reas your
> > current implementation will fail to probe on systems that have the old
> > devicetree, a regression for systems running with that devicetree and
> > downstream firmware.
> >=20
> > Cheers,
> > Conor.
> >=20
> Hi Conor
> I know you would like to put the offset value to the code, Just set sysco=
n in dts.
> Just like pcie-starfive.c. right?

No, not quite. That still uses a phandle lookup, I was talking about
using syscon_regmap_lookup_by_compatible().

--Y6obAq/LA5e3r0dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZr4TuAAKCRB4tDGHoIJi
0sIFAQC/JyXvK+VLgbIRFzTwOSJvSzC4aJueRc46G1g/t0SWQAEAsiQzJzNWfk3E
4/t1gvtNHk8K7qm6C0l8crJVrI7AsAY=
=JWz8
-----END PGP SIGNATURE-----

--Y6obAq/LA5e3r0dd--


--===============5084227830259964790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5084227830259964790==--

