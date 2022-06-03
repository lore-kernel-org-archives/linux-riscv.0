Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA97C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENxse0uMoXjtQ/SJnhwAaJEiungaVYtkhXfSXQbUadI=; b=JcjUNNYiURAops
	k2FAtIExvDnSq5eMxA324tcbMRIN/jpj2LI8MCE9GT2lmmr+1OV90yvPuuNLC0lSBsv9IrmmaKgjS
	yehLh5Z908XB5qEWZHS913gNVnVLaop9znEyZBMNh+a36dYd8kNW9hhdrBf6xlsqhVZWD0RVeDtgi
	IEOAKtXtuDkDKVuuaWL9E3jtqg16WWL/tiwy6d5oeTmSpfaH0Mr+pMaeWTY4JZZzD1injpNRCYq4E
	VpbbTt5BRaFj0oT/hd+y6KrDkl2UKBJgcVQkGhCLOzn4q/HfOX2vHS27uzmCs8/gj0vys6AXPVIC8
	c9Cu7DdR8i4kVdvRbGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2rI-006h4H-1h; Fri, 03 Jun 2022 08:40:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2rF-006h2F-62
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 08:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654245637; x=1685781637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sO/+JqlL4xQIR0mRfbczInWsTC6NEFnc/DwOWJ7X2W8=;
  b=entTIah/xPwr8HYXbsCyUCjV95hIHOMl4I9jhyjT7xeM06yCHPgxKvE8
   NlcT6cy3b/Yj3HIlk1CD/iQv8GSdS+0r6JyIWn1ZewiqdCiDwnI0vU32T
   V0kExVzz1D/7rialJbkDLDZXZL87QUSfNZIR4Zh2glSXE4guaUAAWCBIH
   GX8YX54sJOK6NvxMzW5btK0IZOpIqDG/u98AIgjThKeQ8nbVaNl7GbQ2F
   yjVa0SUJYr/aOK+hM+XPQkojhDp91lsAofuj/4nFfCL04/v1zVNa0i6EL
   7QQdKYFtjMG4pTIWT4XrNbOytqbqbjT0bG09aWwDU/wXhVbw1ZD/W/fJP
   A==;
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="98435059"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jun 2022 01:40:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 3 Jun 2022 01:40:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 3 Jun 2022 01:40:31 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<zong.li@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: dts: microchip: re-add pdma to mpfs device tree
Date: Fri, 3 Jun 2022 09:38:26 +0100
Message-ID: <20220603083825.1910300-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_014037_380222_6F940B86 
X-CRM114-Status: UNSURE (   6.57  )
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

PolarFire SoC /does/ have a SiFive pdma, despite what I suggested as a
conflict resolution to Zong. Somehow the entry fell through the cracks
between versions of my dt patches, so re-add it with Zong's updated
compatible & dma-channels property.

Fixes: c5094f371008 ("riscv: dts: microchip: refactor icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 8c3259134194..3095d08453a1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -192,6 +192,15 @@ plic: interrupt-controller@c000000 {
 			riscv,ndev = <186>;
 		};
 
+		pdma: dma-controller@3000000 {
+			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic>;
+			interrupts = <5 6>, <7 8>, <9 10>, <11 12>;
+			dma-channels = <4>;
+			#dma-cells = <1>;
+		};
+
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
 			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
