Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E3BC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4IsHoNYZSnsISUAQviY1I35lFa0mLXEaMm2ZO+p6pNY=; b=30dnp5YA8rZpCU
	tOBe4ddlWFYB1Hx8rSOFDUmxVa5nC1mEWSbOBCLGuf3hZJ1Ou/8nAnleBGgyFvquNO16DZNS/0/ai
	X0MgsKzins9kMpyrbizch6LsArK2CbEAgVm03055psCOitMqjHSoYOmlqvMyiiqV1HF6wVpDHU6vF
	uo2Ng73inRnOPuvYeBGZvzsBMaHiuQ/snbz5+3mEn2aFH54hkKwEH5QyQLgh+RwY7Dw0Y4M3POuSF
	ugNqKsK9bRudiXRIwU2XzFl3xFw7+pHgTXr+O1N6p6KhpI6VyR/6NBeWouTc+/SDvmXRAdwe4Ukt0
	bxTKrNwCn/RVAB54nz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5n-0000000AZFB-0udg;
	Wed, 11 Jun 2025 16:14:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL2n-00000009tnC-23e7
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 12:59:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2363616a1a6so18935115ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646744; x=1750251544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4QOx+b/QncvHLv/sLMwOKnuymoyk68+Yx3qOBYw2f8=;
        b=u4+nKLE2OH7knCRbrh3cWlNCZ3sdw5HgRWYqhb61BsHceZbN4MHXZl9tEiw8OInphv
         P1Limrj0N9SUkm+iUISLlaKHxYk/okir143jVE0ANV3jamgtoqv7bN4SmXL6cFnlinzu
         k0Cw1VSdx+1yLdNzokxq9Nj8JNpLzGMKgkuAvfuZFfcG62tbpVhSz1BLv310jMfqsETz
         1yZmO2IoTiGd7MZAwCJIb+kuPrfLUb57A9PGNp5EbcblzWB2g/l3lA2lztKpiPrM0m5S
         OQ7RgN9rpdLJ+0/WSGkOCAccIRBIbJApwHAgFFWfvWKPppI8B4hoaX1WcZKAiwihvoIM
         fqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646744; x=1750251544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4QOx+b/QncvHLv/sLMwOKnuymoyk68+Yx3qOBYw2f8=;
        b=pC+j1oj6EDoZ9KZuBBaoRsL3Cw09Xe1ZlypfNeMGhjwF+gGFzRzm/pgKewK8Feq/vK
         pE+pU/p7B/7e/XwuPzl/u6We6QKfH7ocV2BC+cwcuhaduN504v4KYJu19JH5D79LdgC9
         ii1inES1XRbFRO4Jvc8RJB/QgA2+v36KYFbncp96dFlCZMawDoZF2FdgKoFjqc2aNJvf
         C/6y/n6/mDrraQy8JCSvbIO8GMJXpGtoGEQgA8CEa5MmeF91/CShi8qpVIYf9LccT0L7
         o657xa4eiv+KKndDs8SVxH/XX54+UBddHqzzRlvA5tXygiu3pUECxb7ycqPklNC2t88+
         oK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp6y9g1nyCRafajw6lMv1nygAzIWG6nKz0OZcRsfo6Q5ox9ujLC3hRT0FDJiORPHlXpue5LoBty74q0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY6B9qBFp3pQzdGzqUrk9d06MFnukMwManIqIkYsQVb9hISx7U
	CobkQbQJDbaT7K8dYQGQfQ+UTcXKpkSlG/81PHto+fmhU829LBLjD5aosKh7weLF1BI=
X-Gm-Gg: ASbGncsQm3VomUrOsYTCNO1NqqWYHN3FxhGj/oENXKz1Q/5txjLFE0NetqQJ8qcBN6u
	WM5A+TV7g9ZlXKX2BepsfH/o3CJEuCBgfkqmcXACnii4giyV4fMjIvd8PjaHDX/y2Eq8z+DM9xt
	qsM9cJrALBmyBJF9zitMXAC5Mx/SMU+mVwDCp9zaD4xghrZwrMnczHAbr3L5VX5u83reohyTPWp
	vqGedJkQKE21fD5SsRWnzAJUkgrHClNXULRFFOxxtZQTALNYwp0VoTbLOtXnvolBy6nF5WJVZOy
	uhHfMTFtSmHxUq6Focvj5o1THvg4JgAWqkJHOKgc+3gJVkLihjSQqQcADHQrJ6Z3tqkhGXTqe9f
	U33Wqny9hrdYE44ARSovyBQ==
X-Google-Smtp-Source: AGHT+IHeeQKbfAGNGeX62nkTUoAIUb+/0YEOPG1s+np4s8lIc4gcrO2OCn3QlplFdVVleQo4sYhIgw==
X-Received: by 2002:a17:902:e74b:b0:234:f182:a759 with SMTP id d9443c01a7336-23641af07efmr51079475ad.28.1749646744203;
        Wed, 11 Jun 2025 05:59:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:03 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/8] dma: mmp_pdma: Add SpacemiT K1 SoC support with 64-bit addressing
Date: Wed, 11 Jun 2025 20:57:15 +0800
Message-ID: <20250611125723.181711-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055905_611010_3C3DAF75 
X-CRM114-Status: UNSURE (   9.27  )
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

This series extends the existing MMP PDMA driver to support SpacemiT PDMA
controllers with 64-bit addressing capabilities, as used in the K1 SoC.

The SpacemiT K1 SoC contains a PDMA controller that is largely compatible
with the existing Marvell MMP PDMA, but adds support for 64-bit physical
addressing through Long Physical Address Extension (LPAE) mode. This
requires programming additional high address registers (DDADRH, DSADRH,
DTADRH) and enabling the DCSR_LPAEEN control bit.

The implementation maintains full backward compatibility with existing
32-bit Marvell platforms while adding the necessary infrastructure for
64-bit address handling through a flexible configuration-based approach.

Key features added:
- 64-bit DMA address support via LPAE mode
- Platform-specific operation abstractions (mmp_pdma_ops)
- Optional clock and reset controller support for modern SoCs
- Device tree integration for SpacemiT K1 SoC and Banana Pi F3 board

Testing:
This patchset has been tested on SpacemiT K1-based Banana Pi F3 hardware
to ensure the PDMA controller operates correctly with 64-bit addressing.
Existing functionality on 32-bit platforms remains unchanged.

This patchset is based on [spacemit/for-next]
  base: https://github.com/spacemit-com/linux for-next
Plus the reset controller driver, posted by Alex Elder (v10):
https://lore.kernel.org/all/20250513215345.3631593-1-elder@riscstar.com/

Guodong Xu (8):
  dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
  dma: mmp_pdma: Add optional clock support
  dma: mmp_pdma: Add optional reset controller support
  dma: mmp_pdma: Add SpacemiT PDMA support with 64-bit addressing
  riscv: dts: spacemit: Add dma bus and PDMA node for K1 SoC
  riscv: dts: spacemit: Enable PDMA0 controller on Banana Pi F3
  dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
  riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../bindings/dma/marvell,mmp-dma.yaml         |  17 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 234 ++++++++--------
 arch/riscv/configs/defconfig                  |   3 +-
 drivers/dma/Kconfig                           |   2 +-
 drivers/dma/mmp_pdma.c                        | 249 +++++++++++++++---
 6 files changed, 370 insertions(+), 139 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
