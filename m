Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C7AEDB7D1
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nTOzkpge+352BylTGGP88qjAKb5cmV6MuafUVudNYqc=; b=nT7DJyByVLpO7S
	Z6LsAog+wuqbrNFxOD5/KgT319vwEOwGm7vh8OX6gFu1emSy/9VJ1qhx2TLNP/U3doiBzMbiZIJs+
	DFhI+vC9sq4TGzvVcDJG1ZjF4supyZsIr/7r89xcXKGDqZQyzt5+iAw7OQqayCVDTeZ3RlUSdvfuN
	BzSJvVxCqs3pcol2uUTkPUUMo5+/0ZmYFkcOCXP9adXyCxeQtUc+liIxCMNAIXjytb2STSf6l4Vpq
	Wn8H9LD3npHZOeMnN99NUODuKc8gvANzbWhhCuc/i/gKblvaZTYWeu1JFVGapdwBP95I68aIosr7u
	cFQB+uMPH+aLy1aR+yKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1l8-000000068eJ-1pAO;
	Tue, 07 Apr 2026 08:26:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1l5-000000068dD-1ir3
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4888375f735so42717345e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550361; x=1776155161; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=La+U2Bbn/ahJ6bPuRDlCHq4x3+i/91yoVAN+8mU+FaY=;
        b=Mj3NtoN6gDX1VXTdSE1zwLd0IRI0LtPkZZJ4Gc6TPg/B2QFn15nfQtNw9r4Se1mR1t
         YK248I1zG7YB6Y3byATWcNLSqf+87RvXC0LI6pTBfT08fvz68h84lkP1wE1afryDpkFN
         O4k/pd8ESj+rX9TJSL+ax2wUG8+4mhHl3JieirUn5MLc8McN0Vtj6XYkZFwswKV9YVIY
         yPCT3aSUpaDqS4xnQnAG6AQNfwyQU8mEu2IQAtHzEBkv/eaCH8+eUL1vVcw4xKrxTEkB
         RzK6+aTpeB318Th4fSQHrGtAqMyoRSLCHy+Yf7IOyUXRGPYtJFrxTLRE1IbJhWLI2Sdw
         ka9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550361; x=1776155161;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La+U2Bbn/ahJ6bPuRDlCHq4x3+i/91yoVAN+8mU+FaY=;
        b=iHH5Gm3goYJmRm+KgKjDUSNepKjsj1een3oV7hijEpattVwP1Rr2PxyZ+HIQONldZK
         saoOzzXO67k3vqff4HC+8pAegIy2R/CzD/C6mmhDEsNBLd9/v1yUh80pFTFoLG58ek0y
         g0EYCv/zXyjTV+9fLTbEtXSsuEqZdFRAF4WGrTo5I2LWVtJtFgf23Ebwq7EmIFw5gzE3
         TXIp6lbRHj1c+Li0j8sE9oAXXgOUgZ+uzjOnfOTUop+Fq9EyYXTqswc8kzLEma65D6lJ
         8L306fzDDkO9kmTJUDqbDko5xiz66uTrcMUk1zdiQeSzbw+mtGeJYLdUXjoBXflcXnU8
         8HGg==
X-Forwarded-Encrypted: i=1; AJvYcCVIx6HqdKys+q2L4gOJYrZy3NsHXiJlYBLLn1O/YqTrM0rxkAysPUSOGLm6hnr9e2Rl2aqpgoIdBy9/4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJoJwkfbRNID8eS7ZXFg5lpPBs46pHJ5vwI4l3Me3up//sU2ji
	3rhd0kKRhRFm8vgs7kOa0WEQVoitn+bol5hs23KTLynCMC0hARTVgqd6
X-Gm-Gg: AeBDieuP5ZyoXsVZesbiDlEapoQ6AiebGW77/eOfbmMZ+HjfTciVu5GuonqKr8CTiPS
	4yiFwstzjDB87gPZu6vIdqGsMGft7Ny5XC5lL+Bno+3n2H8HpYYy2APgH2z7cU10yXZYYcRqVqN
	PIn6GqsjPUe6lEMHaIR9oTUeK9d4ey/bKQ/hNyZfGXHmLPiE6O58ylFQ3pp0JtoqM05qc8+uwCf
	v1VV0VgoFzg1BKl46VCwrzBHCJyRC9eClOBRVWy1x6cQ8VFmU5EB8xwvq9JPI5dc9rkaDNcr2qa
	Ab6kQK5kcropQK19v6A0lg5X4uqM7myUMIrqLUBqe47G2mVlQ/MDvNjM7EHHdNXiq153mo4W3gr
	fOFks2yN+aSJq0XSHgmeBAQhnZ4vNfHjXwiN5tmb8sfhuAbOzpcEJBu9Ua1UpNUf1dA7Ou0vy7a
	8dCrb/w6WpUwxQoKEwNsibzTwgHyRr3gZ4+tnvnICgGy38bTad+hdVryNW252BctH+
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488998e3cbemr227485015e9.30.1775550360419;
        Tue, 07 Apr 2026 01:26:00 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:00 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v6 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Tue, 07 Apr 2026 10:25:20 +0200
Message-Id: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTW7CMBAF4Ksgr+tqMhPbMSvugbqI/4ilQpANV
 iuUu9ehmxCR5XvSfDPzYNmn6DPb7x4s+RJzHC81yI8ds0N/OXkeXc0MASUgSj6mub1Gnh23fXL
 8PmQO3hoQHWkDltXRa/Ih/jzZ41fNQ8y3Mf0+t5Rmbv9BAnwPloYD77TFRmtFFuzhdO7j96cdz
 2wGCy4RvYFgRYQxaIRqXRBujdACaTZeK1SR3gdHRnWELqyRdoEgbSDtfIlUVislggO/RsQCIdh
 AREWM6wRJaAnx5Z1pmv4AcuDISswBAAA=
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
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_012603_500464_FDA0BD68 
X-CRM114-Status: GOOD (  14.45  )
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

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  16 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  24 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
 7 files changed, 481 insertions(+), 2 deletions(-)
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
