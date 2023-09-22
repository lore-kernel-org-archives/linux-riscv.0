Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B379E7D0BD
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zR9AnGCpF46pmXyMxD89XtQWg5hF3D9+mKT3Bpz964k=; b=cnQPbhh4IegKdg
	sfnaut0eWEu/AZXpVOQm8URyzBB4Pfr5mrFnoJRxtrzxiZcgr56nAy4y1AkudLvmQKT+6IrCnAlP/
	cCFOjBxKQwhZdjkaKP9Uf3pJXx5RVwpU/bzV4GXJV9u8AghIaPurKrWGlDO85cXEoa36ErKo2+GdV
	PYcNshsRbQwe/Jx45uESZ5pQnAGr3zHiL5ULjmaMckyKfZ8lgYeT/j8xvxeXRlTfMMx+sC1hCE4A3
	DuSo0j0aXklW0suJWv+QGDwVBGYOpchLngsByrxZiM2HpgwPni8CNbVxHO01RGMEbawfNTeF7ZrjZ
	l6vvt+N/+amtX2B7AHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKK-007akj-0V;
	Fri, 22 Sep 2023 01:51:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKE-007agP-3A
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Sep 2023 01:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=QxT7MI2lb7w2tzMJaLbHsAOT60s7Ptz9WOHyKvQ6hKs=; b=NLqGpKTT7VWygIeBMpd3EwZ8Az
	fnnniF0LqFvKliPJgvDbgL/suVA6/JVlorpGWvuzTjriPCr2qYvCREn7qMcd03z2j4Y7QqntyItTZ
	GzcW3BdtzByr9e5qqFtgEpLGy8SdYHdJDCQW1hNSIhxUWMgnbL3mkuYwEskDB8gPZmZJtn8wSbcUk
	w8nvmZ6WbFNbm1ZouuNxFvsIjq/+uvlD/qI616+qACFFhG3EygCPVQNFTnLHGjE/bIZmwt/XLEG2b
	jd+G1ag1wD2MB7/gPKof9xuTHgDSJ9V1fL5fElhGXetqFOg1Sa2nvlSg2EVqj9T8X/0G78NSCau6P
	QnKZ0mBg==;
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK6-00Fq0s-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:51:21 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1d66bf632bdso883808fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695347468; x=1695952268; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxT7MI2lb7w2tzMJaLbHsAOT60s7Ptz9WOHyKvQ6hKs=;
        b=nspmLPkPgHII2k5Z3pZC70UJqBSzxtULXIbxbqyYhiWTIwWNXgRt7CMDrMIPTwy84B
         Hv+pbkkiuOaixh7RqNM+Jn90o2EXh3e0l8dG1V0moSweleS4zsBSq+y23BB3gEqfEw47
         gQYZOyCdAZG94guPRPgAkADR54LECRsT+RLhzD1k2ZCffgXliwIZSYBWlp5TbOYDi9OX
         xSrbBmLCn5UZ6TytWYn0SLlG///HpVYWFNMalE/xjjVFXV13yWfQARf+V4JBg4K3MCY1
         bcBX7g75bjgmh16XsYIoSxCzFSpFpGGGdfOxrcnb/ehPmFw9C+pveIX9hII8mqq8dbzZ
         0CrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347468; x=1695952268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxT7MI2lb7w2tzMJaLbHsAOT60s7Ptz9WOHyKvQ6hKs=;
        b=P1vUW+T7bjMMmKZMJQ4ZT0ab3813sC6ZiQiTJjympGJFbQ/q4e4xJp7kYOiYgt/EYJ
         CgFwbnBJZr7SLVS1drZ8R/ERMzNwZZE0fh+GFh/to2hkXLlUYrXUBctmgERfXXAqPQEu
         xzacI6g0xnVtm5Qkly7eSt0hrsPpsYfzw2rsC2Vzogzy8MoU6IC1U2usUO7QFKgbR40M
         n41QPWW+d4owQi5d0gjvyQ/xtuASx/fuaVefo7Zsz/Cl4TGvrvc3qVSuL7bU9aciKIV0
         lKgu1NSGZazIwHXyvRJv6ooI2gZQuFX7MQyU0rTKczKZgIysq+3VNks3R8MzBK5Uj7mC
         A04w==
X-Gm-Message-State: AOJu0Yx+yU7anqYH4p4sJBKODlqp3e3Th+NRuHCKNXwcGbZ2blYdx7yR
	YrTUftdCe+4ZFuvw02AnRIzUYg==
X-Google-Smtp-Source: AGHT+IGOiY0FLBw9/6j89iCI7nDLKyeDUufvwojlifiaXgKtUsAKGuckLBp4bSf3j5HZEVnEu1sWxA==
X-Received: by 2002:a05:6870:ac14:b0:1b5:688b:5c24 with SMTP id kw20-20020a056870ac1400b001b5688b5c24mr8317953oab.32.1695347468248;
        Thu, 21 Sep 2023 18:51:08 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:fa26:6227:be1c:67f0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0057412d84d25sm1973856pge.4.2023.09.21.18.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:51:07 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
Date: Thu, 21 Sep 2023 18:49:47 -0700
Message-Id: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALvyDGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDSyND3ZIMQ1MjA93c3GRdU0MLCwOzxERT00QLJaCGgqLUtMwKsGHRsbW
 1AIE3bOtcAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695347467; l=4409;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=TsJ18vOw1amlgVGcXat8klPQchAwNWl+YaMuYvHoF+4=;
 b=jzGQw+gp4aQ3WssWlcCJ1CI8Sw57dIEOlnAyzTpnSGcOZB8Lx3iKdYt+JyPlSiyQsOsVmJuKf
 AF4jEadFNIQDU2cggKSGH2Ca4Dk+nYeA71n5PgMAVwKOLUzbvLlKMtf
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025116_722559_05FBFCE5 
X-CRM114-Status: GOOD (  24.63  )
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

This series adds support for the eMMC on the BeagleV Ahead and the
Sipeed LicheePi 4A. This allows the kernel to boot with the rootfs on
eMMC.

I tested on top of v6.6-rc2 with this config [1]. I was able to boot
both the Ahead [2] and LPi4a [3] from eMMC. The following prerequisites
are required:

  [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus [4]

I pushed a branch [5] with this patch series and the above patch for
those that find a git branch easier to test.

Please note that only the MMC controller connected to the eMMC device
is enabled in the device trees for these two boards. I did not yet
attempt to configure and use the microSD card slot. My preference is to
address that in a future patch series.

References:
[1] https://gist.github.com/pdp7/5fbdcf2a65eb1abdd3a29d519c19cdd2
[2] https://gist.github.com/pdp7/91a801a5f8d1070c53509eda9800ad78
[3] https://gist.github.com/pdp7/1445c3c991e88fd69c60165cef65726a
[4] https://lore.kernel.org/linux-riscv/20230912072232.2455-1-jszhang@kernel.org/
[5] https://github.com/pdp7/linux/tree/b4/th1520-mmc

Changes since RFC v2:
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
Drew Fustini (6):
      dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head TH1520 support
      mmc: sdhci: add __sdhci_execute_tuning() to header
      mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520
      riscv: dts: thead: Add TH1520 mmc controller and sdhci clock
      riscv: dts: thead: Enable BeagleV Ahead eMMC controller
      riscv: dts: thead: Enable LicheePi 4A eMMC controller

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml           |   4 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  15 +
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  15 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |  15 +
 drivers/mmc/host/sdhci-of-dwcmshc.c                | 456 +++++++++++++++++++++
 drivers/mmc/host/sdhci.c                           |   2 +-
 drivers/mmc/host/sdhci.h                           |   1 +
 7 files changed, 507 insertions(+), 1 deletion(-)
---
base-commit: 3d01adbee80b2237c43e2e06d59e05aa243a0fe6
change-id: 20230921-th1520-mmc-518806aa55a8

Best regards,
-- 
Drew Fustini <dfustini@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
