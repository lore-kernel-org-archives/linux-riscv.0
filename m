Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568DDECD998
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTywyvIjcMeXpOkCu7fVbTBGlVOpa5bHQYdc9TaalAo=; b=rV4+Tnsosa+o9j3bXmzyF3E1YN
	Akfm4pGzPomCluFV70nONEZiALOg7s56gYlxBYA3CcJovXien8NlVpkh5NpgPHEIbtlHshnaY7C9s
	tIcOBcVLeJ1Nc9WQnLo7mfOE5VC70e7YM2YkhW6P3xb2gDeajPEyPeRM5nICN2ZV+itVpjvLBMBx/
	IcS0jwycdee8NPKfUinrCO8WZ8oY3zped63gAvEgRyG7MZwPQRM3nODJAhkx9/evmHOll0AP5S0WZ
	XfgnG5CsmGcNsAb+0NG22oK8HhllV94WL4V6Rnj3RMCTds6HMHtNVdZtmbn82l+FqUho2H4NuUT00
	zLP4Oe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4tM-0000000AQaa-42yz;
	Thu, 05 Feb 2026 19:19:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4tD-0000000AQa4-1IvF
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 19:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 614D560010;
	Thu,  5 Feb 2026 19:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BA0C4CEF7;
	Thu,  5 Feb 2026 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770319182;
	bh=UzMdSswZQOZGh4NcKoenKaqT+G8h9UNzdi6R0YEqBmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ai/KJBM5LyRPQQ2DGzHeSO50lRZttbq1SqxlhyAG4gi0p9v7TqhtCBd8kvuHpfNUR
	 4eDk5nABTSIglVGhtglj/6IOGTyQhSiflETD2EfCxS3LUeFhKqbEse95aTH5KDQSqA
	 bL8QVxCgYC6F5IHCHU6lHnrg3rhIGSjeSwo8zpj94DKFSS9qXs0zWB8oQN2GPZ5/Vv
	 ZoCHHmXNsV7HQl6ZAVWCjuWO8UsyKroSdKrZ0ZjgQAPFdMViS7sx4A2OvLUN0xdPuK
	 DqkmeReF9N5XjxWQ+zN0H5Bqvm2IARNHTtAnbo078J39gEK8eBzkJFvLPjEQLuckkT
	 lzFNrO2Lf4rfQ==
Date: Thu, 5 Feb 2026 19:19:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Add sdhci support for Canaan k230
Message-ID: <20260205-choice-require-1794796b10e5@spud>
References: <20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260204082908.27501-2-jiayu.riscv@isrc.iscas.ac.cn>
 <20260204-imperfect-blitz-55fe5a85590f@spud>
 <aYRC/JVvyI6znWS6@duge-virtual-machine>
MIME-Version: 1.0
In-Reply-To: <aYRC/JVvyI6znWS6@duge-virtual-machine>
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
Content-Type: multipart/mixed; boundary="===============3911145361333502970=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3911145361333502970==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7eHTfwTxGj0wRf4P"
Content-Disposition: inline


--7eHTfwTxGj0wRf4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2026 at 03:13:00PM +0800, Jiayu Du wrote:
> On Wed, Feb 04, 2026 at 06:10:25PM +0000, Conor Dooley wrote:
> > On Wed, Feb 04, 2026 at 04:29:06PM +0800, Jiayu Du wrote:
> > > The Canaan k230 uses the SDHCI from Synopsys. Add compatible strings
> > > to the k230. The k230 has two controllers. MMC0 supports eMMC, while
> > > MMC1 supports SDIO.
> > >=20
> > > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > > ---
> > >  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 22 +++++++++++++++++=
++
> > >  1 file changed, 22 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci=
=2Eyaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > > index 7e7c55dc2440..cab33da3af7d 100644
> > > --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > > @@ -23,6 +23,8 @@ properties:
> > >            - const: sophgo,sg2044-dwcmshc
> > >            - const: sophgo,sg2042-dwcmshc
> > >        - enum:
> > > +          - canaan,k230-emmc
> > > +          - canaan,k230-sdio
> >=20
> > I don't understand why there are two compatibles here, when the driver
> > is able to handle them both identically, using the common properties for
> > mmc controllers to differentiate. Is which is emmc and which sdio
> > actually just determined by how the k230 boards use them?
> >=20
> > Or, if there are pinout differences, would pinctrl allow each to be used
> > for either?
>=20
> Hi, Thanks for the review!
>=20
> Actually, the two compatibles aren't just board choices. They come from
> real SoC-level differences between the two MMC controllers.
>=20
> From the K230 Hardware Guide [1]:
> - MMC0 supports eMMC5.0 and SDIO3.0, usually for eMMC chips.
> - MMC1 only does SDIO3.0 in 4/1-bit mode up to SDR104, and the manual
>   clearly says it can't handle eMMC because of pin count and limits.
>=20
> And the driver treats them a bit differently, such as whether there
> is a phy and the initialization method. So I think keeping separate
> compatibles makes sense to show these hardware differences clearly.

Ah, I didn't notice that there was some logic, I just checked the match
data and I missed that. What you have is fine then I think.

>=20
> About pinctrl, MMC1 pins can mux to other things like GPIO, but MMC0
> pins are fixed in hardware. In next version, I will add pinctrl node
> for MMC1 in the board dts.
>=20
> Link: https://github.com/kendryte/k230_docs/blob/main/en/00_hardware/K230=
_Hardware_Design_Guide.md#mmc-circuit [1]
> >=20
> > >            - rockchip,rk3568-dwcmshc
> > >            - rockchip,rk3588-dwcmshc
> > >            - snps,dwcmshc-sdhci
> > > @@ -87,6 +89,26 @@ required:
> > >  allOf:
> > >    - $ref: mmc-controller.yaml#
> > > =20
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - canaan,k230-emmc
> > > +              - canaan,k230-sdio
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          minItems: 2
> > > +          maxItems: 5

Additionally, why does this have a range? Why is it not minItems: 5?
You've got only one instance per compatible, so the number of clocks for
each compatible is not variable.

> > > +        clock-names:
> > > +          items:
> > > +            - const: core
> > > +            - const: bus
> > > +            - const: axi
> > > +            - const: block
> > > +            - const: timer
> > > +
> > >    - if:
> > >        properties:
> > >          compatible:
> > > --=20
> > > 2.52.0
> > >=20
>=20
>=20

--7eHTfwTxGj0wRf4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYTtSAAKCRB4tDGHoIJi
0tZjAQDTymGYi6A5F3OEmHSp98izoRjyvyN6cbDuLn5AnhU53QD+LbK8MUALBaaM
mkOTaJUMInjD97RaMG7Y8s7Q5BG7GQM=
=WnK+
-----END PGP SIGNATURE-----

--7eHTfwTxGj0wRf4P--


--===============3911145361333502970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3911145361333502970==--

