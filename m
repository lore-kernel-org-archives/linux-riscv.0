Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D087C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhrpAProJpHBpjW9vEkG3cICyw3hdjkyNs0bV7LrLho=; b=Hml2qE7dE/KVRz
	JXpSUhCCNuJ/799BUbe2xOqVQh5w5dqBVkRtY9/NIWwCcuI3qvo50xNyRICOzr4Uuf+bmUF7OWUzm
	W+sUjp2ua659SfJdTB8zyX6ORxRVFz0rYKQpWRPfsa9ixpePyt2xyB7XrIoUUtgTT1viclr9tnMWR
	nXodr2FQsm+5KeVnczqqywJ0m3NwWoFevVTGAixu7vF/cMkGiMCCW+QCsOrqdS1Jeq41IoTZZZZMu
	6KARIStMBw8H4VTJB18GvBS+e4cQF99ANHeclXZZkWBIr7yqnxNs8csU65CWoFgorqqnf8fLrJqUS
	CvQ39DVwsIMINxw+uMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuw-00000004lud-1EBx;
	Mon, 10 Jun 2024 11:10:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcus-00000004lqi-3qYm
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718017822; x=1749553822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpCXcSYLvaUiPvd8q8SOwFC8Rj+IsgRpPjmmEKBXl+s=;
  b=2tqlZJxnKJoUdEbupyKgtoTfbGTMiPXgvXIEdQpOlf7AG1dOWZKl1Jb0
   3PMX1U4JtuOk6jTj0O2g/nqu/MCZITH1dokey8VZfZE2/XBU6RS88YJAa
   2QhyT6RKCeocD48Q0gjwFDsCXofxD1ibg7syxxyCDcnMKh4P2/ZznX8zS
   PjQLmiCMHLRe6iJJUf+2Ng+PwP4xhDeWGF+fr2Vgp/9Ac4qAq0+NntScQ
   Tx51yJS0l4ViEGYuLN17pcwlVX+W/lytcoM2f8nHlGGdWR9Kd6+XMlJHw
   ktynJLaXAE54pE/mxpJ3yaY/Ur8QyqfykBFhFX+lnnNlAZ0SFKz54o+n5
   g==;
X-CSE-ConnectionGUID: BcDt+H4qQZa2Sjv9BSuOAw==
X-CSE-MsgGUID: LJkIoX+TSq+8v/JgPRiTJQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="194602814"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:10:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:09:45 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:09:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 5/5] riscv: dts: microchip: update pcie reg properties
Date: Mon, 10 Jun 2024 12:09:17 +0100
Message-ID: <20240610-panda-revenue-7248a5403dfc@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fpCXcSYLvaUiPvd8q8SOwFC8Rj+IsgRpPjmmEKBXl+s=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlp925bebxoODiN4/DmTXsbS+7b2H7I3rRqP9PE2Ty7VTcG P3GP7ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEqroY/qneU5um2Flwxqld1MLu2L zvhw9YLf/vI7nF4PH10He9kzcwMnRonJw6x+B+W33ytJkmXAuklZdNvlzUxD+x8b7L12zBtewA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041023_200239_2C7267BB 
X-CRM114-Status: GOOD (  10.68  )
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

Split the "apb" regions of memory on PolarFire SoC devicetrees PCIe
nodes into two regions, so that it will be possible to distinguish
between which root port instance is in use. Currently the "apb" region
points to the base of the root port region and the Linux driver uses
hard-coded offsets to find the "control" and "bridge" regions. The new
method for describing these regions explicitly passes the base address
for the two regions of interest.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 6 ++++--
 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi    | 6 ++++--
 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 33e76db965bbc..f151aa2606d7b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -45,8 +45,10 @@ pcie: pcie@3000000000 {
 			#size-cells = <0x2>;
 			device_type = "pci";
 			dma-noncoherent;
-			reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-			reg-names = "cfg", "apb";
+			reg = <0x30 0x0 0x0 0x8000000>,
+			      <0x0 0x43008000 0x0 0x00002000>,
+			      <0x0 0x4300a000 0x0 0x00002000>;
+			reg-names = "cfg", "bridge", "ctrl";
 			bus-range = <0x0 0x7f>;
 			interrupt-parent = <&plic>;
 			interrupts = <119>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
index 8230f06ddf48a..f5036126f2654 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
@@ -20,8 +20,10 @@ pcie: pcie@2000000000 {
 		#interrupt-cells = <0x1>;
 		#size-cells = <0x2>;
 		device_type = "pci";
-		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-		reg-names = "cfg", "apb";
+		reg = <0x30 0x0 0x0 0x8000000>,
+		      <0x0 0x43008000 0x0 0x00002000>,
+		      <0x0 0x4300a000 0x0 0x00002000>;
+		reg-names = "cfg", "bridge", "ctrl";
 		bus-range = <0x0 0x7f>;
 		interrupt-parent = <&plic>;
 		interrupts = <119>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
index 9a56de7b91d64..121b13f9c8bf4 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
@@ -20,8 +20,10 @@ pcie: pcie@2000000000 {
 		#interrupt-cells = <0x1>;
 		#size-cells = <0x2>;
 		device_type = "pci";
-		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-		reg-names = "cfg", "apb";
+		reg = <0x30 0x0 0x0 0x8000000>,
+		      <0x0 0x43008000 0x0 0x00002000>,
+		      <0x0 0x4300a000 0x0 0x00002000>;
+		reg-names = "cfg", "bridge", "ctrl";
 		bus-range = <0x0 0x7f>;
 		interrupt-parent = <&plic>;
 		interrupts = <119>;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
