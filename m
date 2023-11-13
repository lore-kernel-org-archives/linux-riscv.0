Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA63C072AB
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TK7/0TVq8hdcigm7andQvxKTB8jdD5Nri+8d2CPG5d8=; b=IHpMiKrU1qSTBX
	HI6SC7LOMb2MZkVuho7nZeb5t7h+BA0094NKAfWcFhPVp/btUCwbNZmRGl9GlIWniSN+wProS3Vkz
	SNEokGNwTDxwxFOT3FtwzMVcVJUGLFGYirUh/9OvY464552mDFg6Y2ejy6u9kENpJz765ahUPF/+B
	W/cMYaHGJrcvj2E5IcPJkbVV1QkyYGp3cGJ5m0fCf9ezIlo6C31ULYGn3wJMMNzemAzqgThcTGztC
	F1to1idrpu3C4GEvKQu797WaWdzjFhNbXbn5TgggZDp/oR8ugPI+nwF0AVfo+2ufGOJ6tdqVI0uzz
	5vOy908VKE+zu6vOOXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQc-00CxqI-1m;
	Mon, 13 Nov 2023 01:07:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQX-00Cxnq-0I
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DDCD60C7B;
	Mon, 13 Nov 2023 01:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6946C433CC;
	Mon, 13 Nov 2023 01:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837664;
	bh=UhAD3REvQmN6OP/l2BKhCL7Kmd6UirEftGJf0TofIdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6uMoOfYrKHbDT9xNVOIrXAwjAY43Ti2zC6vtPyKcRWafuAZjfKl6WmszSJQYykgw
	 2e0Yzh5UwKRsaPVpDNNdaMWZyYD2zNAb2kQycdaM6oNPdpuu/GHIoM3ZDJVWneYJ6p
	 jZjB1fFrmEFRN2OTgxnpZ9jb39mUe2a69KzqXquh4iXUBEIUDAjvZMsJVgPabVhmjH
	 PqpjoutGlz4Xi9No7OQtLnlD5h0F0SKVX3XyF/S3pPXA7jdIEF7xXRm+sI89cinVJG
	 fTXhBwwvfs4kZwxhkfl5XUpCSW63h91O82PyDqEVqzYID1bCs6/wLY/Rk1YOW+OLcf
	 rSD4k41qZCW0A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/4] riscv: dts: sophgo: add reset phandle to all uart nodes
Date: Mon, 13 Nov 2023 08:55:03 +0800
Message-Id: <20231113005503.2423-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231113005503.2423-1-jszhang@kernel.org>
References: <20231113005503.2423-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170745_173805_DAFD67EF 
X-CRM114-Status: UNSURE (   9.01  )
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

Although, the resets are deasserted by default. Add them for
completeness.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 4032419486be..e04df04a91c0 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/sophgo,cv1800b-reset.h>
 
 / {
 	compatible = "sophgo,cv1800b";
@@ -65,6 +66,7 @@ uart0: serial@4140000 {
 			reg = <0x04140000 0x100>;
 			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc>;
+			resets = <&rst RST_UART0>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -75,6 +77,7 @@ uart1: serial@4150000 {
 			reg = <0x04150000 0x100>;
 			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc>;
+			resets = <&rst RST_UART1>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -85,6 +88,7 @@ uart2: serial@4160000 {
 			reg = <0x04160000 0x100>;
 			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc>;
+			resets = <&rst RST_UART2>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -95,6 +99,7 @@ uart3: serial@4170000 {
 			reg = <0x04170000 0x100>;
 			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc>;
+			resets = <&rst RST_UART3>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -105,6 +110,7 @@ uart4: serial@41c0000 {
 			reg = <0x041c0000 0x100>;
 			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc>;
+			resets = <&rst RST_UART4>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
