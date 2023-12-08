Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B844DC10DCE
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVnwvdOh5gnh1pwuOi2YNmRh4O2GIjIE2nzXZue8f0A=; b=YGfNWdt1uKB/HZ
	MmELbtlp+jcunN6Wu4fIPsYMd9XW5aL8slOp6aVSWvJSTP5eUPokPAn31EAz3ffrTTwtJO/h2NDGJ
	SrspabaE1mc+fV+v50e28rjCnHOzRNSEbwyD+3yneXQUxLLpeAJ5PdUYX6kRgx9juf5PaNy/yjC0M
	iyXVFxdZluwbpgQKFouQ5L8MPlAvkhRxBOrsQR8r92EdXNEO1y/gmcRVxRFVBtZbz2L5nZDLeC5ch
	mr6ZwhGqbRAz6p3YheTrDnDDDOYplZFDPFj+/yhTzY2bk0NO+MyolTS+XI+zlDaD/Hz6SDhfeR7Zj
	yfwAvOTiKNo11XEJ5WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYFt-00FHHw-1Z;
	Fri, 08 Dec 2023 10:38:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYFp-00FHGB-30
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 10:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702031925; x=1733567925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YqtwfEJlrD8L5HAaw7G5HYRJskztVsmoK7bidkNMsB4=;
  b=zctloH8AEKC14aTjLPffN5LArbkrK1k4hk39Lr3lgocidQfo+bno4cs/
   kR3KZZYwby8eeOcyVcmLfIUMslm7zYl91yTve7jpGVeE0kEY7H+kmL+gj
   CLcaOztcTG3gwAjubhAO3D1iXaA3Qm0d9JN2lk+h7KfPUCVHEvt/kjnzt
   Q5DsWx+OAZIplA0aQGusK7ztD+Jm98CpuC3ffkucuZ54uIK9lZXMy5QtW
   ev3J0o7XH0MKVKQWH39fXdD01Dh/G4rIpF92faoXsTPj5+qMawJts3r8N
   PMvsiPWGAqFMFxEsac/aaoO6bap2cxfjdAlfIZAw49N4fnSXMToRYH8VO
   w==;
X-CSE-ConnectionGUID: Cvz3gSbpStiroKFn2Lwqew==
X-CSE-MsgGUID: P2J285XTS/SOK+VrfSFpng==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="13864092"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Dec 2023 03:38:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 03:38:11 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 03:38:06 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 4/4] riscv: dts: microchip: add specific compatible for mpfs pdma
Date: Fri, 8 Dec 2023 16:08:56 +0530
Message-ID: <20231208103856.3732998-5-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208103856.3732998-1-shravan.chippa@microchip.com>
References: <20231208103856.3732998-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_023845_975701_9FD8806F 
X-CRM114-Status: UNSURE (   8.38  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index a6faf24f1dba..e3e9c5b2b33c 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -236,7 +236,7 @@ plic: interrupt-controller@c000000 {
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
