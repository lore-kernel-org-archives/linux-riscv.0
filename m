Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF60EBFD10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bGByr23O3TjQxbXFa7faNogRHabgL1DchGCp1s2BiwY=; b=1oCi/gx+0aYUk4
	y8qLGhvmO5qayJnuGf/UKQw+QgK9coq4n/DRZKeO0O1V4u4C9VWq+Q5AWDrykoUGR/GLdMR/Z2Req
	NEjq1p0IpYACqSc78Oq8GDcBzFtk4nvnH3ONlptko/WMwzEQnMYz9DcuikNMrt5utljCjH9jXB/lo
	2mdVPtHHXInZNwN0AcJN7U6ldAwBBWC+oaORM0eLsaexqv4EFUpJrtYyfdstzRataeuM1QdIdxSZk
	kfQFQaGmXnRlNV7tYtkfrtijXKCHV865IO9ZNlVMbV2eabSoQUe7u4XZoUnmix/CT3fH4lwN/rOYu
	Q4QImwXEfqvNNfiPlckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFf-0000000FD5M-0Bli;
	Mon, 13 Apr 2026 08:02:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFc-0000000FD4r-1cCr
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:02:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so4100518f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067350; x=1776672150; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ6ks+ZM//g0uQWaPIrHlZ6PlfCAj6VR7r1dFpKyen0=;
        b=Rk4jQu4efz73G/r0oGqiMK5+qM+pWhNdI32TqQ03r+VN6mKVC+pkmqzPICdlNmtnKf
         T2g9pwpjB7k1VCQldeawTDPVpO9MyZcWsKsyS83Z8L3P0djmGviAEg5Aq7clNGS538Vc
         QlkvTW/SocPHQDf1CvzzHndmXFVfjNl3oPp3kBeToFhGtMZcaZerLqChkQXM1+vwSeGO
         reG6Zl3FibjjZoJB88Sh7L+GdZlmBdhfBHjKP4po5TWcQhqsMJHv0oaP96tyHJeqD6+T
         McENwqkshbm9wfy8awtzsSd2f6ObGQWBKfyPUiNM+qJdgl5YgomM4DYpD3AGsljtQrlM
         GcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067350; x=1776672150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ6ks+ZM//g0uQWaPIrHlZ6PlfCAj6VR7r1dFpKyen0=;
        b=d25JzA+OI6pUl/aAJ6Dhhc8SgqoyUAy60/kLdyf2rrf9vFAyCP4Rm5ApDYlLyf6P05
         H+hhhkivlIRcPVok45koFmiXZDOy6BjgSMwn8JeJ9Jw3BRIM03KpXMvfzTUM11ct7rdo
         VVcqATgO3dniTsQFXfHyg/90DAzfgyYefKoDPxRz8b7+qNxRB4huriC88GxkAjxVfItY
         9WCwssILlKTKZc6dydETwzspo5zS5wG1MRlGrhnFPVjNgDIElj/64h9z+mUTiY4U/dl1
         J8km4d124QCITgyrp+LCwFDHijd/MMv6cI75ZaLaZFwcffdkKhoKF68vMjWcGwmf6SYx
         PVdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oEqTZCAnJ/ilTD/pqUj3nge49uCY3wIdgP1sfxGG3xBXXCP0l20g0weTfCi5L+R6upMgXCQOoCD9Q/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz96HS1uzBL3+MEdOHGKRjDPiDhjRl3Imra57U8C2kAUi7QBRvQ
	qOmZqA2rS5qbd0nb+0KPoh1u0LX9mDp6wNidLN6lgJP7nGCrygHgLH0i
X-Gm-Gg: AeBDietNtvBjKvsLAvGk7k830x21OIOXbhr+u4b3/oLqhR2krt+Uo9ZLxBCglyCMOwq
	GUzOmsfMY8qRK7RER1Vm4tlodgkCXVw6qvkhRlgOWRzAxCbt94A3GWlcQ2dJRDgjHqOcwcQM8uH
	EjnVxqFT9WZMSp31dgw7JL1PyxEEn2N98lSaErOxyNE7eKJRNSVocoxaJ8FW4F+H1mi5xKDTD5P
	8qJ/UlzwMySHzIMuWFnabUOMlzSeHppZnQV1ZBMdPQay3lhfwhpMdAV+4BV/08e/VR2j8/92N/w
	lVxIqJJTgIRUwmoQ2CYxS2fFChMAFFXACAyxEPZy1Am7ngUVv7wbrnkV5bwncRj+iX6eiYMmkyW
	Q8m38UrwieQwakICJmJTG419DG38g1pJY+9os0R63253dEbP6QWv40mteFqqvcUuAtP0l4BC1L9
	dFLDxMLj0HHoutli/mqxiOZiIC6qbCNtczhzlz3ctEmrf8J2je4NQwOveaVUnQ8+RfQ9gZYl/Dq
	p4=
X-Received: by 2002:a05:6000:1786:b0:43d:7722:ec05 with SMTP id ffacd0b85a97d-43d7722f1bdmr5554533f8f.8.1776067349674;
        Mon, 13 Apr 2026 01:02:29 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 13 Apr 2026 10:02:09 +0200
Message-Id: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQyU7DMBAG4FepfMZoMhNvnHiPikO8NZZoU9lgF
 VV5d5xyIArk+I803yx3VkJOobCXw53lUFNJ06UF/XRgbhwup8CTb5khoAREyae8VK+JF8/dkD3
 /HAuH4CwITcaCY631mkNMtwd7fGt5TOVjyl+PKbVbqj8gAf4P1o4D18ZhZ4wiB+71dB7S+7Obz
 mwBK64Rs4NgQ4S1aIXqfRR+i9AK6XZOq9SQIURPVmlCH7dIv0KQdpB+2UQqZ5QS0UPYImKFEOw
 goiHWa0ESekL8c478RXpQO4hcEGH10LW/RKfXyDzP3znTItsRAgAA
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010232_471244_BD944C15 
X-CRM114-Status: GOOD (  15.14  )
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
Iker Pedrosa (8):
      dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  24 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
 7 files changed, 480 insertions(+), 2 deletions(-)
---
base-commit: 4c3b07bf68391122266dfb01126484daf352cf70
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
