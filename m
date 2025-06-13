Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CB9C7114C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 01:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t8J0K2E7oBtZMBaNKZUm/vX8m6WSLLO0ot8HNn7lxko=; b=zsaISmwO2EZQEB
	Vco/rpqiaC92G6OPSXQ25DqeTnOG/okB4XH78IVuZUi60zIJnL5A304w0IhhqdZE4UG35tBKWFL3x
	JNG6MXcB71TRXiOUjQP3IpWQDErlcj62bsb5Mbi93pIFy43GIBWNKdPnFCVSCIzWYoqkCPfPdO+NI
	Z3YMVuxA3/yb4agq9D1+pY8vReZgYKUyETjxgWkfctl3P4PAD9FPelNzuF7Z8doCffRKFpddNrTY2
	+ptD0RDQ+yr0XzsdSjH4kXOPQtTJ8v5wuH64PZlUfpfKXDkk/q+j3UUjAFuNDqiq2W4f1nqvYPqBO
	8x7sZP3sQBm6KXGepiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxQ-0000000F1a8-3W1V;
	Fri, 13 Jun 2025 01:11:48 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxN-0000000F1Y0-2DrF
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 01:11:47 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-60634f82c77so476122eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777104; x=1750381904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLjk8AtIe7EkG0gXs3iZYCpvTmGpW65yPt2cGZeyPVs=;
        b=ucHT+WVA3QQZA2IbfOCOZb/zSzIHBjISankwcRNe7/lHpYqncDDCXK8hFqUDLX67Tu
         v1+S9M9esNLnHebVv+8cExgzJOXGGy/QMiwgWAjQ34tiENAqiKqNi4i+9ZsAJ9TyTO1x
         k/kVkifRnrdOV7ddg/JRrrMP8cV9Fi+yF/jKgic52khHrx1Sen5GlNbaOECVYoehSmt/
         D4Iqw0moKY1eLprg96OKOjgT54CIjulykTdqKa7pLYD5+G1BPFadMWtfLgNecb61ooQX
         bmqkKOqe+yS7Rom7DtjnklyL0QCIddWOVXdEnQPLEDrF2UQPhYkVfA4QJQeIjJPVNivT
         0XRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777104; x=1750381904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLjk8AtIe7EkG0gXs3iZYCpvTmGpW65yPt2cGZeyPVs=;
        b=YuWO+pf8f4Dp773TNFipyR/uQ3ChZx6WkG36n3fh1aPCR7kPD+sFoWjMGjJ+tFs1mC
         ca9RVadPGONDdEx0iydEksKJ7RI2F7052bZWiwnjVWfPLuO1LzzupFIPqegIssHR96Y+
         wZGZU1r/jNvdBnH9NgVaNkBA6XSe4YwghtWJInP2GvIKJyqwizCEso607r4xcWl4Zplj
         s3UZvqCkZBbKE/zyYJ+Rszjp/7lfOSB6wCbvSyMRVuihzvoe9rtYRVYOF29NANDKTXbH
         0A1F8SmEeu1JFHqQhgnLcVQW19VA+qLxLroeEUGpwqltwSWf9zbKF6gqnIOuusARLGBg
         wmkg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7+enRLBz/m4iIQDwioeOb7zZzXZLKzJznnbyplqxZp09rEDLH34SHdvvvyg7Ox7CO/mRr9dLrKmMzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwdw6TwFCGBZqxgvduInwi1ThSqwSpV8GQbkGGq5h4M7pGwDbw
	lcgJHB0IV/6LUn/SWg+Hi9PsbvtbwP8JBK5NEbUjl4Hu7ZJw3oOkHHrlPWhNaP2Ki14=
X-Gm-Gg: ASbGnct7HEl4kMmh+8iuJ0nTMPtUSx/MCGzcqyJTf2JTxv2bbjXplBSmiK0/HvAC/xF
	UytcCsUu7LpsBx58cqaCxv1ps1Zp2lAi6a64oDP/e65R6jbMqKLvz6keYzmbO1pHJv7AUnpqkOj
	1q/44gDlauSTGXE+7CN11QIwtCZ/MUqJLRUQbV8zheIlNRsgWI33XRUCC0hNemPC77giKk/VvY+
	y5rlBwcSusvnQ42kcbzT5JLQO5OO/vH1V6A6fAHqKzLSqqt5lg8H8WuI9RL0P4EvklJA1gu8XY+
	rq2n1LS/AAC36FiSAsrLxK37txrRnLnfxdRHKlMAU5otJNybUzwyVjEPmp9ixye8uiWZ0NRfNtk
	cXTcVyDPlQAp9kZJhQw+PjRHZnSz/X8gdch1YSvm6KA==
X-Google-Smtp-Source: AGHT+IGuYA1UmF+qyhDFUECuEGO+2TaO/UuS30QC1CnU/pGEOag7zhyk90q5MH8bH5ojGbCRLTOPgQ==
X-Received: by 2002:a05:6870:ab09:b0:2e8:7505:638e with SMTP id 586e51a60fabf-2ead51cc4c8mr724652fac.39.1749777104481;
        Thu, 12 Jun 2025 18:11:44 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:43 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/6] reset: spacemit: add K1 reset support
Date: Thu, 12 Jun 2025 20:11:32 -0500
Message-ID: <20250613011139.1201702-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_181145_807462_C52BA3D1 
X-CRM114-Status: GOOD (  11.57  )
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

This series adds reset controller support for the SpacemiT K1 SoC.
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

In this version several "multi-bit" resets have been redefined as
individual ones.  For example, RESET_AUDIO had a mask that included
3 bits.  Now there are 3 separate resets (one for each bit):
RESET_AUDIO_SYS; RESET_AUDIO_MCU_CORE; and RESET_AUDIO_APMU.

The reset symbols affected (their previous names) are:
    RESET_USB3_0 ->
      RESET_USB30_AHB,  RESET_USB30_VCC, RESET_USB30_PHY 
    RESET_AUDIO ->
      RESET_AUDIO_SYS, RESET_AUDIO_MCU, RESET_AUDIO_APMU
    RESET_PCIE0 ->
      RESET_PCI0_DBI, RESET_PCI0_SLV, RESET_PCI0_MSTR, RESET_PCI0_GLB
    RESET_PCIE1 ->
      RESET_PCI1_DBI, RESET_PCI1_SLV, RESET_PCI1_MSTR, RESET_PCI1_GLB
    RESET_PCIE2 ->
      RESET_PCI2_DBI, RESET_PCI2_SLV, RESET_PCI2_MSTR, RESET_PCI2_GLB

No other code has changed since v10.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v11

					-Alex

Between version 10 and version 11:
  - Rebased onto Linux v6.16-rc1
  - Redefined several "multi-bit" resets as individual ones.

Here is version 10 of this series.
  https://lore.kernel.org/lkml/20250513215345.3631593-1-elder@riscstar.com/

All other history is available via that link, so I won't reproduce
it again here.

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 +++++++++
 9 files changed, 775 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
