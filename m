Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EA0C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBfxCrMgYUz6VJpR/zdh0LZ1BN436kxqUxCgHF8jdrI=; b=rLCbsiPS394XvRu8eqHqKXm1NM
	OKkuCJZqIWZjosbdvmXCdc0qZpYMr0EDPME8lbemWjsk63dJuKc452qlJCojmMhVGrFOxMOrjPs4K
	aYSjCWPa6zR7htBXXhuQuxOdWeituhLqHFgq2d0wt76DHaj7BI+cjM/uN7APevpwSLT+RTM3jCrBI
	0EvAUG0HIeIPzlA41h1+FaIz2Eij+dW1bgx1Yr4/okfhSsUBFvnfsvIeZYY0ztvn6pDBEZLF4YKuH
	DYciuIDWRb9EEAZu2WAX0tofDkn0hxVxMz/aiCvjjTaSz+ZPTxREeOBeZWSo4F3FamEvjsF+OB8AP
	+y7YB6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJXU2-002gxZ-1p;
	Sat, 30 Dec 2023 11:26:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJXTz-002gwl-34
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 11:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1DCC6B810F2;
	Sat, 30 Dec 2023 11:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B258FC433C8;
	Sat, 30 Dec 2023 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703935579;
	bh=1OU6bdZKEl1WLY5wGxuQyuaZq2DtMwE1qATuY4qDn68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZFzg4qVLDXV07uKa0HE1SS7SlNAQO4dpWs6Bgk7Zxpoeut9Yi1uqqN0p2Q1zPfBc
	 HlZM596sgELuISXmOcsZ0h2lDgV5QjRztUcQ6imtp3bfIvzPmbL7TliTvftA2aZlsm
	 26i8flLTQd+aUbzUCbt6Hbrq2QtG2xZkrVwppFndotRFwFNEQ+LVn7eQBEZpcjjqUP
	 ohdnO4AvDcpdeFD/Yis952QulkZP/rVFcAuyD+unrQokSt3evYc2ywZ3jPfvMD1dT/
	 8y5HnculLF/Y95KH4vLLJlKwOTmrjCQypyW6J+uO5LI/c4AWv6aNHBOfMY9oKkBItx
	 6hjx4242WDRsg==
Date: Sat, 30 Dec 2023 11:26:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: dfustini@baylibre.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, jszhang@kernel.org, guoren@kernel.org,
	wefu@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/4] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
Message-ID: <20231230-drudge-snarl-d7a84f843161@spud>
References: <20231129-th1520_mmc_dts-v7-1-c77fc19caa6f@baylibre.com>
 <mhng-577f4913-06ac-4f80-8793-6336132d503e@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-577f4913-06ac-4f80-8793-6336132d503e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_032624_142152_B47F771F 
X-CRM114-Status: GOOD (  16.68  )
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
Content-Type: multipart/mixed; boundary="===============4089674640749377316=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4089674640749377316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6xe6WHVqFSp45+hX"
Content-Disposition: inline


--6xe6WHVqFSp45+hX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 06:42:01PM -0800, Palmer Dabbelt wrote:
> On Wed, 29 Nov 2023 17:48:47 PST (-0800), dfustini@baylibre.com wrote:
> > Enable the mmc controller driver and dma controller driver needed for
> > T-Head TH1520 based boards, like the LicheePi 4A and BeagleV-Ahead, to
> > boot from eMMC storage.
> >=20
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 905881282a7c..e635dc9d1997 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -214,6 +214,7 @@ CONFIG_MMC=3Dy
> >  CONFIG_MMC_SDHCI=3Dy
> >  CONFIG_MMC_SDHCI_PLTFM=3Dy
> >  CONFIG_MMC_SDHCI_CADENCE=3Dy
> > +CONFIG_MMC_SDHCI_OF_DWCMSHC=3Dy
> >  CONFIG_MMC_SPI=3Dy
> >  CONFIG_MMC_DW=3Dy
> >  CONFIG_MMC_DW_STARFIVE=3Dy
> > @@ -223,6 +224,7 @@ CONFIG_RTC_CLASS=3Dy
> >  CONFIG_RTC_DRV_SUN6I=3Dy
> >  CONFIG_DMADEVICES=3Dy
> >  CONFIG_DMA_SUN6I=3Dm
> > +CONFIG_DW_AXI_DMAC=3Dy
> >  CONFIG_RZ_DMAC=3Dy
> >  CONFIG_VIRTIO_PCI=3Dy
> >  CONFIG_VIRTIO_BALLOON=3Dy
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> in case folks want to keep this with the DTS updates.  Thanks!

Just echoing what I said on irc, I already send the subsequent version
of the series to Arnd, minus the defconfig patch, so if you could take
this yourself Palmer, that'd be great.

Cheers,
Conor.


--6xe6WHVqFSp45+hX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZY/+VgAKCRB4tDGHoIJi
0s/JAQDtPyBlwd7KEb9L4HtWe6TX6DE+iVwM/agBaJp+y5GadAD/RCu9FNnwEiak
OoUzBlhASe6hIOwwJuoTkjeNRl57kQM=
=FY5q
-----END PGP SIGNATURE-----

--6xe6WHVqFSp45+hX--


--===============4089674640749377316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4089674640749377316==--

