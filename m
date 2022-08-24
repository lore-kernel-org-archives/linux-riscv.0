Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31A7C32796
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFP2Ibgi4vPhaA5cehHN0uz8TFW9B7Q6+y00e7XmXqM=; b=taXAzR1NcGzkXi
	mE81sgK9nB8SI54wNxnmx+cFhcEj50brId4NjxkcWLtloYFMz7wD43pM4zfa7t0ULzxOMLPwUNFBF
	UM6BRfSO8QEZseMmvF9fPQHZb7mjRMxDS8so3R4Tn7NUtdiiDQgEAkjNsI9vMNLzpLDbBU0oxMxkz
	QWRRObiZOzDfiRLPiKrX+PMLcsQjfgVUHO3QdmxYkUfPPzbuiJJ3r+2Vm7mqNlhzb71aqlz7vEEFp
	uToNBVw2mY/Qs2i3Az95J18LXq2ORC6y0D8tL7BI8Sijk9rT6mbYXhjvBgM+XOtFaJQBaxcovDnzm
	HmkF7+td9jCennAxgZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmmO-00BmSh-4F; Wed, 24 Aug 2022 09:34:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmmL-00BmPD-12
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 09:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661333668; x=1692869668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ggvgSTbI/3n106FcPTJ8++adTEBX7bnWFulBMj2Sqa4=;
  b=tUve7p7TZQgCaxfcCu8FQPM83+MmdWDFY3dbZ0zEwJiD4+DFxdj1n/1m
   EYQrgMlwKYUztkTsaHiRqvcNlI2fzuv7riTRfOrCAYNrJsIM3qgWJbG4C
   6Q110u6Vcsye4xFU+5Zf/59S5hUORcPA8ERazGbUhm0oll4B3KvXrGFYG
   w2hroGPDE/xQZW+nGf7HAlS1rNC1/852xp9vO1uNNXOPL9DId29xBIksl
   4dsNpWBg2/O+wip5DFaXBTBiFwghNOgX/v+P/PMN1khM2xDn/LkM41HfN
   syjk9y79fTzPwa8hE9bgWfXhA9OtelEto7YfvMZhhjlxsZBSWFFw9CJZc
   A==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="173887594"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 02:34:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 02:34:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 02:34:23 -0700
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
Subject: [PATCH v3 3/5] dt-bindings: clk: add PolarFire SoC fabric clock ids
Date: Wed, 24 Aug 2022 10:33:41 +0100
Message-ID: <20220824093342.187844-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220824093342.187844-1-conor.dooley@microchip.com>
References: <20220824093342.187844-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_023429_153713_FA263929 
X-CRM114-Status: UNSURE (   8.57  )
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
