Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E9C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8cUVXlTscTi8pE4+MoPgFIwqtfAvr/tGfd7ArTtNxao=; b=CSo
	XY9q/lmxMphMRopaEn0KNDEaXn0IIG1tFYi7k/QR9P4pjRzsa7sfpQIF7yUOIsW3Of+UxOONcjae6
	48homRb1KBXUWvOF2mmP6oMvuk+pC0ZzdVO4iL5zUsPf8Zb33Lq7eeTK8xAxizKq6VLFEkqhPxDE9
	xwY1llQRkl1FtRDGU2UZ7YxgQsS5lesfllnI6jmft8oD+JIUYoj6GZ9+Y49INi2VngLOBdFDD/tUl
	8Rb7NTRm6qy62aKqs0O/9WPic/kjI95s/82MSJJrd+4DphDE0C92e4spBSwPM7buPtLmP35BABKlh
	GQ64WingQRIy04cCcN6+NOpiOg1enZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fdD-00AiYx-2Q;
	Thu, 30 Nov 2023 11:54:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fd9-00AiSJ-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 11:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6478FB840FB
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 11:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB754C433C8;
	Thu, 30 Nov 2023 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701345286;
	bh=uloZUNW5ey3hM4mum0GKdS/g8cqruhOwU6aMx6keMqg=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=Yfw1liF+EwisUbW/e66jpzSNuvC54kH9pRgWd9/eR0RfFWN9CsnjW5SUFgUnKL7fc
	 21qtXkmBqd7DziaAoxM+3HP5kFOIjequ7KNcYpziyXCE9Zc0mIW3JK1Uo+MXHdAP9N
	 vF4lh0NrNWmZk7Ql1WXMQRDgRbRF3KlfsDSYOat+cg5YQfxebIuAyMM+cdHq1QpWbn
	 nB3m7luiKRQj3H023Slcy2hTh7kkoziA5xCIImGGvylPJdZ/cQgS173otcHPiwItcj
	 XeyKxku49u33oCyVJ8+9fuMr+G+ZC5v5P0+Wjo/LPft5fEG3ugwsB8JRyyu5V2Uy3i
	 XEI84qD8XirZg==
Date: Thu, 30 Nov 2023 11:54:43 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.7-rc4
Message-ID: <20231130-maternity-majestic-dd29f0170050@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_035455_313632_8FBD0731 
X-CRM114-Status: UNSURE (   9.19  )
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
Content-Type: multipart/mixed; boundary="===============0425490999024710133=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0425490999024710133==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/SaH/acr2lICzyUl"
Content-Disposition: inline


--/SaH/acr2lICzyUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

There's barely anything here, but it was annoying me seeing the
dtbs_check issues in mainline so I figured I'd send a PR anyway.

Cheers,
Conor.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.7-rc4

for you to fetch changes up to 79997eda0d31bc68203c95ecb978773ee6ce7a1f:

  riscv: dts: microchip: move timebase-frequency to mpfs.dtsi (2023-11-26 11:44:51 +0000)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.7-rc4

Two fixes, both rather minor. The first fixes some dtbs_check warnings
introduced after an update to the bindings, that returns the
architecture to being clean of dtbs_check issues. The second relocates
a soc-specific property to the appropriate location in $soc.dtsi, and
hopefully avoids the same mistake being copy-pasted into more
devicetrees.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      riscv: dts: sophgo: remove address-cells from intc node
      riscv: dts: microchip: move timebase-frequency to mpfs.dtsi

 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts    | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts    | 7 -------
 arch/riscv/boot/dts/microchip/mpfs.dtsi           | 1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi           | 1 -
 7 files changed, 1 insertion(+), 36 deletions(-)

--/SaH/acr2lICzyUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWh4AwAKCRB4tDGHoIJi
0uD1AP41ASM/NINZRhHMzxuIj0DARhKNBd9Nc190aZXZm9QRWAEA1q6ntbtNTUo0
Ousy9rTtXSAwKQUYSSHvqFTu48QDQA8=
=ex0/
-----END PGP SIGNATURE-----

--/SaH/acr2lICzyUl--


--===============0425490999024710133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0425490999024710133==--

