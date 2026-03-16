Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AFDF506D7
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HqkDxo0OxaFxqA7H39YyYEaFbL5lVBQmqA64+zIn4L0=; b=kcTOCJsBqsOFY+
	K6GNugknRFMIbJ3ojtrVOCW4XVHMRicqhtfvjLMYuW8m0aWlEm7eOrvcj5crDV61a3TfcS9chV0gV
	btGwLTM8pYQ6rLCoS6oIaRRqTin9WaonJNrvSjpTx/9E7A5dQDgu3Pb7abji8cnx9ajhWz8dsUWX5
	/Iez8pr7EUfVbZNm/lgkKnftxJIICnNUBKKtGzSiEipW3/2+AkF0D2j/SmHhTsier9li1x2OSF92A
	asQ6cfGbFimTJ7rEPdYfF5M73RL1/zF8AqlPYg+hCj+2jBWlilRLqoKqqxiScpHBz/23GGrC6TJTy
	2MZw8r+tW2Zn/LAdFfLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28fZ-000000048va-1dZk;
	Mon, 16 Mar 2026 14:11:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28fX-000000048uo-3Dl1
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OdoEqGGjgbvJGV3XvDqNqAu8aItRm8RFqY326SKUvHs=; b=mV2yJS60/77TpdacMualldIPTX
	eLHDsbGhuC5GBJ//LDu7NMctByXLV5k7yMLXAICj3JtwWBoJw8Eh1VJv78LYadF0F/sDuGkjpeOhe
	hfLGk8b7WKTbem0IXCFVRIoKDSdlOsSWwECH9WTckY1txg9uabpj7tbh02hxED//mNDeLYhyhKh1O
	x5gTNKgIpLZGIZEISWbU4wgk/xb8JpgBF+urB5yIZK0PTexNGMSz8UJxg6LjMYwx7ocKKcR2D0ywQ
	eYckgG/T40tz9kEkglxVjQBBcBfu9s6+OJkUbxTl5QeCoUGySNOgSJqwcdEiuoY3kClR/jBsCr3SF
	FTDk+KrA==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28YT-00000006tcO-2Riw
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:04:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48374014a77so47613285e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669863; x=1774274663; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdoEqGGjgbvJGV3XvDqNqAu8aItRm8RFqY326SKUvHs=;
        b=lhavkSt285AG0agfy6A+oIzmIpGS3UUovgyZrjI8PIx3BDM6YAP3rMsyrSVY5o0l2k
         qUHRv2A78j0SCmhlaiHf28rmRv9tkFiGifARlPJze4UHvR51o1xEITQjEqHS4klkmVy1
         qcMrmqI/aft+YigB5xHH6hlzMb3mHMERHh70OEDpr2GkdizdrjnVn69qU4S6DJRh1ptx
         HVeQvCd8m+z82fa+3cm5g/XFO0SamaEKuGhpqtUVr5llp/UhzFcRcLNHzN5r6JL6yKvz
         5TtyO6HcVKJsLoCOIXouHjM+AeMtMdpzHvGC3xGUiKZ6qcITODZmTlAvmyefgzdhEP7I
         rwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669863; x=1774274663;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdoEqGGjgbvJGV3XvDqNqAu8aItRm8RFqY326SKUvHs=;
        b=Ga4P8ArVMo1vAq8S11z7Z9mIi0W9v3QE0FTRZhFh4xZAO+xJw+FAnmd4zIqCbwvCLR
         SoQiA9ZMcnhe3oRB/8Nhr4uWC1uhX+Q0RFaZ1L2N/wOuqBLava+tmb9jQXMRmfCsFJ9d
         IJxf7uHRQRwu+/5TWU8SEKuY4bZ19zScfGcLR4Etmgo+e52GEwAasuUvSKf4/RtBqtfN
         lvf9exqby2b6rHDV6rP0RRuj2Qfox9LEjvlPIcIO2dYygRJJExPAs7T272K+Kk0U10Us
         1NjmiGdq3wk2o+5JBTBFmYLNsDnHymAxvPZiqNkLhGe28D9cpqEdxogF40EY4rajeY2y
         0gaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVRCCoJ0iYLQvhdj0pk9oCNquUGfAv1MGEtx51+mvGONRGg/LkFchYSzwrhycEpdkYWm9qHkatRmCwbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMIP1RZv5GPfnSRnJEHZwJll5esmuDq2MMBEETaiV58pY0zGe6
	EnYmxw6aHeZVgWn0pqT9G6f5eH7xJsOlo5fpLQQLbv9a8oJQ3Tltz9KH
X-Gm-Gg: ATEYQzzl4xq+BBKenXJpGvsiaa5wczNsrWzVno42fLOCZI9FJgDbD0ML6lBvQ29YBCy
	7Qm3/Q2ZsxcgooSluv2LIJ7/xbjebOIzdZ0WSyru9tTYhQGsIR8KKLClCYYuQCKhJkumVJ/PHwS
	PAmT5pTRmj2Iml/cYeV4aKUs221BQWyfBcUqsFU+HrumhMQrb+RT3eGh2Ra8PnS+BjAz6jquvCO
	5B1V2GAspwSeUKah7NCA/Tt8C69OFuBUaF6lp8iIgXnOHHwQwSTf/+u4l+s/HlLW8nH6rU77gTE
	JlbVc7LBa8jEBVrFluUMhwsEb6Vf/AozMYJiMfB9cy70b8Zx8VfziInrMt+6dT28RyrwIROHzeq
	fUu1CWXOFQhXpTkUatr8x3M6angW8Ivv4svcYpTJPZnApba0uBSBgMLQtBe+JPGgesTfOHPdSdF
	hCB14YNARqcFrecy5Pn5cSLoUGzg7MVkC6s3CiJUnd/JZk8wUuYv4nOcTSmPxPtRnS
X-Received: by 2002:a05:600c:1988:b0:485:3f58:d84 with SMTP id 5b1f17b1804b1-4855a8d6fd7mr204197625e9.32.1773669863067;
        Mon, 16 Mar 2026 07:04:23 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:21 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v3 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 16 Mar 2026 15:03:28 +0100
Message-Id: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNyw6CMBCF4VchXVszTOVSV76HcUEvwCRCSauNh
 vDuFtyw0OV/kvlmZsF6soGds5l5GymQG1OIQ8Z034yd5WRSMwQsAbHkzq/rRDwYrhtv+LMPHKx
 WUNRCKtAsnU7etvTa2OstdU/h4fx7+xLzdf2CAvA3GHMOvJYacykroUFfuqGh+1G7ga1gxD0i/
 yCYkEIpVEV1Mm1h9siyLB/zujKG/QAAAA==
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
X-CRM114-CacheID: sfid-20260316_140425_741294_32007593 
X-CRM114-Status: GOOD (  10.85  )
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

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  23 ++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                   | 243 +++++++++++++++++++++++
 5 files changed, 384 insertions(+), 2 deletions(-)
---
base-commit: f38f518dda1f1decc7a39556fe3231b0d1b84e1e
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
