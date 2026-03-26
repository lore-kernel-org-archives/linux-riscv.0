Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5921110A1E7B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=URf+95hiPLfCrI17vzWCFquDZlqN46f8AqR53/V5wiY=; b=cpD
	QGQjjNGsWwfFKmcEBujxBSAUpV6uEUlAYETA/7Ne0eWszqG9lh9UyUXz5bmo+tJ2+gPFAMfNWearY
	5VCBZoGAAlLYzIFPqcYLWY2lIv3vjp7Su96//c5T6vODB/fvjZyQW7ZeW+1y0MM85tcOPUBYZCrbK
	ixv7v9KbPNDXsS5hfCeyKV7E7K6NC7zNSA6p1W3vp/Q6hWBmoOyRrehepr0/oNKh7Tc/JBVy06ywI
	rPGmonM/m9SPpqbIh/2ktFN3FHc55JhQ6e+qzwqAY79h56zusOLcTm0j1Q/CZuWoMYVAxLXgq9ljZ
	t1qv3B4eV+GpicKiCrD9N5pXCh9HXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ies-00000005Kga-2Xku;
	Thu, 26 Mar 2026 11:13:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ien-00000005Kfn-1bfU
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 11:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD80B4346A
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 11:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D81C116C6;
	Thu, 26 Mar 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774523624;
	bh=IwGS7scWtDYJHHjUFe2o0klWiLuIEDxH1PZg+1+e2sk=;
	h=Date:From:To:Cc:Subject:From;
	b=nCSAoKxgY8n5hX+Uz3VEPy9mbROEixyuBWn4Plz21Sn0dODnZ7IEpYtA2OpN7mhXY
	 T9IqBiLX3Gn9cnwbh+hkkgTCN7v3grl3V+JozXa9jrGRJU4Ufcccikt+fWywoVx4pK
	 uV/L2Pm41Q7Vti1/sddkryyqMZKiHKfCZsxLFyJRtU9CZ5JKm+hdrxdhgHygOZTP/h
	 JBx9cNEcKZMvlqnDNhG8YEJ7zgbueL4IrPg/GhJpi0R60l6DWmaIVbNuOh5RfrkxB1
	 uQGlFMObP/exitw7I/89Q0MgznIzVSZWyoigHm+5MKrmRZGT0bwQxplad85T3+w7xG
	 SUB7AR3zsxHzQ==
Date: Thu, 26 Mar 2026 11:13:40 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
Message-ID: <20260326-astrology-rephrase-836ec663228b@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_041345_442285_15B59436 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5716175045241798694=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5716175045241798694==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jOVA/8ZDBYynMp1D"
Content-Disposition: inline


--jOVA/8ZDBYynMp1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull a small fixes PR.

Cheers,
Conor.

The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:

  cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v7.0-rc6

for you to fetch changes up to 305f2865bd034146b2eebc77c27fc50d8d79778d:

  riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card. (2026-03-19 16:00:13 +0000)

----------------------------------------------------------------
RISC-V devicetrees fixes for v7.0-rc6

Starfive:
Two fixes for the SD cards on the Mars CM Lite.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Heinrich Schuchardt (1):
      riscv: dts: starfive: Milk-V Mars CM Lite broken-cd

Ilya Sorochan (1):
      riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 1 +
 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--jOVA/8ZDBYynMp1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacUU5AAKCRB4tDGHoIJi
0t+KAP9HVGkJX8FC4N8a4WE1UvLQLpZrF1Kmxuixb0BDyKB5awEA3quQTryt9l5W
VRD7jvpDTuxAQFfucN2Xu7HumY2U6wU=
=ElcV
-----END PGP SIGNATURE-----

--jOVA/8ZDBYynMp1D--


--===============5716175045241798694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5716175045241798694==--

