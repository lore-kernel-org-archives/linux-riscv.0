Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69653C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2kwsiCdXkUWkPFP6T/bKVt9cZjQPb/y0f2Xgbmh6iY=; b=L8yc4y2is/sADi
	EELqIU407znCSejHra/v+WkoaG1yij67HGpPm09OAnFFF+rz26Ndele0bMJMfaQD7VsuULLZ8GsG+
	QVVylJhbsVMsGO2ggCP37akJ40COt9GSyrtrUvx2D9WwCsZM9B5bHe2brWBybaqv1pOQtY7PmTXUG
	feFZ43y1uxDC6IzI0Ir81zOPgCi4sUW498noBcNcRB+nZUuXhWBSjpoUUJoCDfmB8/my2olwbEJ5F
	Maj6H94p4EjkuQ/DQnPVhhprkRrmy/gpFCqoYB9SeEzl4yn08ec1ni3Vm2ytSnOjgUAXVGAQbzeu0
	JPzRQpAwt3YMVKkwpO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3xc-009DIX-SW; Fri, 04 Mar 2022 09:10:53 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3Wi-0095v1-Ll
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 08:43:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id s11so7024537pfu.13
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 00:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=627oPX+DGtF7Etph+slPCYuLirVFFqbCgoAmIZxqGeU=;
 b=I0HXhO/3K8UuqLVrztTJgmhaBUIPbKnovpiChW/NN5AezpTnub6VbY5mKHRvvfRjru
 G+vBXiCBmMz0X3G7juB7Idt5QInixPjIkUvWYfUlU5p8zJjXe2nE3MHRSQl/YO1OsNxy
 01qAI59ttIHtR18puIJqbxM+vL3htOAwIIm42MNnTsR0/pFKQVP66+eqMXyduTQz7BWa
 q7dW/fXRbReesYR6GX+ZCQ6B9Zt/oaRei7U8dFeozAt+qWn0dXmS6qJTZiv3uyA3d3fT
 TVb8j0JdhaybHLiQRzp76BenikuJazLakYKvbCBFS0gTkClqrN/NkR0IR/jd2cTTJOqV
 /hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=627oPX+DGtF7Etph+slPCYuLirVFFqbCgoAmIZxqGeU=;
 b=T2/GhX1Z+ct0mXnFS0+a9tapnFZEF9Sw/9ChHo+ea0WbnWyHNqDbBp9dRfD7MySMNg
 mMBM4vHX0/ohwxDp+P0ONAkmPqaYBhxhpbqDr10ooTqL8ZVsO+FTOlk00AnfSb6kGrjd
 sOXd3+P9OatvdpojvGkQErPFyJtI8Q2AnYTBBFvt65YeIiuimti8VHx+eSiVZ1WkqidL
 kez6qrzXzEvmgphiAllNeKjt3vlng72SHxYWq12bVXeg/f7Heus81phYvZXiFrsxYrqu
 FOCoOUNdwidU4EFOZH2Q9YF5eglUAgHmv4vwq0rbUhoTq+0rs4edy+GUMr5KOHd2Pudb
 ZGHA==
X-Gm-Message-State: AOAM530jkWK/Tif/AWGSk1/Iadp8VdsoDqFOkz8nkoz2b6ZZTF8dPPNv
 MDvC1EOOwbse8S4gnPpleBvcgw==
X-Google-Smtp-Source: ABdhPJxnV4KLbyp0FJrKDpT92no2nDhKFhhX91+K9egKuVha8hnOjoG9bpvulilLCZYFEFOECTCPtg==
X-Received: by 2002:a63:8bc4:0:b0:341:760f:44d8 with SMTP id
 j187-20020a638bc4000000b00341760f44d8mr33584865pge.32.1646383382940; 
 Fri, 04 Mar 2022 00:43:02 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4245191pjb.14.2022.03.04.00.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 00:43:02 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v6 0/3] Determine the number of DMA channels by 'dma-channels'
 property
Date: Fri,  4 Mar 2022 16:42:54 +0800
Message-Id: <cover.1646383150.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_004304_811158_46EB12EE 
X-CRM114-Status: UNSURE (   9.95  )
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

Changed in v6:
 - Rebase on tag v5.17-rc6
 - Change sf_pdma.chans[] to a flexible array member.

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

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  3 ++-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  3 ++-
 drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
 5 files changed, 39 insertions(+), 18 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
