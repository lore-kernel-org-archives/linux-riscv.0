Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B33C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=JiQXl857AKVGp7cdP+Tm9Os4Ji+4XWUnjsEJaO7QQ9M=; b=pCd
	uOxHI3DVQoraXL3BRQwulSYWgQbT2t1j3sat4+5G9kMsyzEV/iz+PQJoZrq1xQoZzzkqNBx8ogn9S
	2FS5W+5fqyQm9pOkNdg6MkNQFfcmrXUDXInHX8TdTxMs5DGfTYwLkdNgHNftzo831QUPEuj1AdNwO
	Rwwbsd+9UG1FUJorF7Jim6Ft4/XJKsj3jdupcfSFGSg5v/M1rMiQ4yRTvtOZo/DShJtpRfahPEJjK
	SB2RhUFRgI8zjXlW2AXrjXA8wImYcoo3O3xXrHIrfk+mS2wyOToErb95X+ner9KktLo0YYf5t8aRY
	LHuv/jmLgzDJfhkib/RGCLR4qGqtqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMB7j-008N1w-22;
	Wed, 19 Jul 2023 17:38:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMB7g-008N1V-27
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:38:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE267617A2;
	Wed, 19 Jul 2023 17:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0371C433C8;
	Wed, 19 Jul 2023 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689788279;
	bh=j8fNe4V6ZoYqVeurCp5XYHQ1q1HBhfOcJ3wv4cQjznI=;
	h=Date:From:To:Cc:Subject:From;
	b=XXXIZzTnsOmNAZoY6u1uQNaEkzsZ7kWfKmmPwfb/6VUSvOvnHbwQLgeyum96k+FH6
	 DuqpxWo9ozapRiaI3O672LBXfrM9E/HuQBWB9foXmw0NuHmKUFW99d+qtJV75JvRBz
	 FoxupFrqguSin+YMWEaU2AJPug7nuHyVDg0OGQsunfeLaDogSWLNIq7pP+4JspYCDo
	 Mh96AQgspxG1Wqm2WBSLAK9lxWheTgXa6KfBuLQndPqM3VxGuMFa7ol2u/wkU7DW5u
	 k6zFL3dIzSirihoLS3hB7PRWWJiuXn5xCvN0JC6RmYD2nL1mij3l43r3Ky8CI7qP6O
	 MiB9lbZHbAcNQ==
Date: Wed, 19 Jul 2023 18:37:55 +0100
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, emil.renner.berthing@canonical.com,
	xingyu.wu@starfivetech.com, walker.chen@starfivetech.com,
	hal.feng@starfivetech.com
Subject: [GIT PULL] StarFive clock driver additions for v6.6
Message-ID: <20230719-trough-frisk-40b92acb485a@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_103800_784591_E5BF1607 
X-CRM114-Status: GOOD (  16.55  )
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
Content-Type: multipart/mixed; boundary="===============4671566663606631302=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4671566663606631302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qsMV8CFYKUIPWrxp"
Content-Disposition: inline


--qsMV8CFYKUIPWrxp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Stephen,

Please pull some clock driver additions for StarFive. I've had these
commits, other than a rebase to pick up R-b tags from Emil, out for LKP
to have a look at for a few days and they've gotten a clean bill of
health. Some of the dt-binding stuff "only" has a review from me, but
since I am a dt-binding maintainer that's fine, although maybe not
common knowledge yet.

I've also gone and re-arranged the patches in this PR relative to their
mailing list postings, so that the dt-binding patches can be used as a
base for adding the clock controller nodes & dependant peripherals to
the jh7110's dts.

I'm hoping that next time around, someone from StarFive can send you the
PR, maybe Walker, Hal or Xingyu are interested in that.

Thanks,
Conor.

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/clk-starfive-for-6.6

for you to fetch changes up to dae5448a327edef952faaf31bb3aedb0597ba62a:

  clk: starfive: Add StarFive JH7110 Video-Output clock driver (2023-07-19 18:08:05 +0100)

----------------------------------------------------------------
StarFive Clock Drivers for V6.6

Add support for the System-Top-Group, Image-Signal-Process, Video-Output
and PLL clocks on the JH7110 SoC. These drivers come with their
associate dt-bindings & the obligatory headers containing defines of
clock indices.

To maintain backwards compatibility, the PLL driver will fall back to
using the fixed factor clocks that were merged for v6.4. The binding has
been updated to only permit sourcing the PLL clocks from the PLL's clock
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Emil Renner Berthing (1):
      clk: starfive: Add StarFive JH7110 System-Top-Group clock driver

William Qiu (1):
      dt-bindings: soc: starfive: Add StarFive syscon module

Xingyu Wu (9):
      dt-bindings: clock: Add StarFive JH7110 PLL clock generator
      dt-bindings: clock: jh7110-syscrg: Add PLL clock inputs
      dt-bindings: clock: Add StarFive JH7110 System-Top-Group clock and reset generator
      dt-bindings: clock: Add StarFive JH7110 Image-Signal-Process clock and reset generator
      dt-bindings: clock: Add StarFive JH7110 Video-Output clock and reset generator
      clk: starfive: Add StarFive JH7110 PLL clock driver
      clk: starfive: jh7110-sys: Add PLL clocks source from DTS
      clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver
      clk: starfive: Add StarFive JH7110 Video-Output clock driver

 .../bindings/clock/starfive,jh7110-ispcrg.yaml     |  87 ++++
 .../bindings/clock/starfive,jh7110-pll.yaml        |  46 ++
 .../bindings/clock/starfive,jh7110-stgcrg.yaml     |  82 ++++
 .../bindings/clock/starfive,jh7110-syscrg.yaml     |  18 +-
 .../bindings/clock/starfive,jh7110-voutcrg.yaml    |  90 ++++
 .../soc/starfive/starfive,jh7110-syscon.yaml       |  93 ++++
 MAINTAINERS                                        |  13 +
 drivers/clk/starfive/Kconfig                       |  33 ++
 drivers/clk/starfive/Makefile                      |   4 +
 drivers/clk/starfive/clk-starfive-jh7110-isp.c     | 232 ++++++++++
 drivers/clk/starfive/clk-starfive-jh7110-pll.c     | 507 +++++++++++++++++++++
 drivers/clk/starfive/clk-starfive-jh7110-stg.c     | 173 +++++++
 drivers/clk/starfive/clk-starfive-jh7110-sys.c     |  62 ++-
 drivers/clk/starfive/clk-starfive-jh7110-vout.c    | 239 ++++++++++
 drivers/clk/starfive/clk-starfive-jh7110.h         |   6 +
 include/dt-bindings/clock/starfive,jh7110-crg.h    |  80 ++++
 include/dt-bindings/reset/starfive,jh7110-crg.h    |  60 +++
 17 files changed, 1803 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-isp.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-pll.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-vout.c


--qsMV8CFYKUIPWrxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLgfcwAKCRB4tDGHoIJi
0lmJAP9HWeKpdCSL67AwIjv55KgNNNrkUnKLYPLUvt5I9PVBiQD8CZL7F7liwV2T
wp5fHXjNITJ5rh7sCYQ5V3PfHNRqEwI=
=SUmS
-----END PGP SIGNATURE-----

--qsMV8CFYKUIPWrxp--


--===============4671566663606631302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4671566663606631302==--

