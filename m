Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1D2C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJ1G/yGs5bSv1biHo/l3GlyS7cNIdip9hVC7nZmoIvE=; b=qf4aq50EIOEWwV
	JCNctxMPzotKwAUWINQ9bHMp7TmfxKpyFAVhGRC4n9RbYJ73ISZ9QvphOambdTGA7Sc/TevOWLCJV
	NgwqB+HEajkI3YC3rGNls+hSNQPoVP3gpRyfymj4mtQ6juFtNj2dD/Jm/W92rLmvCv3xagaAGbanL
	IzJEmyTgRi/sZFyN9G2mC/+2LAVuTLjdIqJVwPWUdTdsS+vL211Q+aDusZKMV0RUXNh/PmOfS+IXx
	mmhveX45WIuMuf1gYpr8Mo8q5YjWfsSZbgHUzGNA2p1jO1LJsskdpH0k0NkgNyHL3sHuaHnDEvuml
	+B7UyWCr4jNCjmTNKfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4z5t-00Db2W-Tj; Wed, 05 Jan 2022 05:44:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4z5q-00Db1s-QN
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 05:44:16 +0000
Received: by mail-pg1-x532.google.com with SMTP id 7so21976129pgn.0
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jan 2022 21:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=RUGYRR1RJQKJtUsWJ5uTAOkOhkJH9bu4UoUiYQ6kKHDxBWY5hKh/TwfbqSR1UZo4QB
 kAJ4aNcqR9tGhqq7pddSAxim7ptsvg9Ke2hIBRaclfX/3xnOAiBJrCA+drxUunvh85hg
 UvAlOe/ZnNWL/ZUicwzR8o28Xd8XwIFT5GAFFEiR+Q/gzdDMq5L3xdldGWGlgOf1BTqu
 babo3m/6lJwNgQA/8iX+shYU7Qo6eFbnDERAIdiRc/soLziGFaTsX3aPsNWevBi/E3In
 o1C8duEkKoWxXHA1MNyIF2CAPgKiZ0uWNSgJCPV71zPh0qadMAayJX3/QBhP0uumB2s1
 3O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=FMvOk08OntHCgt6CBIpHc9swk9mgfjdiieEND51EEqiG+94ohlP2/V/uwzZZ6gYuV8
 pQW/Gk4IMZyjzDHEz3EJiyTo5sFdZLmh0xUOT1gkPmCSZgI3+dvhtdTCFPc5DzYZ7yuk
 vMSwkQxTOfyYZigJjqGypcCrHP1rN4nmcvA/YpkntLx1smqcBH6t92ggjweptnOusFUH
 VmIcO3sqG0NVm2ZkdwpDAa5BkcAu/uYuho3NfW93q1N+GXxFrUZNkJDyiuqwmXPMIzEO
 PuGN53oXcCrhyFjt8NjEpbsx/663zXjMDiXiczhjUidke0iFEX+3J5ZNbhon74zUQysy
 21Cw==
X-Gm-Message-State: AOAM5302nyO0HYCgeRyXBzlm6NlXsZxOxvo+5Io4BTp4uQli6UPh8zZH
 snuk6I5YmmhoadSS1S53is2P8A==
X-Google-Smtp-Source: ABdhPJz1d/GHnBphP8/L6c4hZ+RtKg54y3QIKQ+HyWa3rLpUV2ja9CTDSCNACsrET9L5iBou/JXaFQ==
X-Received: by 2002:a63:3c19:: with SMTP id j25mr1258601pga.476.1641361454102; 
 Tue, 04 Jan 2022 21:44:14 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cu18sm1000574pjb.53.2022.01.04.21.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 21:44:13 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/3] riscv: dts: Add dma-channels property in dma node
Date: Wed,  5 Jan 2022 13:43:58 +0800
Message-Id: <eeaf4cab4ec44ac95b002cdbf745d328fd46bb60.1641289490.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641289490.git.zong.li@sifive.com>
References: <cover.1641289490.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_214414_878298_B3A3C805 
X-CRM114-Status: UNSURE (   8.56  )
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
