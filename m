Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACEFC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dph/gM2V/HkecV5Am0Rh9RsF+edt7/wbfFjHsmtGmwc=; b=b2GHMgIc7jc7L/g7DN3qPnxcXR
	jJA85wLq9nRMblIQMA6kZ1rsxB8ZHHuKYzTgDrPK2N7fpzRdDSsuDigGe/e3K9kxqPsXMZqSstEGB
	fybo9Lt+gasu4bvIhKsDl0rdTX25j5BMfdDoJglrc5Ilk6jp6js1EwujTpV2mF/XaLfJIsZYoVIMo
	0sUUw+m6rRXKZItDgZ8c/nDfqq8IXAzCHJpBn6o/RNzNprFitSXGLHf8+2xZrsmDP3WHiQCJoLyG1
	BkaRhr9sQA1OR9M5HI0hCV6+oeNm1BOM0aDBPvVEIQnBpWh3rvE6nXmSqolObBQJwubmi32xQyF52
	9HrSdafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAVK-008F2O-1a;
	Wed, 19 Jul 2023 16:58:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAVG-008F1N-24
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:58:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E416D60018;
	Wed, 19 Jul 2023 16:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905FDC433C7;
	Wed, 19 Jul 2023 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689785897;
	bh=xayvFZEqNUxkMixHih/sryn5ylVD/sjcMsn7un1bPYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3n9AoZ0SJlV8lgbjP2eg1EfnS7FHT1VfY3AEiWAgaDry/O2UXfoxJvKZ71IIO5QK
	 YfAe2oiJ4tLy+CjALsaOLZ49xbzWRDuvvOWIUWz9YDkb2wqqSuFcXzaiLkxssiAu2I
	 bFCv/eLHHk3j5eIkHt1rKTSamKndqwGiDZ2Ivgv6bZ1/Hu1VeStmSN56Gj2KDIglNS
	 lwt20OvsGEA8vjd7rpi5hSf+esT5XVBtIdLziDxDf0ZwZhLAkNWZ95/urD1Pmx9cM3
	 7ndjk4fnh/ZBpNO4o4+OajYlAexmPFOhKAWSR+yenbpGdv7tAF6aBgj/RUMeHe7eJc
	 6n1y7UBz5n3Eg==
Date: Wed, 19 Jul 2023 17:58:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 0/9] Refactoring Microchip PolarFire PCIe driver
Message-ID: <20230719-rockstar-gangway-467e64ada609@spud>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230719102057.22329-1-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_095818_768140_19277352 
X-CRM114-Status: GOOD (  18.10  )
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
Content-Type: multipart/mixed; boundary="===============6492571743583146132=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6492571743583146132==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ItaO0NWrNgH9c6FC"
Content-Disposition: inline


--ItaO0NWrNgH9c6FC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Minda,

On Wed, Jul 19, 2023 at 06:20:48PM +0800, Minda Chen wrote:
> This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> same IP and have commit their codes, which are mixed with PLDA
> controller codes and Microchip platform codes.
>=20
> For re-use the PLDA controller codes, I request refactoring microchip
> codes, move PLDA common codes to PLDA files.
> Desigware and Cadence is good example for refactoring codes.
>=20
> So first step is extract the PLDA common codes from microchip, and
> refactoring the microchip codes.(patch1 - 4)
> Then add the PLDA platform codes. (patch5, 6)
> At last, add Starfive codes. (patch7 - 9)

Thanks for sending this, I'll try to have a look through it tomorrow, or
if not, early next week. As pointed out off-list, the gist of what you
have here looked good to myself and Daire.

> This patchset is base on v6.5-rc1
>=20
> patch1 is add PLDA XpressRICH PCIe host common properties dt-binding
>        docs, most are extracted from microchip,pcie-host.yaml
> patch2 is add plda,xpressrich-pcie-common.yaml(patch1 file) reference
>        and remove the PLDA common properties.
> patch3 is extracting the PLDA common codes from microchip Polarfire PCIe
>        codes. The change list in the commit message.
> patch4 is move microchip driver to PLDA directory and remove the PLDA
>        common codes.
> patch5 is add PLDA Xpressrich platform driver dt-binding doc.
> patch6 is PLDA Xpressrich platform driver.
> patch7 is add StarFive JH7110 PCIe dt-binding doc.
> patch8 is add StarFive JH7110 Soc PCIe platform codes.
> patch9 is StarFive JH7110 device tree configuration.
>=20
> I have noticed that Daire have changed microchip's codes.
> https://patchwork.kernel.org/project/linux-pci/cover/20230630154859.20495=
21-1-daire.mcnamara@microchip.com/

I'll go and ping this, it's been a few weeks with no movement :)

Thanks,
Conor.

--ItaO0NWrNgH9c6FC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLgWIwAKCRB4tDGHoIJi
0tRJAQCQfXnUkEmh0PtotZgcZuTK2jJ5Pb7zCTWIdxVjSTdhfQD+LoI9+2N9Qein
q+pkZ3wrnXopGLOVdsu5a4hvcELWqQ8=
=fTL5
-----END PGP SIGNATURE-----

--ItaO0NWrNgH9c6FC--


--===============6492571743583146132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6492571743583146132==--

