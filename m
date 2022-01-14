Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C072C43219
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJ1G/yGs5bSv1biHo/l3GlyS7cNIdip9hVC7nZmoIvE=; b=WkpNOVxRaV8wWe
	wvL/SakCd9Ggql4TFPTM/CtmZjVmOqLF+TlvPD3O18d29U/EjHEWCKqnyNecCP8e/mzlEkLxV1dqO
	+4vWkSvXO577oagYyAV6+RPwSL1/pmTSDfDZG/wE2k4/tSUqBbRofMw8rrN8eSmRz65sTl/sw8Jp8
	Ssnq3Y7zeSiWP6v3qNuZUX9QDVuNY9fItWlHpNbiPflh0pLQ97qOeM/sINulycNhWQUdulb+a1vts
	FVHAfAodHe/YWs5CPWavi2BgSx5x70AY0bElMxhmy75rBUelB8qZJQL2VoFTJcydoNGcgahdP1YfO
	nQK8VbJ66+T2alSbLDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8IiY-008RWV-Ul; Fri, 14 Jan 2022 09:17:54 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8IiW-008RUu-AY
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 09:17:53 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so13652158pjp.0
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 01:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=EVupHttrxPcen6ULmEixZnPbT26g4c+94DyjVPU66nQYYT/5Ego7P6RHu0tJanvUrH
 8guNm0FdQveO46wxKD9SEyeO1sLcsuboP1p9BytGBbPXOE07McBST/jGPcHjXU98cuFL
 eUCb3cmm69qtqXb8LabZ/ZH5qBP794eqqa/XqLeZGEW3mCWgP4NwHIhRsqjMgfsImtyQ
 j5D12YxHNBxitsbn6L9UrZNArImktllj8Knsw3KhD1rb5CgKWXaF3RD7xlVinr8OLdEX
 QIbLoKcRC1uYTCHgQT1G7d0nqkJjlo89YF7cSPOy8fP4vJiys05E1TWfn/Z7VJIzhmAA
 ow2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=AKyuirHFj14nbTaqBjur+7ICLp/I3HwxksR2M6WMET0FECz+KVDwRuUFAtxQiMEIjI
 laCIY3U2XaTSVcxyj5cO7qbi8ZXLbEmOocUL70jmVZNf405iKFlJ/X5VKIA6cXLckc4J
 caWrHjMLLPGfFFxA3QTHNOS1IhVy2ZCXJJdqgMKPq/fK5scFe/XALTiR2Po8g98DqGiE
 rhne52zyhr+czmp4WFqJaW76FyJWvSwOg1XuhOpn2/y5oJMoiexWeYrdFtZiHcZbmrAU
 gNZAXmpg7dfPa2QrWavSOoVxAp98gIxDFEMhRpr2BKSCCyIFd0e5j89iTofQmYj6YIlm
 rrZw==
X-Gm-Message-State: AOAM533ABKb5aYb0D4tBKU5YyOuZV5IGxmSjPQNGd1PIGnCLtdI6Zj2q
 FtIuNjZuPW6xcHcX9NyZ23B7vg==
X-Google-Smtp-Source: ABdhPJwgjZNZBcWY1WqDIfspOa+C3WcZH6OkqRDy57h33N56DUi3jBThAmxkLw4TGNzYi0naU9J2MQ==
X-Received: by 2002:a17:90a:4f4b:: with SMTP id
 w11mr18924303pjl.112.1642151871283; 
 Fri, 14 Jan 2022 01:17:51 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id z3sm4237179pgc.45.2022.01.14.01.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 01:17:50 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 1/3] riscv: dts: Add dma-channels property in dma node
Date: Fri, 14 Jan 2022 17:17:39 +0800
Message-Id: <163a2cf11b2aceee2a1b8dc83251576d2371d4a6.1642151791.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642151791.git.zong.li@sifive.com>
References: <cover.1642151791.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_011752_396413_9ABE495F 
X-CRM114-Status: UNSURE (   7.61  )
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

Add dma-channels property, then we can determine how many channels there
by device tree.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c9f6d205d2ba..3c48f2d7a4a4 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -188,6 +188,7 @@ dma@3000000 {
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
 			interrupts = <23 24 25 26 27 28 29 30>;
+			dma-channels = <4>;
 			#dma-cells = <1>;
 		};
 
diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 0655b5c4201d..2bdfe7f06e4b 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -171,6 +171,7 @@ dma: dma@3000000 {
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <23 24 25 26 27 28 29 30>;
+			dma-channels = <4>;
 			#dma-cells = <1>;
 		};
 		uart1: serial@10011000 {
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
