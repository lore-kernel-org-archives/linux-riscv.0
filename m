Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46279C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=sUpIGgReyxR8yiVU6rAXBsjxerkouaD6dQrdlBeieA4=; b=vyH
	WiQcitqBe4TkO+p3CeqQ1wJ66Xr7a4N7MwlW+j8eLbf7LFA+ygxVh63mK4rODIhqWSM2JWJNruDkq
	oaNwRRObHWcj7dL4Rk+lPLmk9dmj7Q1LorElPKd20ILx4urXd38qzdd7F7C/aOe4quEc3d2vtjdWS
	qoJpsR7saB/n69G/zK+azAcEVoZuP/ST8kaPtteT5nhh8M6GZvEQMl10IAYjZ+CKvUjGuzFrJluLi
	mQeW9YU+gg3nAapeRZYksbu82uuHtsgwt2tP1LADOvT+TW/y5z/NXEUfBsBL2gZsA/JXRnm5Vrva1
	Wxdq/fSgodX15VKWwiMPVPzNYoAHGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxr0N-00000006LUV-1Kji;
	Fri, 19 Apr 2024 16:22:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxr0K-00000006LTe-1eek
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 16:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A502CCE1AC5
	for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49EFC072AA;
	Fri, 19 Apr 2024 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713543741;
	bh=tykiRrAOFNSBCcBojEGAuFmXfbFr/4l3FJUVgUfZRlw=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=Y8Ic+fPe6YsrfeE5p/h8W0bYCzFNP+MloWit55/1hWKMhU8lnn1qZCqQULY6UjCir
	 K0Jwn+ujlWzgkPZ71Pt471PPxD6rmIeDgAnit4sKpo537g/U+l9svPn0+1ultUrNSb
	 jxA2jE+UtKRnKPtMbRFnK2r1AaRsxsYOIxWBP6Jrj4mLfl35dMf5SPGbgVCBP4tlO5
	 INxjRvUdD7oIxkqQ/8guIwunpcLeU0m5xgGheYEmGypeSKalcTyN7dGkRcjjGaXXEv
	 v/yde+EGOkeB141cW/AgcenmdKy4fxbez7XmWiJF4o/PSCFVvpgHCx2SYvtol5bHuo
	 X9jTGUWAwZq1w==
Date: Fri, 19 Apr 2024 17:22:12 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.9-rc4+
Message-ID: <20240419-unnamable-tapering-f05a0af759e3@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_092224_641510_E1AC9B9B 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: multipart/mixed; boundary="===============1464647757236381526=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1464647757236381526==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qd0a+jweUOhx8E8e"
Content-Disposition: inline


--qd0a+jweUOhx8E8e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some dts fixes, all for the VisionFive 2 :)

Cheers,
Conor.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v6.9-rc4+

for you to fetch changes up to e0503d47e93dead8c0475ea1eb624e03fada21d3:

  riscv: dts: starfive: visionfive 2: Remove non-existing I2S hardware (2024-04-15 16:16:11 +0100)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.9-rc4+

StarFive:
Three fixes, all for the VisionFive 2. The first removes a clearly
bogus PMIC interrupt that looks innocuous at first glance, as "0" would
be a valid interrupt number for a GPIO and that is what I expected to be
used for an external PMIC's interrupt. It is actually a PLIC interrupt
and the 0 was used here to satisfy a driver requirement for an interrupt
that was subsequently relaxed. The schematics of the board show this
PMIC interrupt to not be connected.
The other two fixes remove from the dts pin configuration for add-on boards
which are actually on Raspberry PI compatible hats so should never have
been added to the dts for the board. Emil spotted it because both devices
try to claim the same pins.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Hannah Peuckmann (2):
      riscv: dts: starfive: visionfive 2: Remove non-existing TDM hardware
      riscv: dts: starfive: visionfive 2: Remove non-existing I2S hardware

Shengyu Qu (1):
      riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board

 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 99 ----------------------
 1 file changed, 99 deletions(-)

--qd0a+jweUOhx8E8e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKaNAAKCRB4tDGHoIJi
0lxjAP4+WFI/G1/lYaiCriK52KPTydrZj5Wy0gnc9mNHZCyb5wD9F67XXFgoLGzt
XKt49zE7VSGcza15yE849gMtQAz6ugo=
=VWdk
-----END PGP SIGNATURE-----

--qd0a+jweUOhx8E8e--


--===============1464647757236381526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1464647757236381526==--

