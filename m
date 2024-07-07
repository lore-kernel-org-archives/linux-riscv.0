Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399ACC3DA44
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6BPEqCnI/6ZtHmKMrYb5RxM9MS+YQYBy++pYo2Z2oT8=; b=y0J
	PBszP9/ZuyS/UkLNhrEqvZOi3/BDkFLWv8JZZRSUsg3jTzkWH3TglPjcldMHEph0iF44I0/f/FlEb
	2dM5KP8/fST83gSkl+hDEbacSnw47vTG5vKk8eRp8/6CtLV9BTh1Pk/PNEcWQsPg73DdE+o76BtNY
	gIJiR7q4PQ3BXIsUdxfPwNSmvQTu3wRmFJotggv02nuAhGpoEfrNPz/UTrmotrNSmwyjG/EhOsImw
	qysscLmPWR2j0k2PgEVhI8bqy6R88fVbQvNZyFEFw5IcsCcdiiicFtJp9Ce/bEP2uI4iVvP6R7hBP
	3U3bzLns+JXVZLlTDT01YtchrPHFI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQW9I-000000025vy-1j4g;
	Sun, 07 Jul 2024 17:58:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQW9F-000000025vV-08EU
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 17:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4E3B602E2
	for <linux-riscv@lists.infradead.org>; Sun,  7 Jul 2024 17:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D9DC3277B;
	Sun,  7 Jul 2024 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720375083;
	bh=72I96rI7uiyl+GtQJzcvhkozVJ9pOKlNEA5uOq7BpIs=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=JAybygcrTvuH83kAC4TxwlscOgj+cJxWEaLAjJN/zaM5HUwXbiN3ziPuew3ERgnou
	 p1ZA0ZxwFGZxcW66Bvw1D2IviZG8/ZybL+UyU1jHIFxk00WbN1dvf1COALD95uzMem
	 OicBOlq16TEUE8GiENSDQC0y190UVYyqnckoRLzQKXycn6OSeEsO24FLgbZy7mhWYh
	 OpsZz0Yk+9/XBpyIzILkKc+LT9UuDGVDCGWXY8m9csaTdtlSi9UUOw1GHBszkxEK3v
	 PMnrafxWbq9BLyzqMJEnEF3tSn02tVwuWCY4PEP4sFOpntL5/c4nvR0u2EojqmYpa2
	 h6GRhiWmIwTOg==
Date: Sun, 7 Jul 2024 18:58:00 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.11
Message-ID: <20240707-nuttiness-lustfully-4aaf03c991b2@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_105805_227310_BD06510D 
X-CRM114-Status: GOOD (  13.98  )
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
Content-Type: multipart/mixed; boundary="===============9207122159081480999=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9207122159081480999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4tXnFVVA6r14f/tL"
Content-Disposition: inline


--4tXnFVVA6r14f/tL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Should be the final PR from me. I meant to send this stuff out end of
last week but I ended up getting sick - and I'm going to blame screwing
up my PR subjects on that...

There's not really a huge amount in here, I ended up dropping the k230
that missed last window cos there's been no further interest in getting
it support outside of the basic uart + interrupt controllers + memory
configuration dts that Yangyu Chen sent. The board is fairly frustrating
to work with due to the bootloader setup, and maybe nobody really cares
since it's fairly underpowered, especially compared to the Spacemit k1
equipped Banana Pi board. I've stashed it in a branch in case anyone
surfaces that cares about it. So no vector 1.0 hardware with a dts in the
kernel yet.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.11

for you to fetch changes up to 2904244a8c46bdd0fee181df693a495f4628a575:

  riscv: dts: starfive: add PCIe dts configuration for JH7110 (2024-07-01 13:20:19 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.11

T-Head:
Last change from me before this starts going via Drew's tree is the
addition of the SBI PMU events node for the th1520.

StarFive:
A dts for the Pin64 Star64, another board with a jh7110 SoC. This board
is almost identical to the existing Milk-v Mars and VisionFive 2 boards
that are already support - just with a different PHY configuration and
only one of the two PCIe ports exposed. Additionally, the Mars and
VisionFive 2 get their PCie configuration added.

Microchip:
A dts for the BeagleV Fire. PCIe is disabled on it for now, as some
binding and driver changes are required.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      dt-bindings: riscv: microchip: document beaglev-fire
      riscv: dts: microchip: add an initial devicetree for the BeagleV Fire

Henry Bell (2):
      dt-bindings: riscv: starfive: add Star64 board compatible
      riscv: dts: starfive: add Star64 board devicetree

Inochi Amaoto (1):
      riscv: dts: thead: th1520: Add PMU event node

Matthias Brugger (1):
      riscv: dts: starfive: Update flash partition layout

Minda Chen (1):
      riscv: dts: starfive: add PCIe dts configuration for JH7110

Yangyu Chen (1):
      dt-bindings: riscv: Add T-HEAD C908 compatible

 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/microchip.yaml       |   1 +
 .../devicetree/bindings/riscv/starfive.yaml        |   1 +
 arch/riscv/boot/dts/microchip/Makefile             |   1 +
 .../dts/microchip/mpfs-beaglev-fire-fabric.dtsi    |  82 ++++++++
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 223 +++++++++++++++++++++
 arch/riscv/boot/dts/starfive/Makefile              |   1 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  69 ++++++-
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |   7 +
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  65 ++++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |   8 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  86 ++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  81 ++++++++
 13 files changed, 621 insertions(+), 5 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts

--4tXnFVVA6r14f/tL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorXKAAKCRB4tDGHoIJi
0uo/AP98wGZ+35lf668q1VOJ3CAeMAkQwYt7AgPabvq7aO1hHAEAygP3TIHcsK/U
RitSn2i8ioggSeskCNm5i3NtmHP+sA0=
=SVga
-----END PGP SIGNATURE-----

--4tXnFVVA6r14f/tL--


--===============9207122159081480999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9207122159081480999==--

