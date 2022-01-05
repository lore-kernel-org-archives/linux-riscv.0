Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7B8C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 05:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1p/JJr3Asss222cHFkJ1g9YKfoCS5Ltg5W3yLRwNSY=; b=jJ7n2TaJsZE6wC
	zEFi2BlynBwHFymoSRRbsYHbpjs8+jLcI5RbbpX01P2hNqd0WjH6yY+XyHHvY5L2Vi3qRqCaghUqe
	8RJ7oBB2JnSDGv9QzDf8syHBRKjekGd/4eXP3jZL4+Jt5N4ahD2a3VtqOOexPMG5vkFUfzNy8QBKa
	O4S4SvPXrZfDEC95MFzVPeSWD6/K+8XpCfTLwpwC+tI7aegkhMDyzjsGxYwTZbQdZM86P1rcHDvm5
	+9Zy4/UqMa/0cabL/w0ObEEHiOdjixEgpC2PwSQDKNHhfL/Z9PEjW1qfslYpHyLVFLsvdoDPLgIvZ
	4VsaqEQGGk2a524QfdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4z5n-00Db1O-7g; Wed, 05 Jan 2022 05:44:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4z5k-00Db0u-M7
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 05:44:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id n16so28615959plc.2
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jan 2022 21:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9aN3MVYr/eRiJOMan2AXOKnS6rXengbNHdl8ukrLg8Q=;
 b=Lkmpsut52RVgiDO8dUHEr7vqhZTGrLl6xV2Kkv7ydfmDDuVZcySNeXmHyiUzMPRg/K
 om0x1PQNLhIQLAkS4r9I1OK/ihf1Nwng7WiHpe1BG4+AOgiavbr3GuL8Lcga04t8mVsh
 vzYODZ6exNtL0M/Jh8gcS6fJXULUPyaoue3UXBFUnVqOmari00YpM+vebHiFQcjJjqcL
 +yss+yyQuBKzYUKqRARcxyjFqkTZRpThrEfsxtDZMy4T029JfYtq5hNUgGOH2e/LjOfl
 2J6+sIkzsJe6aCfWeIhPR34Ndl7daqgjmrTBb/fNXpwnqcPGBQmSaGQgnIpOfmFic91O
 eGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9aN3MVYr/eRiJOMan2AXOKnS6rXengbNHdl8ukrLg8Q=;
 b=pNO4C5e0uQvhyJW7LKm1VbWrPlxgj+4A4ls6VyqxHMteokaTcsa94C3Xnqq7wJKlbw
 3WnCEkryqPFbXX/yBOc+sotKNi2cpT2YFzcCydzvRqifYjZ1YoIQbA5WEJnjuMYVSZtZ
 JIwDCDbZx4EVfx/tq+x97pML0Zm5VoOLa3EwC02iMKgxD8Jna7OeNEmZPigxQkLjcagX
 8IUYgTgVxtd2WKY6Hw6Ou5uxhatakTUwvL9N6/qeHEu2/1e/BAWHdTiwcVwoFdlwJrKQ
 x7Hvp0E9uAeSXVwiNIff5F64ixKHkSdpeBTu8JgFmDVsQynTy/nl98EqmqbbkVUeZPWD
 3qCw==
X-Gm-Message-State: AOAM530JXl16sKspyXeeDvnchwNwul/vLaGyB0JiB5b0/ZsF1hjDRN8k
 klifRuYrryGSPVC+sZHILa9b3x3CshkLMg==
X-Google-Smtp-Source: ABdhPJyjR5gEVjMyzPzdgCGtXpRNBEO5AKvueTEAzhFJ/eTPOk/TKJ8NA7Vd+aNVHglmeCevkEdWUA==
X-Received: by 2002:a17:90a:2f06:: with SMTP id
 s6mr2229426pjd.230.1641361447984; 
 Tue, 04 Jan 2022 21:44:07 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cu18sm1000574pjb.53.2022.01.04.21.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 21:44:07 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/3] Determine number of DMA channels by 'dma-channels'
 property
Date: Wed,  5 Jan 2022 13:43:57 +0800
Message-ID: <cover.1641289490.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_214408_798018_649F25D8 
X-CRM114-Status: UNSURE (   7.30  )
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
Message-ID: <20220105054357.s0r_DI2uvbFXlGMlOfFp6daHVI30g4PliX5j-ukuSXU@z>

The PDMA driver currently assumes there are four channels by default, it
might cause the error if there is actually less than four channels.
Change that by getting number of channel dynamically from device tree.

This patch set contains the dts and dt-bindings change.

Zong Li (3):
  riscv: dts: Add dma-channels property in dma node
  dt-bindings: Add dma-channels for pdma device node
  dmaengine: sf-pdma: Get number of channel by device tree

 .../bindings/dma/sifive,fu540-c000-pdma.yaml      |  6 ++++++
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi |  1 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi        |  1 +
 drivers/dma/sf-pdma/sf-pdma.c                     | 15 +++++++++------
 drivers/dma/sf-pdma/sf-pdma.h                     |  8 ++------
 5 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
