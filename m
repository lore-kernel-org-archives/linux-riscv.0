Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CEFCD8C92
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=t5twMop07M53MYD8E8eS05GTxAvYkm73vtd+Zob3Wtg=; b=HDP
	t3kPw21ZUM0AAEV6Ij1B7cnIAbCVd/wxSBmso7FD3zHCSmr/tYa++hqVCCcVKYgLWk1kb0pLkui3c
	IPSPYZ5GCBaFWlFWncwARuSltAOsdAZ1hq7MvWQ4xmk5fKBXsS5kvTb8SD0kMJ31rUEtynHBx7iQ2
	kQNhtchHpaymG0Hm/TJvZdSPgJ+xeTDgQd6tZsNxvrgfdHKSOhOUZba2gGi7XLvQnPdpvxAl5MzQD
	cdxK7YIVuccSPz7p0Ep/QoQZoBa/j8yCwSYmNeZqnh9KqaQJtrE16S7Xyrgqs3+bYg7WfLHagvmta
	sfmcbMjPwECpKMPGaNzqOeKWsa18vvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWX0J-00000003JgK-3OZO;
	Mon, 08 Jun 2026 10:14:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWX0I-00000003Jg0-27Bb
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 10:14:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CBAD601D8
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 10:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5CC1F00893;
	Mon,  8 Jun 2026 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913685;
	bh=YQrV6yiTXhTJTiEMyFNXs8wBs1V6hB9Az82uhmiDxIE=;
	h=Date:From:To:Cc:Subject;
	b=apbmPii0hnBIMFovwfQfkWKIp+JqKWjxhSJDqota4g8FCLfrLxvPDvaDVM4EzcaXh
	 u9g2RNTT0+GL7BEg9Rtdkqd38qGtLZlWdFBg01sZCyekpW+SC46wCk0WL7TaYXGJzK
	 SZDP1iIYVCr6oRoEQP2yQ6GTO8SkAyWnEGciG2kfBETQXej0pvenkBTIcZ0yFQJSRd
	 f+AVNALBoPtVpURkFCSoAAGq5n/emLvnJRQTuWqonlPNBI9NIrjCJ2YA6TCsC9CFN3
	 W5/6ufaAogQpy5S2FomdCHiedVhLfM/4/+X6vRowvRrSRoKJ/nqJxxjhpr+DrXvaes
	 yTopcxCpe4yAQ==
Date: Mon, 8 Jun 2026 11:14:42 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Microchip RISC-V devicetrees for v7.2
Message-ID: <20260608-grumbling-gigantic-b0bb128634f2@spud>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============1257781174633713646=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1257781174633713646==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4x40SOgMRt7pnXoG"
Content-Disposition: inline


--4x40SOgMRt7pnXoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull my changes for 7.2, all of which are cleanup/low priority
fixes written by yours truly.

It's probable that I will have a second PR, because I am waiting for
Stephen to hopefully merge my Canaan clock driver series that is a
pre-requisite for the addition of the Canaan k230 SoC. I'd have sent
this earlier, but I was hoping that k230 support would be ready in time.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.2

for you to fetch changes up to 3869417f8996fb076998342d0db560fdd795a3a6:

  riscv: dts: microchip: remove redudant enabling of syscontroller (2026-05-15 17:51:09 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetrees for v7.2

This time around, there's nothing other than patches for Microchip
boards. All of this is low priority fixes and cleanup, centred on the
pic64gx and beaglev-fire boards. There is no new support added.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (10):
      riscv: dts: microchip: add tsu clock to macb on pic64gx
      riscv: dts: microchip: update pic64gx gpio interrupts to better match the SoC
      riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically
      riscv: dts: microchip: gpio controllers on mpfs need 2 interrupt cells
      riscv: dts: microchip: remove gpio hogs from beaglev-fire
      riscv: dts: microchip: clean up beaglev-fire regulator node names
      riscv: dts: microchip: add adc interrupt on beaglev-fire
      riscv: dts: microchip: add gpio line names on beaglev-fire
      riscv: dts: microchip: fix pic64gx gpio interrupt-cells
      riscv: dts: microchip: remove redudant enabling of syscontroller

 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 37 ++++++------
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts   |  4 --
 .../boot/dts/microchip/mpfs-icicle-kit-common.dtsi |  4 --
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts  |  4 --
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts  |  4 --
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts     |  4 --
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts     |  4 --
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  6 +-
 .../boot/dts/microchip/pic64gx-curiosity-kit.dts   | 67 ++++++++++++----------
 arch/riscv/boot/dts/microchip/pic64gx.dtsi         | 46 +++++++++++----
 10 files changed, 95 insertions(+), 85 deletions(-)

--4x40SOgMRt7pnXoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiaWEQAKCRB4tDGHoIJi
0uiKAP90AYti2LQE3wO9hYO4xVpMawT/WiBimG6wfGNpIzArpgEAqJOL/r/LL23q
ZJrKrsiZMbyOcltRla49S8jWGM2F0Qw=
=U2AX
-----END PGP SIGNATURE-----

--4x40SOgMRt7pnXoG--


--===============1257781174633713646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1257781174633713646==--

