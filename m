Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D062C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLSM+IRvhAuqCzyQ21j1hLpEmBKmn0RNfX7QMJHdNi0=; b=F0HEOWaELMTdEA
	cfyApnyUUKvJddHQ58X5h2UzW8WKjA0vJSVyxvO1szAyHRNwBSSAdGcxVo8R25TYFFsjClxDrGduW
	RK8gczu1RNGHiXisE/9BgnqL0TBdrED2ZS+HKA0Ge0junAuzeReaBLnn/f5NQ4WYFjlS2/08XpPgP
	amHuq+w/Puw8BvYx9roJ4XDGvCXM1mQEPjCdh5qBL9ZveSprz23j7RtKpUgwk9e9WeY9WzwNOoshF
	fk0psosNqcmCyvaa9uqCbX39Gj+t9sICyxWPaSOnczR795TfROcANl6Pl5MsNoQSQL2qDPwXr7tmg
	R+5bxZRA0+6MDCKtVrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb28-00BzZ9-0j;
	Wed, 25 Oct 2023 10:22:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb23-00BzUi-2F
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 10:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698229355; x=1729765355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ub36EsnDsZ4Pe9+1Jc9C5yZxVaCIMgDzhRw3P0KEHx8=;
  b=aZFaagPGLdt/hjnoy1S3UXvM3PwTq6+OW6DFmKPHN9Nk2OVVMMvP/Guh
   pd1YsQf8aC4JXHPDXARnJD1H8uODP6vL1QoRpoU9XNxmqeL9X6EDCqJ3T
   xtsKUyFDoZk9X6CkhUdRH8KinB6/kf84P9SKOjglZfvrPXPhO+lnVmtPE
   ryraka04PoBJAsLNgtWhYiUGE2uTMfbTMhSGrz7Gu0xN+iNqtPyhxmUXc
   MXSdIJeVjA13wlIhO2upGddo4WZlsvCKk2FNa0w+CtQNZtapov4lNrL9v
   WnzQU/5xwi8XufGcKUviO7CknD1815oz0zgOzqZ4K7OGZYaXPbw+bNUC2
   Q==;
X-CSE-ConnectionGUID: /1Fh5rPuRU6c46pvXDlHLA==
X-CSE-MsgGUID: /6oeDPW+RKiaEqgYvVPuFg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="177735248"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2023 03:22:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 25 Oct 2023 03:22:14 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 25 Oct 2023 03:22:09 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v3 4/4] riscv: dts: microchip: add specific compatible for mpfs' pdma
Date: Wed, 25 Oct 2023 15:52:51 +0530
Message-ID: <20231025102251.3369472-5-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025102251.3369472-1-shravan.chippa@microchip.com>
References: <20231025102251.3369472-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_032235_797463_07683D26 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Shravan Chippa <shravan.chippa@microchip.com>

Add specific compatible for PolarFire SoC for The SiFive PDMA driver

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 104504352e99..f43486e9a090 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -221,7 +221,7 @@ plic: interrupt-controller@c000000 {
 		};
 
 		pdma: dma-controller@3000000 {
-			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
+			compatible = "microchip,mpfs-pdma", "sifive,pdma0";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
 			interrupts = <5 6>, <7 8>, <9 10>, <11 12>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
