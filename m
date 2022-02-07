Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3FCC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 06:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGrrcrCxRAe6AyVCKW9JL06V2GNq6o2o16ShzjbJMMA=; b=nsCfJ/f/h5ztth
	O5ShdQuqcyF59ER2u+DTOSvpPcMjPGc0lO3bVzroWVTjUB5ldJIQJIv7GlCnDQOX8yOfNwBcoK2Ha
	fe+pRXCrIkwauGzJu2qAPE2Aa9pTNm1D4l/qJiiH/N/rYqKfWBaV5gXzVFnL6ibQMzsnH/agq2xht
	r6Ycf2XqBXUSZl+27FOhV69kGV22Eucg2QAzjJT5pDSmaC6OMMSldwe2E4wxkFA3K40RjsEKPxYsj
	WvBCgXFAS7aXei7riyyCBkChN9kkbyrZhet611/Juy4Y0fsjIK3DgCFEH61Ru8gnL+kmLkKmNsAWR
	m5wBXIuSFqUum44Jq5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGxYH-0098XI-44; Mon, 07 Feb 2022 06:31:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxY6-0098U2-HG
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 06:30:55 +0000
Received: by mail-pl1-x635.google.com with SMTP id y18so776858plb.11
 for <linux-riscv@lists.infradead.org>; Sun, 06 Feb 2022 22:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3fmm4nvalmQleWa1byPzKYwRMYCW7Pxtk8Gk5epwAE=;
 b=Mev+fmMrEndOiPaIwMiostWKbCgoFUolVWzZCS5uUOeb6YzZKZEj6A9J+rHrqQqR1b
 FfCWf6jS25cRBOHFXTGitsymEc26oKLYlLLr4D4R0sNOup6+y6vzmEnPUbVKelaVdhFg
 F03jL7I3xrKN6prjd7rT616gqxvZcctqtMaWnyXsuQNlrEkD/GbYCOXrEZfqeuDGJh9+
 oFz365NpbqYAz4kSJOv6L1wQBP8D7yXOe8Unverh0JpEvOQvoMIA0+i3rH4v57fyrLOf
 Ps15s79JTNhaF4VRgNZYkbR6r0o9WR6DTFOTFXw3AqgmOZarWyVpad9aRR1sKCPoxEUM
 CLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3fmm4nvalmQleWa1byPzKYwRMYCW7Pxtk8Gk5epwAE=;
 b=Fdi16CVNSchNsRxI1rRnXBwMPbUTb3532YDbJkP6bqrnFFuNeG0B7vdY/csyAHACxs
 dFU46nL+cgciMhkmP2n9KWIfUOm4B8O7ucn0I/W2ogsd1OIFN3Xt7uWGyKDHT25iow6J
 N0rHt1egri2of+HOAbQY47JkmzVGQEHoplGJihkS5fedlLXeF5dc1b6WwKJgZQNRflRT
 i1BjBNzZEFD3wDn3zTcbne5IxsUvmvbB0BhlS/vbMnw1GtS6tEoZQyfml3HanxZYOgWN
 TctwO9uezuvaUrTWJJtZAwxFsgdWW3j00lCgLogIyLg+Vsqnqtx0Gi3a9prtg/yBa/LD
 p4Qg==
X-Gm-Message-State: AOAM531y3v7F7l0eIlQ0tJQe/1j8+ub9RO5znRuSa7rtofgJ/eTCEfKe
 IdOEV/JbIr79hGK/eyjG28aMxA==
X-Google-Smtp-Source: ABdhPJz8oBJ3w7oZV38zeOV4odPSlf2oJfYGXKEsseSqcLYbDUnaotjNjwPZV1gk/z/pgQvbgRWgyg==
X-Received: by 2002:a17:90a:5a01:: with SMTP id
 b1mr7252147pjd.134.1644215453808; 
 Sun, 06 Feb 2022 22:30:53 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id i10sm5266634pjd.2.2022.02.06.22.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 22:30:53 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 2/3] riscv: dts: Add dma-channels property and modify
 compatible
Date: Mon,  7 Feb 2022 14:30:39 +0800
Message-Id: <ed0a70966acded2d9b8f7208d6e01b6d8324c1bf.1644215230.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1644215230.git.zong.li@sifive.com>
References: <cover.1644215230.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_223054_607675_CEBE5253 
X-CRM114-Status: UNSURE (   8.82  )
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
