Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA5CCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t5SCJJgIgMhGYkmhbGzBzd6FtHdta65ZlWDWFRyimRA=; b=vZ0iDoq2MguPuq
	1FQkBZZOCFDPfWUXEUM8pLGIUFuPogBQHFz20iL7GJ/CVajelGkmUwWFuDiOJZvgAcV2LVGVdLO21
	cuBbtQ/4FImZNdgGuCeTyaVgSvCgwI3sAKF2gjhecSOjSSTZaedHuBG4ZtfWSkam+H4Kb6/VSWyKC
	C+ssZwJ8AOHZOs84PqgE4GbbGPO+5zxIpEr7KpcIiiRuD4j+j1AeNxc65HC61b/wD49jJANVK3Mws
	nAIL9DpANJ09y0VYSYiXCcjyjOZFV6FEkVdJXQGLtJ+KT78YuNFgXeJwR3rieCbSPzvAqDvvsJtPe
	zL9C0GYtaFxY3nRv6axA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0F-00000005IjQ-0cMY;
	Mon, 10 Nov 2025 11:24:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0B-00000005Iio-3mfE
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 11:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11B80445C9;
	Mon, 10 Nov 2025 11:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1300C4CEF5;
	Mon, 10 Nov 2025 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773843;
	bh=zu7nJbmAIDCN9nTPRsaoiatu0DohODadKdDd7cio2Kk=;
	h=From:To:Cc:Subject:Date:From;
	b=QIwBLGT23wcxkouZ2iRvR/O7CM9xeDaWxf6cpzTl9wj+fXqQXeoVfjEBc4UGuA52a
	 0meP3scIp/zvj2QsoNjtAQHlONa5JGWjLuCiHRI+I4UdE6SNK2vcMNQonCMNX6eOZi
	 M2Uza383oJqzT42naeq1A0wrsDpRF2IQ2AYm28IG1W6Y0OViqGQRhxSSeEEEK0BsQv
	 CSVSmqGq91bc+d4Valjm2R/Zbkm96I1YwVxZjMHRwemM2SveuEUV3y4xuMqIrbeqO7
	 GnWDm8o0sfvlTyMaK9VvRfwfboawNnaiY6+3meNSXSmo6LuSF0RwfxYqM2x8azjTDy
	 QzqtaHGTYjakg==
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
Subject: [PATCH v7 0/5] Redo PolarFire SoC's mailbox/clock devicestrees and related code
Date: Mon, 10 Nov 2025 11:23:49 +0000
Message-ID: <20251110-zookeeper-femur-68a0ae346397@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6367; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ks+8ZMQoxqUkXVcYwuCEyeOzK2zRNHMc49nTez+pTxA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmCp90VXh1Xz1a5rTJtpV/Il6h/V7SYr61O8JYL0Fp8p umL0LnqjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEcTcjw9Elgop3mbvi7XRX fOpa1F6lyc7WeTb+sXnR0SnMHyx+djIyfE0Tm63GPGllZABjxFZn1d6nty7amx2t3FBV8rY19aw 0NwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_032404_003897_686F68B7 
X-CRM114-Status: GOOD (  33.46  )
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

Hey folks,

Here's another version with the reset stuff moved completely to regmap
as you requested Philipp. I think it looks better this way.

Claudiu, I think you're going to "have" to take the reset bits with an
ack, because they now depend on changes to the clock driver (and contain
some further changes to the regmap config and aux bus portion).

Cheers,
Conor.

v7:
 - move reset driver entirely to regmap
 - use clear_bits/set_bits instead of update_bits in reset
 - drop clock patches that Claudiu applied

v6:
- make reset depend on MFD_SYSCON
- return regmap_update_bits() result directly instead of an additional
  return 0 in reset
- use regmap_update_bits() instead of regmap_read() -> regmap_write()
  RMW sequences in clock
- drop clock driver specific lock, since regmap has internal locking,
  from !msspll clocks
- implement determine_rate instead of round_rate
- drop patch 1 & 2 (soc bits) since I applied them as a pre-req for
  pinctrl work

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

v5/6 cover letter:

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

Conor Dooley (5):
  reset: mpfs: add non-auxiliary bus probing
  riscv: dts: microchip: fix mailbox description
  riscv: dts: microchip: convert clock and reset to use syscon
  MAINTAINERS: add new soc drivers to Microchip RISC-V entry
  MAINTAINERS: rename Microchip RISC-V entry

 MAINTAINERS                             |  4 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 34 ++++++---
 drivers/clk/microchip/clk-mpfs.c        |  4 +-
 drivers/reset/Kconfig                   |  1 +
 drivers/reset/reset-mpfs.c              | 92 +++++++++++++++----------
 include/soc/microchip/mpfs.h            |  3 +-
 6 files changed, 88 insertions(+), 50 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
