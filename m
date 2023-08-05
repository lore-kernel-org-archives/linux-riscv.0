Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44CFC00528
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 03:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=htlCkwr8sszAB5AcMDhiMrRxnk7oH5AZvFS9O6KGOSc=; b=gPeM/hr7n/XlJ3
	3QKI+LOWCiHqSjX6AsSgg0gk8jHbJ8m1eUubE1B+FdklOyiEjEgCDZtr3aBS9/FrAlMNxf6dLcfbb
	WaDu3pUzZe+g5mpotrku8ddrad9ZYkggK/vaeRXMUKt7DnElsIjM4P6yY+RkunyqKSPPV+xyFMCrS
	/ktxXhVLqqlfGPmVfKLjQdZbeNc5jkGiqFiuMRSxhw9vejwCtOpECUMFw5K3KEiyYvdhEDxoqMhtQ
	LQFfDc9VZJYGYPAuZQU82V6Y00qOYbrGAIvs5x3RNLD6pqsSwjYZYd6IQIVl1HjgS7Jbeev+QuRXx
	dDWT3pt8Elir5AaGdBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7l9-00DcG4-0n;
	Sat, 05 Aug 2023 03:15:19 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7l5-00DcEn-1c
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 03:15:18 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3a78a29bca3so40917b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 20:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691205313; x=1691810113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wY6Qt1tAikNugWjQbI8lPvA/5LjhxOjzsVL1TcMtfGQ=;
        b=VUDPufE0qnsNjRNmMFNmGkO/KZ1iM8USBm7tTVJUN+t2lBBLWjhTpcSIc4zRrrmhK2
         +g+0dMsvRVZWdSIspTynGRO84gAMGxdVTb3wac+Iv+ahtByPo6CtpdYmw7zo7cxW1fLC
         bIkRLEK0u+kyfQbcLdou3zsN9VbBP74f9Z+c9yIE3/wR2Lh4qdNyyA3u1zHWLSPeMeqE
         WqPNBCoXhP0VsdvdGhMKQKANf52T2tQMZNeZDJPAs7Ni0CJ9oZDXQzOMslpn0bHn6mlw
         RA/w78OksTGfh0EO5YG6HhP7xsLQWEPOjKhrJmd8v8D4FMRnN+A6/0gg8lnCZdUA9d5l
         Yu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691205313; x=1691810113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY6Qt1tAikNugWjQbI8lPvA/5LjhxOjzsVL1TcMtfGQ=;
        b=fq5FCJPG3LTPN2xeC9NeGL1lydqWt0VaPlsSUXJ/osQBvG2+korYnkTIgvLqQWKjkT
         ukz8v6k5mSFGQ1x7K6rGTj+nsht5ZSmPDmz59/J2lHIzYqnAcRB6GfXnxhEAoqrduUhW
         +VYtGpNGU+YZ7efnTkSf1k9VhEBNH9P3BnVHhrgM83HLfYupuKRaBKLzx2AXSFfzV/1v
         BGVLU+1ZsNpkrP7HX/69vs3fCydBhEr/ei2dpcwXUnk1qJmBAUQtDOE95v1rYDLkZSau
         dP7e3zY9D0FfGDaBRwcStfKjgYUu3RGiyfsIK0K8BJAYS2k2PbBB2tAbsigvE1M5FUmh
         fq0A==
X-Gm-Message-State: AOJu0YzhFedtE7HDu4F7VnvvTgBxoDlIowingfJ2PDKP2Uru5LrTTFt7
	TDUva2vqDKy6sI5lQCH+8vejXA==
X-Google-Smtp-Source: AGHT+IHL8VoBkjiy6ix6rUaziMQ7E0AbDt4CLGJy+4lZeUtAQqUNnPPxmUVzSmsimNjPpF87HkxP8w==
X-Received: by 2002:a05:6358:70e:b0:135:99fa:a118 with SMTP id e14-20020a056358070e00b0013599faa118mr3869509rwj.4.1691205313617;
        Fri, 04 Aug 2023 20:15:13 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:e1a0:2f9c:e6f9:e66c])
        by smtp.gmail.com with ESMTPSA id h17-20020a170902f55100b001b864add154sm2412145plf.154.2023.08.04.20.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 20:15:13 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH RFC v2 0/4] RISC-V: Add basic eMMC support for BeagleV
 Ahead
Date: Fri, 04 Aug 2023 20:14:44 -0700
Message-Id: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKS+zWQC/22Oyw6CMBBFf4XM2iGltYCuTEz8ALeGRR+jbWLBt
 IRICP9uYe3yvnLuAomipwTnYoFIk09+6LPghwKMU/2L0NusgTMuWMOPOLpKcoYUgsFGGEuntmX
 S1pAXWiVCHVVv3LYJKo0UsS4lRiO2wifS03933APutyt02XQ+jUOc9wtTtUd/aVOFDI1RleZSC
 Kv4Rav57XWk0gwBunVdfzwVCL/PAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691205312; l=3402;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=MDLsxhc5w3dyfm/SSn/2wE/4REaaADp4oj0jvET2NTw=;
 b=438X54c0dRVAnrP9QJgUt1TUf9yWkmyAhDMglNZx0q12/H3btZjjYx6J4ca3FyvqtD4jty8/G
 qOq286cmPc9Ct35GAf2WWHC4bLrczRXFAAUC0G8dwY5Rljr2Qrw19yN
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_201515_723368_BA616A34 
X-CRM114-Status: GOOD (  20.25  )
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

I tested [1] on top of v6.5-rc3 with this config [2] along with the
prerequisite series [3] that adds the BeagleV Ahead dts file.

I am submitting this as an RFC for other people that want to test
booting from the eMMC with mainline. There are several issues that need
to be resolved before this code can progress beyond an RFC:

  - Only the MMC controller connected to the eMMC is enabled. I did
    not yet attempt to configure or use the microSD card slot.

  - The thead,th1520-dwcmshc compatible sets quirks which disable DMA
    and forces the use of inefficient PIO mode. I need to determine the
    correct configuration for the SDMA and ADMA modes.

  - th1520-specific code is needed in dwcmshc_set_uhs_signaling() for
    MMC_TIMING_MMC_HS400. I have not figured out add proper way to make
    that code conditional so that it only runs on th1520. One method
    could be to add a th1520 flag to dwcmshc_priv but that seems like a
    hack. Alternatively, set_uhs_signaling in sdhci_dwcmshc_th1520_ops
    could point to a th1520-specific function, but that new function
    would have to duplicate all the code in the current
    dwcmshc_set_uhs_signaling().

NOTE: I combined schema, dts and driver patches into this one series to
simplify review and testing of this RFC.

References:
[1] https://gist.github.com/pdp7/09995be1e30df0a04b9b9cd31420f9d5
[2] https://gist.github.com/pdp7/e4585311eb2cd27df7b50c87babc15fd
[3] https://lore.kernel.org/linux-riscv/20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com/

Changes in v2:
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

v1 series:
https://lore.kernel.org/r/20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Drew Fustini (4):
      dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head TH1520 support
      riscv: dts: thead: Add TH1520 mmc controller and sdhci clock
      riscv: dts: thead: Enable BeagleV Ahead eMMC controller
      mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml           |   9 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  17 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  17 ++
 drivers/mmc/host/sdhci-of-dwcmshc.c                | 336 +++++++++++++++++++++
 4 files changed, 379 insertions(+)
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
