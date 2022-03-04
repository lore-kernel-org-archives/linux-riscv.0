Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B7CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGrrcrCxRAe6AyVCKW9JL06V2GNq6o2o16ShzjbJMMA=; b=a7N88psINoqExS
	iy0ov/lKP0jVG8wj75JJ2tJUQOBvKfBw0C6qckxvlcy5+RptnkXozhHU9olTqrugVwfgS88uSnd2Y
	KJBXZBaQGJxqsHuWrrLbtcQ3LxexlOIhfaXkZGzncJhidQxFrHhM5l94TRLohW/ARqxuhh0UyDOHh
	dLrG9kX9xCFIIx9jDT5Dver6ju8vyTBd67AMB4ayqX093XsnteI0Gr6lSjMilyGjwSoJ+tTf/oDh7
	hhUT8+a/ouDo+ps9cj9+ydYI+wPzFoHE192By3EkN3TrJyc5t8QTU1ePbNcgChpJcauqtgfZZMDwY
	AeITghfoQhD9v5RIxRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ404-009DvQ-OM; Fri, 04 Mar 2022 09:13:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3Wp-0095y0-5c
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 08:43:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id e2so7127825pls.10
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3fmm4nvalmQleWa1byPzKYwRMYCW7Pxtk8Gk5epwAE=;
 b=DdaVsAKprHzLmoEOoj7hXNT+Eeasjy3ANt5B6k52rePYudsdXjfR8CCclb5wZdHnEf
 /jgBudJsh2wvZwJw/OERuUAIO60Ri0ua4fo10FGa9AKcX0TraqEZMf51mbPB2qQGJ+jv
 6Xyr8BUa2AlZdrDwLWnGWhQMXdKQy7P5i5iEb8tQaZSTQaSjx3NvKxb/aZmDKQ6cpbzS
 rXEG9L4VFJyCl/9o7NzDXvMMnKnLK6aPGyfM8c6sVy0RolXmpNs2BcVj/vuDgag8Dvkj
 Y2prHnlitDZDPD+7urtYUWiaqPYLxQrHiJOk4qlLK3IP2wbBi81rhE7aMy2DN051H+1R
 /YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3fmm4nvalmQleWa1byPzKYwRMYCW7Pxtk8Gk5epwAE=;
 b=OyaE9iMfv6z5HlXTfW2v6IHZkzAvgTdjVOaTy1faVjNxWMDCquZbeLE0L7WjORIeoc
 b1Q3QE29h6S6v/fUOovgQs649mNdSqzfFKIdlZoYIeKPE6pakTgbkFcKTUAHL8MYyFwY
 JeHG/VD22kB2O/KUGRtKQ4jJf9J5wHncwYZPCPt9/Sfb5LfPS68Ks5RqVOEYCojeT8SC
 2ygFBYi2DY0881pDD6ROcbS2d7hG1ji5p+BR5z6103uD+HoMkWQAhk5TbtA5P8Pi1jCh
 dmP9WZymLAqnPASBrVzjWHzmM5t1wLwZEEDPRaV5uefDnq6XHxAWig3SVLZIZd9bYjA7
 SpJA==
X-Gm-Message-State: AOAM532kvXQtrCRkfq5o0DTkvTNReD7TybuVXK0QDT7qgfRe9it8PH+i
 rA9q3z/ETI8dkcB6E7r70Ox3Bw==
X-Google-Smtp-Source: ABdhPJzDQYRRNKtWR17zpM/+FYK3UlyVp5mrA7EmJm310J0T55vcLfD40IjArzY41WnCFi9Aw5b5gg==
X-Received: by 2002:a17:902:b602:b0:14f:e42b:d547 with SMTP id
 b2-20020a170902b60200b0014fe42bd547mr40717392pls.91.1646383389827; 
 Fri, 04 Mar 2022 00:43:09 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4245191pjb.14.2022.03.04.00.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 00:43:09 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 2/3] riscv: dts: Add dma-channels property and modify
 compatible
Date: Fri,  4 Mar 2022 16:42:56 +0800
Message-Id: <df3a3e170af82070b0bfaa03e66b6570718dea77.1646383150.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646383150.git.zong.li@sifive.com>
References: <cover.1646383150.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_004311_270041_FB46FB9C 
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
