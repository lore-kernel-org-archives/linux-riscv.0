Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFE3C10DC3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 01:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kQ3m7Fg+fMl08G3/MIIvi7neb9IdEX1jqICjCavcLNU=; b=U9pRC4tFr+wQgu
	IbX+rC5zPsEZHrRS4gui0P3DpKzs08HRs/WOpW2LAI7ascr0+bL7VlSCn+bNt9+uof7AvEjBSH59t
	Pvm224F/A2aGWQw0SMDyl4nxat91lJswnoBsmV4se4RSR413wwuWu7c0juAlPOvjLKEdNVvPbUyKi
	U5SSLopjK01+O/mi0JmDkKq5SxbqZ0+NpYF7TcJPayWBFvzb1rgb0IA5v71QN84MU7xXoTt2lzR/w
	w0TIkozAxOJigt/SiddcDBG0CjMlBn6c6lY5HOrUeO6SvO2ZcCcr0NrQFtAUx+YUQHzSyAjXHcajL
	HwHD3dHfoELj7mJfGH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WBB-009i4X-1G;
	Thu, 30 Nov 2023 01:49:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WB1-009i07-35
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 01:49:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cfb30ce241so4688955ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 17:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701308951; x=1701913751; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrWFkW6X8nypRY3mnjRtwbLgjlw5fsTfq7bqWOmuE1g=;
        b=hFRRxDOLB1Y7KpVNRtHsr7924IINhN7GbHA9/CCneCHT28HfniJQXvXsMBOaa5u19m
         mpke12towKZ4aLz8DFjZFdAtCbR62lLkvvNg9LcETuXjobQFLodATRSz6bw1jn16uetA
         XQkc/9osqjLDrZPjuEb5ugjghWIaShvlz/2WyD2uViavqFSIqnT0rMwDyw94QPS7kT9a
         e9NSs1MNKdjiztQeRfDL5vK7G1E34AxGGYmMyyuwHEWYCtaevrTEJ0lGbi3A3sJK6Xkr
         TB1SBtlEnQVcNPiBzWB5t4iC/4IBBC30zqVQWCBTg6XvQrc9gBjvaTTH0awQA+oXSH01
         LGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701308951; x=1701913751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrWFkW6X8nypRY3mnjRtwbLgjlw5fsTfq7bqWOmuE1g=;
        b=LhVgdQGYwq+TCXuBUw1CBnEVl8Spb1284SMfIOauDGXR2DpffFpcc+Lkr05J/TnW3o
         UqDWt4wqHN+6JPBNOPy4zPIkddvI44CfyUAfPmfz1LCMACQzBBmD1dYnKIw4x7o5nX0y
         6FF3s5z9LkS0a9Q5iW0vs4HBvQf8Mz0ma99LIBFlVlI2DmXBempuEGp7bhc+cHS7oYoT
         f+v82YXSD+pDBfFYPW4maZiQDeWdunAjTgmwUvuT/CHBZol99CSrKzHkXrizek9YNU92
         DHky1ztQE9Dbjcin58PZpIQmN0Fe3q42LQtCk8yLWjMvVeMK601einz0/ZmBR67ltr84
         Rzcw==
X-Gm-Message-State: AOJu0Yyh/iAaxNknkF1KN/MHP3VaMeX9LWJZ2DOXTgNkN/9gz/ELopPv
	jVHRERXFwCzslgt0Xdy5sLo7sg==
X-Google-Smtp-Source: AGHT+IHQnhFoeOu/YqKgErSaH65Y+XISFCmB2QWMgNnLP7Sv7Myw42GNsOVenm6/kLWc7zX68a/RXQ==
X-Received: by 2002:a17:903:32c8:b0:1cc:3544:ea41 with SMTP id i8-20020a17090332c800b001cc3544ea41mr26839363plr.46.1701308951316;
        Wed, 29 Nov 2023 17:49:11 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:9707:1e8c:3166:6a23])
        by smtp.gmail.com with ESMTPSA id bc3-20020a170902930300b001d00b0bd306sm24455plb.251.2023.11.29.17.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 17:49:11 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v7 0/4] RISC-V: Add MMC support for TH1520 boards
Date: Wed, 29 Nov 2023 17:48:46 -0800
Message-Id: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP7pZ2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQyNL3ZIMQ1Mjg/jc3OT4lJJi3VQTc6Ok5GRzgxSDFCWgpoKi1LTMCrC
 B0bG1tQDGYC5ZYAAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701308949; l=6520;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=PQN3DG3B59H45OJ+NvPDOITQRD4vzO2wK4yuDwnB+VE=;
 b=nhw6O1JFXLB4tgNkZ0nC/N+rbX3Bzr9hM338D7BYVgeJpvpWKIokLSI8k+BF+wlBKEaNizGsJ
 d3rcPeawHBPBWqmxCo/uw6RG7NuEdR2wa16sc+Zj10TKYOhVbPT05Lw
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_174916_192295_560D5801 
X-CRM114-Status: GOOD (  22.17  )
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

This series enables the MMC controller in the T-Head TH1520 SoC and
enables the eMMC and microSD on both the BeagleV Ahead and the Sipeed
LicheePi 4A.

The drivers/mmc/host patches from v6 were applied by Ulf and are already
in the linux-next [1][2] as well as the bindings patch [3]. Thus v7 is
only a defconfig patch and three device tree patches.

Jisheng - can you apply the dts patches to your for-next tree?

I tested with the riscv defconfig on the Ahead [4] and LPi4a [5]. I only
tested eMMC and microSD and plan to enable SDIO WiFi in the future.

References:
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=49f23745b064cdb6270402403ef58125d78ba183
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=aff35fbc7830510ef7cbcf8e32a041a55de3dc51
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af076680db846ed54b00b9a763473d1043446993
[4] https://gist.github.com/pdp7/881342620ec1509685f23a387e2fc8d7
[5] https://gist.github.com/pdp7/97017ad88d83fccac18eba69bff817b7

Changes in PATCH v7:
- fix sorting of DT properties in the mmc nodes

Changes in PATCH v6:
https://lore.kernel.org/linux-riscv/20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com/
- set the mmc nodes to disabled in the th1520.dtsi

Changes in PATCH v5:
https://lore.kernel.org/r/20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com
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
Drew Fustini (4):
      riscv: defconfig: Enable mmc and dma drivers for T-Head TH1520
      riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
      riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
      riscv: dts: thead: Enable LicheePi 4A eMMC and microSD

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 +++++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 20 +++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 25 ++++++++++++++++++++++
 arch/riscv/configs/defconfig                       |  2 ++
 4 files changed, 67 insertions(+)
---
base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
change-id: 20231129-th1520_mmc_dts-e472bcc70d0d

Best regards,
-- 
Drew Fustini <dfustini@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
