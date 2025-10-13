Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5D0CCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lm1hVYBOCTLnX6brzbpEf8Q4FkFikT4Rj29Xm22BXBQ=; b=3wsS0OIL+Ug0No
	oKRtLxkIW3zlNzckKisrG6r0BxpMbMhELnhWsNLe6jYRZgIeQfytZSqgoX7jAG094M5MoA1jNC0Sr
	xYF4JOUH1fH1tsCQ8hsS+Fzl2eDyt2WwP+iPJ7um1t5hxwiZABnLX5V0+9TuCnyKUvKVCZ7TtpxnA
	jvoAvW3r5bNV6e2z9iiMsaLCdSXVfMcPHZQsm2EW3ac721alLxQscImB8CNtHCfdhecufDVARuyEg
	V/5XsEa/OKRovOJw7+v4xzLR9yioFOtD4GslHmuRXXn0/6+cvDz99ZKFjsuGZLq/Aq+48Gud0V9N1
	r/YEHT8o+N+Z0SQLM4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeA-0000000E4l9-2z44;
	Mon, 13 Oct 2025 17:47:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Me9-0000000E4l0-2xR3
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D338660282;
	Mon, 13 Oct 2025 17:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB3C4CEE7;
	Mon, 13 Oct 2025 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377664;
	bh=4ulKO/nNlIiLicDqkZpPpvf0e+rycqGoPn+RZv+JvMw=;
	h=From:To:Cc:Subject:Date:From;
	b=Q7ERShdNM6XntNbj6meJb2yfBnF8LsTnoPne937gDeIQk/nztBleaxW4aj8Z1tt51
	 YzBjT2UBkT3oB9ZTz8hGPbiRfYlYrO+eudMq+L4XlaE3whyuDJfn31HiOBYPRBZyQ9
	 2PHNH0M57krmaLf/okmumJAZERbgM/cq+TygqVs9qa9+QXMu5F2CUOuOcA9YgK3rmW
	 bFLTrjHFj8qlloRwRzzuw20zphnUTrORgcwIYZDYXABO1oSpcg/OdI6FHzSkd7Cvj7
	 KLkVw9rOne9ToM5mWJ/80RzmHProrzZXQSibvu7mt8CeSbQhKBozCWGt3pgcJSmMWi
	 ZZ7hUL6ccqNoQ==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] Redo PolarFire SoC's mailbox/clock devicestrees and related code
Date: Mon, 13 Oct 2025 18:45:32 +0100
Message-ID: <20251013-album-bovine-faf9f5ebc5d4@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6256; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=rkUkOvChnR2CrvTD3zqV7j5Mky8Pa7y5ASzMCn0aDOE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlvrfab2FgyGteEZEr3H2xaIKg4ITPE7VSL2tbnjvyP2 p92HfrTUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl86mJkWGO/v8royMt9Eg+U tjp/2X9rU67f/uCg6lleTzeU1RSbBDEyTD5c4cB25ulVlSk++aXtuf8yRBxCv087teGu6686Nr0 tzAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

In v5 the only real change is that I removed the attempt at a common
implementation of regmap-based divider/gate clocks. The series hasn't
managed to receive feedback on my approach in 2025, despite sending
several revisions and bumps, and it is blocking support for both new
drivers (gpio interrupt support, pinctrl and hwmon off the top of my
head) and a new platform so I have decided to strip out the attempt at
making something common in exchange for something that can be merged
through the clk-microchip tree without relying on feedback from the
clock maintainers.

Currently the driver uses the common gate and divider clocks, but the
driver used to use its own custom clock types. Reprising this version of
the code allows me to use regmap accessors in the driver without any
wider impact, or attempting to create something that works for any other
user. It has the advantage that it has already been tested in that prior
for, and all that is done to the clock implementations is replacing
readl()s and writel()s with their regmap equivalents.

Hopefully this change has made it possible to merge the series,
Conor.

v5:
- drop mfd patch applied by Lee
- remove attempt at common regmap divider/gate clocks, and replace it
  with a return to how the code used to look, before it started using
  the non-regmap versions of the common divider/gate, with the
  readl()/writel()s replaced by their regmap equivalents.

v4:
- unify both regmap clk implementations under one option
- change map_offset to a u32, after Gabriel pointed out that u8 was
  too restrictive.
- remove locking from regmap portion of reset driver, relying on
  inherent regmap lock

v3 changes:
- drop simple-mfd (for now) from syscon node

v2 cover letter:

Here's something that I've been mulling over for a while, since I
started to understand how devicetree stuff was "meant" to be done.
There'd been little reason to actually press forward with it, because it
is fairly disruptive. I've finally opted to do it, because a user has
come along with a hwmon driver that needs to access the same register
region as the mailbox and the author is not keen on using the aux bus,
and because I do not want the new pic64gx SoC that's based on PolarFire
SoC to use bindings etc that I know to be incorrect.

Given backwards compatibility needs to be maintained, this patch series
isn't the prettiest thing I have ever written. The reset driver needs to
retain support for the auxiliary bus, which looks a bit mess, but not
much can be done there. The mailbox and clock drivers both have to have
an "old probe" function to handle the old layout. Thankfully in the
clock driver, regmap support can be used to identically
handle both old and new devicetree formats - but using a regmap in the
mailbox driver was only really possible for the new format, so the code
there is unfortunately a bit of an if/else mess that I'm both not proud
of, nor really sure is worth "improving".

The series should be pretty splitable per subsystem, only the dts change
has some sort of dependency, but I'll not be applying that till
everything else is in Linus' tree, so that's not a big deal.

I don't really want this stuff in stable, hence a lack of cc: stable
anywhere here, since what's currently in the tree works fine for the
currently supported hardware.

AFAIK, the only other project affected here is U-Boot, which I have
already modified to support the new format.

I previously submitted this as an RFC, only to Lee and the dt list, in
order to get some feedback on the syscon/mfd bindings:
https://lore.kernel.org/all/20240815-shindig-bunny-fd42792d638a@spud/
I'm not really going to bother with a proper changelog, since that was
submitted with lots of WIP code to get answers to some questions. The
main change was "removing" some of the child nodes of the syscons.

And as a "real" series where discussion lead to me dropping use of the
amlogic clk-regmap support:
https://lore.kernel.org/linux-clk/20241002-private-unequal-33cfa6101338@spud/
As a result of that, I've implemented what I think Stephen was asking
for - but I'm not at all sure that it is..

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: pierre-henry.moussay@microchip.com
CC: valentina.fernandezalanis@microchip.com
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (9):
  dt-bindings: soc: microchip: document the simple-mfd syscon on
    PolarFire SoC
  soc: microchip: add mfd drivers for two syscon regions on PolarFire
    SoC
  reset: mpfs: add non-auxiliary bus probing
  dt-bindings: clk: microchip: mpfs: remove first reg region
  clk: microchip: mpfs: use regmap for clocks
  riscv: dts: microchip: fix mailbox description
  riscv: dts: microchip: convert clock and reset to use syscon
  MAINTAINERS: add new soc drivers to Microchip RISC-V entry
  MAINTAINERS: rename Microchip RISC-V entry

 .../bindings/clock/microchip,mpfs-clkcfg.yaml |  36 ++-
 .../microchip,mpfs-mss-top-sysreg.yaml        |  47 ++++
 MAINTAINERS                                   |   4 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  34 ++-
 drivers/clk/microchip/Kconfig                 |   2 +
 drivers/clk/microchip/clk-mpfs.c              | 250 +++++++++++++++---
 drivers/reset/reset-mpfs.c                    |  83 ++++--
 drivers/soc/microchip/Kconfig                 |  13 +
 drivers/soc/microchip/Makefile                |   1 +
 drivers/soc/microchip/mpfs-control-scb.c      |  45 ++++
 drivers/soc/microchip/mpfs-mss-top-sysreg.c   |  48 ++++
 11 files changed, 480 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
 create mode 100644 drivers/soc/microchip/mpfs-control-scb.c
 create mode 100644 drivers/soc/microchip/mpfs-mss-top-sysreg.c

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
