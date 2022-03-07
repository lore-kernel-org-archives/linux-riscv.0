Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13ACC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 05:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGrrcrCxRAe6AyVCKW9JL06V2GNq6o2o16ShzjbJMMA=; b=2hrfpFH6y7VH4R
	kxyuS2uONlcj/+F9Xuqv1AagYfnBmFH4yYJ664JCzeQDZEBerwjoayb3YkpH8aFgTiJkHH+Vnjv8c
	jNMk+OZlvhNeUQDeOQoDa8P32vvpiPzPyIcZA8COdPHhjX+t44rUsw0Qn+NmuPBQR7m1ar+A4qrPW
	7ysHxXzHnVsjrmwRDmF/nvwqXFJDXrWu4h2cQB/PTtmIDdg1UxyOTMHFLRt53TTIpkdgrvouU/YL4
	60G7MScI3t5ydVSL+ef34dWGE5EKt/lMVEFKRt0k0Q1TVPeWhV3/k7p24GifSnAm8RmIjeYEBJnJv
	87++Tj4qq18dVnRWsjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR6Aj-00Fwor-5p; Mon, 07 Mar 2022 05:44:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR6Ah-00Fwnz-Er
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 05:44:40 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so13014662pjb.3
 for <linux-riscv@lists.infradead.org>; Sun, 06 Mar 2022 21:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3fmm4nvalmQleWa1byPzKYwRMYCW7Pxtk8Gk5epwAE=;
 b=fl6tc4VC43ATK5SOcF9SU87whyYsM0/UNtzRWx1LVbVHj6trycs4EzVouaEEZrcpKE
 YC3iW3uXyA9P+iYT3vY/qMfHCuVwCd8S1tqyHxVxtac71XDsOIu+nMvTTY7QMQ/RNvWB
 KeuqZjyWE+hUEVXjKZhptxrbfUOlV7XU4tRNHayODoaEB7NjoS+o2a0Mnp7UWJLF2bIj
 jTC291bbLpDvmrw5q6vX//tuLYirSx6QQATmcn5dOYn1ETGZiqQ25erIbgBbeog9VnzY
 VuA8xqF0bs5B/8CdvaQLH3WrRzU7N/+YFucgiQo1AJA4I+6uqV7BbPIsg10CFjo09Fv0
 NrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3fmm4nvalmQleWa1byPzKYwRMYCW7Pxtk8Gk5epwAE=;
 b=LNY+MoLksmrtGqhK0NkT+d5pKOXFsu58nc8/d2gGvFO3ZqXsGV2nKtRz6RVHCDV0Jt
 h44BLd1jeVhQDeWLUktOqvRt2rCAr2vrJuQcdiAV1A2ndy6s/pRTtc93v2lYm1C0teIA
 E6ZOXb8r/K4RflQNVW92L9zBqJzIPl1UMvWEeLvaa3Y3gGcLC/HnaX9P5TxfcMH1ty52
 cjwL9TWejw2blmYt0fZUQLjkwU3l8lNza8qPq67QUGatDWOrgO8omrExP43TL/PWh+nc
 0Dwt+PrM+g5KtHl0i3rjBt1hs2WtfuVhTbBkVtdNpx7v5NLYO/e+CVaygLRogYbg6fq0
 sClw==
X-Gm-Message-State: AOAM530iM4cYAd6SFxijm9k8EXiCfYVIG5wfLLs7z+BMd6oMnCjIe3WO
 hj6swrkLcDbmV/Rc5fGnlJ2Lcg==
X-Google-Smtp-Source: ABdhPJxmHZJzk1QvRtzUfWeyEP/BccLNeBIBfFdyOzW6/M5gESO4UArQMmmb+9KSWVVM69HaTw8K5Q==
X-Received: by 2002:a17:90b:314b:b0:1bf:7c7:d304 with SMTP id
 ip11-20020a17090b314b00b001bf07c7d304mr23359289pjb.224.1646631878754; 
 Sun, 06 Mar 2022 21:44:38 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056a00168100b004e0e45a39c6sm14447385pfc.181.2022.03.06.21.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 21:44:38 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v7 2/3] riscv: dts: Add dma-channels property and modify
 compatible
Date: Mon,  7 Mar 2022 13:44:25 +0800
Message-Id: <b9ff5d8bef78d87d630d9defa5b39262f5abdcf5.1646631717.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646631717.git.zong.li@sifive.com>
References: <cover.1646631717.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_214439_519412_527777C0 
X-CRM114-Status: UNSURE (   8.86  )
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
by device tree, in addition, we add the pdma versioning scheme for
compatible.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 3 ++-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 869aaf0d5c06..d8869ec99945 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -187,11 +187,12 @@ plic: interrupt-controller@c000000 {
 		};
 
 		dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
+			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
 			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
 				     <30>;
+			dma-channels = <4>;
 			#dma-cells = <1>;
 		};
 
diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 3eef52b1a59b..6a3011180846 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -168,11 +168,12 @@ uart0: serial@10010000 {
 			status = "disabled";
 		};
 		dma: dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
+			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
 				     <30>;
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
