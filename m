Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3742C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 01:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pm5thBdVrYqQEAHulMl69AglgmyCOsTEtZRPcfUqkVI=; b=rUUQ2oKMcPc7Rh
	hKk+WYVGxZUV2LL8IPVPv1k2y+68whCsflBgfIBCiIFXeiNqMQgaH+aLANFweaEujugcJGxO4rpET
	s8w9LlLJzwu5KvXHYwvugdfLHpOeVsyRGULWtWV0Trck9D01Q42A/7xubGuIT4H+4MYCdFmsmI42C
	c1jB4KvbeQt3ey7BkjVCvhmgXet5V6JGILzNNqyxJI056PAA7LJfwzrVk98AmzW5WE/xA3kam0tlj
	muScyZudMzS7V34nrHepDgbl7m9kAkPoh2ADWPmOmkYoHO1L7ucjz0VPS7CPny/bI50hSvNFOLdtI
	rootmj7PoLsk03txMIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Gvq-00DCL2-Li; Mon, 17 Jan 2022 01:35:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Gvn-00DCK3-NI
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 01:35:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id t32so9197095pgm.7
 for <linux-riscv@lists.infradead.org>; Sun, 16 Jan 2022 17:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5VfPZXhTB1Gitf1/abkH4dtjlhx6yCzyBbwzkYPtDE=;
 b=nuEGBewfX2D4CBsw5hzzXDBRybGp50VAcaPLK0Bqr/3r2gDlgyUhoDa01Y75lMtU4R
 ZsqZtEl/sbAcUqB9SJYhkfasbFUOOp6jKKaBBeKAEC4P1f6pataPMUxT76rMe6VnGxnE
 bxWI36FkiT/2N2I4+m/qFkrI3+iiAaY0rSbiG6Jp9qMbzoNCVRxeVNeGzh1iZxFnnKLa
 xXrj9gowNzNXtyIaGxcZlx0cz/zZM0r/4g5P1T8FcZDwusYWq3P64BtvYD7EvrOg7PEy
 1lMmj1YjI+E9v4/poeZIQqxDWdeoV0xpkV4rAZTGGF7PQ3wAFQkz0l4UDRJWSuMzrkb+
 hXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5VfPZXhTB1Gitf1/abkH4dtjlhx6yCzyBbwzkYPtDE=;
 b=i/zvCWttjJyLqTbTz8tLIx4QwDoiOMohfiP0wRkoxPUZtFlpVmlmIsDwgv1cZBwdLu
 NkmryMsxbdai3yBytgRzgl5kzsUWxAcu1Bco11p99EDE+XsIyNosFe+7858fAfGmplU/
 PeyhPnMlgQl+6RFODjP5m89lpuRzWcqGkv3rlcXb6vxgZf/SpEhMLwsHr0Bo/92Vs4iJ
 G9yaLBBSLhqIDfNPsHuKWH7HMeK2/RDBbLoHtR8ooCbPEPeuvsRVuTuNYKb1GrgKbSjW
 x9EeDnAPqIc4iGpMmyI8GmlamGBCJoXaQi8u9uqxyP0GRmhGtiXmsjjNZeTAkXvE7yOG
 5xHw==
X-Gm-Message-State: AOAM530HPvXmCf0bK+E3UT1kASiMF0/92Eg+V0px4Jl7FSD0JjZAzpKv
 pLxHQ357/6pgwRXMh+Rf+MixjQ==
X-Google-Smtp-Source: ABdhPJxLIYeShTzCQNAuiqhv+woORrPiGiFg3PY5eGHPTWu8DqZgmWT1wWUIlKvDczvdCAZbTZ+aQg==
X-Received: by 2002:a63:83c8:: with SMTP id h191mr9624306pge.499.1642383334271; 
 Sun, 16 Jan 2022 17:35:34 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id l1sm10008335pgn.35.2022.01.16.17.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 17:35:33 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 0/3] Determine the number of DMA channels by 'dma-channels'
 property
Date: Mon, 17 Jan 2022 09:35:25 +0800
Message-Id: <cover.1642383007.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_173535_822961_078869DA 
X-CRM114-Status: UNSURE (   9.09  )
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

Changed in v4:
 - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>

Changed in v3:
 - Fix allocating wrong size
 - Return error if 'dma-channels' is larger than maximum

Changed in v2:
 - Rebase on tag v5.16
 - Use 4 as default value of dma-channels

Zong Li (3):
  riscv: dts: Add dma-channels property in dma node
  dt-bindings: Add dma-channels for pdma device node
  dmaengine: sf-pdma: Get number of channel by device tree

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  |  7 +++++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  1 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  1 +
 drivers/dma/sf-pdma/sf-pdma.c                 | 20 ++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++------
 5 files changed, 24 insertions(+), 13 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
