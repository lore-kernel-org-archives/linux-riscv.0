Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7A0C04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GJ9DMgt6TbIb/Ao+h6Pn4JtraOin1hDplUZBDuPWjdY=; b=ZvssnWlQxbevyj
	0XK9sE1X3NE9DWXlM5W0m4Xf2vsLIcbRDkD4pz5WlgWFVwDTTzA9cABxiDv9atrZ+vx+ogHeJ0SP/
	FslVBv2pC1Z8B9ZYCo3hGtvZXHyR8of/rCslHcCt/VYKVTG7tW00crqDN+/mgHX82AtAEiWiLmYro
	CLF4sw57chbKKGrmMoj43pn2zeUvD1oNiCQdrY0sYL1CO7pUA9Yk/P+GCMlFWe+XCpUpq2gzObNci
	dH9dDU0pYj4JdIR0HWrR9cnNOXT8pX24Cq3QcDaR4xSnroihKEUqL0tMRdeECGO2+ZMsi0Ufgrxfk
	X10H6APV6tQOmwUMDHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHp-007u5h-2R;
	Fri, 10 Nov 2023 05:42:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHj-007u44-0v
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:42:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc5b705769so15400515ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 21:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699594945; x=1700199745; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+XcC9jhP/bGq7aC/UoHPwAPHEM/GXNVyFdjZVSpXIVk=;
        b=Cwrp/glwtp/NLol+pK6r+zlvFAsSNGDKXcccyuXipYrYOBzA5wsxNHZRPdyvRSO45W
         YpZA/0L0jlhXtqgWqUKo8JL1bww4NHbIicXCLu0t6yUY6g0Zcwo3fDzuW2uhbvjMfHT6
         aK2TJKwwG8iClIZDQzQR3+rpaESvjfGnAYEm7fEMvhRHojLodSUdezFW7T1hCxDakzzs
         5cL1w9QkHEcFDRUWz3qnw7EptJ50Gto2q2vDswKWs+KsokO5tboMzMe12gwD/1oMwE4G
         RCkALI2BC0NTyoTSyWzRoAiPEcdI5IS0iyR+jTcjSB7DksY1KInvP1BTB98YqlyrGyQS
         oxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699594945; x=1700199745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XcC9jhP/bGq7aC/UoHPwAPHEM/GXNVyFdjZVSpXIVk=;
        b=oQeceTbih3te4WhWQO0d0GnapI5S/qokjlXHoTSWpXnqLX9DsQEejBK+bs8bFG24iK
         2EzSOngUAU7hw/K+OaNLnZ+86NTTpv1n29EuspENl6/tTwR666D6yYVt0nwJEWpzaxOC
         KCjEitdHCRWEBK36bicxw+9wYOuCJEJmbBrHx9xeddbDbUHlTmLUTpHjcuRzn5NMgPNU
         h/wiIOQyvsmOJN1j9UA0tDUkfPToSaTDW6gESpD+Gi6AUMHhF2nVqGFNqns8gBNaQDnk
         eVaWn2B+Ng2+dVIT8Z535DV8aGa/+Tr05SWQDITKOfSs18yhKf6bh01x7ej4odTRF6YR
         Bv7g==
X-Gm-Message-State: AOJu0YwNyLErsXNimQ8qpKL6hxV1aak5YBJNouvB4v4DRT+KqZ+bx2YV
	Te7OkgxWIdIrOySUHCC0AWh3XQ==
X-Google-Smtp-Source: AGHT+IFkQpr0eaXWEhDr21mdSAtBP0kGg5lYXmYv1+D4154UOsr+qeTrAtZAzTwbIvE2xTtyDvJC4A==
X-Received: by 2002:a17:902:7084:b0:1c9:bca2:d653 with SMTP id z4-20020a170902708400b001c9bca2d653mr3086970plk.11.1699594945459;
        Thu, 09 Nov 2023 21:42:25 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2071:4479:98b8:cc69])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b8a00d4f7asm4498845plb.9.2023.11.09.21.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 21:42:25 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v5 0/7] RISC-V: Add MMC support for TH1520 boards
Date: Thu, 09 Nov 2023 21:41:10 -0800
Message-Id: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHbCTWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA2ND3ZIMQ1MjA93c3GTdJJNUCxOztFQzCzNLJaCGgqLUtMwKsGHRsbW
 1AOy3IMZcAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699594943; l=6190;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=m+hSYoMizlNfFoD70CP0rvM+rJPjrC2/jGP5h5E7auY=;
 b=+kVfNZUJ/yL4kzpJ4UTre/gKwRHh0FCK0PeDAaVn5Fmmu+H1uCqdJGe/3xaeF8eEaGeYAj8fc
 o3aHLPRHUMVAFJJJ1fCSWSdyGrQElfHtLh7LfCQoeOpGVzP68v/bcZC
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214227_543386_3044396D 
X-CRM114-Status: GOOD (  24.76  )
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

This series adds support for the MMC controller in the T-Head TH1520
SoC, and it enables the eMMC and microSD slot on both the BeagleV
Ahead and the Sipeed LicheePi 4A.

I tested on top of v6.6 with riscv defconfig. I was able to boot the
Ahead [1] and LPi4a [2] from eMMC. This patch series also exists as a
git branch [3].

Note: I have only tested eMMC and microSD. I have not yet configured
or tested the mmc controller used for SDIO WiFi yet.

References:
[1] https://gist.github.com/pdp7/881342620ec1509685f23a387e2fc8d7
[2] https://gist.github.com/pdp7/97017ad88d83fccac18eba69bff817b7
[3] https://github.com/pdp7/linux/tree/b4/th1520-mmc

Changes in PATCH v5:
- fix logic in th1520_sdhci_set_phy() to correctly check that both
  MMC_CAP2_NO_SD and MMC_CAP2_NO_SDIO are set in host->mmc->caps2
- add Acked-by's from Adrian

Changes in PATCH v4:
https://lore.kernel.org/linux-riscv/20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com/
- set DWCMSHC_CARD_IS_EMMC when (MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO)
  as checking MMC_CAP_NONREMOVABLE is not sufficient
- change prefix of phy functions from th1520 to dwcmshc as they are not
  th1520 specific
- remove unneeded check of priv in dwcmshc_phy_1_8v_init()
- remove unneeded check of auto-tuning in th1520_execute_tuning()
- fix order of new nodes in th1520-beaglev-ahead.dts: move sdhci_clk
  before uart_sclk, move mmc0 and mmc1 before uart0
- fix comment typos pointed out by Adrian
- add trailers that I missed from v2

Changes in PATCH v3:
https://lore.kernel.org/r/20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com
- always call th1520_sdhci_set_phy() in th1520_set_uhs_signaling()
  and not only when timing is MMC_TIMING_MMC_HS400. This allows the
  microSD slot to work as th1520_phy_3_3v_init() is called from
  th1520_sdhci_set_phy().
- add mmc1 node for mmc controller connected to the microSD slot
- add enable mmc1 and add properties for microSD on the Ahead and LPi4A

Changes in PATCH v2:
https://lore.kernel.org/r/20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com
- make use of BIT(), GENMASK(), FIELD_PREP(), FIELD_GET()
- add EXPORT_SYMBOL_GPL(__sdhci_execute_tuning)
- call th1520_phy_1_8v_init() when FLAG_IO_FIXED_1V8 is set
- set DWCMSHC_CARD_IS_EMMC when mmc caps contains MMC_CAP_NONREMOVABLE
- remove manipulation of AT_CTRL_AT_EN from th1520_set_uhs_signaling()
- remove unneccessary cycle of enabling and disabling AT_CTRL_AT_EN in
  th1520_execute_tuning()
- remove th1520_phy_1_8v_init_no_pull()
- remove th1520_phy_3_3v_init_no_pull()
- remove FLAG_PULL_UP_EN from priv->flags
- remove thead,phy-pull-up device tree property

Changes in PACH v1:
https://lore.kernel.org/all/20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com/
- ADMA mode now works correctly due to a patch from Jisheng on the list
  ("riscv: dts: thead: set dma-noncoherent to soc bus") and this commit
  from Icenowy that is now merged: 8eb8fe67e2c8 ("riscv: errata: fix
  T-Head dcache.cva encoding").
- Expose __sdhci_execute_tuning from sdhci.c so that it can be called
  from th1520_execute_tuning()
- Refactor the define macros for all the PHY related registers to make
  it easier to understand the bit fields that the code is manipulating
- Replace magic numbers in the PHY register writes with proper defines
- Replace non_removable in dwcmshc_priv with check of mmc_host.caps
- Drop dt prop "thead,io-fixed-1v8" and instead check for existing
  properties: "mmc-ddr-1_8v", "mmc-hs200-1_8v", or "mmc-hs400-1_8v"
- Rename dt prop from "thead,pull-up" to "thead,phy-pull-up" and
  improve the description in the dt binding
- Replace pull_up_en in dwcmshc_priv with bit field in new flags field
- Create th1520_set_uhs_signaling() and call dwcmshc_set_uhs_signaling()
  from it instead of adding th1520 code to dwcmshc_set_uhs_signaling()
- Return -EIO instead of -1 upon errors in th1520_execute_tuning()

Changes in RFC v2:
https://lore.kernel.org/linux-riscv/20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com/
- Expand dwcmshc_priv based on driver in the T-Head 5.10 kernel:
  delay_line, non_removable, pull_up_en, io_fixed_1v8
- New boolean property "thead,pull-up" indicates phy pull-up config
- New boolean property "thead,io-fixed-1v8" indicates that io voltage
  should be set to 1.8V during reset
- Add th1520_phy_1_8v_init() as voltage_switch op
- Add th1520_execute_tuning() as the platform_execute_tuning op
- Added th1520_sdhci_reset() as the .reset op. This function will set
  io voltage to 1.8V after calling the standard sdhci_reset() function.
- Modified dwcmshc_set_uhs_signaling() to enable SDHCI_CTRL_VDD_180 when
  io_fixed_1v8 is true
- Add many defines for register offsets and settings based on the mmc
  support in the T-Head downstream v5.10 kernel

RFC v1 series:
https://lore.kernel.org/r/20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Drew Fustini (7):
      dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head TH1520 support
      mmc: sdhci: add __sdhci_execute_tuning() to header
      mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520
      riscv: defconfig: Enable mmc and dma drivers for T-Head TH1520
      riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
      riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
      riscv: dts: thead: Enable LicheePi 4A eMMC and microSD

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml           |   1 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  20 ++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  20 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  23 ++
 arch/riscv/configs/defconfig                       |   2 +
 drivers/mmc/host/sdhci-of-dwcmshc.c                | 349 +++++++++++++++++++++
 drivers/mmc/host/sdhci.c                           |   3 +-
 drivers/mmc/host/sdhci.h                           |   1 +
 8 files changed, 418 insertions(+), 1 deletion(-)
---
base-commit: 8cfd133bee055fb537d2338b808079a77de60052
change-id: 20231031-th1520-mmc-b4e846fe6869

Best regards,
-- 
Drew Fustini <dfustini@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
