Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CA3EA4E0A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0rPu94oGhQyU6dTRFq4fi1nAg8WMRf00A09vEXA4Eig=; b=rUQbS3101g5ofU
	2nKAqFtpGmh4V7KZq/zz191arFuAaPD4Qn8/mzbz+95MSS4qYAV5pW5i/KnWNfh1DlLGsw0trdHQD
	jtxluQqclrmob3CiAhiCbeOHiB7ssrVxBgxx2X6bi0OXMntY/t1cg+FX4DTipmzgY90iN5Kc+EWS6
	JXqSjtxak3xydVoY5BqRnlxY6J+KCdn9MV1CT3LCGTCMj8Hm0/pnlQhcpSqQJYKs8YmRysc3TU60V
	TIpSYcIGHTHCG8jaqNIXiaeQC7clcpdyu7XOGddFLxN6gMjS8/WSLvTv76e/MGnq/jxnnIo9mb4u1
	ovLB1h6DGiVJyWLYb+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y0-0000000DJza-3zi2;
	Mon, 02 Mar 2026 15:13:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4xy-0000000DJyt-2jEQ
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:13:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4833115090dso47403095e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464428; x=1773069228; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bjNDBX+/PFOXtqF8zgz+Y2Tzpl7yAa/Q3C6j5YXCMg=;
        b=NQdmhtr+YKCFyeE0eqQs2t0HknxWmvoTL+2p/rft7wVtaghfMjKobiXMw8oCn40qJn
         9d4f9jnz80iJqx3zesO7M3677fOHVoR4rszXWl4wk2GvVEqqqzcL5B01gx9rXSb3lzvE
         HKthtLcf/UE2S9cQrgjrIvg3MKxj1AC57OGihmSGyp1GSGUg0qKDrmjp3+gTLd/zLB+J
         Z2dKF881LVUdMDQL3zvVtN7mKpdJjNvAwgxF5KVuXqKd8FEyh4MLoddEsk584uuDjRpF
         tIPX7XVNzq/b6v8c85VMcm3Nkqhhsj1UnmjRXVYmDuFJPCURxQLiLY6L0WGC5kdMrZ0W
         pECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464428; x=1773069228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bjNDBX+/PFOXtqF8zgz+Y2Tzpl7yAa/Q3C6j5YXCMg=;
        b=uOjrCdMFFg+0gBNIHW1dqVInFZJAEPxpPF5QY81ov2KbqX0e8lOhCBB74oDe7yLTQH
         K+9f36wPE9nswo8ygDKjm30UaL6whZYTnv7CjRFje9NbJtWCpZIpCkyZzwsy375ijCWn
         mN9AQm+bQ8xC0q4CCCHKa9VodS64PckI2VfQYgxHcjbaEQE/OGGQQDAVFu/F8Ar1XlKu
         eJdg2BKJjp36B2HBoawUPm2J4f1ea8XIE1P2vp6kpbRBS/KiAvxwXy10se+BE0rKZg/k
         1pcmA3emm9UFbDIjz8IroyYXq/z7Mo1Lk7RjepOY62bg55zbwXI0wYG97G6dJP4bi2/H
         MmRg==
X-Forwarded-Encrypted: i=1; AJvYcCUoFwxN6gGhsFSjtGg2y+XcicKc5DLmcKtSKQYZkjqvUEqs0rznYWTlBC9rHGD/6QAHmNKLkGNxXdJWJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX7cNDcP/npoN7ID3CmD7Be+S1HCZMXkbVdVlZXVxlQtk+7YhQ
	gbpLv0g/Aq/RNAiBjfWRDX3HJ1wLe0IF3WHj9b8r6pS6FUBqU8r2dkCM
X-Gm-Gg: ATEYQzyBmHz6rUnfF5U1nUb3pdvWvTW636LHzLk99H8Xn49NJrdqBlats2i3uM4FnSi
	Tjh9/TRb9aTXFC7CsjgExv9s0L4TIueWr8CDchvD+SEEtYjoUqY61fh9lmqd6j9GXJXErNlrw0H
	qL0V1J9//fgghS7ITj9BFZJYBOYLVnDfRZByJ4UaethSwYiI1npYr0Z0DrqfkpTVw5OzHdmxSQd
	xrX0XrG5ALqcgIhLU7ePiq+n2NOPNFm5EFf0caxEDfYITUEg+qyFimkDXSu3l4O2oL9WOvZ7nEl
	6vziiJq+HxX7F1CdzSPSDejhdIwk7/NtIWa3B6GAuXQt+isCTNs2HFXRI4Aq29fIvr/bA0JnSpH
	1CopRHlEPYbh6aiJd2h5TMf7Itul3ZvmPfg+Dgrn94a8P9Lft+4V1XP+NPjSTeo3DzfgvjrWC53
	p8VLYR3VG0JgbxobPOLM/8BbK8f0pMY/T+3ynn/FZL8rzNweYimrcpxngHEnNjKbbaFQ==
X-Received: by 2002:a05:600c:3486:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-483c9bed9e2mr214730135e9.21.1772464428106;
        Mon, 02 Mar 2026 07:13:48 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:47 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH 00/10] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 02 Mar 2026 16:13:21 +0100
Message-Id: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQ5AQAwAvyI9a1IrBF8Rh7Vb9IK0IRLxd8txJ
 pm5wViFDbrsBuVTTLY1QZFnEBa/zowSE4MjV5NzNW762V3QIgavEY/FkDiMVDVlO1KAlO7Kk1z
 /th+e5wV2nN/1ZgAAAA==
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071350_711325_32BD89B3 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
Iker Pedrosa (10):
      dt-bindings: mmc: spacemit,sdhci: add AIB voltage switching registers
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator framework support
      mmc: sdhci-of-k1: add pinctrl state switching for voltage changes
      mmc: sdhci-of-k1: add AIB register support for voltage switching
      mmc: sdhci-of-k1: add SDR tuning infrastructure
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  69 +++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 +
 drivers/mmc/host/sdhci-of-k1.c                     | 320 +++++++++++++++++++++
 5 files changed, 457 insertions(+)
---
base-commit: 5f499bb7a07fcdcf8877acaa8f413a5dc1fcfacc
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
