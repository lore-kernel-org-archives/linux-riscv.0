Return-Path: <SRS0=JY4f=UU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5ACC43613
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 10:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FDB208CA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 10:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EMM3t0u4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EkbAXsmi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FDB208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Kx6CnVKIdrHEMiKFNmvm86Eb+09t/4y2H2D5kWLlRG4=; b=EMM3t0u4/gy1wM0coGdjYMXxoo
	SjKqX31Pz755037YwSZygLIQVZqbyvnxp4FI+BCENCEv/ScLGFTZbvRpTTuqwmZIxHoDKaeeMPDHS
	ZvFgTpJP8J0UI4gZzHU6CCDNHnwYeGM6vnJE9YczKnwUyB4SDl7m0z8RjRrgX6H4kWwSsHqe+U1A3
	+KcP8aokHqA31dbzpNdLi4JP0pMD3WNqyZX7WD5cpa6wVMfiLowISM3XkW3hrAJlSwRdsuXjnzE8x
	h+y3aCB6WMqaco/aVENMt0tbTvw28piW1b4IvUkzmxS+QzPz9zfCkxZ8K72X0JH0KGNj1Dze22BXD
	AzmMaG+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heHEs-0001Gj-1i; Fri, 21 Jun 2019 10:57:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heHEo-0001Fn-4J
 for linux-riscv@lists.infradead.org; Fri, 21 Jun 2019 10:57:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id r1so3402493pfq.12
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2019 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LfS7OaPkDmyWohtCv6+omHOKQ0iNU10OGK6bYTnhcSo=;
 b=EkbAXsmiKWaXo7lR4QUiVCL3Qlcv5VjgIRJ0aK6NFuKAuTyEiZcnI5vTp9lBKiydzN
 xC6cvtuwUV1tyZvDArgTgmcBgirg3MR79RamUeHI3xMVLq3/7R4M+MpAfyvVGEYeJgbB
 PgwRRsU2ZoNIary8F1SjsWrxcWSY9vgdB9LcSLnOPck0160+E3v24EbE6LFUfKbFe29l
 R4CRTdtb5UzyEfPhQsBfPQ+9AIlDmOJAaZh1qXb9rJbiVMWQEQijVf75CF4IUZ7OnKvH
 HyLmU0RoHIVMnqj5BScwaEgx/hRKR1sUx6u8RRqdgnfJLVulA4vv4axkwpc17aFOdJzk
 YJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LfS7OaPkDmyWohtCv6+omHOKQ0iNU10OGK6bYTnhcSo=;
 b=MlB2cxUAmsG0ZQk0UmcVfiLqbe9Qf3tkecPiO7Ip9LZ44PYG+feCNvCYLOZsD3ghyB
 CdiJVve2f2loiQQenqpW7Z8kjnNnesEa4Fqfci/BMQLmYjMMexa5h0qgm06GBC68trL3
 s1VP54w6GJJ4Q0KqCOc6+wsjWFIG+5YVUY4+KX9j+E+6qDDMsRudVeC+BWsLn+mDEEYQ
 GrdV/zJ1L5OdTQupo6Fy5fGCqg/iwYMJrqwjLe8vJJMWiW6k/0ei+VMkli+Z71aIdcij
 RK0vK+qE4xc5e3jNemai5yf7kCHvwPMbp+Q1H4WBF/TJcDItfUptzJgjT0jEHAt1DFoN
 Yk6Q==
X-Gm-Message-State: APjAAAUi1RT/ZjNKNhmG8+XEnI6ky5ZHRPGxd9gyz9Ful4T+7F0kjNvh
 OcLHs7oe3JK9bYRm1VVFq+Kqnw==
X-Google-Smtp-Source: APXvYqzyg4P7NwGYnubvr8F2/xiaWS2z04jXSX8kI2HlZUYsAEErfBxzBhb5mkAaVXVwDLS01pWL+Q==
X-Received: by 2002:a63:f817:: with SMTP id n23mr17900412pgh.35.1561114665299; 
 Fri, 21 Jun 2019 03:57:45 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id q63sm3889442pfb.81.2019.06.21.03.57.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 03:57:44 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Fri, 21 Jun 2019 16:23:49 +0530
Message-Id: <1561114429-29612-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561114429-29612-1-git-send-email-yash.shah@sifive.com>
References: <1561114429-29612-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_035746_196397_25D1937A 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, palmer@sifive.com, aou@eecs.berkeley.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 16 ++++++++++++++++
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 4e8fbde..c53b4ea 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -225,5 +225,21 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+		eth0: ethernet@10090000 {
+			compatible = "sifive,fu540-macb";
+			interrupt-parent = <&plic0>;
+			interrupts = <53>;
+			reg = <0x0 0x10090000 0x0 0x2000
+			       0x0 0x100a0000 0x0 0x1000>;
+			reg-names = "control";
+			status = "disabled";
+			local-mac-address = [00 00 00 00 00 00];
+			clock-names = "pclk", "hclk";
+			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
+				 <&prci PRCI_CLK_GEMGXLPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 	};
 };
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 4da8870..d783bf2 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -63,3 +63,12 @@
 		disable-wp;
 	};
 };
+
+&eth0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
