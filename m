Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3B5C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IA6aKP61AI6TcKWghsp8iuCidytT+9fZAoh5cFt9KLQ=; b=baLykLjlxSwrHK
	sQwOqV34FHeUKMFzLrYpJPIuS+7TByVdNT6Eo8iYsRW6X/nv4SfjkNPcGjaDGo0Wqc9ywSLttBFSO
	AEfPn0+Rgs5lS+kfZRQY1Exijf3NpoUzKsqX33MW0c8NX/Y2i6+JKmpMMeBKGWP76WYvu67yZf2qX
	sH9gTEjyN6cV6Dbx05I8YfHsWeP5V1kIs7DDnkp3F7NCCdvVwoLWIF/KLw28kWyj8rXrROCXvl5rN
	CiMSTxHvy9tVTYSbIUH+Wsp+nDwsDLwCZ3q/cq+o28et9RglQm99UsDjtfYCTRI0rZxtWbMnNMujN
	7nHr7RtpBxYEOxKOx37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niwEy-009AiC-Cs; Mon, 25 Apr 2022 10:46:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niwEq-009Afw-C1
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 10:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650883600; x=1682419600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bxea3VVS+O9YCfhPSCWoWw7e2Q1KcEUmpVYcG83zJEA=;
 b=Ja9FpWMDI3q5bUtIUCGmm24+xxbO03rE7ImhY8MkixMFL1Ajeqgvk2u6
 xk//0NiGgnmYI0+GgBJP0H3qKagHxLYdkRE4yrpGQrWoTyj64DIM4JhTK
 RPSCLUicufuyOCMenvJHmqrEAjs+/6U7R651gJkBlk2E//grvbJfFSIrC
 eZ0WwB0c1RFkHTHh0Iloxb3l/ZNUqC+wwAcfQLEQj/TN8sQq/cJEausex
 8K5MF0kMQ4N7Bx9ZZ8a6SF3SWVJ18Ik6UJJ0KXF7HIbRsJx2S/G4pTIst
 eian+wjm3OdGUdBPfND6NpFvewUm0e5Hkk3xOzN2tEjvrvMfcdoJg3N2P w==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643698800"; d="scan'208";a="93428160"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Apr 2022 03:46:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 25 Apr 2022 03:46:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 25 Apr 2022 03:46:31 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 1/2] riscv: dts: microchip: remove icicle memory clocks
Date: Mon, 25 Apr 2022 11:45:21 +0100
Message-ID: <20220425104521.132538-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_034644_168646_92E5A696 
X-CRM114-Status: UNSURE (   6.82  )
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

The clock properties in the icicle kit's memory entries cause dtbs_check
errors:
arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

Get rid of the clocks to avoid the errors.

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Fixes: 5b28df37d311 ("riscv: dts: microchip: update peripherals in icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index cd2fe80fa81a..ffe683d3f528 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -32,14 +32,12 @@ cpus {
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x2e000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 
 	ddrc_cache_hi: memory@1000000000 {
 		device_type = "memory";
 		reg = <0x10 0x0 0x0 0x40000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 };
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
