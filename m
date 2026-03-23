Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C4AEC01C1
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cEtjO8N6ef2oD2jx9Wmi1ZWf08LvLMOKfSXxu5sGLnc=; b=fzR6Iiwv+KDphd
	V54sCIjpCYW5bYYU1LUuZsm7fwiLlPftMERaZX9uI5FW3an65XdD/eUodNKUfpCF/TBWuux10zpUZ
	kjDTMvl8SWHtOaDoQ2HZsdZXMqwnx1eZwAjn9fw3kkTjWRsWtpEA+3uMDQkkKlD+JLog++XQmNy2Q
	bGDLxNZNwz7JaBO/fBTbj2K3PgHxzbuMBfILggccfsZvEuko7zl+uVNuCExf6YPKzS9PGC68W8AeD
	0Ufmy6BUhx+IsYZafjjYpaGmo0BG/rlj4CBSrnZjquJMFq2RbtwBxCn0Cs+Eew7gkEj59O0bFrmE4
	r5nyc6dp50vw4Sd2pPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNg-0000000GU0P-3Gx3;
	Mon, 23 Mar 2026 10:19:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNe-0000000GTzd-3VVa
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so24879865e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261169; x=1774865969; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4ERGMp8NacLG5ZvKAIiOC6A4GgV4+Yn8pLmhG8k+VE=;
        b=SMiucq+UF83GDSVRZIlRPzF4NrZyW3oiVPZeylA8J+taTQuQA1PEWfo/chVnhn0GWe
         vJKQdSdrf3Sxn+o5hnCXStW5QLSz3ZgALL3FYSqBWcL+/eTa3twhRNJ2enQqISiKrK/J
         oIUrx6hCkAT4yjnRSMpgNkcomrEBaD6HA/tbnXmHj6LNYiwPEler9TFRVBNZlgOo0fB9
         DwokX37UEt2VUKAvRTwYOrzkgu5fMEnNrFzxOdzHSmXRL013BSSTNa6xeLmt1BeO1L6x
         WRikJ0Z7saaluLOrOsfeBP3H28dMyr6qaYCgMwf5eW3VSs0pjq1eXolON4UksCxEm6mj
         C3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261169; x=1774865969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4ERGMp8NacLG5ZvKAIiOC6A4GgV4+Yn8pLmhG8k+VE=;
        b=s3ZdgVLZmzCaBrJQRZj+W803vYgSo055LJF8lF+CmqWSlskO9i7oKnoM5D8MwCEPod
         Uhqu366u7y/LG03v7YS/f21y51lGPpREbVqCDimv/7lBU700tBEEeMzcAq9TMJe6lCXs
         gvd0O5lmBjVrcoswHIoeWhThfaBhPD3XIweGMdICl+YMpyY5XcpbNG/CdxLyP0+5tkNI
         jxa0lUTB876Lt4bgU7GHtzxmHhXzx1+v2BXRHacs++5VQZvpaF5ajEymoRUI3E2356r2
         2BIs8mIq4n45FnFTMum27SlhZfI1bmG2mNUHD/F9bUIvWLR7wgpV1eXuOwpMvovD8C/z
         doXw==
X-Forwarded-Encrypted: i=1; AJvYcCUjDptoNcPPtThxXFe/drZYf0pKado/LAfu05RHsy78tpFcK+DFmRhZsT00n5T/kH3n0DM3h3LG62/avQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuY1kW12SOpvWmc+WWExanLT6+jBcL093jPRGpQJY0Pd9xXo2X
	wqGcdPfTqP9W7UbvwprkK12oUPsPzb4rcKhl0n14otGnGN+QkQ32X4jA
X-Gm-Gg: ATEYQzxB62xI6aKmtotcp2/05iE2yvUxAEMLnBiPHVipSyWApEuS3kmW3EmQCu1Gmdz
	7y1L25g0yAoq0OZ1a9xqYjb9OFVPZqv7Fch9HiXzxyDdviN0trTBl6Soz/CTWR5xXJZs92nuQH+
	QcxwJ6nZ5gCjxBp9LLBm/BnQMu+rHf6Ez29gzCIjp6WQBorvUTwctjGSk5O07Zz9KJ54p+J8Ij1
	3j+fU5RTzNZT9P1QmNCjGiKXFPYPH76W30GtMlvxNijHMlnOPDqtQTUuQwcLcfKSd2GqKXVFySP
	Yj3+JveBS926UURRiePaxgiBtH6tlGX8VygTcjb+r2o0CUgixDmQgcqNgx+pN60tb+UuMos4Nar
	sKIRnQOWE0omdprTWfTmAB1Xpt+0uhOxaTfuvFBXcJ0DV9BlF7nnD+p5NIVz/+LlnPoonwN6Cl9
	24wvXdLOC6Sq40QT0dqDvuLGnOxFdAGQWOKJjstFmCgZFXxH8cKNLv5EplNVRLOGFm
X-Received: by 2002:a05:600c:1d15:b0:485:2ce2:4c75 with SMTP id 5b1f17b1804b1-486febbc648mr160002825e9.1.1774261168302;
        Mon, 23 Mar 2026 03:19:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:27 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v4 0/8] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 23 Mar 2026 11:19:03 +0100
Message-Id: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTQ6CMBAF4KuYrq1ppxSoK+9hXPQPaCKUtNpoC
 He34IYYWb6XzPcyE4o2OBvR+TChYJOLzg85FMcD0p0cWoudyRkBgZIAlNiHpR0djgZrGQx+dhE
 TqxXhNROKaJRPx2Ab91rZ6y3nzsWHD+91JdGl/YKMwH8wUUxwLTRQISqmib60vXT3k/Y9WsAEW
 0TsIJARrhQoXhWm4eYXYRuE7ryWWEakbQxTVc3ANFtknucPUgTqIUIBAAA=
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031930_935881_1BCC45BD 
X-CRM114-Status: GOOD (  12.56  )
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

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
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
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  24 ++-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts   |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                   | 257 +++++++++++++++++++++++
 6 files changed, 465 insertions(+), 2 deletions(-)
---
base-commit: ba0e286c944dea871f617bef1d733307b202de25
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
