Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E0CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mj8FI+GNzD0L5vuhoYM+ZARyVmXeEfbglHuIUWqm3g=; b=mmmiXgbq1PNjLP
	CY/Oui/r2BVNTpyBRjRbv10a13hrPzu5/Ovf34j8IN1lBF6SypwDUxf8/rgzS70+NA1yQEq59H/gT
	37G4cVRDEXHNnCH2jXpAHtdnTJYYHFoSGx9QuKnCpMcqaPbabRSNXUdK587D7p/YdHja+KK5a58FL
	fG6YHuDkRZHEykZkfv+i9wCgGrdXjRsS0oX+IIaVgde6yvXEU0d1gaCw3hIhAIV+lWY8veo00+f9u
	oiyvlxL2u2eOy3ZJnJl3XfMX7P6mWBVoBI6ga6ymZsUQ3scrZaw3ZnO+nLithZuacge2JQlBe29j3
	nV+Y/4AAUtSTTAMoY2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPN-0000000Co4Y-3uXC;
	Mon, 11 May 2026 08:54:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPK-0000000Co1D-3EJT
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4526a8170ceso2157994f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489673; x=1779094473; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KTqIc8oUh4mMXyWlg9exQXhlCotoCqVUbKnvoIeh3w=;
        b=C4F2kfyjFc/f9fJ+yL91MelPrgpTFrzqDoVr+x0n+Zmch9R2A1CxXh45+dWWj/gsFq
         sCcr/EPBO4QTopGoDIDVYJR8Pb6WhBT56rf26cNVEB28Nhfj8qJhD6tdf9pwhLxgL9xf
         g6lOnA9b6zAnckVksqcs5V25IdDOw/3qtfBGlYrb9IjSAw3f/9IM3hokgxMTzSWa9gxs
         2EIlmYIJJFx7m5CZvwBg2m24aCwGQONro33q1Lw/4ukdhaqdv8bJ0T2UAMhD1TIQCOo7
         6OmES5VyYcecYzBmPazTruOf95lDfvCZ0UCu15jwCPjwg3RZBJqpJvtiY/E8Xsyt8TQr
         xW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489673; x=1779094473;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KTqIc8oUh4mMXyWlg9exQXhlCotoCqVUbKnvoIeh3w=;
        b=FEi2WMOMZs0KLVABEayhMUyZ18hHAI4VZwscomnqZjYdRzeuCgfos7pFM1ST+N5D/+
         Q7uKuOaeuTOkmuiapUTMLjATcucTzZCqhNjMElQUQ0ZY+BCzg4qiNDgXB+wR34gPo8V3
         mGcB48NWP1uSpvsCMV6HLo2CXc5nSCG4LmeqKfqKevTS8B4PD30YPtxNbv7GodKtoah8
         lqqu43+8IWjl5s3yd3lqred4phnYE2Khw5ZxUbQRerrQmgbvhRiKBXuRCkesZzFs6bxW
         t4i6a2NrQOuuyGDAgmb7XNWMFg3Xhx6UGdN0gZ6XAsEKNItqVgBVwFb7NInKGy4vqcEp
         p5DQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MPnUVF1SNYBZIvLA+lL57kqGDrdAL13me8qbliZQTiq4214jzo2EDMgUGnl/npCiunyU1bK1sHVulnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjgSRA50miK+fmVjjKQKDP7qZOheKLlJl/tTFjDbK1l3k4Urgz
	lNCB/qLIzOWhILII2d0W8deURH7wJMlk5uTPw8Ao9M2z5u2SkGGaNdzQ
X-Gm-Gg: Acq92OEHu6Wea2JVNHGqNN5DmnC3PJFVTx0+Bf1iO8D4xdfAYl1eZ/kzke6DwPao/zR
	gU6fdh+yNrw0ths/v+H5Y1Ilv+eMoMcf3hWeOQcLgSSIJhAik7hDWDMlDEUaiJ03LRmkMHX7MoT
	QU99LjWaip19dna7cGICIrFtD9LlRI0oSNHmoNFUOCBjoArt9S4K2oz2C0NsM/JKvexJ13bJDfA
	QTGHeLW4pwqWMFeAPgkGDppHPDNtud0mcyHGVc9QrEV56N5DGaswuqCPEWJOp7ECmA6etrY8Cz6
	nIT9CJvto78r3q6DnxNlqgJKCjlVUo9zwerMbrAFhnRa6h6nDCdL/rnFoA+8vtu1BeX/yBM4h9A
	Bo20O4y7ugEPAgSWwQ4Oi8Hr3142x1Pw9q2mC4FGbcmZAhB5jpTa4Rc55R6zeEF/cMgvzE8NqMR
	MP0POcuNqBApwThnZFYaWhGvtiO8lqgV/Po5EM2+kikp+7sXjd4HIF4bWHN/nPROWj+mr8ggpqr
	NU6
X-Received: by 2002:a05:6000:1ace:b0:43d:1c4a:37c with SMTP id ffacd0b85a97d-45689baace9mr12928217f8f.4.1778489666837;
        Mon, 11 May 2026 01:54:26 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:26 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v9 0/8] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 11 May 2026 10:53:55 +0200
Message-Id: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRy04DIRQG4FdpWIs5HO6ufA/jYri1JLbTgE40z
 by7TF1IRln+J+GDn3MjNZYcK3k63EiJS655vrRgHw7En6bLMdIcWiYIqABR0bls02umNVA/lUA
 /TpVC9A6k4daBJ+3otcSUP+/sy2vLp1zf5/J1v2Vh2/QH5ID/gwujQI31yKzV3IN/Pp6n/Pbo5
 zPZwAV7xA4QbIh0Dp3UIiQZ9gjvEDaotvCGTDEF7rThGNIeER2CfICI7SVKe6u1TAHiHpEdwmG
 AyIa4YCRXIDjinzrqFxGgB4jaEOnMxNq/JG/2iOkQNqpjGtJ240VbPFMBemRd129uT+BeVgIAA
 A==
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015434_858772_09E5F09F 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Vincent Legoll <legoll@online.fr>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series enables complete SD card support for the Spacemit K1-based
OrangePi RV2 board, including UHS (Ultra High Speed) modes for
high-performance SD card operation.

Background

The Spacemit K1 SoC includes an SDHCI controller capable of supporting
SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
currently lacks basic SD controller configuration, SDHCI driver
enhancements for voltage switching and tuning, and power management
infrastructure.

Implementation

The series enables SD card support through coordinated layers:

- Hardware infrastructure (patches 1-2): Device tree bindings for voltage
switching hardware and essential clock infrastructure.
- SDHCI driver enhancements (patches 3-7): Regulator framework
integration, pinctrl state switching for voltage domains, AIB register
programming, and comprehensive SDR tuning support for reliable UHS
operation.
- SoC and board integration (patches 8-10): Complete K1 SoC controller
definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
with full UHS support.

This transforms the OrangePi RV2 from having no SD card support to full
UHS-I capability, enabling high-performance storage up to 208MHz.

Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Changes in v9:
- Rebased on top of "for-next" to include required infrastructure:
  * P1 PMIC regulator definitions (commit c02c047b925c).
  * GPIO pull-up/pull-down configuration support.
- Updated BananaPi F3 SD card detect configuration to use GPIO pull-up
  instead of "broken-cd" workaround:
  * cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
- Link to v8: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com

Changes in v8:
- Resending the series as v8. The v7 submission failed due to an SMTP
  error during transit, which resulted in a broken thread on the mailing 
  list.
- No functional changes from v7.
- Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com

Changes in v7:
- Remove sdhci-common.yaml reference from DT binding.
- Link to v6: https://lore.kernel.org/r/20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com

Changes in v6:
- Add pinctrl support for voltage switching. Document optional
  pinctrl-names property supporting "default" and "uhs" pinctrl states
  for coordinating pin configuration changes during UHS-I voltage
  switching.
- Update pinctrl state naming from "state_uhs" to "uhs" to match DT
  binding naming convention.
- Fix MMC drive strength values based on vendor kernel investigation.
  Correct 3.3V operation from 7mA to 19mA and 1.8V UHS operation from
  13mA to 42mA to match proven vendor implementation.
- Link to v5: https://lore.kernel.org/r/20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com

Changes in v5:
- Document optional pinctrl-names property supporting "default" and
  "state_uhs" pinctrl states for coordinating pin configuration changes
  during UHS-I voltage switching.
- Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com

Changes in v4:
- Revert to start_signal_voltage_switch() approach for bidirectional
  voltage switching: replace voltage_switch() callback with 
  start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
  signal voltage directions.   
- Fix DC input voltage specification: corrected the main power supply
  from 12V to 5V to match the OrangePi RV2 board specifications. The
  board uses a 5V USB-C input connector, not a 12V rail as previously
  specified in the device tree.
- k1-bananapi-f3.dts: add `broken-cd` property to work around card
  detection. Using `broken-cd` disables hotplug detection but keeps SD
  card functionality working without additional dependencies.
- Add SD card support for Muse Pi Pro board (contributed by Trevor
  Gamblin): enable SD card support with UHS-I capabilities following the
  same pattern as OrangePi RV2, including dual pinctrl states, PMIC
  power supplies, and card detection.
- Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com

Changes in v3:
- Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
  add reset support" patch.
- Squash tuning infrastructure and implementation patches (3 and 4)      
  together to form complete functionality and avoid unused function      
  warnings.
- Reduce code nesting: implemented an early return sanity check in
  spacemit_sdhci_voltage_switch() to reduce indentation and improve
  logic flow.
- Refactor pinctrl initialization: moved pinctrl resource acquisition    
  and state lookup into a dedicated helper function,                     
  spacemit_sdhci_get_pins().
- Use generic regulator node names (buck4, aldo1) instead of             
  device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that     
  these PMIC outputs serve multiple devices.
- Remove dead code handling 3.3V voltage switching from
  spacemit_sdhci_voltage_switch().
- Optimize tuning algorithm to use single-pass window detection instead
  of storing results in array, reducing memory usage and complexity.
- Remove unnecessary card detect check in execute_tuning() - rely on MMC
  core.
- Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
  tuning support.
- Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
  following the same pattern as OrangePi RV2.
- Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com

Changes in v2:
- Removed custom AIB voltage switching code per maintainer feedback. The
  existing pinctrl driver already handles AIB voltage switching
  automatically via power-source property changes during UHS mode
  transitions. This eliminates code duplication.
- Squashed regulator and pinctrl commits into single voltage switching
  implementation.
- Moved voltage switching callback from dynamic probe assignment to
  static sdhci_ops declaration. Removed redundant SDHCI core call since
  the framework handles standard voltage switching automatically.
- Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
  conditional for SD/SDIO cards only. This follows vendor driver pattern
  of differentiating SD and eMMC card handling.
- Include no-mmc property for SD card.
- Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com

---
Iker Pedrosa (7):
      dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  22 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  21 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
 7 files changed, 431 insertions(+), 3 deletions(-)
---
base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
