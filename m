Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2CAD59D99
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 22:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/QNN/mmw4pMSkD9UNAAHpc5WhDU+vDM5ZtI2ZYTMlIs=; b=k1zgRzUByVlky9
	V05ZtbZQ52vf30P/nMucF9KR/LPAqfozdn8blKtk4x2UY1OGlerN+RAlq1J0lW+uzXzziz0cu9aFW
	g4ILIPGDR9jD93byr9gFJAcfHnynKBkPCL2GCuff/sMC5zeKZ47n8aZwmsY2A8VgR6+dlQQ7JtaMw
	ur9bFt94+mJUxaJtI8Mx4wtIvTAO90DtB1bd7TQDrUmmWuunVTdNzUCCuHOZ8EfbEZNvooQVL8ND0
	cer64iKtoSlJrRKDIARq8yKIBY+vIXqFputHToM8Fi4iL8k+BY4GmaZLHwD2NF38X6jKyZK/wXims
	Aq8BM7/sBd8hF3dwJW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUurs-00000002oD7-1syF;
	Sun, 14 Dec 2025 22:47:08 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUurq-00000002oCm-04qI
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 22:47:07 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-bfe88eeaa65so1917313a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 14:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752425; x=1766357225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQSX2LSFXSd0QzrN4pi98DPbRQ5Gqu2d9o2DvTxsgxI=;
        b=KeZpBpGgEDQwSyt2EaynEktSVHtxx87JeLXbU3GOTyK7DydRVWzaw/nqf+VF+huEJz
         DWIb7zV6BKowKhV0ZDkcvyu2sjYrRFQtDMjk+QIMwVwYdcYf/pdAnMK6TKw25MZVtQSD
         3dbTHvbjApCfoaDUaMhGiNH58q66SyRQKnTG8/ST6O79X4t3+AK7hzCjcauu2LhFWiks
         eRxfVvY5D8onHKK+gVsGN++UgrlDt6krw3fCLpZPtfKwlq1Cul0eYfo2QggWlMt70Stj
         RFGts3YAxJbroB38ibLWolfuMKHFWeZ4D4XDOFINuxae4tS/IpmMZHFYzt4pNngrSmPH
         dfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752425; x=1766357225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQSX2LSFXSd0QzrN4pi98DPbRQ5Gqu2d9o2DvTxsgxI=;
        b=Jb/Luqlws6rLVz5fWCfPOQIUUEmNRqquziBnzVcSyiEyjtZXC8jy+P9YVS+BJrmQub
         95H9lXfFEycj/Dzxn25mJmxMbxGSWuESvju6wYIRo0G16qWY3DHu2yb4d3hBCsA0jLAN
         ZAld0C4a3woSoHxUlBZV8QV1mSH9PPpAo4MCk4yraPUgZsmxG/Qkd0eY2I63GnVL8EyE
         CamQcnKyekDf8hLSJSInkb39dNnuHUEgGF1XFpqyvD1E5YhR43B//kcHJ95LFLm2C1jJ
         1Da7+zRpkGJzHaKWtXbFfrhlDLsl7SqEcxeXKNAqna7sMAYZRQQPkPcrEI1l6OC9evlR
         X4dg==
X-Forwarded-Encrypted: i=1; AJvYcCUuLs6xVs25uvPXSOjpcLVCHnViKokD8FRzo5G/TKfTAE6eMroxMAWo2UQG9HhrMKnTx8mr/tmgbBJvhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YysJHz0Q4iUvQlD31tS+pE30Fc9Uj6n+OAHhg2XXEe8B2DgxkdZ
	IGZz1pK6ztD3wCUnMSvhJJXCQ7bCgjX8XelrEUD/Pty0IDzi6W8XbpE5EMC/PQ==
X-Gm-Gg: AY/fxX7qshYNxqBN9kDCln0gtDIUCdqILMayLg6vySJE2d+4JfN0qGplNVVzog1pXrS
	P7RXsf55J2kI153s798zg1AiNPIpBd4XKk8NFJRY9GKw0/rA7pbPn7iJy5hTMdVQt/7iKxMvaeN
	Yxef5zYk2107jbGMpmRq2G8qTwqw7PwTMJrxJ3h3ZlcFmzzxqXIM3J40OWgBPdkMqloFUD1rH6F
	Y72ib5Ssab6wPnCAW7teIbJTviCuJ2HWjpjG+XqZdgTZ65p5wYwIQQ/NjTRibnlE7Qq5946Cz39
	a6xZYrW6qPtS9a0J0rEaSd4mtKasdZLxgE1G5j8S3z6bEpw1e+nRUP0HUx9zGbwyG3isxFs2rGO
	/0VqqEbsqOTKSLqAc51J1cTtHV+wuUDssDbriD8AgZLNbZ5JufN9kc1BhQbaDfgMz2dGcQFdWXh
	G9axDpEn+jOw==
X-Google-Smtp-Source: AGHT+IHjCMwEMhrIndkSHywWXlymB1MdGXVU8RHAOoQgNJtfIdi9BRjQB3e8/tXrqTx2dBHPGX3TJA==
X-Received: by 2002:a05:7301:f10:b0:2a4:7b65:1a16 with SMTP id 5a478bee46e88-2ac300fd6cbmr6728297eec.25.1765752424562;
        Sun, 14 Dec 2025 14:47:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac190d3d14sm25081258eec.2.2025.12.14.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:04 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Mon, 15 Dec 2025 06:45:57 +0800
Message-ID: <20251214224601.598358-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_144706_150927_18B50595 
X-CRM114-Status: UNSURE (   9.38  )
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

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary.

Change from v1:
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

Inochi Amaoto (3):
  dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
  dmaengine: dw-axi-dmac: Add support for CV1800B DMA
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 4 files changed, 25 insertions(+), 5 deletions(-)

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
