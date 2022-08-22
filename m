Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A1C32789
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFP2Ibgi4vPhaA5cehHN0uz8TFW9B7Q6+y00e7XmXqM=; b=5Cgh+qQ1PYb7Cl
	JNduIB39F0rFbYdCZ2mFQS+pUbjvHNCsk7nLB3DrufpIKCseYxYUqjwFvTySwAttbTnwIRUFIIgMK
	Wqo/viINW4MzJcL0sIdtgh+NAqdYwDrWo04uQnFX4E90rffqP+whT5zn8pVuHA5a8arI0vyau6uL5
	msN5un9Qz41wpjwLqrdDIHdTTSftJKtvwXyL9NlPRqf8Egxi2EYlkfCPOKE0xq/MyIq39WjbyM4Cz
	VDvyxAq2/AE53PPGRwFoIquK2ExNY6mrJqGSGDnfSn+62Ygi1Ct1Hri4/rjRTLlAHu1OEA/veCIaW
	ocpr4d1PKnhOTKtIjBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5dU-008FmE-1B; Mon, 22 Aug 2022 11:30:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5d9-008FYb-Rs
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 11:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661167808; x=1692703808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ggvgSTbI/3n106FcPTJ8++adTEBX7bnWFulBMj2Sqa4=;
  b=Pz3EICBbjSBKYtF82b1I3T1CmMKwNuRBna08Faaammlrc5uMd4RqWXD3
   dhmUX9CDlrW/CjOx+bOGaVu3roO87oY6OBNwaSaKsbHzNXy4pcROYKfvH
   F0qQRELrDKeBebb7P0bDZc9flN4UK3BK5i/20f/3auDXvZxtJAHb9xirC
   1vTw9DGUwEJQLi5XCBYd48fbyclGvCvfPP3ivDz38KAdJLeWv0ho4SmyR
   pMkhdNQ+yTECtv7ZTby47YIXFAbSFt4uhY3XG7g7MgALl5wJmTY/ZIoOi
   4R2e9PCzd7jPK+Spc70V+EGPmN1GcWm4kINH0/AXpp7r7e0sVad5ehtU9
   A==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="170324628"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 04:30:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 04:30:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 04:30:00 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Hugh Breslin <hugh.breslin@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/6] dt-bindings: clk: add PolarFire SoC fabric clock ids
Date: Mon, 22 Aug 2022 12:29:26 +0100
Message-ID: <20220822112928.2727437-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220822112928.2727437-1-conor.dooley@microchip.com>
References: <20220822112928.2727437-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_043008_062098_6090A731 
X-CRM114-Status: UNSURE (   7.81  )
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

Each Clock Conditioning Circuitry block contains 2 PLLs and 2 DLLs.
The PLLs have 4 outputs each and the DLLs 2. Add 16 new IDs covering
these clocks. For more information on the CCC hardware, see the
"PolarFire SoC FPGA Clocking Resources" document at the link below.

Link: https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dt-bindings/clock/microchip,mpfs-clock.h  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
index 4048669bf756..79775a5134ca 100644
--- a/include/dt-bindings/clock/microchip,mpfs-clock.h
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -45,4 +45,27 @@
 #define CLK_RTCREF	33
 #define CLK_MSSPLL	34
 
+/* Clock Conditioning Circuitry Clock IDs */
+
+#define CLK_CCC_PLL0		0
+#define CLK_CCC_PLL1		1
+#define CLK_CCC_DLL0		2
+#define CLK_CCC_DLL1		3
+
+#define CLK_CCC_PLL0_OUT0	4
+#define CLK_CCC_PLL0_OUT1	5
+#define CLK_CCC_PLL0_OUT2	6
+#define CLK_CCC_PLL0_OUT3	7
+
+#define CLK_CCC_PLL1_OUT0	8
+#define CLK_CCC_PLL1_OUT1	9
+#define CLK_CCC_PLL1_OUT2	10
+#define CLK_CCC_PLL1_OUT3	11
+
+#define CLK_CCC_DLL0_OUT0	12
+#define CLK_CCC_DLL0_OUT1	13
+
+#define CLK_CCC_DLL1_OUT0	14
+#define CLK_CCC_DLL1_OUT1	15
+
 #endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
