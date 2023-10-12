Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37DECDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MRiwjH2B023AA2ALkoK8GE23aAHBLvAKVtwfmiWaow=; b=t2F5+aBox2aTphSjBEenBqFaY2
	3p8E62X0D10jRHd1FXjnFLmHKaLSwn/hsHeOcXIQyyRwcSB9jUTtq6kIO0eAs56gBWEpD0Zacfg7h
	ikKXJnhqA0xUZtYutn/mlmbS0e6/dLf+U+PjKPfR69SaHLlbW6FVUi2FFJk5zFONkes8KFKy8Y36x
	mLrS9mDWmNeobAdAG6py7OzzjZpbxpPs537Qb5gJVe/3et9uwT1aKLPXcsBWsssuX3Ve+/p56nLGK
	VdBDeqNXwa4FRiEACSOcOKi0Xqsv+rPGPmQQsikZSR/A6VHq5yGZriamlXws1b2B0gUazoAWji/bj
	nQB0icvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqs6o-000Pb2-0r;
	Thu, 12 Oct 2023 09:35:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqs6l-000PaN-2A
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 09:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 398AEB823B5;
	Thu, 12 Oct 2023 09:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97825C433C8;
	Thu, 12 Oct 2023 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697103353;
	bh=niTCfJ5nIaIV1WZUxp0TKmnQ2v5iDejGCa7Cmf/1Jwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbRLNQNfMtsTH4iIze3Y5b3OZNLq/K1qI1XUxP39RvQLX6are82KYxLxhQIJskbhv
	 Ntg622Ldzc8WCpGRa43myfybdwUngfgDa9W+DUXImpShUMC0BP4++8C387I4uoSukI
	 1yxtGJ07H91Cq0Ao+k9hivZzCIqrxKXrwvZokNf+NSuk+NQ0l9acbLGYYoNO3WRi8G
	 1nP7oAwYb5SpO4L1tFoXSsdmt8QdGZipRhFnKlg/KnLPkUBsRLtItwoWeisxkLxFUM
	 S/dn/FwJiBY4ZJwEgTCS+me6LDQWB50N3qcbvDOpDw2lxgXX0GWcHY8GpLDDf2mU1I
	 7aTKv13Qc7rXQ==
Date: Thu, 12 Oct 2023 10:35:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Shravan.Chippa@microchip.com
Cc: robh@kernel.org, green.wan@sifive.com, vkoul@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, conor+dt@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nagasuresh.Relli@microchip.com, Praveen.Kumar@microchip.com,
	Conor.Dooley@microchip.com
Subject: Re: [PATCH v2 2/4] dt-bindings: dma: sf-pdma: add new compatible name
Message-ID: <20231012-yippee-squid-9fce27a4d84e@spud>
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
 <20231003042215.142678-3-shravan.chippa@microchip.com>
 <20231004133021.GB2743005-robh@kernel.org>
 <20231005-wanted-plausible-71dae05ccc7b@spud>
 <PH0PR11MB5611CDD7C66363B9F2367C2881D3A@PH0PR11MB5611.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB5611CDD7C66363B9F2367C2881D3A@PH0PR11MB5611.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_023555_984053_F359BE47 
X-CRM114-Status: GOOD (  31.75  )
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
Content-Type: multipart/mixed; boundary="===============7056859123468743766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7056859123468743766==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ejP92r94GEiwuG/C"
Content-Disposition: inline


--ejP92r94GEiwuG/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 09:22:17AM +0000, Shravan.Chippa@microchip.com wrot=
e:
> Hi,
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Thursday, October 5, 2023 4:24 PM
> > To: Rob Herring <robh@kernel.org>
> > Cc: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>;
> > green.wan@sifive.com; vkoul@kernel.org; krzysztof.kozlowski+dt@linaro.o=
rg;
> > palmer@dabbelt.com; paul.walmsley@sifive.com; conor+dt@kernel.org;
> > dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Nagasuresh Rel=
li - I67208
> > <Nagasuresh.Relli@microchip.com>; Praveen Kumar - I30718
> > <Praveen.Kumar@microchip.com>; Conor Dooley - M52691
> > <Conor.Dooley@microchip.com>
> > Subject: Re: [PATCH v2 2/4] dt-bindings: dma: sf-pdma: add new compatib=
le
> > name
> >=20
> > On Wed, Oct 04, 2023 at 08:30:21AM -0500, Rob Herring wrote:
> > > On Tue, Oct 03, 2023 at 09:52:13AM +0530, shravan chippa wrote:
> > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > >
> > > > Add new compatible name microchip,mpfs-pdma to support out of order
> > > > dma transfers
> > > >
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > ---
> > > >  .../bindings/dma/sifive,fu540-c000-pdma.yaml         | 12 ++++++++=
----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > > > b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > > > index a1af0b906365..974467c4bacb 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > > > +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.y
> > > > +++ aml
> > > > @@ -27,10 +27,14 @@ allOf:
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    items:
> > > > -      - enum:
> > > > -          - sifive,fu540-c000-pdma
> > > > -      - const: sifive,pdma0
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: microchip,mpfs-pdma # Microchip out of order DM=
A transfer
> > > > +          - const: sifive,fu540-c000-pdma # Sifive in-order DMA
> > > > + transfer
> >=20
> > IIRC I asked for the comments here to be removed on the previous versio=
n, and
> > my r-b was conditional on that.
> > The device specific compatible has merit outside of the ordering, which=
 may just
> > be a software policy decision.
> >=20
> > > This doesn't really make sense. microchip,mpfs-pdma is compatible with
> > > sifive,fu540-c000-pdma and sifive,fu540-c000-pdma is compatible with
> > > sifive,pdma0, but microchip,mpfs-pdma is not compatible with
> > > sifive,pdma0? (Or replace "compatible with" with "a superset of")
> >=20
> > TBH, I am not sure why it was done this way. Probably because the driver
> > contains both sifive,pdma0 and sifive,fu540-c000-pdma. Doing compatible=
 =3D
> > "microchip,mpfs-pdma", "sifive,fu540-c000-pdma", "sifive,pdma0"; thing =
would
> > be fine.
> >=20
> > > Any fallback is only useful if an OS only understanding the fallback
> > > will work with the h/w. Does this h/w work without the driver changes?
> >=20
> > Yes.
> > I've been hoping that someone from SiFive would come along, and in resp=
onse to
> > this patchset, tell us _why_ the driver does not make use of out-of-ord=
er transfers
> > to begin with.
> >=20
>=20
> I am also expecting a replay someone from SiFive
> The out-of-order should work with other RISC-V platforms also.
>=20
> I will try to send V3 with the below changes (just adding a new compatibl=
e name)
>=20
> ****************************
> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -29,6 +29,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - microchip,mpfs-pdma
>            - sifive,fu540-c000-pdma
>        - const: sifive,pdma0
>      description:
> ***************************
>=20
> Device tree patch
> *****************************
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -221,7 +221,7 @@ plic: interrupt-controller@c000000 {
>                 };
>                 pdma: dma-controller@3000000 {
> -                       compatible =3D "sifive,fu540-c000-pdma", "sifive,=
pdma0";
> +                       compatible =3D "microchip,mpfs-pdma", "sifive,fu5=
40-c000-pdma", "sifive,pdma0";

This is gonna produce dtbs_check complaints. Your binding change only
permits `compatible =3D "microchip,mpfs-pdma", "sifive,pdma0";`

Cheers,
Conor.

>                         reg =3D <0x0 0x3000000 0x0 0x8000>;
>                         interrupt-parent =3D <&plic>;
>                         interrupts =3D <5 6>, <7 8>, <9 10>, <11 12>;
> ***************************

--ejP92r94GEiwuG/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSe99AAKCRB4tDGHoIJi
0vQ9AQCbY9hLUCrnbF9LvnoMPy66j2uiLwr8OKI1eDpwHw4mOAD+PukoSXw/50R3
traIq92KfBKrNnBYqcteMG5oDxT8CQ4=
=2bIJ
-----END PGP SIGNATURE-----

--ejP92r94GEiwuG/C--


--===============7056859123468743766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7056859123468743766==--

