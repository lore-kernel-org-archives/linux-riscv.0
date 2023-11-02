Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56069C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TYSpQi6J7r4CTMdjSmEzm7O/L3HIsHbCvwURk7Iwv1M=; b=PkeovptoOLJVy/
	4u+ti938vRibVr0RmA3VBp7kUDZvgL2A1A8SwgoIjt9VA5l6Hp/nC7SkEjwN46fbkA0lPoXl8/xik
	CRuKQd6xY/qTgx2QAMBp1PqUGbb9hmXhHBzg4Ihb8LFXyFF7PZkSQUSX0zTpPSqSaleeejEp92hyU
	2G/cRInpnGORXWkFQ7DtmMe5c6qBShz0V0ctR//SbBmqxCigi1ZoLW12qmJT0Q8DI7zit3c0bwZX2
	FMu30HO20u+PzKA/9Jf9thCQ9k7hr1E2mdKlZpDPC/yFB6RRY8ZjrAhjw+RwYvl7hhs1S5NAJMuwj
	P52WkcTIZ67UJN6+b5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlj-008a1y-1O;
	Thu, 02 Nov 2023 02:49:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNld-008Zzi-1y
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 02:49:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c434c33ec0so3584045ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 19:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698893347; x=1699498147; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tp4LNFiIF0pTxRkJsbksRH4Nx/gk/tWgjgJQ5eEll8=;
        b=DG2ovo430gTDxHWivZ/YkPc9OXTvIm0U/G4DBy3+j90XpWBDCI+cpMO9flCfqsz2Ed
         ebifQDn6BAov/XC1in9Eojap6YPMYQMl2I29oEJUXo7xLqNqsu30MAijEdbAeBq9U3fV
         eZFZVKG4HYSCYAuIoB9T4Wj5RX+jt6kjJ71+g9VUK8gYGuVXsC6D5WT2YGWZZEii+02j
         Y2aV42Z1oXrt8/8fCmG0Un8gMYW148c2+3zcT3jcYNyNZHmsFpvYTEydLJzCA6wqAnLm
         bLWhGwaPPJXbWEcjmtf0/oADQCpjeGlBXki993FKUKAJn8JWkbbZO/Xy4mKpnkbvpxXG
         VyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698893347; x=1699498147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tp4LNFiIF0pTxRkJsbksRH4Nx/gk/tWgjgJQ5eEll8=;
        b=hGtm4JurYnj2sDiXMfMmqPU883oIjqIZBxy4qXhKlrgtpxhvfZr+/rn6M+eEa+TPbi
         rvi2NM8vhsxflWIi7m8HwUhT3payKNHPE5KYO38Pvjxwd86a4ZHTViqGdW/MwYijRDlL
         Wr+W6xygi/KxUNQnRADvONSVNg3SSq5b5y4XF/Wpf0b5G9vHTtoZBaffGCV9vVn8acbB
         YooKlrHMSvMTWQZlgiiSZr1PBV7I/bPt0zKDGtc51PHvlQbGLQEqFjiVLRGuHU6nD5z9
         +02Qbs2eJcj7AlWUEIPPVGsAMo8Af5Wv5se/mIpnMa1mEmdBie5J0kuMjWeZ1WGdeI1S
         /Bfw==
X-Gm-Message-State: AOJu0Yzc8026Pf9ug20zkp5bhGjzlObWj9vxpOi6I3dOR5UYsVxS441W
	bOWd0BboTPH6m/T7ClnH+ZnxXA==
X-Google-Smtp-Source: AGHT+IFkOx/+76NcFaGViGGbeEoWR4UywZvbPMSVn3cN0A4jkLfE3prQTt7GHkUul/rKHHcq58eRPg==
X-Received: by 2002:a17:902:ccca:b0:1bd:c7e2:462 with SMTP id z10-20020a170902ccca00b001bdc7e20462mr18207924ple.11.1698893347434;
        Wed, 01 Nov 2023 19:49:07 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:7e4c:4d4e:6943:bc0f])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001b850c9d7b3sm1925787plf.249.2023.11.01.19.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 19:49:07 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v4 0/7] RISC-V: Add MMC support for TH1520 boards
Date: Wed, 01 Nov 2023 19:48:51 -0700
Message-Id: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABMOQ2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI2NDA2ND3ZIMQ1MjA93c3GTdJJNUCxOztFQzCzNLJaCGgqLUtMwKsGHRsbW
 1AM4vHaNcAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698893345; l=5914;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=9uwd3KxQTq2z1eqbCZTpoimys4YAiHwbzTNaQs8ZY48=;
 b=qnZqPF3iTr1XNscIOCu+0fjWYOVL7Tmr8I/o612k83XRSmyldRaBL6WDqNqzj8jKVD6veifbe
 PEajM+9mLkRCecWaHGaY2Nv2q5MIMcIrJtEwUm6qbeL2e9ko0ziBIwJ
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_194909_875779_6B3C79CF 
X-CRM114-Status: GOOD (  25.26  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
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

Changes in PATCH v4:
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
 drivers/mmc/host/sdhci-of-dwcmshc.c                | 348 +++++++++++++++++++++
 drivers/mmc/host/sdhci.c                           |   3 +-
 drivers/mmc/host/sdhci.h                           |   1 +
 8 files changed, 417 insertions(+), 1 deletion(-)
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
