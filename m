Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA7CC48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 06:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8E861375
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 06:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8E861375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtgGRIqgNO069HltAngsCPnxoq3XS9/VdTtsAgRr5+0=; b=hgyLTXTrJG6kFf
	BkCCons74mtAvX1RKqfejix00r2eWgjukviGGh5jy1eJzErJITsyNS7cJBHXECRChwIDm0nhshQUT
	1SiLd612hmbflR/TI3A5RbgaQnHtcf1JuPIxRfzoa0zN7wOLM5bovSu1J5QxjfzwrJesr3uPBcfe+
	Dhw6o6f3fUUNEHjeRLzki1QEewLKEQyPYvRSndX9vB0pCouRVBWiT4ZpDbB5gBnvEIKrq89ivdaVJ
	XhWDl07LBGTwQEJiG4i7VaQA5vUIAod7b2+xkbrFCxyg4RgLjV6Mf2JrYosj7TX3yUydJtpkjH0yn
	vM/aymcrEvSNMB/7z2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltOdO-004z1x-Us; Wed, 16 Jun 2021 06:02:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltOdM-004z0z-75
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 06:02:41 +0000
Received: by mail-ej1-x62a.google.com with SMTP id g20so1893172ejt.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 23:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmUZFQiKZAjt3d7qJZzBsR6hutNnEwcefr5tWqFFkuo=;
 b=cNBdmWxkePEVOxU4GERyfW7MCTkzvtfBJblvz+kQkALBJRfbl1uPPBrUdTX+iDyxyd
 d0nEMtstHBL39SbNSkLBPyRqWKSrbX/LbSimF8p7LO3fHbcWip7YHWwiPLxeY1meqfl0
 klcq6W4c/WR/KmTfIRON+T6MOvtCdveG+NTukNx14XbQV3cOZCAtUD3RGhnrimzxdaey
 NrjpMOuYQbg7Y2a6Xj+LgK707xT3ClTGnuMAvi5iTHkQSmOVHOOHjtzZZ+PI5cvr9HZ/
 +RUpkxV/itCKp5LykdWdZgt+bp4pz0kVboyeVMkycs5CuUs7Gt0WuSt5bjj7hHJP70VO
 vpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmUZFQiKZAjt3d7qJZzBsR6hutNnEwcefr5tWqFFkuo=;
 b=qA6dKJ+hIsndBoIVNmfAu8ryFoo9DHMNLeuuQZsToSh4la6ffHH/pl5K86nInvN3mI
 5Y3TViaixllf1i20cu9vn00YZUgEJfsmofqmuLgialo5LbCLh7yK1KKRVPX/6Ys+Rf8z
 c477SqdAkr8DUnAT4ZZIHw2MEz+YmDDSV/OykysO5rchJfbv+L0Xc3Sy96Y4DHPXaXxC
 E/seAWlN+ZPi+rtiwKU2F0q9Cdo4K/ULIvNroKmttoFtjjz7d/FdYfrxuO/f8tmiIar7
 ke60rCOQjXCJ+ircmYJukx/813kJJDdRvvsNvhGrpjzitllITTLs3rtZyaygCRI3Egb8
 Rjbg==
X-Gm-Message-State: AOAM532t6UT84s6Sr4lu5pTd7WuxDK5zroc0bvCvgc+Nwq30ZUyWcEes
 jwCIHOQHldycB7Y8rGZkJhM=
X-Google-Smtp-Source: ABdhPJz8f65f1DFxLdRl6kc6uEgMgLBoCFxF66MEh/Tj3iwnV3NUK5Azu7L4uj5Uj8IcYog8SKNDkw==
X-Received: by 2002:a17:906:2e81:: with SMTP id
 o1mr3530816eji.446.1623823358242; 
 Tue, 15 Jun 2021 23:02:38 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id ot30sm810474ejb.61.2021.06.15.23.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 23:02:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/2] riscv: dts: microchip: Fix wrong interrupt numbers of DMA
Date: Wed, 16 Jun 2021 14:02:51 +0800
Message-Id: <20210616060251.398444-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616060251.398444-1-bmeng.cn@gmail.com>
References: <20210616060251.398444-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_230240_299243_194A2890 
X-CRM114-Status: GOOD (  10.24  )
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

From: Bin Meng <bin.meng@windriver.com>

Per chapter 5.2.2, interrupt sources in the PolarFire MSS doc [1],
the correct interrupt numbers for DMA are <5,6,...,12>.

[1] https://www.microsemi.com/document-portal/doc_download/
    1245725-polarfire-soc-fpga-mss-technical-reference-manual

Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index ee54878b3f89..a00d9dc560d3 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -182,7 +182,7 @@ dma@3000000 {
 			compatible = "sifive,fu540-c000-pdma";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
-			interrupts = <23 24 25 26 27 28 29 30>;
+			interrupts = <5 6 7 8 9 10 11 12>;
 			#dma-cells = <1>;
 		};
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
