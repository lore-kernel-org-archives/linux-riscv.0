Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781DDC3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=StHDZVrNtvnWBPWvXUFDpp6BCBkkxxNW6sn3qxsqR3M=; b=wZ/
	+FrRqvaFmBB+KeXV+3RmxXzZ6oz4gcyqwZNhUHh3mdvXwQJ/un2G2h8zWKdrlM0bLmYd1d0YjErGF
	Re8w1ioqetaa7ESQ/F15jN8fLLSLhgOwDLcP+CBpVqO4FSrLKRzGz5ym42EC29yvbjHGY09KFjheO
	8xfz8mFU5AReqvhmmihWJSYmIxJBgenXOIdJjRnIXH+Axc8B6Auku/F4yr3GIqRxf5BPKmz9X7yKQ
	4YsSUvrO3Y6rVNWXbdj9V1Pri9KZ1peOF9T5hZVS4NtWyFNdVA9i0794EmiOGy21kmoiwAEBFgsRI
	nyGqB/ovQHtwyvMhHhhH8hZpzsfNO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFt5I-00000003F2b-1a8C;
	Fri, 16 May 2025 11:18:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsox-00000003D5h-2nqT
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 11:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBF2F629F7
	for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 11:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62B4C4CEE4;
	Fri, 16 May 2025 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747393302;
	bh=Vq+12IYot7g5r+2zqoGU+kI4hthH7/3l7cf08q+d388=;
	h=Date:From:To:Cc:Subject:From;
	b=EgyhdOX+CJ2vlu031JvYZH+rZ/QwLZNiko7qrjukTDrmR939JSyd7QGd/9qyzESHi
	 66wlcn28ZvP4bBn5k29LdKz6ICPGh5uZyfxJUf34Eu0VWBv6EvcnXQk/pT0dRWqsUg
	 p7/3kMRguCIgAKwr3t5J2wKa5hlgtc3ZPZSKSETkawUCFhQpvdeOAHyuqo+zR7nlKa
	 2jS3gJZfts2gZcCAbYwIQ4rzCuj89+t5p1+5zThEz5lMA1ku9W/BSPSz7axOLtOn/W
	 0GHDeiBpLejKNL4X58bKt6M5MJ/Yq+eUAMj7C+WaFLXQRTuceFiKtu7nGUt+ir+Yo6
	 QAO1j0Pn+H7sQ==
Date: Fri, 16 May 2025 12:01:39 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL 3/3] RISC-V Devicetrees for v6.16
Message-ID: <20250516-gap-exploring-f8f516ab4e1c@spud>
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
Content-Type: multipart/mixed; boundary="===============4185209548831517908=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4185209548831517908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2IJr7IMmKSXyj3sE"
Content-Disposition: inline


--2IJr7IMmKSXyj3sE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd

Please pull some ~RISC-V~Starfive updates for 6.16. They're a bit late
and only went into linux-next today, cos I was stalling out for some
acks before picking them up.

Thanks,
Conor.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.16

for you to fetch changes up to d50108706a63dfd896db42172bf9f6aebec219c5:

  riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader (2025-05-15 21:08:27 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.16

Starfive:
All Starfive this time (again), enabling the usb3 port on the framework
laptop mainboard, and a few cleanup patches that are syncing things with
the dts used by U-Boot.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (4):
      riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to syscrg
      riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
      riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
      riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader

Icenowy Zheng (1):
      riscv: dts: starfive: jh7110-common: use macros for MMC0 pins

Sandie Cao (1):
      riscv: dts: starfive: fml13v01: enable USB 3.0 port

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 52 ++++++++++++++++------
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts | 19 ++++++++
 2 files changed, 57 insertions(+), 14 deletions(-)

--2IJr7IMmKSXyj3sE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCcbEwAKCRB4tDGHoIJi
0pzoAQDcMeUjjl0jWfUF3Z+3zScNmhO6A2N3lq3xsK3VLEH2vwD+LdAfnMEhjgtn
F6YEEBh7DUs3v7gQqbV5gfvWv/zx0g8=
=KifE
-----END PGP SIGNATURE-----

--2IJr7IMmKSXyj3sE--


--===============4185209548831517908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4185209548831517908==--

