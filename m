Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9806CD13CF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2MoTGGYuIH58VsksZRZP5FOlpgxOgkGGC/iZzw0UmY=; b=ChoFjaDREUSyyZQnJppoRNW3cC
	9NZOduTrjxM0GPT5sOGTNUspJzw2lj24Pwnd99SLZ7MYTMmVyG3iupzno4ymlGP/D7wHqw/z4R8T1
	S3ug7l5WrELmOflWxKI63piBagmPNd54NvBa2iaA7PeGJ2Q9ZdpCtvBXSqy4fOepGTzvUBWh7iyRO
	bKR7js7rWU+jF+LGTBM3YxsngxIR6EXKTryo4sqqihrVM/yNp5LlJJW8fsEUosqubl8vnW4Fw/BpT
	ej7uwvyngqTp+1Mp9aOXRutScPpU86e0NdE7OJ4gBRs//H2dbfxPZGWpgeRsikYhjyfAjlL5waNXX
	wG8LrSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQGM-0000000HG4P-2nwl;
	Tue, 03 Sep 2024 09:55:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQ3S-0000000HDYx-3yt6;
	Tue, 03 Sep 2024 09:42:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FBD1A42627;
	Tue,  3 Sep 2024 09:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE20C4CEC4;
	Tue,  3 Sep 2024 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725356549;
	bh=5BLz5g5ZXnWApa/H8Ah2Nu3ZSoDtsGE5Qt5nhSeqhdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpWJiwrwBxT7rWN+9/oKqNvpR+ufP71dFF1FTsDNfzANX/Nj/bigOjITeTIxXHdOt
	 nG3Ot6/tpDS03RaC2jtz+XgT9WwZQz7UEJjsxed+xrO24kTIfBNlCtVa3v+Kc0bt3B
	 ZYs1ebjQXYxPPfq11YzTKqL8Voc16LR7exKuRy6/OlL7TPsSgt6mxoOg9txiYJe4u+
	 jzXNfGLZH+BpA22zL1XF1JJMEY+D23K96KK5SUDZVnHnttnVOc1JkkObL8um+4+fZM
	 z5KEvA4BwWDThCEMjQaj7AKNDQkBgbE5vZVFNbyBUNCY0hqmJQjjUHCnCXJlf3ZOw/
	 qPcsTSZBncIFA==
Date: Tue, 3 Sep 2024 10:42:30 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: jh7110-usb-phy: Add sys-syscon
 property
Message-ID: <20240903-gating-shamrock-c0d4415d1eb3@squawk>
References: <cover.1723472153.git.jan.kiszka@siemens.com>
 <30f3ca9f6bd788e16767b36aa22c0e9dc4d1c6a4.1723472153.git.jan.kiszka@siemens.com>
 <20240812-overstuff-skirt-7a8aabbcdc6f@spud>
 <8cdba8b0-7364-4c09-b18a-f3f59da1eae2@siemens.com>
 <20240813-haiku-pusher-f2fb037a2f49@wendy>
 <SHXPR01MB08633B523DA1F6C5632F6D9DE6802@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20240815-endless-credible-324438d164f4@spud>
 <SHXPR01MB08632E50DFE53BE0CFAA99ABE6922@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB08632E50DFE53BE0CFAA99ABE6922@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_024231_145859_AB85A28F 
X-CRM114-Status: GOOD (  41.76  )
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
Content-Type: multipart/mixed; boundary="===============7197630580931973820=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7197630580931973820==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V8qJgUi9TxzWpM4h"
Content-Disposition: inline


--V8qJgUi9TxzWpM4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 09:19:29AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > On Thu, Aug 15, 2024 at 10:33:55AM +0000, Minda Chen wrote:
> > >
> > >
> > > >
> > > > On Tue, Aug 13, 2024 at 07:31:50AM +0200, Jan Kiszka wrote:
> > > > > On 12.08.24 17:55, Conor Dooley wrote:
> > > > > > On Mon, Aug 12, 2024 at 04:15:51PM +0200, Jan Kiszka wrote:
> > > > > >> From: Jan Kiszka <jan.kiszka@siemens.com>
> > > > > >>
> > > > > >> Analogously to the PCI PHY, access to sys_syscon is needed to
> > > > > >> connect the USB PHY to its controller.
> > > > > >>
> > > > > >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > > > > >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > >> ---
> > > > > >> CC: Rob Herring <robh@kernel.org>
> > > > > >> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > > > >> CC: Conor Dooley <conor+dt@kernel.org>
> > > > > >> ---
> > > > > >>  .../bindings/phy/starfive,jh7110-usb-phy.yaml         | 11
> > > > +++++++++++
> > > > > >>  1 file changed, 11 insertions(+)
> > > > > >>
> > > > > >> diff --git
> > > > > >> a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy
> > > > > >> .yam
> > > > > >> l
> > > > > >> b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy
> > > > > >> .yam l index 269e9f9f12b6..eaf0050c6f17 100644
> > > > > >> ---
> > > > > >> a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy
> > > > > >> .yam
> > > > > >> l
> > > > > >> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb
> > > > > >> +++ -phy
> > > > > >> +++ .yaml
> > > > > >> @@ -19,6 +19,16 @@ properties:
> > > > > >>    "#phy-cells":
> > > > > >>      const: 0
> > > > > >>
> > > > > >> +  starfive,sys-syscon:
> > > > > >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > > > >> +    items:
> > > > > >> +      - items:
> > > > > >> +          - description: phandle to System Register Controller
> > > > sys_syscon node.
> > > > > >> +          - description: PHY connect offset of
> > > > SYS_SYSCONSAIF__SYSCFG register for USB PHY.
> > > > > >
> > > > > > Why is having a new property for this required? The devicetree
> > > > > > only has a single usb phy, so isn't it sufficient to look up the
> > > > > > syscon by compatible, rather than via phandle + offset?
> > > > > >
> > > > >
> > > > > I didn't design this, I just copied it from
> > > > > starfive,jh7110-pcie-phy.yaml. As that already exists, I'm neither
> > > > > sure we want to change that anymore nor deviate in the pattern he=
re.
> > > >
> > > > To be honest, I think some of the other users of phandle + offset on
> > > > this soc were just copy-pasted without thinking about whether or no=
t they
> > were required too.
> > > > This one seems like it should just be a lookup by compatible in the
> > > > driver instead of by phandle. As a bonus, it will work with existing
> > > > devicetrees - whereas your current implementation will fail to probe
> > > > on systems that have the old devicetree, a regression for systems
> > > > running with that devicetree and downstream firmware.
> > > >
> > > > Cheers,
> > > > Conor.
> > > >
> > > Hi Conor
> > > I know you would like to put the offset value to the code, Just set s=
yscon in dts.
> > > Just like pcie-starfive.c. right?
> >=20
> > No, not quite. That still uses a phandle lookup, I was talking about us=
ing
> > syscon_regmap_lookup_by_compatible().
>=20
> Okay. Using syscon_regmap_lookup_by_compatible() can just modify the driv=
er code only.
> But syscon_regmap_lookup_by_compatible() is not exist in uboot now. If I =
want to enable
> CONFIG_OF_UPSTREAM in uboot. I have to add this function in u-boot...

You can use
	node =3D ofnode_by_compatible(ofnode_null(), "foo");
	*regmap =3D syscon_node_to_regmap(node);
in U-Boot.


--V8qJgUi9TxzWpM4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtbaAQAKCRB4tDGHoIJi
0qddAQCykV/8wdobsflqJGegk8VpG4PfIyVD95Ps/lFiN6N8EAEA3A0m+qTJUFXs
meGu8AGVsKo0mah3sBBHmXQzCetNhA8=
=t0GZ
-----END PGP SIGNATURE-----

--V8qJgUi9TxzWpM4h--


--===============7197630580931973820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7197630580931973820==--

