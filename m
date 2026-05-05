Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6355FCD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cAZazO6QDkm5Qyw0YnM81WtE2WBknPPKi4oRv9FwTVY=; b=dI3cSwUhFK1UNU
	crwHPIE2a1ULkHT9AXgPjNH34BEZWFyMi6tx+GCBUY1b5kGF3dEd0c4UnTP0H+WHoQmwUIvz9HYiD
	YQ4acZYWVnft26fa0SYbOhPQe0GTGm9w38JI/rptBCX5tv9gXyc1g3rZ1LcxA1lwo/mdzKO7uQR7q
	21RrwEM8lVFS0qNWMANMEcELqTQHVgkjNIehOKPoG1nVq+Sjvo7b8yJDiGZrXG+3u1fHoL1b80P5Z
	e5xSavsFS1a+tHC8LQGm3Rudv5TBll2Y6iEGysZYsoBJw5nJFOlV3wAPK8bPaSf5nmEG/lb+Pxd1e
	ucS3MEapb4S1fUuW2+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGhx-0000000GV4v-34rr;
	Tue, 05 May 2026 14:25:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGhv-0000000GV4J-1Mh8
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 14:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ABF843B4D;
	Tue,  5 May 2026 14:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C23BC2BCC7;
	Tue,  5 May 2026 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991106;
	bh=AVBaKymAMimEgUWtRYaUbFG1lawckkp/pv+cD+2y4hc=;
	h=From:To:Cc:Subject:Date:From;
	b=tPA+qTVmP1bCRF2P66dGyA1QN0Cz/Pzqi+KWqlqT1+/fANiZO4l51X88ubq3k2/sk
	 ZHE6SK0odt3LFBp/78zj7wWC0fD8iYWYAlJ92A9VgfiUWszLfRkZ4OICJwTDH3HYCj
	 ODZETpVHWsA+qyiB0zrC0VGKsgVfRay+RewOgt7uSzO9toB/iRUT3RzpzADlDkaR4/
	 KtxThUpLgvpOSdSXcPGj1sLqSx8A4Rp40XRXbvbRpMM3W/gQCtFBWYHpoHL7+DW0XZ
	 iA1sD3InVz0LjMOoA9bb0Fzu03MctsyNyFWAz1bQ9dGDa+Ftjfu6wlYRRozcYYSZkO
	 5FAT4kAmWPndQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: fix pic64gx gpio interrupt-cells
Date: Tue,  5 May 2026 15:24:06 +0100
Message-ID: <20260505-yahoo-deceiving-390a15dad184@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xgqkZxW8PvU3B1C20zMpNDkdyFF229wzrQ2xJQf58Zg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJk//7Z6VyTLlL5gcNi4ec67DFOR4KfZm1afvXGA/yR30 bcri24HdZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi950YGW5NPH0w4v/T9dFd k47GFSZ65Kq177rZHfB6MoeZuuWepnxGho2VD9m2G6f/PKPFf7rk2atYjZ1HNib8TF1R47z09h+ ndlYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_072507_392973_71323354 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Conor Dooley <conor.dooley@microchip.com>

As the pic64gx devicetree files got added in parallel to the
GPIO interrupt-cells being fixed for PolarFire SoC, they didn't get
changed to the correct values. Fix them now.

Fixes: 7219d20f9f421 ("riscv: dts: microchip: add pic64gx and its curiosity kit")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/microchip/pic64gx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx.dtsi b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
index 5cf3e3de0e067..5addfd4357117 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx.dtsi
+++ b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
@@ -494,7 +494,7 @@ gpio0: gpio@20120000 {
 			reg = <0x0 0x20120000 0x0 0x1000>;
 			interrupt-parent = <&irqmux>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			interrupts = <0>, <1>, <2>, <3>,
 				     <4>, <5>, <6>, <7>,
 				     <8>, <9>, <10>, <11>,
@@ -511,7 +511,7 @@ gpio1: gpio@20121000 {
 			reg = <0x0 0x20121000 0x0 0x1000>;
 			interrupt-parent = <&irqmux>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			interrupts = <32>, <33>, <34>, <35>,
 				     <36>, <37>, <38>, <39>,
 				     <40>, <41>, <42>, <43>,
@@ -530,7 +530,7 @@ gpio2: gpio@20122000 {
 			reg = <0x0 0x20122000 0x0 0x1000>;
 			interrupt-parent = <&irqmux>;
 			interrupt-controller;
-			#interrupt-cells = <1>;
+			#interrupt-cells = <2>;
 			interrupts = <64>, <65>, <66>, <67>,
 				     <68>, <69>, <70>, <71>,
 				     <72>, <73>, <74>, <75>,
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
