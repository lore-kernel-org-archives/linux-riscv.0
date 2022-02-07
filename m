Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E6AC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UU+9u/nPOQe2ShlZc0wQAzEURhFxRNSEQAwo4Rmf9dQ=; b=RVhBQTEHojNwE1
	NJZxLXT72fowgmmImTW5t/84ehBvqkPT2MHtDCBrQqExpLkT7lZVVN7Vr0CUm199TpgbFLUY8vh69
	oWwvDdFJ+tXU8T7fwW1bp5CWKskVJDNgBpmadvpeyW+mNOI+9OIG2yw/Nd0yM1nVZ3z/pKTkWzvHQ
	GCRI2zKNDvKSM1W9Q3CBiVkly4tyu7ol3EmYS3beXBBJdAIdG5tGyZws89WyXACgNHeOPX0RuWt9f
	5EFckWizteFrzGhN2OwnH0fj063jY1W1Yhzlm7L2mRNPfjwSeTP6aazn9IAY4jvIzA1G2L0hRbRKY
	WfKv8yBodaAEeuVoeJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGxYC-0098W2-Vw; Mon, 07 Feb 2022 06:31:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxY0-0098Rf-97
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 06:30:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id a8so11305534pfa.6
 for <linux-riscv@lists.infradead.org>; Sun, 06 Feb 2022 22:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLX5yScMxlQJ0sOssQwN5Kzrzlw7vwEez/KPc90XX1c=;
 b=mZGtqaYZUVCLH900LgcbwP8iVBRBagHqD2CsiTQ3hHkie78V59FfMQGeXnUnGetJvI
 DcB9FvVD9uzjdIYzDItXH+R1ixXa96wYWEIko9b1jHCIPaHmmQ2Z7B44q59+ZLK8TRwx
 10/0F8jPtCKl3fxbuBofFcQnArPFnhU8VEEvvf86n5NJEVzo/4UCcxvTgCm+/3G3b6P5
 KdmRpg8tq3/+ftH0CmD6hkZXgXbzcAkgdP7+jwie3u7YoIh00JFiEle504RX1Sj6Fmbu
 TcpOU10k5dUOIkDEJGkUyP0gHZNxn09YtyT5ZJgq/+pBL9MRTz48Q+vKM83t0KkxLxZD
 G/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLX5yScMxlQJ0sOssQwN5Kzrzlw7vwEez/KPc90XX1c=;
 b=OPet0dnJk/zrIjXRWYWMrrOJ7r6MgL+uqhXTY7lg3FF9sz+QRfpgHPAmogjAvaPg3E
 4kUoyzToFIWHmLaIljLc2KeJ0agGMCkusdmpENiLHiz5g8zYRS/HhnPbG3bE9ub8qr8c
 LiHbZ7KH6xpQR9+B7iyTLSInWsezboX1R4IgZKoscE7c+N4Nlt9GXKQpotQfh1dUZPMT
 xEAWdrfz679M2Hazkn6uQienA8vaywZmCmuzg5eljXk5nWqcKobk6e9BYBmwG5q1xW1d
 8JXfpxGUfrRPbexuIUL56XQvxCMUSdHCsdw5dy9sbb210nwyF6qOmX2dh/79gGg5xxP/
 /mFw==
X-Gm-Message-State: AOAM530+1RDojQbxMXbA3Av42u+UcD+RF9hVfYAHHgjr/C9FhDkv4iFF
 N53FKFwf7QP7hEzTFaMZyKhWkg==
X-Google-Smtp-Source: ABdhPJzLXi5WEZyX6LDirKnfSvr2IIhEFCVIHrTUFoTtuYM6ocZtuM8KhHrWJ6491MLFe71KsCULsw==
X-Received: by 2002:a05:6a00:1789:: with SMTP id
 s9mr14302978pfg.71.1644215447332; 
 Sun, 06 Feb 2022 22:30:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id i10sm5266634pjd.2.2022.02.06.22.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 22:30:46 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 0/3] Determine the number of DMA channels by 'dma-channels'
 property
Date: Mon,  7 Feb 2022 14:30:37 +0800
Message-Id: <cover.1644215230.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_223048_408216_2AE8659C 
X-CRM114-Status: UNSURE (   8.91  )
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

The PDMA driver currently assumes there are four channels by default, it
might cause the error if there is actually less than four channels.
Change that by getting number of channel dynamically from device tree.
For backwards-compatible, it uses the default value (i.e. 4) when there
is no 'dma-channels' information in dts.

This patch set contains the dts and dt-bindings change.

Changed in v5:
 - Rebase on tag v5.17-rc3
 - Fix typo in dt-bindings and commit message
 - Add PDMA versioning scheme for compatible

Changed in v4:
 - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>

Changed in v3:
 - Fix allocating wrong size
 - Return error if 'dma-channels' is larger than maximum

Changed in v2:
 - Rebase on tag v5.16
 - Use 4 as default value of dma-channels

Zong Li (3):
  dt-bindings: Add dma-channels property and modify compatible
  riscv: dts: Add dma-channels property and modify compatible
  dmaengine: sf-pdma: Get number of channel by device tree

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  3 ++-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  3 ++-
 drivers/dma/sf-pdma/sf-pdma.c                 | 21 ++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
 5 files changed, 37 insertions(+), 17 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
