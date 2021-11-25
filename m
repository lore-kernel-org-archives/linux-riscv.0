Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59D0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlHPbpw8uwZBBO2QAt+D7f5UCwweZ/5IsSBWq/thKGI=; b=4fCODRHArk1epB
	3QXpUCJI4ojgDtvcOc3azNycy3ecIpljnm+9Ojziby8Jy1VAxNrD+7upWExyM2pEKgM4xWG8QD1NQ
	lXDPUajpKcb3oyIr3v4HVVbrKYbcBA2r3oYWqIMxBHemaMNbgU6RlVchZsftckVhN7TBVluNtWrB6
	daHh5MO0wNuSiu0pMvWWMBP+6YudtAVn2ZSaquew3dtaJDJiq0CqMlex8do9b+YMqje1fhvQ1zsCt
	4RIGUt5RP0xtji0NpqHjy8ZB+tL5kFiMHOc9DF6sPOTBX3XL8RSS6VlbcpQYEv2VR5+rhtdbkjycH
	1kl8DlYMmw1PTczLNMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGjF-00828Y-KT; Thu, 25 Nov 2021 15:32:05 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGir-0081rv-B5
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:31:42 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by baptiste.telenet-ops.be with bizsmtp
 id NfXa260145CGg7701fXarl; Thu, 25 Nov 2021 16:31:36 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGij-000DSQ-Ex; Thu, 25 Nov 2021 16:31:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGii-000gZ3-Kq; Thu, 25 Nov 2021 16:31:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/9] riscv: dts: microchip: mpfs: Fix PLIC node
Date: Thu, 25 Nov 2021 16:31:27 +0100
Message-Id: <20211125153131.163533-6-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153131.163533-1-geert@linux-m68k.org>
References: <20211125153131.163533-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_073141_591217_EABD6A0D 
X-CRM114-Status: GOOD (  10.42  )
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

Fix the device node for the Platform-Level Interrupt Controller (PLIC):
  - Add missing "#address-cells" property,
  - Sort properties according to DT bindings.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index d91226bfa586cda7..c71d2d682fc0a0e7 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -168,16 +168,17 @@ clint@2000000 {
 		};
 
 		plic: interrupt-controller@c000000 {
-			#interrupt-cells = <1>;
 			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
-			riscv,ndev = <186>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
 			interrupt-controller;
 			interrupts-extended = <&cpu0_intc 11>,
 					      <&cpu1_intc 11>, <&cpu1_intc 9>,
 					      <&cpu2_intc 11>, <&cpu2_intc 9>,
 					      <&cpu3_intc 11>, <&cpu3_intc 9>,
 					      <&cpu4_intc 11>, <&cpu4_intc 9>;
+			riscv,ndev = <186>;
 		};
 
 		dma@3000000 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
