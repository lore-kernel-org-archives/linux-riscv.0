Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB9C54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OleMQLhrLdOi+favtLxT4Mpw76gpn1HnMZdtCHl/Yw=; b=SVaKGK2iW0it2O13bDgXm+Vp9M
	RY0Tsq6yq52MUDRLX8rdyVvcQj3I1SL4rlpLhoMHAkiqQQQkQK4awcwfkUBJZZSfBNMkOr+qZfqNw
	aXAtqC5nQn8ImrrelHQoDolVYDgihOTmVCTbGQYFAUiIXAiggMr8pYhoj9lbIMDVG7Ns+3w7lnXxx
	4LSU4vpovBmapVwT7A9pIdN2KMnKWj3hhmrgkjurp695oL3AzGHzYUeLq0F+nIB2VsJpR9xoGZBb6
	w88+QBDEU9/YjjiMicXb+Y68maBOOql0iqJpBduyxhsNqUaIYQ32R/f6Fx7Wn7LuUgNfuQYIP5onm
	NkSs8rTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHV0l-00Bqat-VG; Mon, 16 Jan 2023 19:19:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHV0h-00Bqa5-PK
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 19:19:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2E8EFB80E77;
	Mon, 16 Jan 2023 19:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D62C433D2;
	Mon, 16 Jan 2023 19:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673896748;
	bh=XPbeY1Tw3NOIW18sn3VUjs5hnmitr2mUboL06yyV1OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ht26c5+BaGyCrnSatfGGdKlEeaSu6vFP4V4n9oRMBtY9yVXlRSe/2DdYDLyNPXbEP
	 TaZAHDIhfnoHV4gNfbdO6avAqMxerbEq+Kd3rTvXXICod5S6F0czWPGbt71oRbGTE+
	 EBMrn0o2zzrvL2mD9J1cRd8/2XtJArHP6xV4QRFMCQk4lo6x78PJzpsp1l3y2MBBB4
	 4EDSvcALVvzn0mkixQjkJfr6BgbrHZnsRyj1Ngv/OnqFArGwqbklYrnIqipgMUZlOe
	 PDwmQsbmfiN07tMtCLKfgXNSjzN0vbHZlxoLuCBwDslQhLNymZEQ33hQ7qzkrrfszd
	 vfFWghN6ratvQ==
Date: Mon, 16 Jan 2023 19:19:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] JH7110 PMU Support
Message-ID: <Y8WjKArEZH5zd5jb@spud>
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230116074259.22874-1-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_111912_164152_C7846EF5 
X-CRM114-Status: GOOD (  22.56  )
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
Content-Type: multipart/mixed; boundary="===============1403068199341139259=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1403068199341139259==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9GoKrs0wz7LbOpIW"
Content-Disposition: inline


--9GoKrs0wz7LbOpIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Walker,

On Mon, Jan 16, 2023 at 03:42:56PM +0800, Walker Chen wrote:
> Hello,
>=20
> This patchset adds PMU (Power Management Unit) controller driver for the
> StarFive JH7110 SoC. In order to meet low power requirements, PMU is
> designed for including multiple PM domains that can be used for power
> gating of selected IP blocks for power saving by reduced leakage
> current. The first patch adds device tree binding for PM domain provider
> and consumer. The second patch adds pmu driver and support JH7110 SoC.
> The last patch adds device node about pmu to JH7110 dts.=20
>=20
> The series has been tested on the VisionFive 2 boards which equip with
> JH7110 SoC and works normally.

For the series:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I'm hoping that someone with knowledge of the power APIs will take a
look now that the driver looks to be in a pretty good state (to my naive
eyes at least).

> Changes in v3:
> - Rebased on tag v6.1.

FYI, please pick something more recent than that.
Ideally, the last -rc1, which in this case is v6.2-rc1.
It's helpful to do this, as when I went to apply your patch, there were
some conflicts that needed to be sorted out. Because of your prerequisite
patches, the usual `b4` commands would not usable. E.g.

b4 am -3 20230116074259.22874-1-walker.chen@starfivetech.com
Analyzing 4 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH v3 1/3] dt-bindings: power: Add starfive,jh7110-pmu
  [PATCH v3 2/3] soc: starfive: Add StarFive JH71XX pmu driver
  [PATCH v3 3/3] riscv: dts: starfive: add pmu controller node
---
Total patches: 3
Preparing fake-am for v3: JH7110 PMU Support
  ERROR: Could not find matching blob for MAINTAINERS (85e8f83161d7)
         If you know on which tree this patchset is based,
         add it as a remote and perform "git remote update"
         in order to fetch the missing objects.

Fortunately, this is just a driver addition so despite `b4` not
helping it was easy to resolve but for other patches in the future,
this may not be the case.

Assuming the dt maintainers are happy with the binding, ping me in 2
weeks if no-one else has commented and I'll apply patches 1 & 2.

Thanks,
Conor.

> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> prerequisite-patch-id: 54ce870d6ea747466474b5d4105cfbc05e1b01ab
> prerequisite-patch-id: e8dd8258a4c4062eee2cf07c4607d52baea71f3a
> prerequisite-patch-id: 057fa35870d8d7d22a57c13362588ffb9e9df316
> prerequisite-patch-id: 102368a6ff799c4cb639aed513deff09c1839161
> prerequisite-patch-id: 7c1a50a37919fedbbd336ca5dec295ac63c2a89d
> prerequisite-patch-id: a5d9e0f7d4f8163f566678894cf693015119f2d9
> prerequisite-patch-id: 87cb528acd9a7f1ffe7475d7261553f6a4de5753
> prerequisite-patch-id: 417736eb958e1158c60a5ed74bc2350394321a80
> prerequisite-patch-id: a137312ca162b5712e28719f77d0da78e9fdd778
> prerequisite-patch-id: f7c548b4619f491ce27f319242c4e3685c76173b
> prerequisite-patch-id: 4d90febab2fb7928f50a73104e7454312b9ce6c8
> prerequisite-patch-id: 645a807d50e0e56593ffdc6c3b50ea54a230827a
> prerequisite-patch-id: 165f8cd740ae60585d22c95b99a0689084d468e3
> prerequisite-patch-id: 480d910deccadc2947b3318c3c13dfa0882c8e0d
> prerequisite-patch-id: 1d1cb90ec12dfc9312e448759c7cab89f2bc6394
> prerequisite-patch-id: 5f539ac7c96023b36489c6da7c70c31eaf64a25b
> prerequisite-patch-id: 6bb9a780c62af3bcc2368dfd20303c7b1bc91e23
> prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
> prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
> prerequisite-patch-id: e3b986b9c60b2b93b7812ec174c9e1b4cfb14c97
> prerequisite-patch-id: 2e03eeb766aefd5d38f132d091618e9fa19a37b6
> prerequisite-patch-id: e0ba7af0f8d3d41844da9fbcba14b548cbc18f55
> prerequisite-patch-id: c1f8603e58c64828d0f36deac9b93c24289d8e05


--9GoKrs0wz7LbOpIW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8WjKAAKCRB4tDGHoIJi
0oszAQDM9ExcHzz5zwVTaRHH/CUh3N4IkT9RnBltBfBDkeqmmwD/eoWkYLcS1whs
CsKsgJlSS9Nu15N2/XX5xgyh1Scb+AA=
=zJa1
-----END PGP SIGNATURE-----

--9GoKrs0wz7LbOpIW--


--===============1403068199341139259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1403068199341139259==--

