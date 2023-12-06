Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA079C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4hDALGTL/Im3bhNgaGzWyFJE8GQP02pdrewAEiu9umI=; b=eBni3DJg1Xe0dS
	H2lByD77ZvJr9vieMBHBMRiqiKeulmYhq8+efXW1o4QjqHsvBFBSvQ47hrrrIwak731oRLwcb49NN
	j5fjYLvqFV6JDGOkGNFTjJxnXjMiyF/kdAsOPe4bCHH0wX3+KKxS4yMOhC/DMixgiODPeH+jVmHiM
	xKbnDrMNtaV3eTxVX8H8256sf5suKkOEEJs+GMYwmXrGusph1T5uQJPhp/kUyfDw8BRrqteL0L5C6
	Wc1INHXEsmHH7WvnPvsxjyaPK3fdYSHphKqRYmH45qkhDEwk5ehjvCDO2VyxHy2cdc8BiFcUqWW3P
	SYRrbpczpropQBaBFEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyb-009M8B-1R;
	Wed, 06 Dec 2023 08:09:49 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyX-009M6J-0M
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 08:09:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28648be0811so4764936a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 00:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701850183; x=1702454983; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pP/mOAEHk3L4+Ebm5XnxL4lBL8R0trfRL0q6ZyH6hc=;
        b=uBjrtftXvEYZ3xX/otGHgAtA2nglqttdFkmljOrnTvwnksEW8q45ulNeO9vZuKE2/z
         0m5Axue0xsX/UtKWIjVJ2o4OvK4sfyds6m1uTNTVVrAsUFUXxPj2+OO6lN9qhHYIYTxS
         6hZuLU8UbTdZ8JpOJ6OV/EJEuKC7O78019Ym6VEmc66K6MOr8APHajHXcJ36QC6/+Rhm
         2FTRUxa489WHdWhjnV+fMSjHiENb7RJFyo1UEa14lR28s8oihBnxHvFs1p7VIZ4FA3wu
         PpT74JHdeaQhq0dxEszj80kD/YHiKc9dwNWS/hlliV8AwvPX6CbRya0Ys05pkxelapri
         0eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850183; x=1702454983;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pP/mOAEHk3L4+Ebm5XnxL4lBL8R0trfRL0q6ZyH6hc=;
        b=XbkTMVu85kwDhBwaqChiMzfEHiddklfasZWuG0u+bVbQgWqYNYbpJzwG7On/cchZZF
         0yG8bcUSPpIyDdVg7TNHtzCbVeh8lLx3BAy5otENUrArdSI9CZcUuy4oS+si5bk58VUu
         NCR8KbemIuTahMSEXRn+7nbYkOU1jFL9RXALvnXU4KHGdjHRYFiSVeCzl7MhXiGT/L+5
         Nq7Y4isDZPO8BlCjTX1nIi/xKQnSN7BrKKOBva4BSCt2Ki4Hj3uvUHR9onKI4sBK+46L
         ciSX1tsmyulrbfP2jbUWaAKuji5lsAXVXk2QpbR2NJtyLH5TvP0v4LaF4Aw94DzBB1ob
         wgAQ==
X-Gm-Message-State: AOJu0YzrVRpE5Z4PhGAYlRimOzVoOtnKXaGY+4+q7To/YXq7IxwOrDbH
	QMVJFwBiJPfR1RUeHz1ZghMhiQ==
X-Google-Smtp-Source: AGHT+IGo4/JHP4QyL3itKtTca7idWT8OvTKnh9lPYABqdfiEY+lwqbOvaMtMU1IWNmUp7dyJXBs4zA==
X-Received: by 2002:a17:90a:49cd:b0:286:96c0:b884 with SMTP id l13-20020a17090a49cd00b0028696c0b884mr343400pjm.52.1701850183368;
        Wed, 06 Dec 2023 00:09:43 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:92e9:8fb4:700:680])
        by smtp.gmail.com with ESMTPSA id bd11-20020a170902830b00b001d0d312bc2asm1208668plb.193.2023.12.06.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 00:09:42 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v8 0/4] RISC-V: Add MMC support for TH1520 boards
Date: Wed, 06 Dec 2023 00:09:20 -0800
Message-Id: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADAscGUC/3XMywqDMBCF4VeRWTclSS+prvoeRSSZjHWgmpKIV
 CTv3tR9l/+B822QKDIlaKoNIi2cOEwlbocKcLDTkwT70qClPimlazEP6qJlN47Y+TkJOhvtEI3
 00kM5vSP1/NnBR1t64DSHuO7+Yn7rX2oxQgo0pkdVo7XX/u7s+mIX6YhhhDbn/AUrHPryrwAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701850181; l=6790;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=mugmxLWTK+bV84JTD7xpY9l0ErVJ4SQJ9hqn3/CIac0=;
 b=I03RYUw2HSwrnIpX5TfHkv1n9Y9awQ0JfMC8RaPXVcJwWRKjxPeOHKNm8zF61Qjdye4xrCr3N
 f4ykon/4hKZAiGpR7cv+Fz5KW/oOugPkWKV8SRSN9whflmqBq7AiUN4
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_000945_149983_9D8B5DF7 
X-CRM114-Status: GOOD (  22.14  )
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
in the linux-next [1][2] as well as the bindings patch [3]. Thus v7 was
only a defconfig patch and three device tree patches. This v8 is a
followup to change the dwcmshc node names to match the documentation.

Jisheng - can you apply the dts patches to your for-next tree?

I tested with the riscv defconfig on the Ahead [4] and LPi4a [5]. I only
tested eMMC and microSD and plan to enable SDIO WiFi in the future.

References:
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=49f23745b064cdb6270402403ef58125d78ba183
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=aff35fbc7830510ef7cbcf8e32a041a55de3dc51
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af076680db846ed54b00b9a763473d1043446993
[4] https://gist.github.com/pdp7/881342620ec1509685f23a387e2fc8d7
[5] https://gist.github.com/pdp7/97017ad88d83fccac18eba69bff817b7

Changes in PATCH v8:
- change dwcmshc node labels to match TH1520 System Reference Manual:
  emmc, sdio0, sdio1

Changes in PATCH v7:
//lore.kernel.org/r/20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com
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

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 +++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 20 +++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 34 ++++++++++++++++++++++
 arch/riscv/configs/defconfig                       |  2 ++
 4 files changed, 76 insertions(+)
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
