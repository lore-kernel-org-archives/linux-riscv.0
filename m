Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B81EF4EC2
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jkclNUTqL0qkkYFfz8ZZC4FLzUnA5Dmkg3Yv9paRxnA=; b=fVq
	L+hYKWXFRbw/4Cjz4oyuyIYRPd2q2Ug4JzuhRGMFd6hZHlVickpRf5CZ6yuLyVoYpVpLuHNxmAq4Y
	K3vApyBrQ5SMbpNO8K9p5j5kS/S1NY1U5kzNenEe70/M0T0FDP9sZk3//Mz0VXJJCNcpjFl6YphKT
	ZF0mCvr8GwOo2W5lFvuf2Z0FwUE5o+nsL51vsJ07Uz/ES9B0UTl8OW6LSts5gbmXeCiXEVJcpB+Um
	tuZTftSfEreS8vsU1lhsDpNZ/1v7U7CZIbGzaDm3idRknIhBUzfKMrWPOgXukFoavJFVzou78k7/f
	nLWwos5DV31EGbXvWpm7HE1fjZKSi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hJq-000000051xE-41Lv;
	Mon, 06 Apr 2026 10:36:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hId-000000051Oq-0ZMY
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 10:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 469354418C
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 10:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36965C2BCB2;
	Mon,  6 Apr 2026 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471718;
	bh=fZJwWZGCMsWt5WVh+Ig6SZBzzZylN81uk6bAMko3zvE=;
	h=Date:From:To:Cc:Subject:From;
	b=ne1gPalmg5ep1RlzXvnJU5QbXLiTd7272J88QFdPbSk6Ir2nQHzPy4QdbQpc1lSWY
	 q0f0OGDKdlJ2htuIecFGzPybRmxWa2HsOWJcoQT7QXLSsiglwT3Hf/cEvD4QWcXB6i
	 p/YJdUTgdj12SU2+qP/Odd46+TOTdP6Niv+W4VWT3kGeZKRP9Hbc2uSC2YBlGd0jpL
	 0QazIW8I2TJaXoMw24V+OteFQQLQDXyM0h82KCPn3HwAR5ZeBVOsk9F0u8DCcHu004
	 /eudnDi06XKzXtJs6nsd1I25mA1iqiCrFBU/ihU0jWMO+mF+E4+IyH/ARU3FYtd/Mj
	 qL1PM08H26Y1Q==
Date: Mon, 6 Apr 2026 11:35:15 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V soc drivers for v7.1
Message-ID: <20260406-spearmint-request-b71f627dc08c@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_033523_086169_CC00D74C 
X-CRM114-Status: GOOD (  12.63  )
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
Content-Type: multipart/mixed; boundary="===============0391501645536003003=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0391501645536003003==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n3WH9EHYOiLI3q76"
Content-Disposition: inline


--n3WH9EHYOiLI3q76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull my driver updates for 7.1.

Thanks,
Conor.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.1

for you to fetch changes up to bd34cdd6d214f815570986ce55978fd7ddd8d8ac:

  soc: microchip: add mpfs gpio interrupt mux driver (2026-03-31 14:13:14 +0100)

----------------------------------------------------------------
RISC-V soc drivers for v7.1

Microchip:
Add coverage for the pic64gx in the system controller and syscons.
Add a interrupt mux driver (akin to the one that Renesas recently added)
that fixes a problem where the platform never properly modelled gpio
interrupts. There's a gpio driver change here that Bartosz has acked
that adds the interrupt support to the GPIO driver itself.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (4):
      dt-bindings: soc: microchip: add compatible for the mss-top-sysreg on pic64gx
      gpio: mpfs: Add interrupt support
      dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
      soc: microchip: add mpfs gpio interrupt mux driver

Pierre-Henry Moussay (2):
      dt-bindings: soc: microchip: mpfs-sys-controller: Add pic64gx compatibility
      soc: microchip: mpfs-sys-controller: add support for pic64gx

 .../soc/microchip/microchip,mpfs-irqmux.yaml       | 103 ++++++++++++
 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   |  18 +-
 .../microchip/microchip,mpfs-sys-controller.yaml   |   4 +-
 MAINTAINERS                                        |   2 +-
 drivers/gpio/Kconfig                               |   1 +
 drivers/gpio/gpio-mpfs.c                           | 122 +++++++++++++-
 drivers/soc/microchip/Kconfig                      |  11 ++
 drivers/soc/microchip/Makefile                     |   1 +
 drivers/soc/microchip/mpfs-irqmux.c                | 181 +++++++++++++++++++++
 drivers/soc/microchip/mpfs-sys-controller.c        |  74 ++++++---
 10 files changed, 488 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
 create mode 100644 drivers/soc/microchip/mpfs-irqmux.c

--n3WH9EHYOiLI3q76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadOMYgAKCRB4tDGHoIJi
0uo8AP9PYB0GQdK6WV4VT+Dr77MlLx2xoCT0XkgFWDkruO82/QEAza6Y9CnWvi31
8654TI2+1w19rW+/0CQi3oU1qB/ajgo=
=esMu
-----END PGP SIGNATURE-----

--n3WH9EHYOiLI3q76--


--===============0391501645536003003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0391501645536003003==--

