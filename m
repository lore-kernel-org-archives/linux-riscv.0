Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C0C25B47
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yufNpcGwIome6iMju7iIVsBLcQiZBWTwkgoC1kDDTYo=; b=2/XPYOvmtUzZqA
	HVWVs9rZu5US0/W1+UCtpjXW1QNm3WZspAMW4gtK/2Tg0DcTNIdZ7jYJqAVJGAthXWoRo3h/36ZCB
	9jLMRrkI7AvvzfRLi4PncxxS/w7o43zzE49wFLa9Gz9ISFiOh56MhNJvvwYmVIRCTuLz/JoK5GBZm
	YKHbkwS5cfsHOZ2SZ0dxbWgwTF1kvmxD0MGnpOZaIjEjKN/7RG8r4MFMvFUoEA/r+i3UFaTIYh/rS
	llbAJCNHwUzR9+3w3CU6b6BBrHAIKWbQbdsqN35j6WPEgbxMvS/DWf9m8pX7Ma+sxPsD2NBP888OW
	ggS+37fk8ehp4IMi3I9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28o-008HSo-02;
	Mon, 23 Oct 2023 21:07:14 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28j-008HRO-1X
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:07:12 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso3071377b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095226; x=1698700026; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rxRjmIExa0NCWi/ierGnShMAGgwQw0v6YfA7TKsSgfk=;
        b=IHxKhN6lX7fC4R3KJskXLBCoydzKjFWECMxWx/vKzW7Jei5BPI++YZ7Tg2Rn6Y5qP5
         9D90TuzKpS/0ChckYR2+wPUN+jwyBTwm31ZbcDbQFP/257SgXokaPdjuiSL1Lu5dDZTU
         syVcI2fOAaAHj6qkpz7vUFHDaOiPPigdj/DeWHkZS1zGnvv0O2G1lr4zC8HM4JsL/lmc
         g3dejMHTs/WNsFszNbsm6okZIDVnmjRsKOn06jsGSt/zF8fvQUtp7ja4jj0uz+CynbGH
         bEyeiDpr5BzWqY+kUhFGZRqdpELRL3s+V4bmE3o1SZgaojkNGgsFUerAqCMOcf5WcVGs
         NU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095226; x=1698700026;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxRjmIExa0NCWi/ierGnShMAGgwQw0v6YfA7TKsSgfk=;
        b=pHU2tZTNcC5ol+eYfyKBcFbbjSvx+TzvJaQ+t6/AmipDuqFhCKOBePl+l5EgV2tKsq
         Txrn87+Et2UMzyeMWR+98QJlLoT2NgMsROv17OBjjdhWWLHo8o9GGY2ekZ6Lnw5tI7ue
         xaEeTNIqcBQK7xRnu4CQzZJ4zPIA4VcKHk27J5Yzp85QYSS/BVNcqvIC2Mp+7e6Jruv8
         y8ibjWpqjcLg5CtZf3spPoFKTdKDgT8oiKyMb4TZzKa32OEtFCbo976WpDj2ZPPWQnOI
         TqSymWQuKEd6FWR13XgQcllkCzSxtRX2Bz+mK51sLyqsqirfH+729U0E6iiXAxD7Q3Aj
         1yog==
X-Gm-Message-State: AOJu0Yz3aygi0mK1tiHBxiHIxCFzi3WYv1Ff/RikASZn/JB9CyxFTHEY
	kZZnztlpKjTHOnrSvhV/0JQSWQ==
X-Google-Smtp-Source: AGHT+IEoVvEEKGNGxVa0n9CRdhi7Ihz0IMoJxlBRs0dTzoIAAFxOorZeJxrH4V6npo3yp+XogKZ02w==
X-Received: by 2002:a05:6a00:2295:b0:68a:4103:9938 with SMTP id f21-20020a056a00229500b0068a41039938mr9387407pfe.0.1698095226097;
        Mon, 23 Oct 2023 14:07:06 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b006bde2480806sm6573066pfp.47.2023.10.23.14.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:07:05 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v3 0/7] RISC-V: Add MMC support for TH1520 boards
Date: Mon, 23 Oct 2023 14:07:01 -0700
Message-Id: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHXgNmUC/23MQQ6DIBCF4auYWZcGEIV01Xs0LmTEMknRBgypM
 dy91HWX/0ved0BykVyCW3NAdJkSrUuN9tIA+nF5OkZTbZBctoILzTYvOslZCMisRi2tnrseJ6i
 Hd3QzfU7sMdT2lLY17qed5W/9y2TJOFO9NmgQFVfmbsf9RTa6K64BhlLKF/3IbDinAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698095224; l=5536;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=GA2saEZ7Ng9DFUZVB2Ta7tnKvGxz/8BX1kSEaH8UI2g=;
 b=XrIwcdiSWadi5ZFufTxN6I76b4sqwaR/ja7juxyXW9ipudXcCdVIhttKyXXwNm2H79zio3rXz
 UaNyohV5nkYDCPnXvPc2lVUqETp9jMxbv1GT/qAlOQiVdQnx88moi2t
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_140709_751909_C23FE106 
X-CRM114-Status: GOOD (  25.16  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for the MMC controller in the T-Head TH1520
SoC, and it enables the eMMC and microSD slot on both the BeagleV
Ahead and the Sipeed LicheePi 4A.

I tested on top of v6.6-rc6 with riscv defconfig. I was able to boot
both the Ahead [1] and LPi4a [2] from eMMC. The following prerequisites
are required:

  [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus [3]

I pushed a branch [4] with this patch series and the above patch for
those that find a git branch easier to test.

Note: I have only tested eMMC and microSD. I have not yet configured
or tested the mmc controller used for SDIO WiFi yet.

References:
[1] https://gist.github.com/pdp7/7850027e8d256b6fd9cd53080240f0f6
[2] https://gist.github.com/pdp7/fae4637378426723508b679420a0a5a1
[3] https://lore.kernel.org/linux-riscv/20230912072232.2455-1-jszhang@kernel.org/
[4] https://github.com/pdp7/linux/tree/b4/th1520-mmc

Changes in PATCH v3:
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
 drivers/mmc/host/sdhci-of-dwcmshc.c                | 357 +++++++++++++++++++++
 drivers/mmc/host/sdhci.c                           |   3 +-
 drivers/mmc/host/sdhci.h                           |   1 +
 8 files changed, 426 insertions(+), 1 deletion(-)
---
base-commit: f4c03b3d6c4bdafbb7885ccb84b095001eab1b88
change-id: 20231017-th1520-mmc-b7c72b7f56cd

Best regards,
-- 
Drew Fustini <dfustini@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
