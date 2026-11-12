Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922C3606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OwT0v66H;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=T9dFumNz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ea1JMu2TIWn/MYiNnFNKVQ9nOMJQi7v1qBIsCzpwV34=; b=OwT0v66HdkasRhzcqiR9Q9mPBS
	k8ARFyUSnr7tdtmxMHWDrUjODRYk5xUtcLsnaAJeuqn+uNJqE59qdCTHUpsocEU1F0MJFZWkVVdPG
	W88V1USuQ0xOlwLNE9SVL7W7UUqwTCPsk+28k96bVGwDHOdGVmjuFcijE4slueJJ0oBja6V4b8MOH
	wE6FD3WxVv6DCkCzS6/q/GmherFFDRB4vHhIT/7GzeSjJvO8KW1bP50GgvQITuYWBrNXz1mUUnl70
	1u91h8OeHrAP7O8jtcdbIiYdVSs0zYe5u9aOIgTWyjZNJ8MWgzVWGUoHbezrW5x3JlIn36mL3Z5QK
	FjksKFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP0R-00000008sS7-3rjI;
	Thu, 12 Nov 2026 07:13:59 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP0M-00000008sRb-2MM1;
	Thu, 12 Nov 2026 07:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794467600; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GQklXaqEgzoVYf5QvQNRVkuZrFajDf0rTAqn0LZQCn+i0syIt4JcF/N3DGoqy+C4mg70XqtJOgqC2pYxAdmkBmgWQ5foRx7AD5gRf7Gbesm1nDqvY9aBrh6C19jQ/nE+E7PyT2fpsjEZWbnsVzC+KYBztvD0AJeox9BIyn2nu+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794467600; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7SJXi7Q2ISPCL9/+n6wNfoFH+ghIme3sVDHuX/k4ej8=; 
	b=HUpIXfXR0eSwB8ADPbgrtW6eduuB7GP74Xz8Zmst0WLWU/mkxJDhEXdWQv8o7M+sQg4C1vdpdz4aZ1xdPRi0RfTBTzjkX+Axnf8Bu8f71wYpkLX4IzhCYBFhVtsr1oPok/wgmcj+Z0RoV/FO47+yYWLqy45YLg504OKOP1sYt4I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=T9dFumNziim9obSDgP1Eer5PfVgZQWQndkGmlqvbTKrImdQNnZovRCyKOFZq9Ib0pj0tuNwe9gaLzrTyzAXs0LyiIu0n6VuMJA9Sw4B8AZYyc17RWSektM/e97NZcXpZFa7ihFhgEsuFg1eDojBWadeW9t89I167A77LeYpdg5M=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=7SJXi7Q2ISPCL9/+n6wNfoFH+ghIme3sVDHuX/k4ej8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794467599617418.7331795434135;
	Wed, 11 Nov 2026 23:13:19 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v7 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU
 and PRCM
Date: Thu, 12 Nov 2026 15:11:49 +0800
Message-Id: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23RzU7EIBAH8FfZcBbD8FHAk+9hPNDpsCWu25XWR
 rPpu0t3jSWxF5Ih/P4zZK5spJxoZE+HK8s0pzEN51LYhwPDPpyPxFNXaiaFbEQ5eLBKcTy9cdH
 piEIEHz2y8vySKaavW9TLa6n7NE5D/r4lz7De3kMUiC1kBi64alpNvpVaG/t8Scf3IYfT40TYs
 zVolhu2ABWWBXurO3AOWxK4h9WGvTAVVgUbEaVyUXm0bg/rCsu6s147IzhNLfmAsIdNhVX9Z1M
 wAFjTasBOdnu4+cMghK9wU3AgB9ZFJEv/xl7uq8j08VmWOf3uY1l+AFb+4BLqAQAA
X-Change-ID: 20260202-a733-clk-0d4fc00a9f9c
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Enzo Adriano <enzo.adriano.code@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7391;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=FEdphdA6ezS+mTsUDdTB+sTKWjVRHNI1UV7u1NsCN6Q=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLK+pl0tt79156Di0zNvSw7fZajj2/F4b3I97/qdTXdT5
 81pW5Uj3lHKwiDGxSArpsjC5S/+z1qH59sRgdb7MHNYmUCGMHBxCsBELH0ZGc6GilTuzNM+ajan
 OnDR1cXZYYt2CNr/FfvH8j7pwP4/IS0M/4N/1+0+dnzX+fVe/Jrn6w419jyIKVx7RV9/1uSVtWv
 P3OIEAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_231356_452420_2B0B07EC 
X-CRM114-Status: GOOD (  16.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the main CCU and the PRCM module (R-CCU) found in the
Allwinner A733 SoC. The clock architecture is derived from the previous
A523 design, with the MCU_CCU removed and the clock tree extended for
the additional functional blocks found on the A733.

The A733 introduces a "pll-ref" clock that normalizes the physical
oscillator frequency, which can be 19.2MHz, 24MHz, or 26MHz, into a
consistent 24MHz reference for the PLL clock tree.

The peripheral, video, and DE PLLs provide multiple independently gated
outputs with programmable dividers. Model these outputs as separate
divider-and-gate child clocks. Also follow the documented hierarchy for
the derived peripheral PLL outputs. The explicitly named PLL_AUDIO1 /2
and /5 outputs are modeled as fixed-factor clocks, with their divider
fields initialized accordingly.

Also extend the sunxi-ng SDM (Sigma-Delta Modulation) support for the
dual-pattern register layout used by the A733 PLLs. PLL_AUDIO0 uses the
dual-pattern SDM support to synthesize its fractional output.
PLL_AUDIO1 does not expose fractional rates, but its SDM controls are
modeled so that stale settings left by firmware can be disabled when an
integer rate is programmed.

The actual parents of a small number of bus gates are not documented in
the user manual. Follow the vendor BSP and keep these gates parented to
"hosc" until more complete hardware information is available.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Changes in v7:
- Rebase to v7.4-rc1
- Patch 5: Fix the MBUS parents to use periph0 instead of periph1
- Patch 6: Fix the G2D parent order and replace video1 with video2
- Patch 6: Fix the DRAM0 parents and widen its divider to 5 bits
- Patch 6: Fix the IRTX first parent and the SGPIO parent order
- Patch 6: Add the missing gates for usb01-ref and usb2-u2-ref
- Patch 6: Add the second divider for edp-tv and fix the HDMI CEC and SFR
  mux widths
- Patch 6: Add the missing video0_4x and video1_4x parents for CSI
- Patch 6: Use the documented parents and fixed dividers for fanout-16M
  and fanout-25M
- Patch 6: Reuse common parent arrays
- Link to v6: https://patch.msgid.link/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech

Changes in v6:
- Patches 1 and 3: Drop the R-TWD bus clock, since S_TWD_BGR_REG is
  always secure and cannot be accessed by the non-secure kernel
- Patches 1 and 7: Rename mbus-nand and CLK_MBUS_NAND to mbus-nand0 and
  CLK_MBUS_NAND0
- Patches 3 and 4: Document the firmware requirements for the PRCM and
  CCMU security switch registers
- Patch 4: Add CLK_SET_RATE_PARENT to the video and DE PLL output clocks
- Patch 5: Document why the CPU_PERI and NSI clocks are not modelled
- Patch 7: Model ahb-store as the parent of the NAND, MMC, SPI, SPIF and UFS
  bus gates, and drop its CLK_IS_CRITICAL flag
- Patch 7: Keep mbus-store critical for the storage DMA paths and make it
  the parent of mbus-nand0
- Patch 7: Add comments explaining the ahb-store, ahb-cpus and mbus-store
  gates
- Patches 5, 7 and 8: Collect Reviewed-by tags
- Link to v5: https://patch.msgid.link/20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech

Changes in v5:
- Add the CLK_GIC binding ID, inserted after CLK_TRACE
- Add the GIC clock and mark it critical
- Fix the continuation line alignment of the trace clock
- Mark ahb-cpus critical
- Link to v4: https://patch.msgid.link/20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech

Changes in v4:
- Model the MBUS and DRAM0 clocks as M-only clocks
- Base the series on the A523 single-divider clock fixes
- Link to v3: https://patch.msgid.link/20260905-a733-clk-v3-0-50f238f39c78@pigmoral.tech

Changes in v3:
- Patch 1: Rename the clock/reset binding headers with the allwinner vendor
  prefix, use BSD-2-Clause for their dual license, and reorder the binding
  properties according to the preferred schema layout
- Patches 1 and 4: Drop the undocumented 12X suffix from the video and DE
  PLL core clock names and binding IDs
- Patch 2: Require all PAT1 enable bits to be set when checking whether SDM
  is enabled
- Patch 4: Model the independently gated peripheral, video, and DE PLL
  outputs as programmable-divider child clocks
- Patch 4: Follow the documented hierarchy for the derived peripheral PLL
  outputs
- Patch 4: Model the explicitly named PLL_AUDIO1 /2 and /5 outputs as
  fixed-factor clocks and initialize their divider fields accordingly
- Patch 4: Model the PLL_AUDIO1 SDM controls so stale firmware settings are
  disabled when an integer rate is programmed
- Patch 4: Add the missing module device table and remove an unused include
- Patch 6: Replace the MP helpers used by timer clocks, which have no M
  divider, with the corresponding P-only helpers
- Patch 7: Document the unresolved parents of bus gates kept on hosc and
  fix the APB/AHB IOMMU1 system clock names
- Patches 3 and 8: Make the reset maps const
- Link to v2: https://patch.msgid.link/20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech

Changes in v2:
- Rework the clocks property in DT bindings to source hosc directly from
  the oscillator to adapt to the new RTC binding
- Clean up the SDM dual-pattern helper macro and add the missing enable
  parameter for pll-audio0
- Number single-instance clocks with 0, e.g. GPU0, VE_ENC0/VE_DEC0,
  DRAM0, NAND0, GPADC0, THS0, etc
- Correct 8x PLL post-divider names to 12x for video and DE PLLs
  (pll-videoX-12x, pll-de-12x)
- Drop gic, cpu-peri, nsi clocks
- Rename clocks: OWA -> SPDIF, USB_REF -> USB01_REF, HDMI_ESM -> HDCP_ESM,
  PWMCTRL -> PWM
- Mark bus-dram0, ahb-store and mbus-store critical to avoid DMA, MMC and
  SPI NOR failures when unused clocks are disabled
- Switch PRCM timer clocks to P-only helpers
- Fix bus gate bit positions for UARTs and correct the sysdap register
  address
- Interleave bus clocks into function clocks
- Link to v1: https://lore.kernel.org/r/20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech

---
Junhui Liu (8):
      dt-bindings: clk: sun60i-a733-ccu: Add Allwinner A733 support
      clk: sunxi-ng: sdm: Add dual patterns support
      clk: sunxi-ng: a733: Add PRCM CCU
      clk: sunxi-ng: a733: Add PLL clocks support
      clk: sunxi-ng: a733: Add bus clocks support
      clk: sunxi-ng: a733: Add mod clocks support
      clk: sunxi-ng: a733: Add bus clock gates
      clk: sunxi-ng: a733: Add reset lines

 .../bindings/clock/allwinner,sun60i-a733-ccu.yaml  |  107 +
 drivers/clk/sunxi-ng/Kconfig                       |   10 +
 drivers/clk/sunxi-ng/Makefile                      |    4 +
 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c           |  277 +++
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c             | 2402 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_sdm.c                     |   52 +-
 drivers/clk/sunxi-ng/ccu_sdm.h                     |   29 +-
 .../dt-bindings/clock/allwinner,sun60i-a733-ccu.h  |  291 +++
 .../clock/allwinner,sun60i-a733-r-ccu.h            |   38 +
 .../dt-bindings/reset/allwinner,sun60i-a733-ccu.h  |  129 ++
 .../reset/allwinner,sun60i-a733-r-ccu.h            |   23 +
 11 files changed, 3336 insertions(+), 26 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260202-a733-clk-0d4fc00a9f9c

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
