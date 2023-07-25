Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAD8C001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 01:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6L1fUrrCOEB3paz/Y7OfmxURt67zZlVSQLF53V29epU=; b=oCAJmlyMJCXhuJ
	kXypPXA9AZIo6WN53v+6uLmjWKSXrbubQ7+9REJjowUDwRgcuYGiGF2i+bVmBfcyeXWFU9SVCTeoa
	5mfuTg3xwCRdPmUM26LXV7fZmVEAam9tNQLzzTPVsOYvEdU1xAqpEaM/bwvb5AHyQUasntNSHNd44
	lrxpvI09bzLq0Y4M0Eawlkm3GghUGGeoyOCRchxmg9VEV/5zKEEmNa5gMrniIpt8KyH8/qDD/JkDQ
	ty82ccObj3Zew8Jx6Hdu1Mbc0nnG6yei3QDpb6Qg40bWsdd543GuwTftiej6ah3HVCBO+HMu/S17s
	GgMDFGGs1kYw3MbIoMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Pw-005nUe-2z;
	Tue, 25 Jul 2023 01:00:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Ps-005nTX-1o
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 01:00:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b9cd6a0051so30981465ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 18:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690246843; x=1690851643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjptT1JAo6APLrBCr3T/Njj8Ut+EIbCwxhdTzUr/jGY=;
        b=RsS/Dxo4J7mrQnCESvRMUJ4+qmObT0YYUvWIc6OBoeiaLJaKoXMvlYFI25EqtRWSBt
         wtOVt5gCFn7knLF52RL66/YXJEI8dJVaiFzJSyf9rCfKXDFYqKvs2NIUKFpZWbvBXxA0
         EOoPX0xKOaL4LfQTdSu4tvwqNXnJdETYOTMVbT7FCZ/WgbEKg+ZThX1PumPiGd4ptnEu
         VOGijO1mhvegyIY+qzaWiAlxgvfxOvLrhbUk980wndp4Z/KN+PYMplBCrrraRlaGQC+u
         A4QwPS9j/dUeKkEUdXWJ+YLpNq9aZNIKMBSEcYg9r96urm0cHsU+MQbpzeeWPukv+RMq
         1sdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690246843; x=1690851643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjptT1JAo6APLrBCr3T/Njj8Ut+EIbCwxhdTzUr/jGY=;
        b=OtaMXn/ERzjF+Jlb59lIKysFm79jO03l4MIHjvFAwTgblfKgDlX9/onvsrWeX38U1b
         mj1/r6sI0/6UsU5mwhIaX/z6B4sPXyFIQ+c145YQ3G0++FbVogmg5DMggIdSc8miaVkQ
         KVUZQ7vKyO/c1A0Tj+iWUo2P5tsQ/tvD+hXjGn0JhYyECH8DgFA3CD1fIrHdghZYPTS9
         kZh067Hnf1u7yUIn6aXaSaiLNHN4m1ROBxbhtJdvK78AqZCjUdJ2LUEfLJjbYsboiOsV
         xNcA4uvNBdiXIIGmQKrEM5e0QsshCr5f8lJhQyWN0kRBNLqidl2CvaL7J0TP0MCpzH/t
         phLQ==
X-Gm-Message-State: ABy/qLZIVOIG241udFGFa6jYZks8soxVv/L/JzVBHmj0BdV3gWYmj+w2
	YOGBQhwTxJt0ithA2RsWm+dAYRNb2t1j4rz5JbOw7g==
X-Google-Smtp-Source: APBJJlH2wjLOOW96TXK80PRQDJaUMRx9PYau8YGE4KcjOBDpRvW12RY7PzL7XRjA1UgvKTGGDzI0LQ==
X-Received: by 2002:a05:6a20:8e1b:b0:138:3302:1471 with SMTP id y27-20020a056a208e1b00b0013833021471mr12436514pzj.6.1690246842890;
        Mon, 24 Jul 2023 18:00:42 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2cbf:9196:a906:e222])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b00682a75a50e3sm8576900pfn.17.2023.07.24.18.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 18:00:41 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH RFC 0/4] RISC-V: Add basic eMMC support for BeagleV Ahead
Date: Mon, 24 Jul 2023 17:59:14 -0700
Message-Id: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGIev2QC/x2NQQrCMBAAv1L27EqamLZ6FfoAr+IhTVaTQ6Lsl
 iKU/t3U48AMs4IQJxK4NCswLUnSu1RoDw346MqLMIXKoJU2qtcnnGNrtULK2WNvfKDzMCgbOqj
 F5IRwYld83JvsZCbG7miRvdmFD9Mzff+7O9zGKzy27QeBonZkgwAAAA==
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690246840; l=2518;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=AUPEwpyDxsigwBWm3NiT3sK0EsmNOZWp0bCGe7BGOA0=;
 b=se8Hk4XUDD1D8YXFzAuuvFR2cNqx5kl7XVjj2BXZe6pCsgL4MebKjhHyl85LVO10JXmnkqHti
 P2KpzCT59ToBGEmvQMO0EQQ57q9wKGnwwViW3oPnYn+IIVx1IJWuCAF
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_180044_822230_90A6E37A 
X-CRM114-Status: GOOD (  17.03  )
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

This series adds initial support for the eMMC on the BeagleV Ahead
board. This allows the kernel to boot with the root fs on eMMC.

I tested [1] on top of v6.5-rc3 along with the prerequisite series [2]
that adds the BeagleV Ahead dts file.

I am submitting this as an RFC for other people that want to boot
mainline Liunx from the eMMC. There several issues that need to be
addressed in order to claim that MMC fully supported on TH1520:

  - Only the MMC controller connected to the eMMC is enabled. I did
    not attempt to configure or use the microSD card slot.

  - The new th1520 compatible in the sdhci-of-dwcmshc driver turns off
    DMA and just uses the inefficient PIO mode, because I did not yet
    get into the correct configuration for DMA support.

  - The new th1520 compatible in sdhci-of-dwcmshc turns the reset op
    into a no-op. The vendor boot loader [3] fully configures the mmc
    controller and the phy. The kernel does not yet know how to do that
    so it avoids doing a reset. This is essentially a hack and not the
    correct way to handle the situation.

Fortunately, Jisheng is the original author of sdhci-of-dwcmshc so I
am sure Jisheng will know many ways in which this can be improved.

NOTE: I combined schema, dts and driver patches into this one series for
the purposes discussing the RFC but that is probably not the correct
structure for a real patch series.

Thanks,
Drew

[1] https://gist.github.com/pdp7/23259595a7570f1f11086d286e16dfb6
[2] https://lore.kernel.org/linux-riscv/20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com/
[3] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-u-boot

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Drew Fustini (4):
      dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head TH1520 compatible
      riscv: dts: thead: Add TH1520 mmc controller and sdhci clock
      riscv: dts: thead: Enable BeagleV Ahead eMMC controller
      mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml           |  1 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 14 ++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 17 +++++++++
 drivers/mmc/host/sdhci-of-dwcmshc.c                | 42 ++++++++++++++++++++++
 4 files changed, 74 insertions(+)
---
base-commit: cb8c874afdc063290797ae1776a5d410fecb06cb
change-id: 20230724-th1520-emmc-73cde98805d6

Best regards,
-- 
Drew Fustini <dfustini@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
