Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CB0CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWRpK0jNInU7TxKavjC5NB4tQt9qt3hoisov28SZQSE=; b=lwA07TJCY/w+vu
	LukqyJBvBHSrSDIWYf6Y+Muhf2kdcbCqAPWbnZeYJ+qe/YOj3IB84rYoleRYk3diHcm7KQVOcycDF
	clVx6cBygDUWpMnoaFPepqjXmg0uTI2Oxf8Hx1KnDb8PwAekdWhSX26ycKST6nFNtDkcrxZrkt8GD
	/T+8HWoIbf1vsxupxiYQzPmys2M3cv5kwTyCNgW/UV46mhqEUsW8rPLDSiAygFRKrkoXQye0IO9df
	8ziLJMZg01/BS0YQFGhS939DhVDPCrIBvigWvcftrsO0/WCCndZkSQmsq4pl4gpTH5yPrGoNdp0q8
	ZG60jHeeM62B8T6h9tpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBgB-00000004F7S-03GI;
	Sat, 16 Aug 2025 07:50:19 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBg8-00000004F5q-3Vtr
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 07:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755330608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bRIBP23Y2ylQdHyImJXvD14HwjwUSpPUyjy5Yo1t7D8EXFbNZu+m0zYe68AenkV8T9/1ogDPszwlEPJangV45qbJJOgkN3s4ZAhd6xMPbQGSIz/MrP0Q1TUXItKY5L5wPWwySTPFRHo3LDzmM2O1nGhdbaPtyWV280E1YpMWgyc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755330608; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RKVNLFhAmULFUVk/4/UgqVYn12Un3zwHAL+8oU8wrEY=; 
	b=b9lwSazD+oDggzY75pFgNp2ioqLk1kjXpP7YAgzBrlWU5MiJF+ucS12rb7sJRQBxmWXCQYdGl5bLub/a4hdcxMrH4YO3x61NujThAzaWOZmW+IX1Zrs5mu3yj5GIcl/bK/iLk+QrQWXv+2mbl2dLBtBpMCVrXkQLyHcEtpsVpvQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330608;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RKVNLFhAmULFUVk/4/UgqVYn12Un3zwHAL+8oU8wrEY=;
	b=lr2ya7xbDyoj/LKhQv0oLLFaHdP7+1e7ch5bc2tO92CVWCWllMQyLHhOG93ElCXn
	Udoq4fyzAXn4v97KFumIyVcr/WDjbpV34IifKu1/g5eAaCx2iciw8SzOvBNqMbhSGAk
	a3AtSFXptFiV3eDQuySJwo51gjiLICgCrT54h6puQpfT6jtut66YrIzDd3b3FM4Ye84
	8OINcyNE//uRAywRwMzqm2oeE0XeslceYyufky1oqsS3r1ZWgdVnJlPWuvZjYHBRGdd
	ZD8pLVEMZpgPSPMN+Pvef3rHLcb6V/nGjMc0tivuQKJ87d1kzAduP9AeT8M6BjOpZNr
	VgVssPGulA==
Received: by mx.zohomail.com with SMTPS id 1755330606588202.98819779340647;
	Sat, 16 Aug 2025 00:50:06 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 7/7] [NOT FOR UPSTREAM] riscv: dts: thead: enable GC620 G2D on TH1520
Date: Sat, 16 Aug 2025 15:47:57 +0800
Message-ID: <20250816074757.2559055-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_005016_934113_94B0D020 
X-CRM114-Status: UNSURE (   8.30  )
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

The T-Head TH1520 SoC contains a GC620 2D graphics accelerator.

Enable it in the devicetree to allow using etnaviv driver with it.

This patch is currently very dirty because it relies on the bootloader
leaving the clocks enabled, and the core clock is a fake one.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 42626f35de37b..f21598aec82a7 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
 		#clock-cells = <0>;
 	};
 
+	gc620_cclk: clk-gc620-fake {
+		compatible = "fixed-clock";
+		clock-frequency = <264000000>;
+		clock-output-names = "gc620_cclk";
+		#clock-cells = <0>;
+	};
+
 	stmmac_axi_config: stmmac-axi-config {
 		snps,wr_osr_lmt = <15>;
 		snps,rd_osr_lmt = <15>;
@@ -516,6 +523,18 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		/* Vivante GC620, 2D only */
+		g2d: gpu@ffecc80000 {
+			compatible = "vivante,gc";
+			reg = <0xff 0xecc80000 0x0 0x40000>;
+			interrupt-parent = <&plic>;
+			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gc620_cclk>;
+			clock-names = "core";
+			status = "okay";
+		};
+
 		clk: clock-controller@ffef010000 {
 			compatible = "thead,th1520-clk-ap";
 			reg = <0xff 0xef010000 0x0 0x1000>;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
