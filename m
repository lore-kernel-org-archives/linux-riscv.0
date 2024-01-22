Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3393EC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w74NRKQaxq7pit65ZmSOtl0Szn3HOmYz70L6eR41rTk=; b=Mer3XHVy77RqP2
	v0VPtbPisYTBPzvnG1tv/cMEMUqWSxzqkOS6HavitviPmS5phrs6w0n15tobg+KdXOIrK/+h2vIVh
	HhWZ36ahPqjnj3n8zUI8uipJ2lxQD/Ue0g2n/5qfN15Vtph5shGGCGKFZh494yXNZTmWaCXVT9EGP
	o99+/cZrxmXL6vz/qqtMSmxz/c2uH3qO5xu0t7mjRLN+zH73wyDEzIxDkdHduXbYJ24HPM+68WQ8Q
	mV2s7q2YSkHDdnko06ilZh0JgXxc2yh/mWJJfSiSsaP5ugMd3jXg2tXs6UjzCs+XR0Odlz/Yonqdz
	RPJZD5pFRxR3eI1vmjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtHi-00C48Q-2c;
	Mon, 22 Jan 2024 12:20:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtHg-00C480-2R
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2103612BB;
	Mon, 22 Jan 2024 12:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3934FC433F1;
	Mon, 22 Jan 2024 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926011;
	bh=IlLNZwCv119gs+G1XZGQUJ/nTZHJ2OxfZVk+jo076AY=;
	h=From:To:Cc:Subject:Date:From;
	b=ob2Qox9Rq4r16y13ck9Hpq/TMnEm3RnAjWh84mJdSYOZTkruw2jb+VCPFnb0Lh4YU
	 pS5oIzblRyjnRjjqPfAHjKIZKxL9x42SXUb8gB1lQbEUn+1l+lMIUcaAV95xVZGoUU
	 P2XGfjHWsDWVYKJuf3CompvjiOERgDFSqMsfHP5LatjVDA5SEfF20l6DqbM7sIlXi8
	 RV6aXp4F2GBCs1WO8rmakFi3XVxuIQUthGmGg/B3KKVmCmgRzoVZl6cS3czqWGreXt
	 2FZGSOYl7DWpB/B9+H/v/gNjlgs6z/gBcfpU6eBBKBhJk55mR7KOgsYj8TsM5AK61G
	 EdbigUbi7JqxQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/7] MPFS clock fixes required for correct CAN clock modeling
Date: Mon, 22 Jan 2024 12:19:48 +0000
Message-ID: <20240122-catty-roast-d3625dbb02fe@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LljwZDfMNfbMVLp7XtH+2mdlVEJFVNUoZZukL9HDn4g=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYpNPeB3Nb1kttaDRUG6G2KQrfo9W/pvGmv1XWTDCd +Zr1hbbjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyEjZvhfzE3J/uknFOdS1IO rBILU2HdXCJ24FX6s1di79+EBT29fpqRYfPeFnMmbcM8vdZjkyPudL37ZpvB+vux3oJDb74//3y ligUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042012_885448_4F50EFDB 
X-CRM114-Status: GOOD (  11.11  )
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

While reviewing a CAN driver internally for MPFS [1], I realised
that the modeling of the MSSPLL such that only one of its outputs could
be used was not correct. The CAN controllers on MPFS take 2 input
clocks - one that is the bus clock, acquired from the main MSSPLL and
a second clock for the AHB interface to the result of the SoC.
Currently the binding for the CAN controllers and the represetnation
of the MSSPLL only allows for one of these clocks.
Modify the binding and devicetree to expect two clocks and rework the
main clock controller driver for MPFS such that it is capable of
providing multiple outputs from the MSSPLL.

Cheers,
Conor.

1 - Hopefully that'll show up on the lists soon, once we are happy with
  it ourselves. (As of v2, that's not happened yet, Christmas etc gettin
  in the way, soonTM).

Changes in v2:
- Swap MSSPLL out for MSSPLL0 in the driver, there's no functional
  change there.
- drop the unneeded maxItems from clocks.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Wolfgang Grandegger <wg@grandegger.com>
CC: Marc Kleine-Budde <mkl@pengutronix.de>
CC: "David S. Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-can@vger.kernel.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org

Conor Dooley (7):
  dt-bindings: clock: mpfs: add more MSSPLL output definitions
  dt-bindings: can: mpfs: add missing required clock
  clk: microchip: mpfs: split MSSPLL in two
  clk: microchip: mpfs: setup for using other mss pll outputs
  clk: microchip: mpfs: add missing MSSPLL outputs
  clk: microchip: mpfs: convert MSSPLL outputs to clk_divider
  riscv: dts: microchip: add missing CAN bus clocks

 .../bindings/net/can/microchip,mpfs-can.yaml  |   6 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   4 +-
 drivers/clk/microchip/clk-mpfs.c              | 154 ++++++++++--------
 .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +
 4 files changed, 98 insertions(+), 71 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
