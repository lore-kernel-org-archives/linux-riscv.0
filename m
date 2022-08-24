Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9220AC00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RORyfG/cUy75aTM2mnKvSP6EDXJKd7HiISTUCYAfTnw=; b=jZzqPBq5qfsBl+
	SWte08EqOwPiJ2x8TU/QreOk46iVfOjv95d+Uo7FOchh0JkyB9NSLb7ogP45RKAXdtYC5epjab9at
	pU6mvG0ST+dTX4tZ+N+t8H3/MigrtOsTuQ9p4HHixsOleHD9pR4HpGs8GU4S9AUk+hTTa+jzcf8xG
	0yg+gLvpKujr4/WbNOPa7RklukadJVkKt9WJegagHm2G/j/+5BhAnCaX4DUUmOrXaX7K8qGYcywHS
	OMiAkWdQwQyvN4ZGyoxJlHRDTimT2WWlzZZNv3a6vNEDCdFbfiaLHAqYR4sTxS5JqeHidgcQv9CQo
	QfBoSxqBb1SGAef5BrQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmRM-00BgJ0-Lp; Wed, 24 Aug 2022 09:12:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmRI-00BgE7-6A
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 09:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661332365; x=1692868365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E7lc4EnKiZ1cJys8i7k2b1wZuaqqZKmkVBwqdNfKks0=;
  b=zC39jxmCGg6T+ofuVsWQggIWZH4ObBF0GhiD1cHlgqZgQolcMY0wp8EU
   BVmu0XrmPUL0RYwf1T9GDl3XNgbVVjuIW+ZJwvOoS99loXgIQocVYRx5g
   ln3FAMCNUQJ1t8Eo4NYxYx0w/6wgYpwH0y3en8mkXG02m0i6zyJxGzWyL
   Z5UHAk35nnkUmj1tzkLvx/mS2Gjy1r/HDXHinAgzpTeRNEDu+6sB5t6np
   YdgGelYUTd42xy6JY6gdDIItvEOuytvHe86wRsmB8p3mS47NTHaeiU0Dv
   3CYIb5gBHSkymm98WE+pl5OI/f61pk0aIrjtotz/VZnBBzoV17IDZvzQw
   w==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="187831739"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 02:12:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 02:12:40 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 02:12:38 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v10 2/4] riscv: dts: fix the icicle's #pwm-cells
Date: Wed, 24 Aug 2022 10:12:13 +0100
Message-ID: <20220824091215.141577-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220824091215.141577-1-conor.dooley@microchip.com>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_021244_339434_1D884CBA 
X-CRM114-Status: GOOD (  10.31  )
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

\#pwm-cells for the Icicle kit's fabric PWM was incorrectly set to 2 &
blindly overridden by the (out of tree) driver anyway. The core can
support inverted operation, so update the entry to correctly report its
capabilities.

Fixes: 72560c6559b8 ("riscv: dts: microchip: add fpga fabric section to icicle kit")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 0d28858b83f2..e09a13aef268 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -8,7 +8,7 @@ core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x41000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
-		#pwm-cells = <2>;
+		#pwm-cells = <3>;
 		clocks = <&fabric_clk3>;
 		status = "disabled";
 	};
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
