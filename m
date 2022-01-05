Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1D5C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 04:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1p/JJr3Asss222cHFkJ1g9YKfoCS5Ltg5W3yLRwNSY=; b=eZNZtgijjLjYwm
	3ZuZDoebsDEKV9Dzmf1V2Tr7Exe8W01E/DmUSpOvT15iyVQrOnF5y7EHMQ5qsT8ysMmAvpkE3Wbtr
	ltK8BEy2i6yuUeTXbkW3j6svhIVHM+nvL7XKWuqS1VKLtxGYvyS6Okw09q9vieCTaMZVJtGS6srOt
	h6iy/+nf6usihCSUn3Eg5Uojo9oP278v9vfibuaCQUrz+DIdNNCwGMdv1dv/Q6yCglRaqIU4NfK2s
	F8FfRu5MlqbtV28Xsw1R3kCVoZ1MyMmuKUvQgZfXYVSe2XUwiR3GPJ6McoE/D5Ow3dSqzhRDPz+HT
	axARYfRj7+NNzkRxRQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4y4W-00DW5S-56; Wed, 05 Jan 2022 04:38:48 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4y4T-00DW56-K6
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 04:38:47 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so2175280pjo.5
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jan 2022 20:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9aN3MVYr/eRiJOMan2AXOKnS6rXengbNHdl8ukrLg8Q=;
 b=chEtXgMW/jgHH/5DCnTuHZPiW24an6y7pTIn6Bri/8i5+OkXl0tqt2S7a+d0oSw1E6
 xbtlp37n8UM20bQ01v5rnPHEouHragXKMDHapP4i0yTDa+XcMQaX/775+tWkZuJJI2vg
 swNdxC+/1am+Oc0aKKQ6fJH875639pDBDRp92+yxyLkiv0rW4npI1pkt202WC9wp0Lcr
 8VrobxfB0h/zJnmtsKeD3YTpoCd363/I0tWhPdJfS1S6EOaAa8nwZCPWe8bUy41ieWZ4
 zOX+8hBZbqSuZDRqgy5XTrDIJHounAjhDqXV2sWFyFTtp+1DbOlGl4QA0C7oRZm0Kj45
 N8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9aN3MVYr/eRiJOMan2AXOKnS6rXengbNHdl8ukrLg8Q=;
 b=2MlylV4tNJxmWDfmok/j4r97oUWSxVaMDKeUpjlIpNFmfqznIxMufhWA61bD0/ZH+X
 FFXNzgGDSjvEIkuVikEtykb82CTLdG9vDqkuZcWsXQo1Xp2bV5TLGfdRW4nuT+0fnRCU
 oR6FidqQvuRMoPV+uDFrYVizZsbBBLUowlxX/l91/VReJDIPAnLJDLXOf1JPcZLRaRdH
 GWNoCjFLRdVCTU6r8MaSQQMtmf96Ys99yFHwR2uZm17yZJY+Wk8+SzBVIEnF6ohLnEF3
 RsO7sbfbilECHEY0urKzkQijbY6bBvifz44ZNUaKLjejUusFw3kZF3G3XEcaF0MlfmHU
 MOmA==
X-Gm-Message-State: AOAM5335wtg9kX+RQedBo5QcDsZzS5Wk7Xjf4aiWCWkQvsSqS18kEXC6
 Y0lsaHCrF7bEypUizuI4tYthsQ==
X-Google-Smtp-Source: ABdhPJzFZp6NmebEnmYEZa1fqT6Z51iGeMByHFmL64WhfozHkp665fRhYI8myvlJR41cr27d3/HV2w==
X-Received: by 2002:a17:903:11cd:b0:149:bf70:2031 with SMTP id
 q13-20020a17090311cd00b00149bf702031mr10495508plh.40.1641357522727; 
 Tue, 04 Jan 2022 20:38:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id j8sm36172812pgf.21.2022.01.04.20.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 20:38:42 -0800 (PST)
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
Date: Wed,  5 Jan 2022 12:38:36 +0800
Message-Id: <cover.1641289490.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_203845_733279_DE4F56B9 
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
